SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

/***************************************************************************************** 20020928
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
alter     PROCEDURE Zwd_TransFields
	(
		@InfoId			varchar(4),					-- ����
		@OldFields		varchar(8000),					-- Type1:Field1:DictId1[|Type2:Field2:DictId2[...]]
		@NewFields		varchar(8000)			OUTPUT,		-- InfoId1.Field1[,InfoId2.Field2[...]]
											-- InfoId.Field maybe like "Gs_DictItem.Description"
		@DataFormat		varchar(8000),					-- ��ʽ
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@Index			varchar(4),					-- Field Index
		@MainObject		varchar(4),					-- ������
		@Object			varchar(4),					-- ����
		@Child			int		=	0,			-- �Ƿ�����ӱ�
		@IsVarchar		int		=	-1,			-- Ҫ�����ִ�
		@strGroupBy		varchar(8000)	=	''		-- �����ֶ� add 2003-01-13
	)
with ENCRYPTION 
AS											-- ���� 0-���� 1-�ַ� 2-����
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


	-- ȡ���ʽ����
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

		-- ���֣���ɫ
		if(@Return_Value = 0 and @strTemp <> "2" and @strTemp <> "9")
			set @Return_Value = 1

		-- ����
		if(@Return_Value = 2 and @strTemp <> "3" and @strTemp <> "4" and @strTemp <> "5")
			set @Return_Value = 1
	end
	

	-- �ӱ�����
	if(substring(@InfoId,3,2) <> "01" and @Child = 0)
		RETURN @Return_Value


	-- ���ɱ��ʽ
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

--execute Zwd_ErrorMessage "��ʽ����", "Zwd_TransFields"

			-- ����
			if(@strTemp2 = "2")
				set @strTemp = replace(@NumFormat, "@", @strTemp)
			-- ����
			else if(@strTemp2 = "3" or @strTemp2 = "4" or @strTemp2 = "5")
			begin
				set @strTemp = replace(@DateFormat, "@", @strTemp)
			end
			-- ��ɫ
			else if(@strTemp2 = "9")
				set @strTemp = "CONVERT(VARCHAR," + @strTemp + ")"
		--	else if(@strtemp2='18' or @strtemp2='19' )
	--			set @strTemp = "dbo.get_dictidname()"

		end

		-- �����ֵ���
		set @Length = datalength(@aOldField)
		if(@Length > 0)
		begin

--execute Zwd_ErrorMessage "�ֵ䴦��", "Zwd_TransFields"

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

			-- ������
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
	-- ����
	RETURN @Return_Value










GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

