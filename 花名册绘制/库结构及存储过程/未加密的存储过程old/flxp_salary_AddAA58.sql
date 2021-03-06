if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_salary_AddAA58]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_salary_AddAA58]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

CREATE   PROCEDURE  flxp_salary_AddAA58
 @salaryNo varchar(20),
 @condition varchar(2000)=null
AS
SET QUOTED_IDENTIFIER OFF 
declare @strsql varchar(2000)
declare @infofield varchar(6)
declare @fields1 varchar(2000)
declare @fields2 varchar(2000)
declare @zc9995 varchar(10)
--处理工资业务中处理特殊数据（as01.as0110）--工资子集加记录
DECLARE @ExceuteSql varchar(6000)
DECLARE as01_cursor CURSOR static FOR 
SELECT as0110 FROM as01 where za0100=@SalaryNo
OPEN as01_cursor
FETCH NEXT FROM as01_cursor
INTO @ExceuteSql
close as01_cursor
deallocate as01_cursor



-- 将上一条记录的双倍字段复制下来

select @zc9995=zc9995 from as01 where za0100=@salaryNo
if(isnull(@condition,'')='')
	begin
	set @condition='1=1'
	end
else
	begin
	set @condition="za0100 in ("+@condition+")"
	end
 --insert into ll values(@ExceuteSql)
if(@ExceuteSql!='' and @ExceuteSql is not null)
begin
  set @ExceuteSql=replace(@ExceuteSql,'flxhcfmj',@condition)
--  create table ll(kk varchar(6000))
 -- insert into ll values(@ExceuteSql)
  exec(@ExceuteSql)
end
--select * from ll
--set @strSQl=" declare curs_g cursor for select infofield from gs_property where infoid='aa58' and isnull(standbyvarchar,'')='' and flag='0' and infofield not in ('aa58id','zc9993') and Restriction<>'7' open curs_g"
--exec(@strsql)

---fetch next from  curs_g into @infofield
--while(@@fetch_status=0)
--	begin
--		if @fieldsBase=""
--			begin
--				set @fieldsBase=@infofield
--			end
--		else
--			begin
--				set @fieldsBase=@fieldsBase+","+@infofield
--			end
--		fetch next from  curs_g into @infofield
--	end
--close Curs_g
--deallocate Curs_g

set @fields1=''
set @fields2=''

set @strSQl=" declare curs_g cursor for select infofield from gs_property where infoid='aa58'  and  state='1'  and standbyvarchar='A' open curs_g"
exec(@strsql)
fetch next from  curs_g into @infofield
while(@@fetch_status=0)
	begin
		if @fields1=""
			begin
				set @fields1=@infofield
				set @fields2='_'+right(@infofield,5)
			end
		else
			begin
				set @fields1=@fields1+","+@infofield
				set @fields2=@fields2+",_"+right(@infofield,5)
			end
		fetch next from  curs_g into @infofield
	end
close Curs_g
deallocate Curs_g
if @fields1<>""
begin
	--set @fields1="za0100,aa58id,"+@fields1
	--set @fields2="za0100,aa58id+100,"+@fields2
	set @fields1="za0100,aa58id,zc9993,"+@fields1
	set @fields2="za0100,aa58id+100,'*',"+@fields2

	set @strsql="insert into aa58 ("+@fields1+") select "+@fields2+" from aa58 where zc9993='1' and "+@condition
	exec(@strsql)
        set @strsql="update aa58 set zc9993='0' where zc9993='1' and "+@condition
	exec(@strsql)
	set @strsql="update aa58 set zc9993='1' where zc9993='*' and "+@condition
	exec(@strsql)
end
if (@zc9995='1')
	begin
		update aa25 set aa2506='1'
		 where aa25.za0100+right('0000000000'+cast(aa25.aa25id as varchar(10)),10) in
		(select a1.za0100+right('0000000000'+cast(a1.aa25id as varchar(10)),10) from  
		(select za0100,aa25id from aa25) as a1 left join (select za0100,aa25id from aa25 where aa2501='2' and aa2504>='3' and aa2506<>'1') as a2
		 on a2.za0100=a1.za0100 where a1.aa25id<=a2.aa25id)
		set @strsql="update  aa25  set aa2506='1' where  "+@condition
	end
if (@zc9995='2')
	begin
		update aa25 set aa2507='1'
		 where aa25.za0100+right('0000000000'+cast(aa25.aa25id as varchar(10)),10) in
		(select a1.za0100+right('0000000000'+cast(a1.aa25id as varchar(10)),10) from  
		(select za0100,aa25id from aa25) as a1 left join (select za0100,aa25id from aa25 where aa2501='2' and aa2504>='3' and aa2507<>'1') as a2
		 on a2.za0100=a1.za0100 where a1.aa25id<=a2.aa25id)
		set @strsql="update  aa25  set aa2507='1' where  "+@condition
	end
exec(@strsql)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

