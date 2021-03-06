if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gs_standPurFile]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gs_standPurFile]
GO

CREATE TABLE [dbo].[gs_standPurFile] (
	[standId] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ZB9991] [datetime] NOT NULL ,
	[PurFile] [varchar] (500) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[gs_standPurFile] WITH NOCHECK ADD 
	CONSTRAINT [PK_gs_standPurFile] PRIMARY KEY  CLUSTERED 
	(
		[standId],
		[ZB9991]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[gs_standPurFile] ADD 
	CONSTRAINT [FK_gs_standPurFile_gs_stand] FOREIGN KEY 
	(
		[standId]
	) REFERENCES [dbo].[gs_stand] (
		[StandId]
	)
GO

