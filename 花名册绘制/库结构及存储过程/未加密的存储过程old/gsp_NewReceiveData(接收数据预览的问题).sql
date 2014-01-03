
SET QUOTED_IDENTIFIER off
GO
SET ANSI_NULLS ON 
GO

if exists(select * from sysobjects where name='gsp_NewReceiveData' and type='p')
 drop procedure gsp_NewReceiveData
go

--接收数据
create procedure  gsp_NewReceiveData

   @ObjectName sysname,  --目标对象
   @PrimaryKey varchar(1000), --源对象主键,用逗号隔开
   @NewPrimaryKey varchar(1000), --目标对象主键,用逗号隔开
   @ReceiveCols varchar(8000), --源字段列,用逗号隔开,不能包含计算列
   @NewReceiveCols varchar(8000), --目标字段列,用逗号隔开,不能包含计算列
   @ReceiveType int,  --接收方式 1=更新方式 2=覆盖方式 =3追加不存在的记录,存在则不管
   @Filter varchar(8000), --过滤条件,
   @CoverKey varchar(8000), --覆盖接收时删除的定位键
   @TempTableName varchar(100) --临时表的名称


as


  declare @str varchar(8000)
  declare @length int
  declare @Newlength int
  declare @LocateSql varchar(8000)
  declare @tempReceiveCols varchar(8000)
  declare @tempNewReceiveCols varchar(8000)
  declare @FieldName varchar(100)
  declare @NewFieldName varchar(100)
  declare @NotInSql varchar(8000)
  declare @IdentityOn varchar(8000)
  declare @IdentityOff varchar(8000)
  declare @CoverWhereSql varchar(8000)
  declare @CoverInSql varchar(8000)
  declare @CoverKeySql varchar(8000)
  declare @UpdateSql varchar(8000)
  declare @tempObjectName varchar(8000)


set @tempObjectName=@ObjectName

  --取主键中的每个字段，生成定位语句
 set @LocateSql=''
 set @NotInSql=''

  set @length=len(@primarykey)
  set @Newlength=len(@Newprimarykey)

 print 'ok'



  WHILE @Length > 0
    BEGIN

        --取源对象中的一列主键
        EXECUTE @Length = gsp_PopFirstWord @primarykey OUTPUT, @FieldName OUTPUT
        set @FieldName=ltrim(rtrim(@FieldName))
       -- print @FieldName
  
        --取目标对象中的一列主键
        EXECUTE @NewLength = gsp_PopFirstWord @Newprimarykey OUTPUT, @NewFieldName OUTPUT
        set @NewFieldName=ltrim(rtrim(@NewFieldName))
       -- print @NewFieldName



        set @LocateSql=@LocateSql +  'a.' + @NewFieldName + '= b.' +  @FieldName + ' and '
        set @NotInSql=@NotInSql + 'cast(a.' + @NewFieldName + ' as varchar(100))+'

       
   end
     
    set @LocateSql=left(@LocateSql,len(@LocateSql)-4)
    set @NotInSql=left(@NotInSql,len(@NotInSql)-1)

    print @LocateSql
    print @NotInSql


--取覆盖删除时的语句
 set @CoverWhereSql=''
 set @CoverInSql=''
 set @CoverKeySql=''

 if @CoverKey <> ''
   begin
		 set @length=len(@CoverKey)
		
		  WHILE @Length > 0
		    BEGIN
		
		        --取源对象中的一列主键
		        EXECUTE @Length = gsp_PopFirstWord @CoverKey OUTPUT, @FieldName OUTPUT
		        set @FieldName=ltrim(rtrim(@FieldName))
		       -- print @FieldName
		  
		
		        set @CoverWhereSql=@CoverWhereSql +  'a.' + @FieldName + '= b.' +  @FieldName + ' and '
		        set @CoverKeySql=@CoverKeySql + 'cast(a.' + @FieldName + ' as varchar(100))+'
		        set @CoverInSql=@CoverInSql + 'cast(' + @FieldName + ' as varchar(100))+'
		       
		   end
		     
		    set @CoverWhereSql=left(@CoverWhereSql,len(@CoverWhereSql)-4)
		    set @CoverInSql=left(@CoverInSql,len(@CoverInSql)-1)
		    set @CoverKeySql=left(@CoverKeySql,len(@CoverKeySql)-1)
     end
  

 set @tempReceiveCols=@ReceiveCols
 set @tempNewReceiveCols=@NewReceiveCols

print @tempReceiveCols
print @tempNewReceiveCols


--关闭所有标识
SET IDENTITY_INSERT gs_formula off
SET IDENTITY_INSERT gs_standitem off



  --有标识列，暂时打开
  set @IdentityOn=''
  set @IdentityOff=''
  if exists(select a.name,a.status from syscolumns a ,sysobjects b where a.id=b.id and b.name=@ObjectName and a.status=128)
   begin
     set @IdentityOn="SET IDENTITY_INSERT " + @ObjectName + " ON "
     set @IdentityOff="SET IDENTITY_INSERT " + @ObjectName + " OFF "
    end


--对人员，为保证接收时不在人员机构变动表中加记录，设置标志位
if upper(@tempObjectName)='AA01'
  begin
    update aaoo set zc9995=null
  end


--更新方式接收:目标数据库，有则更新，没有则追加
if @ReceiveType=1
  begin
	  --1.对于目标库中存在的记录，根据接收的列逐列更新
	  set @length=len(@tempReceiveCols)
	  set @Newlength=len(@tempNewReceiveCols)
          set @UpdateSql=''

	  WHILE @Length > 0
	    BEGIN

                --取源对象中的一列
	        EXECUTE @Length = gsp_PopFirstWord @tempReceiveCols OUTPUT, @FieldName OUTPUT
	        set @FieldName=ltrim(rtrim(@FieldName))
	        --print @FieldName


               --取目标对象中的一列
               EXECUTE @NewLength = gsp_PopFirstWord @tempNewReceiveCols OUTPUT, @NewFieldName OUTPUT
	        set @NewFieldName=ltrim(rtrim(@NewFieldName))
	        --print @NewFieldName

	       --更新一列的语句
	       set @UpdateSql = @UpdateSql + @NewFieldname + '=b.' + @FieldName + ","

	     end  --while

          --开始执行更新操作
          print 'get update ok'
          set @UpdateSql=left(@UpdateSql,len(@UpdateSql)-1)
          print  @UpdateSql
          print   @tempObjectName
       
          set @str='update ' + @tempObjectName + ' set ' + @UpdateSql + ' from ' + @tempObjectName + ' a,' + @TempTableName + ' b where ' + @LocateSql
	  print @str
          exec(@str)
	   if @@ERROR <> 0 
	      begin 
	          print '更新列失败'
	          --exec(@IdentityOff)
		  select 0
	          return
	       end
	    else
	          print '更新列成功'
	
	      
	
	
	   --2.对于目标库中不存在的记录，进行追加
           print '开始追加不存在的记录'
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from " + @TempTableName + "  a where "  + @NotInSql + " not in(select " + @NotInSql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
               begin 
                  print '追加不存在的记录失败'
                  exec(@IdentityOff)
                  select 0
                  return
               end
            else
              print '追加不存在的记录成功'

     end

--覆盖方式接收：先删除目标数据库中相同的记录，在追加
else if @ReceiveType=2
   begin
          print 'covert'

	   --1.删除目标表中的记录
           if @CoverWhereSql=''
              set @str="delete from  " + @tempObjectName
           else
              set @str="delete from  " + @tempObjectName + " where "  + @CoverInSql + "  in (select " + @CoverKeySql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @CoverWhereSql + ")"
              

	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
                     print '删除相同的记录失败'
                    -- exec(@IdentityOff)
                     select 0
                     return 
 
              end
            else
               print '删除相同的记录成功'
	   
          
	   --2.追加所有记录
             
             if @ObjectName = 'gs_StandItem'
              SET IDENTITY_INSERT gs_StandItem ON
             else if @ObjectName = 'gs_Formula'
              SET IDENTITY_INSERT gs_Formula ON

           set @str='insert ' + @tempObjectName + '(' + @NewReceiveCols + ')  select ' + @ReceiveCols + '  from ' + @TempTableName
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '追加记录失败'
                 if @ObjectName = 'gs_StandItem'
                    SET IDENTITY_INSERT gs_StandItem OFF
                 else if @ObjectName = 'gs_Formula'
                    SET IDENTITY_INSERT gs_Formula OFF

                select 0
              end
            else
	   print '追加记录成功'


   end

--对不存在的记录进行追加，存在的记录不处理
else if @ReceiveType=3
   begin
	   --对于主键不存在的记录，进行追加
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from " + @TempTableName + " a where "  + @NotInSql + " not in(select " + @NotInSql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '追加记录失败'
                select 0
                return
              end
           else
	      print '追加记录成功'

   end


  --重新打开种子列
  exec(@IdentityOff)

 --对子集，保证最大ID为当前记录
      if len(@ObjectName)=4 and  right(@ObjectName,2)<>'01' and CHARINDEX('ZC9993',@ReceiveCols)<>0 and CHARINDEX('ZA0100',@ReceiveCols)<>0 and CHARINDEX(@ObjectName + "id",@ReceiveCols)<>0
        begin
          print '更新子集的状态'
         set @str="update " + @ObjectName + " set ZC9993='0'"
         print @str
         exec(@str)
         set @str="update " + @ObjectName + " set ZC9993='1'" + " where za0100+cast(" + @ObjectName + "id as varchar) in(select za0100+cast(max(" + @ObjectName + "id) as varchar) from " + @ObjectName + " group by za0100)"
         print @str
         exec(@str)
       end


if upper(@tempObjectName)='AA01'
  begin
    delete from aaoo where  zc9995='A'
  end
   

  --操作成功
   select 1



--测试

/*
SET QUOTED_IDENTIFIER off 
SET ANSI_NULLS ON  
exec gsp_NewReceiveData "MA01" ,"ZA0100","ZA0100","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993",1,"select ZA0100 from MA01 where za0100 in (select ZA0100 from MA01 where MA01.ZC9993='1') and  ZC9993='1' and  ZA0100 like '%'","ZA0100"
*/



