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
set @Sqlstr=N'select id,case flag when 1 then ''����'' when 2 then ''ɾ��'' else ''�޸�'' end as operate,za0101,
                     fieldDesc,oldvalueDesc,NewvalueDesc,
                     Convert(varchar(19),operateDate,21) as operateDate,operateuser,
                     case archieveflag when 0 then ''��'' else ''��'' end                    
                     from gs_modifyRecord where id>0 '
if @tableSet<>'' --�ƶ��ض���Ϣ����ѯ
   Set @Sqlstr=@Sqlstr+N' and infoid='''+@tableSet+''''
if @fieldSet<>'' --ָ���ض���Ϣ���ѯ
   set @Sqlstr=@Sqlstr+N' and infofield='''+@fieldSet+''''
if @name<>'' -- ������ģ����ѯ
   set @sqlstr=@Sqlstr+N' and za0101 like ''%'+@name+'%'''
if @DateFlag=1 --ָ����ѯ���ڷ�Χ
   set @Sqlstr=@Sqlstr+N' and operateDate>='''+@beginDate+''' and operateDate<='''+@endDate+''''
if @Operate<>0 --�ƶ�������ʽ
  set @Sqlstr=@Sqlstr+N' and flag='+cast(@operate as varchar)


execute sp_executesql @Sqlstr

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

