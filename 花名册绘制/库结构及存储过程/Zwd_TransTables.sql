SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







/***************************************************************************************** 20020928
1-不分组的情况
	1-生成以主表关键字作关键字的临时表，包括 WHERE 部分过滤，可以顺带处理 2-1
	2-处理列
		1-主表的列，子表的当前记录[ZC9993=1]，以及不用特殊处理的表达式直接 UPDATE 处理
		2-子表的历史记录采用第二个临时表处理
			1-建临时表，不采取过滤措施，如果本身没有过滤条件的话
			2-取得极值[ZA0100]（最大值/最小值，处理历史的最近和最初问题），UPDATE 增量[历史记录]处理
			3-删除极值或者打标记
			4-循环处理 - 2~3
		3-特殊表达式特殊处理
	3-循环处理每列 - 2
2-分组的情况
	1-采用最小分组，以及不用特殊处理的计算式，以建立临时表
	2-在当前临时表里进行第二次最小分组，将分组结果插入该表
	3-循环处理每个分组 - 2
	4-处理平均人数、累计、累计平均
**************************************************************************************************/
alter PROCEDURE Zwd_TransTables
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 关联对象
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@AddExLink		int		=	0	OUTPUT,		-- 是否增加额外连接
		@Child			int		=	0			-- 是否操作子表
	)
AS											-- 返回 0-失败 1-成功
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @strSQL			varchar(8000)
	declare @strFields		varchar(8000)
	declare @strField		varchar(8000)

	
--execute Zwd_ErrorMessage @Object, "Zwd_TransTables"


	set @AddExLink = 0

	if(@MainObject = @Object)
		RETURN 0

	if(substring(@InfoId,3,2) = "01" or (substring(@InfoId,3,2) <> "01" and @Child = 1))
	begin
		-- 该表未被登记
		if(charindex(","+@Object+",", ","+@strFrom+",") = 0 and charindex(" JOIN "+@Object+" ON ", " JOIN "+@strFrom+" ON ") = 0)
		begin
	
--execute Zwd_ErrorMessage "开始处理……", "Zwd_TransTables"
	
			-- 打开关联表，去关联字段	
			set @strSQL = "SELECT PropertySet FROM Gs_ObjectAssociate WHERE InfoIdA='" + @MainObject + "' AND InfoIdB LIKE '" + @Object + "%'"
			set @strSQL = "declare CR_Associate cursor for " + @strSQL + " open CR_Associate"
			exec(@strSQL)
			fetch CR_Associate into @strFields
			close CR_Associate
			deallocate CR_Associate
			
--
			execute Zwd_PopFirstWord @strFields output, @strField output, ","

			set @strSQL = @MainObject + "." + @strField + "=" + @Object + ".ZA0100"
--
			-- modify by zhangwd 2004-04-09
			--execute Zwd_AddFrom @strFrom output, " JOIN ", @Object, @strSQL, @strWhere output
			execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @Object, @strSQL, @strWhere output
			-- end modify


			if(upper(@strField) <> "ZA0100")
				set @AddExLink = 1
		end
	end


--execute Zwd_ErrorMessage @strFrom, "Zwd_TransTables"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
