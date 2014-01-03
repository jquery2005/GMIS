SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/***************************************************************************************** 20040326
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
ALTER             PROCEDURE Zwd_ParseField
	(
		@InfoId			varchar(4),					-- 对象
		@MainObject		varchar(4),					-- 主对象
		@Object			varchar(4),					-- 关联对象
		@InfoFields		varchar(8000),					-- 字段列
		@Direction		varchar(1),					-- 是否垂直连接
		@Express		varchar(8000),					-- 表达式
		@UseFun			varchar(8000),					-- 函数
		@ExtreMum		varchar(1),					-- 极值
		@ExtreStyle		varchar(1),					-- 极值计算方式
		@Num			int,						-- 历史个数
		@DataType		int				OUTPUT,		-- 类型
											-- 返回 0-数字 1-字符
		@DataFormat		varchar(8000),					-- 格式
		@ComputeField		varchar(8000)			OUTPUT,		-- 返回计算字段
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@StartTime		varchar(100)	= "2000-01-01",			-- 数字开始时间
		@EndTime		varchar(100)	= "2001-01-01",			-- 数字结束时间
		@GroupBy		varchar(8000),					-- 分组字串
		@GroupBy2		varchar(8000)			OUTPUT,		-- 分组字串
		@Index			varchar(4),					-- Field Index
		@ExecuteCompute		int		= 0,				-- 子表是否执行聚合计算
		@MainTableName		varchar(8000)	= ""				-- 主表名称
	)
AS											-- 返回 0-无效 1-有效
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int
	declare @DateFormat		varchar(8000)
	declare @NumFormat		varchar(8000)
	declare @Result2		int
	declare @astrFrom		varchar(8000)
	declare @astrWhere		varchar(8000)
	declare @strSQL			varchar(8000)
	declare @TableName		varchar(100)
	declare @InfoFieldOld		varchar(8000)
	declare @InfoFieldNew		varchar(8000)
	
	-- 对冲
	declare @ComputeExecute		int


--execute Zwd_ErrorMessage @InfoFields, "Zwd_ParseField"
	

	set @ComputeExecute = 0

	set @InfoFieldOld = @InfoFields
--
	execute Zwd_PopFirstWord @InfoFieldOld output, @InfoFieldNew output, ":"
	execute Zwd_PopFirstWord @InfoFieldOld output, @InfoFieldNew output, ":"
	set @InfoFieldNew = @InfoId + "." + @InfoFieldNew


	if(charindex(","+@InfoFieldNew+",",","+@GroupBy+",") > 0 or @ExtreMum in("1","2","3","4","5"))
		set @Result = 1
	else
		set @Result = 0

--execute Zwd_ErrorMessage @Result, "Zwd_ParseField"

--
	execute Zwd_TransTables @InfoId, @MainObject, @Object, @strFrom output, @strWhere output, @Result2 output, @Result
--
	-- modi 2003-01-13
	--execute @Result = Zwd_ParseExpressAndFunction @InfoId,@InfoFields,@Direction,@Express,@UseFun,@DataType output,@DataFormat,@ComputeField output,@strFrom output,@strWhere output,@Index,@MainObject,@Object,@Result
	execute @Result = Zwd_ParseExpressAndFunction @InfoId,@InfoFields,@Direction,@Express,@UseFun,@DataType output,@DataFormat,@ComputeField output,@strFrom output,@strWhere output,@Index,@MainObject,@Object,@Result,@GroupBy
	-- endm

--execute Zwd_ErrorMessage @strFrom, "Zwd_ParseField"

	-- 特殊表达式和函数 : 不处理
	if(@Result = 0)
	begin

--execute Zwd_ErrorMessage "特殊表达式", "Zwd_ParseField"

		-- 数字
		if(@DataType = 0)
		begin
			-- 平均人数
			if(@ExtreStyle = "0" and @ExtreMum = "6")
			begin
				if(@ExecuteCompute = 0 or @ComputeExecute = 1)
				begin
					-- modi 2003-01-13
					--set @astrFrom = "SELECT ZA0100,(CASE WHEN ZB9991<=CONVERT(DATETIME," + @StartTime + ") AND ZB9992>=CONVERT(DATETIME," + @StartTime + ") THEN 1 ELSE 0 END) AS F1"
					--set @astrFrom = @astrFrom + ",(CASE WHEN ZB9991<=CONVERT(DATETIME," + @EndTime + ") AND ZB9992>=CONVERT(DATETIME," + @EndTime + ") THEN 1 ELSE 0 END) AS F2"
					set @astrFrom = "SELECT ZA0100,(CASE WHEN DATEDIFF(mm,ISNULL(CAST(ZB9991 AS DATETIME),GetDate()),CONVERT(DATETIME," + @StartTime + "))>=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate()),CONVERT(DATETIME," + @StartTime + "))<=0 THEN 1 ELSE 0 END) AS F1"
					set @astrFrom = @astrFrom + ",(CASE WHEN DATEDIFF(mm,ISNULL(CAST(ZB9991 AS DATETIME),GetDate()),CONVERT(DATETIME," + @EndTime + "))>=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate()),CONVERT(DATETIME," + @EndTime + "))<=0 THEN 1 ELSE 0 END) AS F2"
					-- endm
					set @astrFrom = @astrFrom + " FROM " + @MainObject
					-- add 2003-03-31
					set @astrFrom = @astrFrom + " WHERE ZC9993=1"
					-- enda
					set @TableName = "##TPersonAvg"
					set @astrFrom = replace(@astrFrom, "F2 FROM", "F2 INTO "+@TableName+" FROM")
					-- modi 2003-01-13
					--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + " " + @astrFrom)
					exec("exec Zwd_Delete " + @TableName + " " + @astrFrom)
					-- endm
					set @astrFrom = @TableName
	
					set @astrWhere = @MainObject + ".ZA0100=##TPersonAvg.ZA0100"
					-- add 2003-01-13
					set @astrWhere = @astrWhere + " AND ##TPersonAvg.F1=1 AND ##TPersonAvg.F2=1"
					-- enda
	
					set @ComputeField = "##TPersonAvg.F1 AS F1_TPersonAvg,##TPersonAvg.F2"

	
--
					-- modi 2003-01-10
					--execute Zwd_AddFrom @strFrom output, " JOIN ", @astrFrom, @astrWhere, @strWhere output
					execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @astrFrom, @astrWhere, @strWhere output
					-- endm

					set @DataType = 1
				end
				else
				begin
					set @ComputeField = "(SUM(F1_TPersonAvg)+SUM(F" + @Index + "))/2"
				end
			end
			else
				set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
		end
		-- 日期
		else if(@DataType = 2)
			set @ComputeField = "CAST(NULL AS DATETIME)"
		-- 文本
		else
			set @ComputeField = "CAST('' AS VARCHAR(1024))"
	end
	-- 一般表达式和函数
	else if(@Result = 1)
	begin
		-- 主表
		--if(@InfoId = @MainObject)
		if(substring(@InfoId,3,2) = "01")
		begin
	
--execute Zwd_ErrorMessage "主表", "Zwd_ParseField"

			-- 累计 : 不处理
			if(@DataType = 0 and @ExtreStyle <> "0")
			begin

--execute Zwd_ErrorMessage "累计", "Zwd_ParseField"

				set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
			end
			-- 非累计, 数字
			else if(@DataType = 0 and @GroupBy <> "")
			begin

--execute Zwd_ErrorMessage "非累计的数字计算", "Zwd_ParseField"

				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index

					if(@ExtreMum = "1")
						set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 最小值
					else if(@ExtreMum = "2")
						set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 平均值
					else if(@ExtreMum = "3")
						set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- 中位值
					else if(@ExtreMum = "4")
						set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
					-- 求和
					else if(@ExtreMum = "5")
						set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
				end
			end 
			-- 存在分组中
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin
				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index
				-- add 2002-12-28
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[空]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)
			end
			-- 存在分组却不在分组中，太遗憾了……
			else if(@GroupBy <> "")
			begin
				-- 日期
				if(@DataType = 2)
					set @ComputeField = "CAST(NULL AS DATETIME)"
				-- 文本
				else
					set @ComputeField = "CAST('' AS VARCHAR(1024))"
			end
			else if(@ExecuteCompute = 1)
				set @ComputeField = "F" + @Index
--
			-- modi 2002-12-26
			--set @ExecuteCompute = 1
			if(@DataType <> 0)
				set @ExecuteCompute = 1
			-- endm
		end
		-- 子表 : 不处理(但处理分组情况)
		else if(substring(@InfoId,3,2) <> "01")
		begin
	
--execute Zwd_ErrorMessage "子表", "Zwd_ParseField"


			-- 开始处理子表计算问题 - 数据分析表嘛：）

			-- 数字
			if(@DataType = 0  and @ExtreStyle in("0","1","2") and @ExtreMum in("1","2","3","4","5"))
			begin

--execute Zwd_ErrorMessage "累计", "Zwd_ParseField"

				if(@ExecuteCompute = 0)
				begin
					set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
				end
				else
				begin
					-- 当前
					if(@ExtreStyle = "0")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100," + @ComputeField + " AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0 GROUP BY ZA0100"
						-- endm 次数变月
					end
					-- 累计
					else if(@ExtreStyle = "1")
					begin
						-- modi 2003-03-31
						/*
						set @astrFrom = "(SELECT MAX(F0) FROM (SELECT ZA0100,COUNT(*) AS F0 WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100) T0)"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100 HAVING COUNT(*)=" + @astrFrom
						*/
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,SUM(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100 HAVING COUNT(ZA0100)=DATEDIFF(mm," + @StartTime + "," + @EndTime + ")+1"
						-- endm 次数变月
					end
					-- 累计平均
					else if(@ExtreStyle = "2")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100,AVG(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,AVG(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100"
						-- endm 次数变月
					end
		
--execute Zwd_ErrorMessage "非累计的数字计算", "Zwd_ParseField"
	
	
					set @TableName = "##Temp_Table_" + @MainObject + "_" + @InfoId + @Index
					set @astrWhere = @TableName + ".ZA0100=" + @MainTableName + ".ZA0100"
	
--execute Zwd_ErrorMessage @astrFrom, "Zwd_ParseField"
	
					set @astrFrom = replace(@astrFrom, "F0 FROM", "F0 INTO "+@TableName+" FROM")
	
--execute Zwd_ErrorMessage @astrFrom, "Zwd_ParseField"
	
					-- modi 2003-01-13
					--exec("IF EXISTS(SELECT * FROM SYSOBJECTS WHERE NAME='" + @TableName + "') DROP TABLE " + @TableName + " " + @astrFrom)
					exec("exec Zwd_Delete " + @TableName + " " + @astrFrom)
					-- endm
					set @astrFrom = @TableName
	
					set @ComputeField = @TableName + ".F0"
	

--
					-- modi 2003-01-10
					--execute Zwd_AddFrom @strFrom output, " JOIN ", @astrFrom, @astrWhere, @strWhere output	
					execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @astrFrom, @astrWhere, @strWhere output	
					-- endm
	

					if(@ComputeExecute <> 1)
					begin
						-- 计算之
						set @strSQL = "UPDATE " + @MainTableName + " SET F" + @Index + "=" + @ComputeField + " FROM " + @strFrom + @strWhere
						exec(@strSQL)

--execute Zwd_ErrorMessage @strSQL, "Zwd_ParseField"
	
						set @ComputeField = "F" + @Index

						-- 最大值
						if(@ExtreMum = "1")
							set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 最小值
						else if(@ExtreMum = "2")
							set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 平均值
						else if(@ExtreMum = "3")
							set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- 中位值
						else if(@ExtreMum = "4")
							set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
						-- 求和
						else if(@ExtreMum = "5")
							set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
					end
				end
			end 
			-- 存在分组中
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin

--execute Zwd_ErrorMessage "子表分组", "Zwd_ParseField"

				-- modi 2003-01-13
				--set @astrWhere = @InfoId + ".ZA0100=" + @Object + ".ZA0100"
--
				--execute Zwd_AddFrom @strFrom output, " JOIN ", @InfoId, @astrWhere, @strWhere output
				set @astrWhere = @InfoId + ".ZA0100=" + @Object + ".ZA0100 AND " + @InfoId + ".ZC9993=1"
				execute Zwd_AddFrom @strFrom output, " INNER JOIN ", @InfoId, @astrWhere, @strWhere output
				-- endm

				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index
				-- add 2002-12-28
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[空]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)

--execute Zwd_ErrorMessage "子表分组", "Zwd_ParseField"

			end
			-- 子表的非数字型不处理呀！
			-- modify by zhangwd 2004-03-26
			--else
			else if(@GroupBy2 <> "_Order_")
			-- end modify
			begin
				set @ComputeField = "CAST('' AS VARCHAR(1024))"
				set @DataType = 1
			end
		end
	end


	if(@ExecuteCompute = 1)
	begin
		set @NumFormat = @DataFormat
--
		execute Zwd_PopFirstWord @NumFormat output, @DateFormat output, "|"
	
		-- 数字
		if(@DataType = 0)
			set @ComputeField = replace(@NumFormat, "@", @ComputeField)
		-- 日期
		else if(@DataType = 2)
		begin
			-- modi 2003-07-10
			--set @ComputeField = replace(@DateFormat, "@", @ComputeField)
			set @ComputeField = replace("CASE WHEN @<>'' THEN "+@DateFormat+" ELSE '' END", "@", @ComputeField)
		end
	end
	

--execute Zwd_ErrorMessage @ComputeField, "Zwd_ParseField"


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

