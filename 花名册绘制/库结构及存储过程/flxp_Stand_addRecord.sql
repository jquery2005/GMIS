SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


ALTER      PROCEDURE  flxp_Stand_addRecord 
 @sInfoId varchar(10), 
 @copydate varchar(21),--要复制的时间
 @Rundate  varchar(21)--生效时间
AS

--declare @sInfoId varchar(10) 
--declare @copydate varchar(21)--要复制的时间
--declare @Rundate  varchar(21)--生效时间

--set @sInfoId='M901'
--set @copydate='2003-10-10'
--set @Rundate='2006-10-10'

SET QUOTED_IDENTIFIER OFF 

if isnull(@copydate,'')=''
	set @copydate='1900-01-01'
declare @intMaxSet int
declare @intaddValue int
declare @strsql varchar(4000)
declare @strField varchar(2000)
declare @infofield varchar(10)
declare @sId varchar(20)

set @strField=''
set @strSql="declare curs_maxId cursor for  select max(cast(ZA0100 as int)) +100   from " +@sInfoId +" open curs_maxId"
--print(@strSql)
exec(@strSql)
--print @strSql
fetch next from curs_maxId into @intMaxSet
--print @intMaxset

 if(@@fetch_status<>0)
   set @intMaxset=0
--print @intMaxset
close curs_maxId
deallocate curs_maxId
--

set @strSql="select *  into temp"+@sInfoId+" from "+@sInfoId +" where isnull(ZB9991,'1900-01-01')='"+@copydate+"' "
	    +" update temp"+@sInfoId+" set ZB9991='"+@Rundate+"'"
	   +" update temp"+@sInfoId+" set ZA0100=cast(ZA0100 as int)+"+Convert(Varchar(20),@intMaxset,8)
--print(@strSql)
exec(@strSql)
--
 set @strSql="declare curs_tb cursor for select ZA0100,isnull(ZC9995,'0') from temp"+@sInfoId+" open curs_tb"    
 exec(@strsql)
  fetch next from curs_tb into @sId,@intaddValue
    while(@@fetch_status=0)
      begin

	set @strfield=''
        set @infofield=''

           set @strsql="declare curs_gw cursor for select InfoField from gs_property where InfoId='"+@sInfoId+"' and propertyset='0' and Flag='1' open curs_gw"
           exec(@strsql)
	   fetch next from  curs_gw into @infofield

           while(@@fetch_status=0)
	      begin
	         if(@strfield="")
		   set @strfield=@infofield+"="+@infofield+"+"+Convert(Varchar(20),@intaddValue,8)
	         else
		   set @strfield=@strfield+","+@infofield+"="+@infofield+"+"+Convert(Varchar(20),@intaddValue,8)

		  fetch next from  curs_gw into @infofield
	       end
	        close Curs_gw
	        deallocate Curs_gw

          set @strSql = "update temp"+@sinfoId+" set "+@strfield+" where ZA0100='"+@sId+"'"
	  --print(@strSql)
          exec(@strSql)
         
         fetch next from curs_tb into @sId,@intaddValue

	end
        close curs_tb
        deallocate curs_tb

set @strSql=" insert into "+@sInfoId+" select * from temp"+@sInfoId
	   +" drop table temp"+@sInfoId;
--print(@strSql)
exec(@strSql)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

