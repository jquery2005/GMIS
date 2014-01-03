

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

/***************************************************************************************** 20020928

	����������ʷ��¼

**************************************************************************************************/
CREATE    PROCEDURE Zwd_BatchCopyHistory
	(
		@InfoId			varchar(4),					-- ����
		@MainObject		varchar(4)	= "AA01",			-- ������
		@WholeCondition		varchar(8000)	= "",				-- ����
		@Fields		varchar(8000)	=	""				-- ��ѡ�ֶ�
	)
WITH ENCRYPTION
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- ִ�еķ��ؽ��
	declare @Result			int

	declare @strSQL			varchar(8000)

	declare @InfoField		varchar(6)
	declare @strInto		varchar(8000)
	declare @strSelect		varchar(8000)
	declare @strWhere		varchar(8000)

	
	-- �ӱ�
	if(@InfoId <> @MainObject)
	begin

--execute Zwd_ErrorMessage "�ӱ�", "Zwd_BatchCopyHistory"

		-- modi 2003-02-13
--
		--execute gsp_delete_currec_trigger @InfoId
		-- endm

--
		execute Zwd_CurrentHistory @InfoId

		set @strWhere = ""
		if(ISNULL(@WholeCondition,"") <> "")
			set @strWhere = "ZA0100 IN(" + @WholeCondition + ")"


		-- ƴ���
		set @strInto = ""

		--
		if(@Fields = "")
		begin
			set @strSQL = "SELECT InfoField FROM Gs_Property WHERE InfoId='" + @InfoId + "' AND State='1' AND Restriction <> '7'"
			set @strSQL = "declare CR_Property cursor for " + @strSQL + " open CR_Property"
			exec(@strSQL)
			fetch next from CR_Property into @InfoField
			while(@@fetch_status = 0)
			begin
				-- add 02-11-02
				if(upper(@InfoField) <> "ZB9991" and upper(@InfoField) <> "ZB9992")
					set @strInto = @strInto + "," + @InfoField

				fetch next from CR_Property into @InfoField
			end
			close CR_Property
			deallocate CR_Property

			set @strInto = substring(@strInto, 2, datalength(@strInto)-1)
		end
		-- add 2003-05-09
		else
		begin
			set @strInto = "ZA0100," + @InfoId + "Id,ZC9995," + @Fields
		end
		-- enda

		set @strSelect = replace(replace(@strInto,@InfoId+"Id",@InfoId+"Id+100"), "ZC9995", "'1'")


		-- ���ǿ�
		set @strSQL = "UPDATE " + @InfoId + " SET ZC9995='0'"
		exec(@strSQL)

--
		execute Zwd_AddWhere "ZC9993=1", @strWhere output

		-- ����
		set @strSQL = "INSERT INTO " + @InfoId + "(" + @strInto + ")" + " SELECT " + @strSelect + " FROM "+ @InfoId + " WHERE " + @strWhere

		exec(@strSQL)

--execute Zwd_ErrorMessage @strSQL, "Zwd_BatchCopyHistory"

		-- ���������
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
	-- ����
	RETURN 1

OnError:
	RETURN 0









GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

