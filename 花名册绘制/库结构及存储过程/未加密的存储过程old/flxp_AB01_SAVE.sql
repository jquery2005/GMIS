
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

create     PROCEDURE  flxp_AB01_SAVE 
 @currentdate  datetime,--当前时间
 @strOut int output
 
    AS
--declare @currentdate  datetime
--set @currentdate=getdate()
declare @intMaxSet int
declare @Tablename varchar(200)
declare @strsql varchar(4000)
declare @strField varchar(2000)
declare @infofield varchar(10)
declare @historydate datetime
SET QUOTED_IDENTIFIER OFF 
set @strField=''
--print 'aaaaaaaaaaaaaaaaaaaaaaaaa'
select @intMaxset=max(isnull(setnumber,0)) from ab01S
print @intMaxset
if(@intMaxset is null )
	set @intMaxset=0
print @intMaxset

set @strsql="declare curs_gwmc cursor for select LEFT(NAME,4) FROM sysobjects where len(name)=5 and left(name,2)='AB' and right(name,1)='S' and substring(name,3,2)>='01' and substring(name,3,2)<='99'  open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @Tablename
while(@@fetch_status=0)
	begin
		set @strsql="declare curs_gw cursor for select infofield from gs_property where infoid='"+@tablename+"'  and state='1'  open curs_gw"

		exec(@strsql)
		fetch next from  curs_gw into @infofield
		while(@@fetch_status=0)
			begin
				if(@strfield="")
					set @strfield=@infofield
				else
					set @strfield=@strfield+","+@infofield
				fetch next from  curs_gw into @infofield
			end
		close Curs_gw
		deallocate Curs_gw
		set @strsql="insert into "+@Tablename+"S ("+@strfield+",ZD9992,setnumber) select "+@strfield+",'"+convert(varchar(10),@currentdate,21)+"',"+cast(@intMaxset+1 as varchar(10))+" from "+ @Tablename
		exec(@strsql)
		if @intMaxset>=1
		begin
			select  @historydate= zd9992 from ab01s where setnumber=@intMaxset and isnull(za9996,'')=''
			set @strsql="update "+@tablename+"S set zd9991='" + convert(varchar(10),@historydate,21) +"' where setnumber="+cast(@intMaxset+1 as varchar(10)) 
			exec(@strsql)
		end
		if(@@error<>0)
			goto abandon
		fetch next from  curs_gwmc into @Tablename
	end

close Curs_gwmc
deallocate Curs_gwmc
SET QUOTED_IDENTIFIER on
return 0
abandon:
return 1


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

