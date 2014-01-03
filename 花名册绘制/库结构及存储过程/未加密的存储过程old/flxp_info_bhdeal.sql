SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE PROCEDURE  flxp_info_bhdeal 
@mainObject varchar(4)
with ENCRYPTION 
AS

SET QUOTED_IDENTIFIER OFF 

declare @strsql varchar(2000)
declare @intLen int
declare @I int

set @strSQl=" declare curs_gwmc cursor for select isnull(max(distinct(len(za0101))),0) from "+@mainObject+"   open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @intlen
close Curs_gwmc
deallocate Curs_gwmc
print @intlen
set @i=1
while (@intlen>0)
begin
	if @i=1
		set @strsql="update "+@mainObject+"        set zc9995=(select isnull(dp0103,'0') from dp01 where      left("+@mainObject+".za0101,1)=dp01.za0101 )                                 where left("+@mainObject+".za0101,"+cast(@i as varchar(10))+") in (select za0101 from dp01)   and   len("+@mainObject+".za0101)>="+cast(@i as varchar(10))

	else
		set @strsql="update "+@mainObject+" set zc9995=cast(zc9995 as numeric(10,0))+(select cast(isnull(dp0103,'0') as numeric(10,0)) from dp01 where substring("+@mainObject+".za0101,"+cast(@i as varchar(10))+",1)=dp01.za0101) where substring("+@mainObject+".za0101,"+cast(@i as varchar(10))+",1) in (select za0101 from dp01) and   len("+@mainObject+".za0101)>="+cast(@i as varchar(10))

	exec(@strsql)
	set @i=@i+1
	set @intlen=@intlen-1

end


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO
