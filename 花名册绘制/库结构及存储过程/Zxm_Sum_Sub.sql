SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO




create             PROCEDURE Zxm_Sum_Sub
         @TargetInfoId    varchar(4),
         @ModifyStyle     varchar(4),
         @ObjectID        varchar(30) 
AS
         declare @var_getSql varchar(3000)
         declare cur_getSql cursor for select sql_update_set from jgbz_2 where  Targetinfoid=@TargetInfoId and isuse='1' and modifystyle=@ModifyStyle
         open cur_getSql;
         fetch next from cur_getSql into @var_getSql
         while(@@fetch_status=0)
           begin
              set @var_getSql= replace(@var_getSql,'@##@',@ObjectId)
              print @var_getSql
              exec(@var_getSql)
              fetch next from cur_getSql into @var_getSql
           end
         close cur_getSql


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

