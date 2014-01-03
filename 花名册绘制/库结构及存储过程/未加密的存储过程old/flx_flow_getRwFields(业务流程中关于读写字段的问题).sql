SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO



create  procedure flx_flow_getRwFields

@flowId Varchar(4),
@ItemId varchar(10), --步骤代码
@RwFields varchar(1000),
@strOut varchar(1000) output
--declare @flowId Varchar(4)
--declare @ItemId varchar(10) --步骤代码
--set @flowId='108'
--set @ItemId='108002001'
with encryption
as
--
declare @Sqls varchar(2000)
declare @strFptr varchar(1000)
--declare @RwFields varchar(1000)
declare @strRw varchar(1000)
if(@RwFields=null)
   set @RwFields=''
SET QUOTED_IDENTIFIER OFF  
set @Sqls ="declare  Curs_fptr cursor for  select isnull(fptr,'') from gs_flowItem where flowId='"+@flowId+"' and ItemId='"+@ItemId+"' and ItemType='0' and ItemGKFlag='1' open Curs_fptr" 
--print(@sqls)
exec(@Sqls) 
fetch next from Curs_fptr into @strFptr 
close curs_fptr
deallocate curs_fptr 
--print(@strFptr)
--

if(@strFptr ='')
   set @sqls ="declare curs_rw cursor for select isnull(ReadWriteField,'') from gs_flowItem where flowId='"+@flowId+"' and isnull(fptr,'')='' and ItemType='0' and ItemGKFlag='1' open curs_rw"
else
   set @sqls ="declare curs_rw cursor for select isnull(ReadWriteField,'') from gs_flowItem where flowId='"+@flowId+"' and fptr='"+@strFptr+"' and ItemType='0' and ItemGKFlag='1' open curs_rw"

--print(@sqls)
exec(@Sqls)
fetch next from curs_rw into @strRw
--循环

while(@@fetch_status=0)
     begin
	 if(@strRw<>'')
             set @RwFields = @RwFields+@strRw+','  
	fetch next from curs_rw into @strRw
     end

close curs_rw
deallocate curs_rw

declare @strreturn varchar(1000)  
set @strReturn =''
if(@strFptr<>'')
 begin
   if(CHARINDEX(',', @strFptr)>0)
	set @strFptr = left(@strFptr,CHARINDEX(',', @strFptr)-1)
   exec flx_flow_getRwFields @flowId,@strFptr,@RwFields,@strReturn output
    if(@strReturn<>'')
  	set @RwFields = @RwFields+@strReturn+','
 end
--else
--  return
--print(@RwFields)
set @strOut=@RwFields

SET QUOTED_IDENTIFIER on











GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

