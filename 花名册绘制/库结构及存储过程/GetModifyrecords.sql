SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO



ALTER   Proc GetModifyRecords @tableset varchar(20),@fieldSet varchar(10),@name varchar(50),
                            @dateFlag int,@BeginDate varchar(20),@EndDate varchar(10),@operate int
as 
       
declare  @SqlStr Nvarchar(1200)
if @DateFlag=1
Begin
   Select @beginDate = @BeginDate+' 00:00:00'
   Select @EndDate = @EndDate+' 23:59:59'
End
set @Sqlstr=N'select id,case flag when 1 then ''新增'' when 2 then ''删除'' else ''修改'' end as operate,za0101,
                     fieldDesc,oldvalueDesc,NewvalueDesc,
                     Convert(varchar(19),operateDate,21) as operateDate,operateuser,
                     case archieveflag when 0 then ''否'' else ''是'' end                    
                     from gs_modifyRecord where id>0 '
if @tableSet<>'' --制定特定信息集查询
   Set @Sqlstr=@Sqlstr+N' and infoid='''+@tableSet+''''
if @fieldSet<>'' --指定特定信息项查询
   set @Sqlstr=@Sqlstr+N' and infofield='''+@fieldSet+''''
if @name<>'' -- 按姓名模糊查询
   set @sqlstr=@Sqlstr+N' and za0101 like ''%'+@name+'%'''
if @DateFlag=1 --指定查询日期范围
   set @Sqlstr=@Sqlstr+N' and operateDate>='''+@beginDate+''' and operateDate<='''+@endDate+''''
if @Operate<>0 --制定操作方式
  set @Sqlstr=@Sqlstr+N' and flag='+cast(@operate as varchar)


execute sp_executesql @Sqlstr

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

