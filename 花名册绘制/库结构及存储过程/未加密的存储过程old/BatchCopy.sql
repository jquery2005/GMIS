SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO













/***************************************************************************************** 20020928

	批量复制记录

**************************************************************************************************/
alter      PROCEDURE Zwd_BatchCopy
	(
		@InfoId			varchar(4),					-- 对象
		@ZA0100			varchar(8000),					-- 当前对象
		@WholeCondition		varchar(8000)	= ""				-- 条件
	)
WITH ENCRYPTION
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL			varchar(8000)

	declare @InfoField		varchar(6)
	declare @strInto		varchar(8000)
	declare @strSelect		varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strTable		varchar(8000)
	declare @strTable1		varchar(8000)
	declare @strTable2		varchar(8000)
	declare @strWhere		varchar(8000)
	declare @strWhere2		varchar(8000)

	declare @Error		varchar(8000)

	
	-- 子表
	if(substring(@InfoId,3,2) <> "01")
	begin

--execute Zwd_ErrorMessage "子表", "Zwd_BatchCopy"
--
--select @Error = "Start=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 2003-02-13
--
		--execute gsp_delete_currec_trigger @InfoId
		-- endm

--
		execute Zwd_CurrentHistory @InfoId

		set @strWhere = ""
		if(ISNULL(@WholeCondition,"") <> "")
			set @strWhere = "ZA0100 IN(" + @WholeCondition + ")"


		-- 拼语句
		set @strInto = ""

		set @strSQL = "SELECT InfoField FROM Gs_Property WHERE InfoId='" + @InfoId + "' AND State='1' AND Restriction <> '7'"
		set @strSQL = "declare CR_Property cursor for " + @strSQL + " open CR_Property"
		exec(@strSQL)
		fetch next from CR_Property into @InfoField
		while(@@fetch_status = 0)
		begin
			-- modi 02-11-02
			--if(upper(@InfoField) <> "ZA0100" and upper(@InfoField) <> upper(@InfoId+"Id") and upper(@InfoField) <> "ZC9995")
			if(upper(@InfoField) <> "ZA0100" and upper(@InfoField) <> upper(@InfoId+"Id") and upper(@InfoField) <> "ZC9995" and upper(@InfoField) <> "ZB9991" and upper(@InfoField) <> "ZB9992")
				set @strInto = @strInto + "," + @InfoField

			fetch next from CR_Property into @InfoField
		end
		close CR_Property
		deallocate CR_Property

		set @strSelect = substring(@strInto, 2, datalength(@strInto)-1)
		set @strInto = "ZA0100," + @InfoId + "Id,ZC9995" + @strInto


		-- 打标记咯
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='1'"

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopy"

		exec(@strSQL)

--
--select @Error = "Update=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 02-11-02
		--set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
		--set @strSQL = @strSQL + " WHERE ZA0100<>'" + @ZA0100 + "'"
		set @strSQL = "ZA0100<>'" + @ZA0100 + "'"
		if(@strWhere <> "")
			set @strSQL = @strWhere + " AND " + @strSQL
		set @strWhere = " WHERE " + @strSQL
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'" + @strWhere
		exec(@strSQL)

--
--select @Error = "Update=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- modi 02-11-02
		--set @strTable = "(SELECT ZA0100,ISNULL(MAX(" + @InfoId + "Id),0)+100 AS F,'1' AS F2 FROM " + @InfoId + " WHERE ZC9995='0'"
		--set @strTable = @strTable + " GROUP BY ZA0100) T"
		set @strTable = "(SELECT ZA0100,ISNULL(MAX(" + @InfoId + "Id),0)+100 AS F,'1' AS F2 FROM " + @InfoId + " WHERE ZC9995='0'"
		set @strTable1 = "SELECT ParentId1 FROM Gs_Structure WHERE InfoId='" + @InfoId + "'"

		-- modi 02-11-04
		--set @strTable1 = "OBJECT_ID(" + @strTable1 + ")"
		exec("declare CR_Parent cursor for " + @strTable1 + " open CR_Parent")
		fetch CR_Parent into @strTable1
		close CR_Parent
		deallocate CR_Parent
		-- endm 02-11-04

		set @strWhere = @strWhere + " AND ZA0100 NOT IN(SELECT DISTINCT ZA0100 FROM " + @InfoId + ")"
		set @strTable1 = " UNION SELECT ZA0100,100 AS F,'1' AS F2 FROM " + @strTable1 +  @strWhere
		set @strTable = @strTable + " GROUP BY ZA0100" + @strTable1 + ") T"
		-- endm 02-11-02

		set @strTable2 = "(SELECT " + @strSelect + " FROM " + @InfoId + " WHERE ZA0100='" + @ZA0100 + "' AND ZC9993=1) T2"


		set @strWhere = ""

		set @strFrom = @strTable
--
		execute Zwd_AddFrom @strFrom output, " CROSS JOIN ", @strTable2, "", @strWhere output


		-- 复制
		set @strSQL = "INSERT INTO " + @InfoId + "(" + @strInto + ")" + " SELECT T.*,T2.* FROM "+ @strFrom
		if(@strWhere <> "")
			set @strSQL = @strSQL + " WHERE " + @strWhere

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopy"

		exec(@strSQL)

--
--select @Error = "Insert=> " + convert(varchar, getdate(), 121)
--execute Zwd_ErrorMessage @Error, "Zwd_BatchCopy"

		-- 标记用上了
		--set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=0 WHERE ZC9995='0'"
		--exec(@strSQL)

--
		execute Zwd_CurrentHistory @InfoId

		-- modi 2003-02-13
--
		--execute gsp_create_currec_trigger @InfoId
		-- endm
	end


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO