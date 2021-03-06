--更新人员的机构字段
update aa01 set ab0110=ae0122 where isnull(ae0122,'') != ''
go

--删除人员表中的部门字段
exec gsp_goback_properties 'AA01','AE0122'
go
DELETE FROM gs_property WHERE INFOID = 'AA01' AND INFOFIELD = 'AE0122'
go


--重新设置人员的关联关系，没有部门字段
update gs_objectassociate set infoidB='AB01',PropertySet='AB0110' where infoidA='AA01'


--人员机构变动触发器修改
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[CHANGED_AA01]') and OBJECTPROPERTY(id, N'IsTrigger') = 1)
drop trigger [dbo].[CHANGED_AA01]
GO

CREATE   trigger CHANGED_AA01
	on AA01
	for insert, update 
	as 
	if UPDATE(AB0110)
	begin
		declare @key varchar(100)
		select top 1 @key = ZA0100 from inserted
		declare @newid int
		select @newid = (count(*) + 1)*100 from AAOO where ZA0100 = @key
		insert into AAOO(ZA0100,AAOOID,ZC9000,AB0110,zc9995) select ZA0100,AAOOID = @newid,ZC9000 = getdate(),AB0110,'A' from inserted
	end
go
	


--机构表中加层次字段Level1

exec gsp_new_scribble_property 'AB01','LEVEL1','层次','','0','2','8','0','','','0','','0','EVEL1','层次',''
go

exec gsp_create_field 'AB01','LEVEL1'
go

--删除bs模块
delete from xd01 where xd011h='1'
go

--更改人员的关联关系
update  gs_objectassociate set propertyset='AB0110' where InfoIdA='AA01'
go

--删除人员变动表AAoo中的部门字段
exec gsp_goback_properties 'AAOO','AE0122'
go
DELETE FROM gs_property WHERE INFOID = 'AAOO' AND INFOFIELD = 'AE0122'
go

--系统参数表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gs_AreaParameter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gs_AreaParameter]
GO

CREATE TABLE [dbo].[gs_AreaParameter] (
	[ParamName] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ParamValue] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[ParamDesc] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[ModuleCode] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark1] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark2] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[gs_AreaParameter] WITH NOCHECK ADD 
	CONSTRAINT [PK_gs_AreaParameter] PRIMARY KEY  CLUSTERED 
	(
		[ParamName]
	)  ON [PRIMARY] 
GO


--插入记录
insert gs_areaparameter(paramname,paramvalue,paramdesc,modulecode) values('NumberField','AA0195','编号字段','0116')
go

insert gs_areaparameter(paramname,paramvalue,paramdesc,modulecode) values('OrderField','AA01.AB0110,AA01.AA0195','排序字段','0116')
go

insert gs_areaparameter(paramname,paramvalue,paramdesc,modulecode) values('RecordBeginTime','2004-01-01','变动信息记录生效时间','0116')
go


--信息变动记录表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gs_ModifyRecord]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gs_ModifyRecord]
GO

CREATE TABLE [dbo].[gs_ModifyRecord] (
	[ID] [int] IDENTITY (1, 1) NOT NULL ,
	[ZA0100] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[ZA0101] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[XXID] [int] NULL ,
	[ModuleCode] [varchar] (100) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[InfoId] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[InfoField] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[FieldDesc] [varchar] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[OldValueCode] [varchar] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[OldValueDesc] [char] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewValueCode] [char] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[NewValueDesc] [varchar] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[OperateUser] [varchar] (400) COLLATE Chinese_PRC_CI_AS NULL ,
	[OperateDate] [datetime] NULL ,
	[Flag] [int] NULL ,
        [ArchieveFlag] [bit] NULL
) ON [PRIMARY]
GO





--用户子集顺序表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gs_SaveParameter]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[gs_SaveParameter]
GO

CREATE TABLE [dbo].[gs_SaveParameter] (
	[ModuleCode] [varchar] (10) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[UserId] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[Flag] [varchar] (50) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[OrderId] [int] NOT NULL ,
	[SaveValue] [varchar] (100) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark1] [varchar] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[Mark2] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


--在r100中加入字段groups varchar（200）字段，处理用户权限
ALTER TABLE dbo.R100 ADD
	groups varchar(200) NULL
GO


--机构编制表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[jgbz_2]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[jgbz_2]
GO

CREATE TABLE [dbo].[jgbz_2] (
	[Name] [char] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[IsUse] [char] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[SourceInfoId] [char] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[TargetInfoId] [char] (4) COLLATE Chinese_PRC_CI_AS NULL ,
	[SourceFields] [char] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[TargetFields] [char] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[SumStyle] [char] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[Sql_Update_Set] [char] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[WholeCondition] [char] (1000) COLLATE Chinese_PRC_CI_AS NULL ,
	[id] [int] IDENTITY (1, 1) NOT NULL ,
	[ModifyStyle] [char] (10) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

--历史记录查询定义表
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Gs_hisCondition]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Gs_hisCondition]
GO

CREATE TABLE [dbo].[Gs_hisCondition] (
	[HisCondID] [int] NOT NULL ,
	[CountTimeField] [varchar] (11) COLLATE Chinese_PRC_CI_AS NULL ,
	[RangeTime] [int] NULL ,
	[EndYear] [datetime] NULL ,
	[Times] [int] NULL ,
	[CondExp_man] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ItemExp_man] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[DesExp_man] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[CondExp_his] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ItemExp_his] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[DesExp_his] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[CanLink] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[SetSql_man] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL ,
	[SetSql_his] [varchar] (3000) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO


--ptf报表归档管理表FA01和FA02
if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_FA02_FA01]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[FA02] DROP CONSTRAINT FK_FA02_FA01
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FA01]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FA01]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FA02]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[FA02]
GO

CREATE TABLE [dbo].[FA01] (
	[ZA0100] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[FA01ID] [int] NOT NULL ,
	[ZA0101] [varchar] (50) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZA9999] [varchar] (10) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZA9996] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZA9997] [bit] NULL ,
	[ZB0198] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZB0199] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZB9991] [datetime] NULL ,
	[ZB9992] [datetime] NULL ,
	[ZC9993] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZC9995] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL 
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[FA02] (
	[ZA0100] [varchar] (20) COLLATE Chinese_PRC_CI_AS NOT NULL ,
	[FA02ID] [int] NOT NULL ,
	[ZB9991] [datetime] NULL ,
	[ZB9992] [datetime] NULL ,
	[ZC9993] [varchar] (1) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZC9995] [varchar] (255) COLLATE Chinese_PRC_CI_AS NULL ,
	[FK0201] [varchar] (200) COLLATE Chinese_PRC_CI_AS NULL ,
	[FK0202] [varchar] (20) COLLATE Chinese_PRC_CI_AS NULL ,
	[ZA9998] [image] NULL 
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[FA01] WITH NOCHECK ADD 
	CONSTRAINT [DF__FA01__ZB0198__082E031D] DEFAULT ('1') FOR [ZB0198],
	CONSTRAINT [ZB9991FA01] DEFAULT (getdate()) FOR [ZB9991],
	CONSTRAINT [ZB9992FA01] DEFAULT (getdate()) FOR [ZB9992],
	CONSTRAINT [DF__FA01__ZC9993__0B0A6FC8] DEFAULT ('1') FOR [ZC9993],
	CONSTRAINT [PK_FA01] PRIMARY KEY  CLUSTERED 
	(
		[ZA0100]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FA02] WITH NOCHECK ADD 
	CONSTRAINT [ZB9991FA02] DEFAULT (getdate()) FOR [ZB9991],
	CONSTRAINT [ZB9992FA02] DEFAULT (getdate()) FOR [ZB9992],
	CONSTRAINT [DF__FA02__ZC9993__11B76D57] DEFAULT ('1') FOR [ZC9993],
	CONSTRAINT [PK_FA02] PRIMARY KEY  CLUSTERED 
	(
		[ZA0100],
		[FA02ID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[FA02] ADD 
	CONSTRAINT [FK_FA02_FA01] FOREIGN KEY 
	(
		[ZA0100]
	) REFERENCES [dbo].[FA01] (
		[ZA0100]
	) ON DELETE CASCADE  ON UPDATE CASCADE 
GO


insert FA01(ZA0100,FA01Id,ZA0101,ZC9993) values('0000000001',100,'登记表','1')
go
insert FA01(ZA0100,FA01Id,ZA0101,ZC9993) values('0000000002',200,'花名册','1')
go
insert FA01(ZA0100,FA01Id,ZA0101,ZC9993) values('0000000003',300,'统计报表','1')
go
