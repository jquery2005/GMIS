SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



ALTER   FUNCTION field_definition 
	(@infoid varchar(128),@infofield varchar(128))
RETURNS varchar(200)
AS
BEGIN
	declare	@datatype varchar(10)
	declare	@length varchar(4)
	declare	@decimal varchar(2)
	declare @Restriction int
	declare @RestExplain varchar(1000)
	--���ɵ��ֶεĶ���
	declare @fielddefinition varchar(100)

	select  @datatype = datatype,
		@length = length, 
		@decimal = decimal,
		@Restriction = Restriction,
		@RestExplain = RestrictionExplain
	from gs_property where(infoid = @infoid and infofield = @infofield)

	set @fielddefinition = case  
		--�ַ���
		when @datatype = '0' or @datatype = '16' or @datatype = '17' or @datatype = '12' or @datatype = '18' or @datatype = '19' 
			then ' varchar(' + @length + ')'
		--����
		when @datatype = '1' 
			then ' varchar(20)'
		--����
		when @datatype = '2' 
			then ' numeric(' + @length + ',' + @decimal + ')'
		--����
		when @datatype = '3' or @datatype = '4' or @datatype = '5' 
			then ' datetime'
		--���䣬��ַ��Ŀ¼���������ã�����
		when @datatype = '6' or @datatype = '7' or @datatype = '8' or @datatype = '10' or  @datatype = '13' 
			then ' varchar(100)'
		--��ɫ
		when @datatype = '9' 
			then ' int'
		--��Ƭ����ý��
		when @datatype = '11' or  @datatype = '15' 
			then ' image'
		--��ע
		when @datatype = '14' 
			then ' text'
	end
-------------------------------------------------------------------------------------------------------------------------
	if @Restriction = 7
	begin
		set @fielddefinition = ' as ' + @RestExplain
	end

	return @fielddefinition
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

