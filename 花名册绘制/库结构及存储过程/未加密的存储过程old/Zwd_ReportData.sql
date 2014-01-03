SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Zwd_ReportData]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[Zwd_ReportData]
GO

/***************************************************************************************** 20040508
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
create  PROCEDURE Zwd_ReportData
	(
		@TableName		varchar(8000)	= "",				-- TableName
		@GroupString		varchar(8000)	= ""				-- Group Order String
	)
AS
	SET ANSI_NULL_DFLT_ON ON

	SET QUOTED_IDENTIFIER OFF

	SET NOCOUNT ON

	SET ANSI_WARNINGS OFF


	declare @TableNameOrder		varchar(8000)

	declare	@strSQL			varchar(8000)
	declare	@strSelect		varchar(8000)
	declare	@strSelect2		varchar(8000)
	declare	@strInto		varchar(8000)
	declare	@strFrom		varchar(8000)
	declare	@strWhere		varchar(8000)
	declare	@strTemp		varchar(8000)
	-- �����ִ�
	declare @GroupBy2		varchar(8000)
	-- ����Ϊ�������Ķ���
	declare @InfoId			varchar(10)
	declare @Object			varchar(10)
	declare @InfoFields		varchar(8000)
	declare @DataType		int
	-- ִ�еķ��ؽ��
	declare @Result			int

	-- add by zhangwd 2004-04-09
	declare @NeedDisplayText	varchar(8000)
	declare @NeedDisplayText0	varchar(8000)
	declare @AddExLink		int
	-- end add

	-- add by zhangwd 2004-04-10
	declare @GetOrgLevel		int
	declare @tempInfoField		varchar(8000)
	declare @tempInfoIdField	varchar(8000)
	-- end add

	-- add by zhangwd 2004-05-08
	declare @GetOrgUpLevel		int
	-- end add

--execute Zwd_ErrorMessage @TableName, "Zwd_ReportData"


	if(@GroupString = "")
		exec(@TableName)
	else
	begin
		set @TableNameOrder = @TableName + "_Order"

--execute Zwd_ErrorMessage @TableNameOrder, "Zwd_ReportData"

		set @strSelect = ""
		set @strSelect2 = ""
		set @strFrom = @TableName
		set @strWhere = ""


		set @Result = datalength(@GroupString)
		while(@Result > 0)
		begin
--
			execute @Result = Zwd_PopFirstWord @GroupString output, @InfoFields output, "||"


			-- add by zhangwd 2004-04-09
			set @NeedDisplayText = Null
			if(charindex("^", @InfoFields) > 0)
			begin
--
				execute Zwd_PopFirstWord @InfoFields output, @strSQL output, "^"

				set @NeedDisplayText = @InfoFields

				if(@NeedDisplayText is Null)
					set @NeedDisplayText = ""
--
				execute Zwd_PopFirstWord @NeedDisplayText output, @NeedDisplayText0 output, "^"

				if(@NeedDisplayText is Null)
					set @NeedDisplayText = ""
				if(@NeedDisplayText0 is Null)
					set @NeedDisplayText0 = ""

				set @InfoFields = @strSQL
			end
			-- end add

			-- add by zhangwd 2004-04-10
			set @GetOrgLevel = 0

			-- add by zhangwd 2004-05-08
			set @GetOrgUpLevel = 0
			-- end add

			if(charindex("#", @InfoFields) > 0)
			begin
--
				execute Zwd_PopFirstWord @InfoFields output, @strSQL output, "#"

				if (IsNull(@InfoFields, "") <> "")
				begin
					-- add by zhangwd 2004-05-08
					if(charindex("@@@@", @InfoFields) > 0)
					begin
						set @GetOrgUpLevel = 1
						set @InfoFields = substring(@InfoFields, 1, 1)
					end
					-- end add

					if(@InfoFields = "1" or @InfoFields = "2" or @InfoFields = "3")
						set @GetOrgLevel = cast(@InfoFields as int)
				end

				set @InfoFields = @strSQL
			end
			-- end add

--
			execute Zwd_PopFirstWord @InfoFields output, @Object output, ";"
--
			execute Zwd_PopFirstWord @Object output, @InfoId output, ":"
			
			-- add by zhangwd 2004-04-10
			set @strSQL = @InfoFields
--
			execute Zwd_PopFirstWord @strSQL output, @tempInfoField output, ":"
--
			execute Zwd_PopFirstWord @strSQL output, @tempInfoField output, ":"

			set @tempInfoIdField = @InfoId + "." + @tempInfoField
			-- end add

			-- add by zhangwd 2004-04-09
			if( (@Object = "AB01") and (not @NeedDisplayText is Null) )
			begin
				set @strTemp = "AA01.ZA0100="+@TableName+".ZA0100"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", "AA01", @strTemp,@strWhere output
--
				execute Zwd_TransTables @InfoId, "AA01", @Object, @strFrom output, @strWhere output, @AddExLink output, 1

				set @strTemp = @InfoId + ".ZA0100=" + @Object + ".ZA0100 AND " + @InfoId + ".ZC9993 = 1"
--
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @InfoId, @strTemp,@strWhere output
			end

			if(@NeedDisplayText is Null)
			begin
			-- end add
				set @strTemp = @Object+".ZA0100="+@TableName+".ZA0100"
--
				--execute Zwd_AddFrom @strFrom output, " JOIN ", @Object, @strTemp,@strWhere output
				execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @Object, @strTemp,@strWhere output
	
				-- add by zhangwd 2004-03-26
				set @GroupBy2 = "_Order_"
				-- end add
--
				execute Zwd_ParseField @InfoId,@Object,@Object,@InfoFields,"","","","1","",0,@DataType output,"",@strTemp output,@strFrom output,@strWhere output,"","","",@GroupBy2 output,@Result

				-- add by zhangwd 2004-04-10
				if(@GetOrgLevel > 0)
				begin
					set @strSQL = @tempInfoIdField

					set @strFrom = replace(@strFrom, @strSQL, "dbo.GetOrgValue(" + @strSQL + "," + cast(@GetOrgLevel as varchar(1)) + ")")
				end
				-- end add

			-- add by zhangwd 2004-04-09
			end
			else
			begin
				set @strTemp = @tempInfoIdField
			end
			-- end add

			if(@strSelect <> "")
			begin
				-- add by zhangwd 2004-04-09
				if(@NeedDisplayText is Null)
				begin
				-- end add
					set @strSelect = @strSelect + "+'_'+"
				-- add by zhangwd 2004-04-09
				end
				else
				begin
					set @strSelect = @strSelect + "+"
				end
				-- end add
			end

			-- add by zhangwd 2004-04-09
			if(not @NeedDisplayText is Null)
			begin
				set @strSelect = @strSelect + "'" + @NeedDisplayText0 + "'+"
			end
			-- end add

			-- delete by zhangwd 2004-04-09
			--set @strSelect = @strSelect + "ISNULL(" + @strTemp + ",'[��]')"
			-- end delete

			-- add by zhangwd 2004-04-09
			if(@NeedDisplayText is Null)
				set @strSelect = @strSelect + "ISNULL(" + @strTemp + ",'')"
			else
			begin
				set @strSelect = @strSelect + "CAST(ISNULL(" + @strTemp + ",0) AS VARCHAR(1024))"
			end

			if(not @NeedDisplayText is Null)
			begin
				set @strSelect = @strSelect + "+'" + @NeedDisplayText + "'"
			end

			if(@NeedDisplayText is Null)
			begin
			-- end add
				if(@strSelect2 <> "")
					set @strSelect2 = @strSelect2 + "+'_'+"
				-- modify by zhangwd 2004-04-10
				--set @strSelect2 = @strSelect2 + "ISNULL(" + @InfoId + "." + @Object + ",'')"
				if(@GetOrgLevel = 0)
					set @strSelect2 = @strSelect2 + "ISNULL(" + @tempInfoIdField + ",'')"
				else
					set @strSelect2 = @strSelect2 + "ISNULL(dbo.GetOrgValue(" + @tempInfoIdField + "," + cast(@GetOrgLevel as varchar(1)) + "),'')"
				-- end modify
			-- add by zhangwd 2004-04-09
			end
			-- end add

--execute Zwd_ErrorMessage @strTemp, "Zwd_ReportData"

		end


		set @TableNameOrder = @TableName + "_Order"

		set @strSelect = " SELECT " + @TableName + ".*," + @strSelect2 + " AS FOrder," + @strSelect + " AS FOrder2"
		set @strInto = " INTO " + @TableNameOrder
		set @strFrom = " FROM " + @strFrom
		if(@strWhere <> "")
			set @strWhere = " WHERE " + @strWhere

		
		set @strSQL = char(13) + @strSelect + char(13) + @strFrom + char(13) + @strWhere
--
execute Zwd_ErrorMessage @strSQL, "Zwd_ReportData"

		exec("IF EXISTS(SELECT * FROM tempdb.dbo.SYSOBJECTS WHERE NAME='" + @TableNameOrder + "') DROP TABLE " + @TableNameOrder + @strSelect + @strInto + @strFrom + @strWhere)


		exec("SELECT * FROM " + @TableNameOrder + " ORDER BY FOrder")
	end


	SET ANSI_WARNINGS ON

	SET NOCOUNT OFF

	SET ANSI_NULL_DFLT_ON OFF

	SET QUOTED_IDENTIFIER ON


	RETURN 0








GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
