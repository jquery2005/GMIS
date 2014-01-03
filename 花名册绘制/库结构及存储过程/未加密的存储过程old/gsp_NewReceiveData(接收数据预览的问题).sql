
SET QUOTED_IDENTIFIER off
GO
SET ANSI_NULLS ON 
GO

if exists(select * from sysobjects where name='gsp_NewReceiveData' and type='p')
 drop procedure gsp_NewReceiveData
go

--��������
create procedure  gsp_NewReceiveData

   @ObjectName sysname,  --Ŀ�����
   @PrimaryKey varchar(1000), --Դ��������,�ö��Ÿ���
   @NewPrimaryKey varchar(1000), --Ŀ���������,�ö��Ÿ���
   @ReceiveCols varchar(8000), --Դ�ֶ���,�ö��Ÿ���,���ܰ���������
   @NewReceiveCols varchar(8000), --Ŀ���ֶ���,�ö��Ÿ���,���ܰ���������
   @ReceiveType int,  --���շ�ʽ 1=���·�ʽ 2=���Ƿ�ʽ =3׷�Ӳ����ڵļ�¼,�����򲻹�
   @Filter varchar(8000), --��������,
   @CoverKey varchar(8000), --���ǽ���ʱɾ���Ķ�λ��
   @TempTableName varchar(100) --��ʱ�������


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

  --ȡ�����е�ÿ���ֶΣ����ɶ�λ���
 set @LocateSql=''
 set @NotInSql=''

  set @length=len(@primarykey)
  set @Newlength=len(@Newprimarykey)

 print 'ok'



  WHILE @Length > 0
    BEGIN

        --ȡԴ�����е�һ������
        EXECUTE @Length = gsp_PopFirstWord @primarykey OUTPUT, @FieldName OUTPUT
        set @FieldName=ltrim(rtrim(@FieldName))
       -- print @FieldName
  
        --ȡĿ������е�һ������
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


--ȡ����ɾ��ʱ�����
 set @CoverWhereSql=''
 set @CoverInSql=''
 set @CoverKeySql=''

 if @CoverKey <> ''
   begin
		 set @length=len(@CoverKey)
		
		  WHILE @Length > 0
		    BEGIN
		
		        --ȡԴ�����е�һ������
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


--�ر����б�ʶ
SET IDENTITY_INSERT gs_formula off
SET IDENTITY_INSERT gs_standitem off



  --�б�ʶ�У���ʱ��
  set @IdentityOn=''
  set @IdentityOff=''
  if exists(select a.name,a.status from syscolumns a ,sysobjects b where a.id=b.id and b.name=@ObjectName and a.status=128)
   begin
     set @IdentityOn="SET IDENTITY_INSERT " + @ObjectName + " ON "
     set @IdentityOff="SET IDENTITY_INSERT " + @ObjectName + " OFF "
    end


--����Ա��Ϊ��֤����ʱ������Ա�����䶯���мӼ�¼�����ñ�־λ
if upper(@tempObjectName)='AA01'
  begin
    update aaoo set zc9995=null
  end


--���·�ʽ����:Ŀ�����ݿ⣬������£�û����׷��
if @ReceiveType=1
  begin
	  --1.����Ŀ����д��ڵļ�¼�����ݽ��յ������и���
	  set @length=len(@tempReceiveCols)
	  set @Newlength=len(@tempNewReceiveCols)
          set @UpdateSql=''

	  WHILE @Length > 0
	    BEGIN

                --ȡԴ�����е�һ��
	        EXECUTE @Length = gsp_PopFirstWord @tempReceiveCols OUTPUT, @FieldName OUTPUT
	        set @FieldName=ltrim(rtrim(@FieldName))
	        --print @FieldName


               --ȡĿ������е�һ��
               EXECUTE @NewLength = gsp_PopFirstWord @tempNewReceiveCols OUTPUT, @NewFieldName OUTPUT
	        set @NewFieldName=ltrim(rtrim(@NewFieldName))
	        --print @NewFieldName

	       --����һ�е����
	       set @UpdateSql = @UpdateSql + @NewFieldname + '=b.' + @FieldName + ","

	     end  --while

          --��ʼִ�и��²���
          print 'get update ok'
          set @UpdateSql=left(@UpdateSql,len(@UpdateSql)-1)
          print  @UpdateSql
          print   @tempObjectName
       
          set @str='update ' + @tempObjectName + ' set ' + @UpdateSql + ' from ' + @tempObjectName + ' a,' + @TempTableName + ' b where ' + @LocateSql
	  print @str
          exec(@str)
	   if @@ERROR <> 0 
	      begin 
	          print '������ʧ��'
	          --exec(@IdentityOff)
		  select 0
	          return
	       end
	    else
	          print '�����гɹ�'
	
	      
	
	
	   --2.����Ŀ����в����ڵļ�¼������׷��
           print '��ʼ׷�Ӳ����ڵļ�¼'
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from " + @TempTableName + "  a where "  + @NotInSql + " not in(select " + @NotInSql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
               begin 
                  print '׷�Ӳ����ڵļ�¼ʧ��'
                  exec(@IdentityOff)
                  select 0
                  return
               end
            else
              print '׷�Ӳ����ڵļ�¼�ɹ�'

     end

--���Ƿ�ʽ���գ���ɾ��Ŀ�����ݿ�����ͬ�ļ�¼����׷��
else if @ReceiveType=2
   begin
          print 'covert'

	   --1.ɾ��Ŀ����еļ�¼
           if @CoverWhereSql=''
              set @str="delete from  " + @tempObjectName
           else
              set @str="delete from  " + @tempObjectName + " where "  + @CoverInSql + "  in (select " + @CoverKeySql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @CoverWhereSql + ")"
              

	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
                     print 'ɾ����ͬ�ļ�¼ʧ��'
                    -- exec(@IdentityOff)
                     select 0
                     return 
 
              end
            else
               print 'ɾ����ͬ�ļ�¼�ɹ�'
	   
          
	   --2.׷�����м�¼
             
             if @ObjectName = 'gs_StandItem'
              SET IDENTITY_INSERT gs_StandItem ON
             else if @ObjectName = 'gs_Formula'
              SET IDENTITY_INSERT gs_Formula ON

           set @str='insert ' + @tempObjectName + '(' + @NewReceiveCols + ')  select ' + @ReceiveCols + '  from ' + @TempTableName
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '׷�Ӽ�¼ʧ��'
                 if @ObjectName = 'gs_StandItem'
                    SET IDENTITY_INSERT gs_StandItem OFF
                 else if @ObjectName = 'gs_Formula'
                    SET IDENTITY_INSERT gs_Formula OFF

                select 0
              end
            else
	   print '׷�Ӽ�¼�ɹ�'


   end

--�Բ����ڵļ�¼����׷�ӣ����ڵļ�¼������
else if @ReceiveType=3
   begin
	   --�������������ڵļ�¼������׷��
           set @str="insert " + @tempObjectName + "(" + @NewReceiveCols  + ")  select " + @ReceiveCols + " from " + @TempTableName + " a where "  + @NotInSql + " not in(select " + @NotInSql + " from " + @TempTableName + " a," + @tempObjectName + " b where " + @LocateSql + ")"
	   print @str
	   exec(@str)
           if @@ERROR <> 0 
             begin 
 	        print '׷�Ӽ�¼ʧ��'
                select 0
                return
              end
           else
	      print '׷�Ӽ�¼�ɹ�'

   end


  --���´�������
  exec(@IdentityOff)

 --���Ӽ�����֤���IDΪ��ǰ��¼
      if len(@ObjectName)=4 and  right(@ObjectName,2)<>'01' and CHARINDEX('ZC9993',@ReceiveCols)<>0 and CHARINDEX('ZA0100',@ReceiveCols)<>0 and CHARINDEX(@ObjectName + "id",@ReceiveCols)<>0
        begin
          print '�����Ӽ���״̬'
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
   

  --�����ɹ�
   select 1



--����

/*
SET QUOTED_IDENTIFIER off 
SET ANSI_NULLS ON  
exec gsp_NewReceiveData "MA01" ,"ZA0100","ZA0100","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993","MA0110,MA0111,MA0112,MA01ID,ZA0100,ZA0101,ZA9996,ZA9997,ZA9998,ZA9999,ZB9991,ZB9992,ZC9993",1,"select ZA0100 from MA01 where za0100 in (select ZA0100 from MA01 where MA01.ZC9993='1') and  ZC9993='1' and  ZA0100 like '%'","ZA0100"
*/



