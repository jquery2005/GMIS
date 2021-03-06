if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_Copy_SalaryType]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_Copy_SalaryType]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


CREATE procedure  gsp_Copy_SalaryType

  @SetNo varchar(10), --帐套号--拷贝工资类别
  @TypeNo varchar(10), --类别号
  @NewDescription varchar(1000) --新类别描述

with encryption
as

declare @subMaxCode varchar(10)
declare @sql1 varchar(1000)
declare @sql varchar(1000)
declare @RelateFields varchar(1000)
declare @OldFuncId varchar(100)
declare @NewFuncId varchar(100)

SET QUOTED_IDENTIFIER  OFF


--取当前工资类别的最大编码
select @subMaxCode=isnull(max(CAST(typeno as int)),0) + 1 from gs_salarytype  where SetNo=@SetNo 
print 'subMaxCode='+@subMaxCode

 --拷贝工资类别
set @RelateFields="baseexpr,baseitem,chineseitem,filter,delivertype,groups,stype"

set @sql1="select SetNO='" + @SetNO + "',TypeNo='" + @subMaxCode + "',TypeDescription='" + @NewDescription + "'," + @RelateFields + " from gs_salarytype where SetNO ='" + @SetNo + "' and TypeNo='" + @TypeNo + "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_salarytype(setno,typeno,TypeDescription," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)

--拷贝工资项目
set @RelateFields="InfoField,ItemDescription,Flag,OrderNo"

set @sql1="select SetNO='" + @SetNO + "',TypeNo='" + @subMaxCode + "'," + @RelateFields + " from gs_salaryItem where SetNO ='" + @SetNo + "' and TypeNo='" + @TypeNo + "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_salaryItem(setno,typeno," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)


--拷贝计算公式
set @OldFuncId="gzff_" + @SetNo + "_" + @TypeNo
set @NewFuncId="gzff_" + @SetNo + "_" + @subMaxCode

set @RelateFields="Description,MainObject,InfoId,InfoField,BaseExpr,BaseItem,FieldType,flag,relation,userid,condition,subcondition,formulaSql,formulaFieldName,FormulaFlag,IsHistory,XmlDocument,ErrorNum"

set @sql1="select funcId='" + @NewFuncId + "'," + @RelateFields + " from gs_formula where funcId ='" + @OldFuncId +  "'"
print 'sql1=' + @sql1
exec(@sql1)

set @sql="insert gs_formula(funcid," + @RelateFields + ")" + @sql1
print 'sql=' + @sql
exec(@sql)







--测试
-- exec gsp_Copy_SalaryType '1','4','test123'
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

