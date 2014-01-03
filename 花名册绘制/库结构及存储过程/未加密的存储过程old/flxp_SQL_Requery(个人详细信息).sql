SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

















ALTER    PROCEDURE   flxp_SQL_Requery  
@StrZA0100 varchar(500),--±àºÅ
@StrField  varchar(500),--ÏÔÊ¾×Ö¶Î´®'aa0101','aa0102'
@StrMainObject varchar(4),--ÏÔÊ¾¶ÔÏó
@strOut varchar(8000) output--Êä³ö

AS

declare @strSQl varchar(8000)
declare @strTBL varchar(1000)
declare @field varchar(20)
declare @fieldname varchar(20)
declare @strtemp varchar(8000)
declare @strdatatype varchar(10)

declare @dictid as varchar(20)
set @strtemp=''

set @strOut = ''

SET QUOTED_IDENTIFIER OFF  
--set @strTBL= @StrMainObject + " where " + @StrMainObject + ".ZA0100 = '" + @StrZA0100 + "' and " + @StrMainObject + ".ZC9993 = '1' " 
set @strTBL= @StrMainObject + " where " + @StrZA0100

declare @str varchar(10)
declare @strfield1 varchar(1000)
declare @aa int
declare @jstable varchar(40)
set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
set @strSql = "create table " + @jstable + "(orderid int,strField varchar(10))"
exec(@strSql)

if	isnull(@StrField,'') = ''
	set @strSql = "declare curs_g cursor for select InfoField,Description from gs_property where infoid = '"+ @StrMainObject +"' and propertySet = '0' and state = '1' order by orderNo open curs_g"
else
begin
	--drop table ##hjhtemp

	set @strfield1 = @StrField
	select @aa = len(@strfield1)
	while @aa>1
	begin
		set @str = substring(@strfield1,2,6)
		set @strSql = "insert into " + @jstable + "values(" + cast(@aa as varchar(10)) + ",'" + @str+ "') "
		exec(@strSql)

		if(@aa > 9)
		begin
			set @aa = @aa -9
			set @strfield1 = substring(@strfield1,10,@aa)
		end
		else
			set @aa = 0

--		print @str
	end

	set @strSql = "declare curs_g cursor for select InfoField,Description from gs_property left join " + @jstable + " on strField = InfoField where infoid = '"+ @StrMainObject +"' and InfoField in (" + @StrField + ") and propertySet = '0' and state = '1' order by orderid desc open curs_g"

end
--print @strsql
exec(@strsql)

fetch next from  curs_g into @field,@fieldname
while(@@fetch_status=0)
	begin
	
		select @dictid=isnull(dictid,'') from gs_property where infoid +'.'+infofield= @StrMainObject+'.'+@field
		select @strdatatype=isnull(DataType,'1') from gs_property where infoid +'.'+infofield= @StrMainObject+'.'+@field
	
		if len(@dictid)<=1	
			begin		
				if (@strtemp='')
					if @strdatatype = '5' 
						set @strtemp= "CONVERT(varchar(10)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '4'
						set @strtemp= "CONVERT(varchar(7)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '3'
						set @strtemp= "CONVERT(varchar(4)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else
						set @strtemp=@field+" as '"+@fieldname + "." + @strdatatype + "' "
				else	
					if @strdatatype = '5' 
						set @strtemp= @strtemp + "," + "CONVERT(varchar(10)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '4'
						set @strtemp= @strtemp + "," + "CONVERT(varchar(7)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else if @strdatatype = '3'
						set @strtemp= @strtemp + "," + "CONVERT(varchar(4)," + @field + ",21)"+" as '"+@fieldname + "." + @strdatatype + "' "
					else
						set @strtemp=@strtemp + "," + @field+" as '"+@fieldname + "." + @strdatatype + "' "
			end
		else if len(@dictid)<=2
			begin
			if (@strtemp='')
					set @strtemp="(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
				else	
					set @strtemp=@strtemp+",(select description from gs_dictitem where dictid='"+@dictid+"' and dictvalue="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
			end
		else
			begin
				if (@strtemp='')
					set @strtemp="(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
				else	
					set @strtemp=@strtemp+",(select za0101 from "+left(@dictid,4)+" where za0100="+@field+") as '"+@fieldname+ "." + @strdatatype + "' "
			end

		fetch next from  curs_g into @field,@fieldname
	end
close Curs_g
deallocate Curs_g
set @strSql = "drop table " + @jstable 
exec(@strSql)

set @strtemp="select "+@strtemp+"," +@StrMainObject+".ZA0100 from "+@strTBL

set @strOut=@strtemp
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

