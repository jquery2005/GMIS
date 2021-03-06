if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gs_SaveParameter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gs_SaveParameter]
GO

CREATE TABLE [dbo].[gs_SaveParameter] (
	[ModuleCode] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserId] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Flag] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[OrderId] [varchar] (5) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[SaveValue] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark2] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

