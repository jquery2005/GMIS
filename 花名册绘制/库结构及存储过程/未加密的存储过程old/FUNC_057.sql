if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FUNC_057]') and xtype in (N'FN', N'IF', N'TF'))
drop function [dbo].[FUNC_057]
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE FUNCTION FUNC_057(@infofielda sysname)
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

