if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_040]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_040]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_041]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_041]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_042]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_042]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_050]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_050]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_051]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_051]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_052]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_052]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_053]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_053]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_054]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_054]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_055]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_055]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_056]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_056]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_057]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_057]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_058]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_058]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[associate_propertyset]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[associate_propertyset]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[field_definition]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[field_definition]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[field_length]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[field_length]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[field_typename]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[field_typename]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getDictIdDesc]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[getDictIdDesc]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getSalarySetInfoName]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[getSalarySetInfoName]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[get_orderby]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[get_orderby]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[getvalue]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[getvalue]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[must_select_field]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[must_select_field]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[sub_object]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[sub_object]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

--==========================================================================
--CREATE FUNCTION FUNC_040(@infofield sysname,@infoid sysname, @flag int)
--2003-02-28 改为二个参数
----------------------------------------------------------------------------
CREATE FUNCTION FUNC_040(@infofield sysname,@flag int)
--==========================================================================
RETURNS varchar(100)
AS
BEGIN
	RETURN ''
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_041(@infofield sysname,@infoid sysname,@flag int)
RETURNS varchar(100)
AS
BEGIN
	RETURN ''
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_042(@infofield sysname)
RETURNS varchar(100)
AS
BEGIN
	RETURN ''
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_050(@infofield sysname)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_051(@infofield sysname,@A int,@B int)
RETURNS sql_variant
AS
BEGIN
	RETURN null
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_052(@infofield sysname,@A int)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_053(@infofielda sysname,@infofieldb sysname,@A int)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_054(@infofielda sysname)
RETURNS varchar(100)
AS
BEGIN
	RETURN ''
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_055(@infofielda sysname)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_056(@infofielda sysname)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_057(@infofielda sysname,@infofieldb sysname)
RETURNS int
AS
BEGIN
	RETURN 0
END


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_058(@infofielda sysname,@A int)
RETURNS int
AS
BEGIN
	RETURN 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION associate_propertyset 
	(
	 @infoid sysname, --本表名称
	 @infoidb varchar(100),--被关联表的名称
	 @type int --关系类型
	)
RETURNS varchar(1000)
AS
BEGIN
	declare @propertyset varchar(1000)
	if @infoidb is null or @infoidb = ''
	begin --如果未指定是哪个关系，则返回第一个关系
		select top 1 @propertyset = propertyset from gs_objectassociate where infoida = @infoid and associatetype = @type
	end
	else
	begin
		if exists(select propertyset from gs_objectassociate where infoida = @infoid and associatetype = @type and infoidb = @infoidb)
		begin --如果指定的关联存在
			select @propertyset = propertyset from gs_objectassociate where infoida = @infoid and associatetype = @type and infoidb = @infoidb
		end
		else
		begin --如果指定的关联不存在返回第一个关联
			select top 1 @propertyset = propertyset from gs_objectassociate where infoida = @infoid and associatetype = @type
		end
	end
	RETURN @propertyset
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION field_definition 
	(@infoid varchar(128),@infofield varchar(128))
RETURNS varchar(200)
AS
BEGIN
	declare	@datatype varchar(10)
	declare	@length varchar(4)
	declare	@decimal varchar(2)
	declare @Restriction int
	declare @RestExplain varchar(1000)
	--生成的字段的定义
	declare @fielddefinition varchar(100)

	select  @datatype = datatype,
		@length = length, 
		@decimal = decimal,
		@Restriction = Restriction,
		@RestExplain = RestrictionExplain
	from gs_property where(infoid = @infoid and infofield = @infofield)

	set @fielddefinition = case  
		--字符串
		when @datatype = '0' or @datatype = '16' or @datatype = '17' or @datatype = '12' or @datatype = '18' 
			then ' varchar(' + @length + ')'
		--代码
		when @datatype = '1' 
			then ' varchar(20)'
		--数字
		when @datatype = '2' 
			then ' numeric(' + @length + ',' + @decimal + ')'
		--日期
		when @datatype = '3' or @datatype = '4' or @datatype = '5' 
			then ' datetime'
		--邮箱，网址，目录，特殊引用，常量
		when @datatype = '6' or @datatype = '7' or @datatype = '8' or @datatype = '10' or  @datatype = '13' 
			then ' varchar(100)'
		--颜色
		when @datatype = '9' 
			then ' int'
		--照片，多媒体
		when @datatype = '11' or  @datatype = '15' 
			then ' image'
		--备注
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

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION field_length 
	(@infoid varchar(128),@infofield varchar(128))
RETURNS int
AS
BEGIN

	declare	@datatype varchar(10)
	declare	@length varchar(4)
	--实际的字段的宽度
	declare @realylength varchar(4)
	select  @datatype = datatype,
		@length = length
	from gs_property where(infoid = @infoid and infofield = @infofield)

	set @realylength = case  
		--代码
		when @datatype = '1' then '20'
		--日期
		when @datatype = '3' or @datatype = '4' or @datatype = '5' then '8'
		--邮箱，网址，目录，特殊引用，引用，常量
		when @datatype = '6' or @datatype = '7' or @datatype = '8' or @datatype = '10' or @datatype = '12' or @datatype = '13' then '100'
		--颜色
		when @datatype = '9' then '4'
		--照片，多媒体，备注
		when @datatype = '11' or  @datatype = '15' or @datatype = '14' then '16'
		--其它
		else @length 
		end

	return @realylength

END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



create     FUNCTION field_typename
	(@datatype varchar(10))
RETURNS varchar(10)
AS
BEGIN

	--实际的字段数据类型名称
	declare @realylength varchar(20)
	set @realylength = ''
	set @realylength = case  
		--代码
		when @datatype = '1' then '字符'
		--日期
		when @datatype = '3' then '日期' 
		when @datatype = '2' then '数值' 
		when @datatype = '4' then '日期' 
		when @datatype = '5' then '日期'
		--邮箱，网址，目录，特殊引用，引用，常量
		when @datatype = '6'  or  @datatype = '7' or  @datatype = '8'  or @datatype = '10' or @datatype = '12' or @datatype = '13' then '字符'
		--颜色
		when @datatype = '9' then '整型'
		--照片，多媒体，备注
		when @datatype = '11' or  @datatype = '15'  then '照片，多媒体' 
		when @datatype = '14' then '备注'
		--其它
		else '字符' 
		end

	return @realylength

END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

create function getDictIdDesc
(@DictId varchar(20))
returns varchar(100)
as
begin
declare @name varchar(100)
if len(@dictid)>2
begin
  set @name=(select shortdesc from gs_structure where infoid=substring(@Dictid,1,4))
end
else
begin
  set @name=(select description from gs_dict where dictid=@Dictid)
end
if(@name=null)
 set @name=''
 return @name
end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



CREATE   function getSalarySetInfoName 
 (@type varchar(10),@setval varchar(10))
 returns    varchar(100)
as 
begin
declare @name varchar(100)
  if @type='001' 
    begin
      set @name=(select top 1 Description from  gs_stand where type=0 and StandId=@setval)
    end
  else if @type='002'
    begin
      set @name=(select top 1 isnull([description],infoid) from gv_formula where formulaId=@setval)
    end 
  else if @type='003'
    begin
      set @name=(select top 1 rptname from r501 where cast(typeno as varchar)+'_'+cast(rptno as varchar)=@setval and IsAnalysis='1')
    end 
  else if @type='004'
    begin
      set @name=(select top 1 rptname from r501 where cast(typeno as varchar)+'_'+cast(rptno as varchar)=@setval and IsAnalysis='0')
    end 
  else if @type='005'
    begin
      set @name=(select top 1 name from r200 where cast(typeno as varchar)+'_'+cast(settableno as varchar)+'_'+cast(tableno as varchar)=@setval)
    end 
    else if @type='006'--登记表
    begin
      set @name=(select top 1 rptname from  r401 where rptno=@setval)
    end 
   if isnull(@name,'')=''
     set   @name='与此关联目标项已不存在'
   return (@name)
end





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO


CREATE   FUNCTION get_orderby
	(
	 	@objectid sysname
	)
RETURNS varchar(8000)

AS

BEGIN

	declare @orderby varchar(8000)

	set @orderby = dbo.associate_propertyset(@objectid, '', 1)
	set @orderby = @objectid + '.' + replace(@orderby, ',', ',' + @objectid + '.')
	set @orderby = @orderby + ',' + @objectid + '.' + @objectid + 'Id'

	RETURN @orderby

END



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION dbo.getvalue (@express varchar(200))
RETURNS varchar(20)
AS  
BEGIN 
declare @strsql varchar(200)
declare @t1 varchar(20)
set @strsql =' DECLARE R241_cursor CURSOR FOR   select '+ @express
exec @strsql
open r241_cursor
FETCH NEXT FROM R241_cursor into @t1
close R241_cursor
DEALLOCATE r241_cursor
return @t1
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION must_select_field 
	(
	@infoid varchar(4), --对象名
	@infofield varchar(6), --属性的名称
	@associatename varchar(1000) --关联名
	)
RETURNS bit
AS
BEGIN
	declare @keys varchar(1000)
	declare @associate varchar(1000)
	declare @restriction int
	declare @default varchar(1000)
	declare @returnvalue bit 
	set @returnvalue = 0
	--取关联表中的字段
	--set @associate = (select propertyset from gs_objectassociate where associatetype = 1 and infoida = @infoid)
	set @associate = dbo.associate_propertyset(@infoid,@associatename,1)

	--取主键(排序字段)
	select @keys = pkey from gs_structure where infoid = @infoid

	select @infofield = infofield,@restriction = restriction,@default = defaultvalue from gs_property where infoid = @infoid and infofield = @infofield and state = 1
	if(@infofield is not null)
	begin
		if charindex(@infofield,@associate) <> 0 or --如果是关联字段
			charindex(@infofield,@keys) <> 0 or --如果是主键字段
			@infofield = @infoid + 'ID' or --如果是本表的ID字段
			((@default is not null) and (@default <> '')) or --如果是有缺省值字段
			@restriction > 0 or --如果有约束
			(exists(select * from gs_property where infoid = @infoid and condition like '%' + @infofield + '%')) -- 被其它字段设置为条件
		begin
			set @returnvalue = 1
		end
	end
	return @returnvalue
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE FUNCTION sub_object(@InfoIdA sysname, @InfoIdB sysname)
RETURNS bit
AS
BEGIN
	declare @InfoId sysname;
	set @InfoId = @InfoIdA;
	if(@InfoIdA = @InfoIdB) return 1;
	while(@InfoId is not null)
	begin
		set @InfoId = (select top 1 parentid from gs_structure where infoid = @InfoId)
		if @InfoId = @InfoIdB return 1
	end
	return 0
END

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

