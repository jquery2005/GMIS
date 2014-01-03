if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[GetClanByUser]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[GetClanByUser]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

CREATE function dbo.GetClanByUser(@UserCode varchar(20))
returns varchar(200)
as 
/*
  用于获取制定用户的政治面貌记录；
  如：加入共产党的时间；加入其他党派的记录
*/
Begin
  Declare @desc varchar(200),@desc1 varchar(10);
  Select @desc='';
  Select @desc1='';
  -- case when 考虑到null的存在
  Select @desc1=case when aa2210 is null then '' else Convert(varchar(6),aa2210,112) end from aa22 where za0100=@UserCode and aa2205='01';
  If @desc1=''
        Select  @desc=@Desc+'；'+c.description from gs_dictItem c where c.dictvalue<>'01' and dictid='bu'
                   and dictvalue in(select top 3 aa2205 from aa22 where za0100=@UserCode);
                   -- top 3 :最多返回两个其他党派
  else
        Select  @desc=@Desc+'；'+c.description from gs_dictItem c where c.dictvalue<>'01' and dictid='bu'
                   and dictvalue in(select top 2 aa2205 from aa22 where za0100=@UserCode);
                    -- top 2 :最多返回两个其他党派
  /*  ---- 又加入共产党的时间，返回最多两个民主党派，如无，最多返回三个 --*/  
  
  If @desc1<>'' and ltrim(rtrim(@desc))<>'；' and ltrim(rtrim(@desc))<>''
     Select @desc1=@desc1+'；'

return @desc1+''+substring(@desc,2,len(@desc))

End




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

