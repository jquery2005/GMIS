SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
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
alter     PROCEDURE Zwd_TransFields
	(
		@InfoId			varchar(4),					-- 对象
		@OldFields		varchar(8000),					-- Type1:Field1:DictId1[|Type2:Field2:DictId2[...]]
		@NewFields		varchar(8000)			OUTPUT,		-- InfoId1.Field1[,InfoId2.Field2[...]]
											-- InfoId.Field maybe like "Gs_DictItem.Description"
		@DataFormat		varchar(8000),					-- 格式
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@Index			varchar(4),					-- Field Index
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 对象
		@Child			int		=	0,			-- 是否操作子表
		@IsVarchar		int		=	-1,			-- 要求是字串
		@strGroupBy		varchar(8000)	=	''		-- 分组字段 add 2003-01-13
	)
with ENCRYPTION 
AS											-- 返回 0-数字 1-字符 2-日期
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @Result			int
	declare @aOldFields		varchar(8000)
	declare @aOldField		varchar(8000)
	declare @strJoinedTable		varchar(8000)
	declare @strOn			varchar(8000)
	declare @strTemp		varchar(8000)
	declare @strTemp2		varchar(8000)
	declare @DateFormat		varchar(8000)
	declare @NumFormat		varchar(8000)
	declare @Return_Value		int
	declare @Length			int
	declare @Pos			int
	declare @TableName		varchar(100)


--execute Zwd_ErrorMessage @OldFields, "Zwd_TransFields"


	-- 取表达式类型
	set @Return_Value = @IsVarchar	

	set @aOldFields = @OldFields
	set @Result = datalength(@OldFields)
	while(@Result > 0)
	begin
--
		execute @Result = Zwd_PopFirstWord @aOldFields output, @aOldField output, "|"

--
		execute Zwd_PopFirstWord @aOldField output, @strTemp output, ":"
		if(@Return_Value = -1)
		begin
			if(@strTemp = "2" or @strTemp = "9" or @strtemp='18' or @strtemp='19')--hjh 2003.10.15
				set @Return_Value = 0
			else if(@strTemp = "3" or @strTemp = "4"  or @strTemp = "5")
				set @Return_Value = 2
			else
				set @Return_Value = 1
		end

		-- 数字，颜色
		if(@Return_Value = 0 and @strTemp <> "2" and @strTemp <> "9")
			set @Return_Value = 1

		-- 日期
		if(@Return_Value = 2 and @strTemp <> "3" and @strTemp <> "4" and @strTemp <> "5")
			set @Return_Value = 1
	end
	

	-- 子表不处理
	if(substring(@InfoId,3,2) <> "01" and @Child = 0)
		RETURN @Return_Value


	-- 生成表达式
	set @NumFormat = @DataFormat
--
	execute Zwd_PopFirstWord @NumFormat output, @DateFormat output, "|"


	set @NewFields = ""

	set @aOldFields = @OldFields
	set @Result = datalength(@OldFields)
	while(@Result > 0)
	begin
--
		execute @Result = Zwd_PopFirstWord @aOldFields output, @aOldField output, "|"

--
		execute Zwd_PopFirstWord @aOldField output, @strTemp2 output, ":"
--
		execute Zwd_PopFirstWord @aOldField output, @strTemp output, ":"

		set @strTemp = @InfoId + "." + @strTemp

--
		if(@Return_Value = 1)
		begin

--execute Zwd_ErrorMessage "格式处理", "Zwd_TransFields"

			-- 数字
			if(@strTemp2 = "2")
				set @strTemp = replace(@NumFormat, "@", @strTemp)
			-- 日期
			else if(@strTemp2 = "3" or @strTemp2 = "4" or @strTemp2 = "5")
			begin
				set @strTemp = replace(@DateFormat, "@", @strTemp)
			end
			-- 颜色
			else if(@strTemp2 = "9")
				set @strTemp = "CONVERT(VARCHAR," + @strTemp + ")"
		--	else if(@strtemp2='18' or @strtemp2='19' )
	--			set @strTemp = "dbo.get_dictidname()"

		end

		-- 处理字典项
		set @Length = datalength(@aOldField)
		if(@Length > 0)
		begin

--execute Zwd_ErrorMessage "字典处理", "Zwd_TransFields"

			if(substring(@InfoId,3,2) <> "01")
			begin
				set @strOn = @InfoId + ".ZA0100=" + @Object + ".ZA0100"
				-- add 2003-01-13
				-- del 2003-03-31
				--if(charindex(@strTemp, @strGroupBy) > 0)
				-- endd
				set @strOn = @strOn + " AND " + @InfoId + ".ZC9993=1"
				-- enda
--
				-- modi 2003-03-28
				--execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @strOn, @strWhere output
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @InfoId, @strOn, @strWhere output
			end

			set @TableName = "T" + @Index + cast(@Result as varchar)

			-- 引用项
			set @Pos = charindex(".", @aOldField)
			if(@Pos > 0)
			begin
				set @strJoinedTable = substring(@aOldField, 1, @Pos-1) + " AS " + @TableName
				set @strOn = @strTemp + "*=" + @TableName + ".ZA0100"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @strJoinedTable, @strOn, @strWhere output

				set @strTemp = @TableName + substring(@aOldField, @Pos, @Length-@Pos+1)
			end
			else if(@strTemp2='2')---hjh,2003.10.15
			--else

			begin
				set @strJoinedTable = "Gs_DictItem AS " + @TableName
				set @strOn =  @TableName + ".DictId='" + @aOldField + "' AND " + @strTemp + "*=" + @TableName + ".DictValue"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @strJoinedTable, @strOn, @strWhere output

				set @strTemp = @TableName + ".Description"
			end
			--hjh,2003.10.15
			---------------------------------
			else 
			begin
				set @strTemp = "dbo.get_dictidname('"+@aOldField+"',"+@strTemp+")"
				set @strWhere = ''
			end
			----------------------------------

		end

		if(@NewFields <> "")
			set @NewFields = @NewFields + "|"
		-- add 2002-12-28
		if(@Return_Value = 0)
			set @strTemp = "ISNULL(" + @strTemp + ",0)"
		-- enda
		set @NewFields = @NewFields + @strTemp

--execute Zwd_ErrorMessage @strTemp, "Zwd_TransFields"

	end


--execute Zwd_ErrorMessage @NewFields, "Zwd_TransFields"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN @Return_Value










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

