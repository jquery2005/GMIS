SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/***************************************************************************************** 20040326
1-����������
	1-����������ؼ������ؼ��ֵ���ʱ������ WHERE ���ֹ��ˣ�����˳������ 2-1
	2-������
		1-������У��ӱ�ĵ�ǰ��¼[ZC9993=1]���Լ��������⴦��ı��ʽֱ�� UPDATE ����
		2-�ӱ����ʷ��¼���õڶ�����ʱ����
			1-����ʱ������ȡ���˴�ʩ���������û�й��������Ļ�
			2-ȡ�ü�ֵ[ZA0100]�����ֵ/��Сֵ��������ʷ�������������⣩��UPDATE ����[��ʷ��¼]����
			3-ɾ����ֵ���ߴ���
			4-ѭ������ - 2~3
		3-������ʽ���⴦��
	3-ѭ������ÿ�� - 2
2-��������
	1-������С���飬�Լ��������⴦��ļ���ʽ���Խ�����ʱ��
	2-�ڵ�ǰ��ʱ������еڶ�����С���飬������������ñ�
	3-ѭ������ÿ������ - 2
	4-����ƽ���������ۼơ��ۼ�ƽ��
**************************************************************************************************/
ALTER             PROCEDURE Zwd_ParseField
	(
		@InfoId			varchar(4),					-- ����
		@MainObject		varchar(4),					-- ������
		@Object			varchar(4),					-- ��������
		@InfoFields		varchar(8000),					-- �ֶ���
		@Direction		varchar(1),					-- �Ƿ�ֱ����
		@Express		varchar(8000),					-- ���ʽ
		@UseFun			varchar(8000),					-- ����
		@ExtreMum		varchar(1),					-- ��ֵ
		@ExtreStyle		varchar(1),					-- ��ֵ���㷽ʽ
		@Num			int,						-- ��ʷ����
		@DataType		int				OUTPUT,		-- ����
											-- ���� 0-���� 1-�ַ�
		@DataFormat		varchar(8000),					-- ��ʽ
		@ComputeField		varchar(8000)			OUTPUT,		-- ���ؼ����ֶ�
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@StartTime		varchar(100)	= "2000-01-01",			-- ���ֿ�ʼʱ��
		@EndTime		varchar(100)	= "2001-01-01",			-- ���ֽ���ʱ��
		@GroupBy		varchar(8000),					-- �����ִ�
		@GroupBy2		varchar(8000)			OUTPUT,		-- �����ִ�
		@Index			varchar(4),					-- Field Index
		@ExecuteCompute		int		= 0,				-- �ӱ��Ƿ�ִ�оۺϼ���
		@MainTableName		varchar(8000)	= ""				-- ��������
	)
AS											-- ���� 0-��Ч 1-��Ч
	SET QUOTED_IDENTIFIER OFF

	
	-- ִ�еķ��ؽ��
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
	
	-- �Գ�
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

	-- ������ʽ�ͺ��� : ������
	if(@Result = 0)
	begin

--execute Zwd_ErrorMessage "������ʽ", "Zwd_ParseField"

		-- ����
		if(@DataType = 0)
		begin
			-- ƽ������
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
		-- ����
		else if(@DataType = 2)
			set @ComputeField = "CAST(NULL AS DATETIME)"
		-- �ı�
		else
			set @ComputeField = "CAST('' AS VARCHAR(1024))"
	end
	-- һ����ʽ�ͺ���
	else if(@Result = 1)
	begin
		-- ����
		--if(@InfoId = @MainObject)
		if(substring(@InfoId,3,2) = "01")
		begin
	
--execute Zwd_ErrorMessage "����", "Zwd_ParseField"

			-- �ۼ� : ������
			if(@DataType = 0 and @ExtreStyle <> "0")
			begin

--execute Zwd_ErrorMessage "�ۼ�", "Zwd_ParseField"

				set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
			end
			-- ���ۼ�, ����
			else if(@DataType = 0 and @GroupBy <> "")
			begin

--execute Zwd_ErrorMessage "���ۼƵ����ּ���", "Zwd_ParseField"

				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index

					if(@ExtreMum = "1")
						set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- ��Сֵ
					else if(@ExtreMum = "2")
						set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- ƽ��ֵ
					else if(@ExtreMum = "3")
						set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
					-- ��λֵ
					else if(@ExtreMum = "4")
						set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
					-- ���
					else if(@ExtreMum = "5")
						set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
				end
			end 
			-- ���ڷ�����
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin
				if(@ExecuteCompute = 1)
				begin
					set @ComputeField = "F" + @Index
				-- add 2002-12-28
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[��]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)
			end
			-- ���ڷ���ȴ���ڷ����У�̫�ź��ˡ���
			else if(@GroupBy <> "")
			begin
				-- ����
				if(@DataType = 2)
					set @ComputeField = "CAST(NULL AS DATETIME)"
				-- �ı�
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
		-- �ӱ� : ������(������������)
		else if(substring(@InfoId,3,2) <> "01")
		begin
	
--execute Zwd_ErrorMessage "�ӱ�", "Zwd_ParseField"


			-- ��ʼ�����ӱ�������� - ���ݷ��������

			-- ����
			if(@DataType = 0  and @ExtreStyle in("0","1","2") and @ExtreMum in("1","2","3","4","5"))
			begin

--execute Zwd_ErrorMessage "�ۼ�", "Zwd_ParseField"

				if(@ExecuteCompute = 0)
				begin
					set @ComputeField = "CAST(NULL AS NUMERIC(20,2))"
				end
				else
				begin
					-- ��ǰ
					if(@ExtreStyle = "0")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100," + @ComputeField + " AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")=0 GROUP BY ZA0100"
						-- endm ��������
					end
					-- �ۼ�
					else if(@ExtreStyle = "1")
					begin
						-- modi 2003-03-31
						/*
						set @astrFrom = "(SELECT MAX(F0) FROM (SELECT ZA0100,COUNT(*) AS F0 WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100) T0)"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100 HAVING COUNT(*)=" + @astrFrom
						*/
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,SUM(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100 HAVING COUNT(ZA0100)=DATEDIFF(mm," + @StartTime + "," + @EndTime + ")+1"
						-- endm ��������
					end
					-- �ۼ�ƽ��
					else if(@ExtreStyle = "2")
					begin
						-- modi 2003-03-31
						--set @astrFrom = "SELECT ZA0100,AVG(" + @ComputeField + ") AS F0 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100"
						set @astrFrom = "SELECT ZA0100,SUM(" + @ComputeField + ") AS F9 FROM " + @InfoId + " WHERE DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @StartTime + ")<=0 AND DATEDIFF(mm,ISNULL(CAST(ZB9992 AS DATETIME),GetDate())," + @EndTime + ")>=0 GROUP BY ZA0100,CAST(YEAR(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)+'-'+CAST(MONTH(ISNULL(CAST(ZB9992 AS DATETIME),GetDate())) AS VARCHAR)"
						set @astrFrom = "SELECT ZA0100,AVG(F9) AS F0 FROM (" + @astrFrom + ") T GROUP BY ZA0100"
						-- endm ��������
					end
		
--execute Zwd_ErrorMessage "���ۼƵ����ּ���", "Zwd_ParseField"
	
	
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
						-- ����֮
						set @strSQL = "UPDATE " + @MainTableName + " SET F" + @Index + "=" + @ComputeField + " FROM " + @strFrom + @strWhere
						exec(@strSQL)

--execute Zwd_ErrorMessage @strSQL, "Zwd_ParseField"
	
						set @ComputeField = "F" + @Index

						-- ���ֵ
						if(@ExtreMum = "1")
							set @ComputeField = "CAST(MAX(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- ��Сֵ
						else if(@ExtreMum = "2")
							set @ComputeField = "CAST(MIN(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- ƽ��ֵ
						else if(@ExtreMum = "3")
							set @ComputeField = "CAST(AVG(" + @ComputeField + ") AS NUMERIC(20,2))"
						-- ��λֵ
						else if(@ExtreMum = "4")
							set @ComputeField = "CAST((MAX(" + @ComputeField + ")+MIN(" + @ComputeField + "))/2 AS NUMERIC(20,2))"
						-- ���
						else if(@ExtreMum = "5")
							set @ComputeField = "CAST(SUM(" + @ComputeField + ") AS NUMERIC(20,2))"
					end
				end
			end 
			-- ���ڷ�����
			else if(charindex(@InfoFieldNew,@GroupBy) > 0)
			begin

--execute Zwd_ErrorMessage "�ӱ����", "Zwd_ParseField"

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
				--	set @ComputeField = "ISNULL(" + @ComputeField + ",'[��]')"
				-- enda
				end

				set @GroupBy2 = replace(@GroupBy2, @InfoFieldNew, @ComputeField)

--execute Zwd_ErrorMessage "�ӱ����", "Zwd_ParseField"

			end
			-- �ӱ�ķ������Ͳ�����ѽ��
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
	
		-- ����
		if(@DataType = 0)
			set @ComputeField = replace(@NumFormat, "@", @ComputeField)
		-- ����
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
	-- ����
	RETURN 1















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

