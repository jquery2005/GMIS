if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RptInnerCheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RptInnerCheck]
GO

CREATE TABLE [dbo].[RptInnerCheck] (
	[ZA0100] [varchar](20) NOT NULL ,
	[typeno] [int] NOT NULL ,
	[settableno] [int] NOT NULL ,
	[tableno] [int] NOT NULL ,
	[conditionid] [int] NOT NULL ,
	[lexpr] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[opsign] [varchar] (2) COLLATE Chinese_PRC_CI_AS NULL ,
	[rexpr] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[lexpr1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[rexpr1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[cucol] [int] NOT NULL ,
	[checktype] [int] NOT NULL 
) ON [PRIMARY]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[tablecheck]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[tablecheck]
GO

CREATE TABLE [dbo].[tablecheck] (
	[ZA0100] [varchar](20) NOT NULL ,
	[lexpr] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[opsign] [varchar] (2) COLLATE Chinese_PRC_CI_AS NULL ,
	[rexpr] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[lexpr1] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[rexpr1] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[tableno] [int] NOT NULL ,
	[settableno] [int] NOT NULL ,
	[typeno] [int] NOT NULL 
) ON [PRIMARY]
GO

