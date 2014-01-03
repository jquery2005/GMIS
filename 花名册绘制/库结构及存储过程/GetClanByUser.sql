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
  ���ڻ�ȡ�ƶ��û���������ò��¼��
  �磺���빲������ʱ�䣻�����������ɵļ�¼
*/
Begin
  Declare @desc varchar(200),@desc1 varchar(10);
  Select @desc='';
  Select @desc1='';
  -- case when ���ǵ�null�Ĵ���
  Select @desc1=case when aa2210 is null then '' else Convert(varchar(6),aa2210,112) end from aa22 where za0100=@UserCode and aa2205='01';
  If @desc1=''
        Select  @desc=@Desc+'��'+c.description from gs_dictItem c where c.dictvalue<>'01' and dictid='bu'
                   and dictvalue in(select top 3 aa2205 from aa22 where za0100=@UserCode);
                   -- top 3 :��෵��������������
  else
        Select  @desc=@Desc+'��'+c.description from gs_dictItem c where c.dictvalue<>'01' and dictid='bu'
                   and dictvalue in(select top 2 aa2205 from aa22 where za0100=@UserCode);
                    -- top 2 :��෵��������������
  /*  ---- �ּ��빲������ʱ�䣬������������������ɣ����ޣ���෵������ --*/  
  
  If @desc1<>'' and ltrim(rtrim(@desc))<>'��' and ltrim(rtrim(@desc))<>''
     Select @desc1=@desc1+'��'

return @desc1+''+substring(@desc,2,len(@desc))

End




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

