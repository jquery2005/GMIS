SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--�м��鹫ʽ�������ؼ���δͨ����У�鹫ʽ
alter   procedure dbo.gsp_innercheck
      @typeno varchar(20),--���
      @settableno varchar(20),--�ױ�
      @rptno      varchar(20),--������
      @za0100 varchar(20),--��λ����
      @starttime varchar(10),--ͳ��ʱ��
      @revalue  varchar(8000)  OUT
with ENCRYPTION 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off
  
declare @v1 varchar(20)--����ʽֵ
declare @v2 varchar(20)--�ұ��ʽֵ
declare @strwhere varchar(200) --ʱ�������͵�ǰ����

declare @lexpr varchar(500)--����ʽ
declare @rexpr varchar(500)--�ұ��ʽ
declare @lexpr1 varchar(500)--����ʽ
declare @rexpr1 varchar(500)--�ұ��ʽ
declare @opsign varchar(2)------�ȽϷ�
--declare @tableno varchar(20) ----------���
declare @blnresult bit;

declare @strsql varchar(500)--������ʱsql���
declare @strtemp varchar(500)--����鹫ʽ
declare @value varchar(20)  --��ʱֵ
declare @tabno  varchar(20)--���鹫ʽ���ڵı�
declare @conditionid varchar(20)
declare @tabname varchar(40) --�������
declare @row  varchar(20) --��Ԫ����
declare @col  varchar(20) --��Ԫ����
declare @colcount varchar(20)--���ݱ��������
declare @rowcount varchar(20)--���ݱ��������
declare @i int 
declare @cutno varchar(20)
declare @checktype varchar(1) --�������� 
declare @custr varchar(100)
declare @strtabchk varchar(500)
declare @removerow varchar(200)
declare @removecol varchar(200)

declare @tablename varchar(20)

--��R244��ŵ�Ԫ����鹫ʽ
--��������ʱ��ṹ
set @blnresult=0;
set @colcount=0
set @rowcount=0
SELECT settableno,tableno,conditionid,lexpr,opsign,rexpr,lexpr1,rexpr1,tableno cucol,tableno checktype into #check  FROM R242 WHERE 1=2

if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1' and zb0110='"+@za0100+"'"
else
  set   @strwhere="  and starttime='"+@starttime +"' and zb0110='"+@za0100+"'"

--ȡ���ж��ٱ�,��ͬ�������������������ͬ
  if isnull(@rptno,'')=''
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno='+@settableno
  else
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

    set @strsql='DECLARE T_ColCount cursor static for '+@strsql  
    execute(@strsql)
    
    open T_ColCount 
    fetch next from T_ColCount  
    into @tabno,@tabname



--����ÿ������������������С��м��鹫ʽת��
while(@@FETCH_STATUS = 0)
begin
     set @tablename='t'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
	  --����checktypeΪ���鹫ʽ��� 1Ϊ�м��� 2Ϊ�� 3Ϊ��Ԫ��
      --ȡ���������
		set @strsql="select count(*) from  syscolumns where id=OBJECT_ID('"+@tablename+"') and name like 'C%'"
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @colcount
	        close temp_value
	        deallocate temp_value
	        
	        
	        	--���м��鹫ʽת���ɵ�Ԫ��ʽ�����뵽��ʱ����
		set @i=1
		while(@i<=@colcount)
		begin
			set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,replace(lexpr1,']',':"+cast(@i as varchar(20))+"]') lexpr1,replace(rexpr1,']',':"+cast(@i as varchar(20))+"]') rexpr1,"+cast(@i as varchar(20)) +',1 FROM R242  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno+" and isnull(removecol,'')=''"
			exec(@strsql)
			set @i=@i+1
		end
		
--**********************�������ų��еĴ���
		
		   DECLARE temp_value CURSOR static FOR 
	        select conditionid,removecol from  R242  WHERE typeno=@typeno  and settableno=@settableno  and tableno=@tabno and isnull(removecol,'')<>''
	        open temp_value
	        fetch next from temp_value into @conditionid,@removecol
   
			while(@@FETCH_STATUS=0)
			begin
			    set @removecol=','+@removecol+','
				set @i=1
				while(@i<=@colcount)
				begin
				    set @col=charindex(','+cast(@i as varchar(20))+',',@removecol)
						if @col='0'
							begin				    
								set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,replace(lexpr1,']',':"+cast(@i as varchar(20))+"]') lexpr1,replace(rexpr1,']',':"+cast(@i as varchar(20))+"]') rexpr1,"+cast(@i as varchar(20)) +',1 FROM R242  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno+' and conditionid=' +@conditionid
								exec(@strsql)
							end
					set @i=@i+1
				end
				
		        fetch next from temp_value into @conditionid,@removecol
			end
            close temp_value
	        deallocate temp_value

--**********************		
		
		
		
/*		
		---ȡ���������
		set @strsql='select MAX(ROWID) from t_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno 
		set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @rowcount
	        close temp_value
	        deallocate temp_value
*/
/*
	--���м��鹫ʽת���ɵ�Ԫ��ʽ�����뵽��ʱ����
	set @i=1
	while(@i<=@rowcount)
	begin
		set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,
		 replace(lexpr1,'[','["+cast(@i as varchar(20))+":') lexpr1,
		 replace(rexpr1,'[','["+cast(@i as varchar(20))+":') rexpr1,"
		 +cast(@i as varchar(20)) +',3 FROM R243  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno
		exec(@strsql)
		set @i=@i+1
	end
	
--settableno,tableno,conditionid,lexpr,opsign,rexpr,lexpr1,rexpr1,tableno cucol,tableno checktype

*/
--��У�鹫ʽ
--***************************
	DECLARE temp_value CURSOR static FOR 
        select tableno,conditionid,lexpr,opsign,rexpr,removerow,lexpr1,rexpr1 from r243 WHERE typeno=@typeno and settableno=@settableno  and tableno=@tabno and isnull(lexpr1,'')<>'' and  isnull(rexpr1,'')<>''
        open temp_value
        fetch next from temp_value into @tabno,@conditionid, @lexpr,@opsign,@rexpr,@removerow,@lexpr1,@rexpr1
  
       if @removerow=''
         set @removerow=null
       while(@@FETCH_STATUS=0)
       begin
          set @lexpr1=replace(@lexpr1,'[','[c')
          set @rexpr1=replace(@rexpr1,'[','[c')
          set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+char(39)+@lexpr+char(39)+','+char(39)+@opsign+char(39)+','+char(39)+@rexpr+char(39)+','+@lexpr1+','+@rexpr1+',rowid,2 from '+@tablename+ 
            ' where not ('+@lexpr1+@opsign+@rexpr1+') and (rowid not in ('+isnull(@removerow,char(39)+''+char(39))+'))'+@strwhere
      
          exec(@strsql) 
          if @@error<>0
             begin
                set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+char(39)+@lexpr+char(39)+','+char(39)+@opsign+char(39)+','+char(39)+@rexpr+char(39)+',null,null,rowid,2'
                exec(@strsql) 
             end
               
          fetch next from temp_value into @tabno,@conditionid, @lexpr,@opsign,@rexpr,@removerow,@lexpr1,@rexpr1
          if @removerow=''
            set @removerow=null

           --fetch next from temp_value into @tabno,@strtemp, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1
       end  
       close temp_value
       deallocate temp_value
       --//��������У�鹫ʽ  
       insert into #check select settableno,tableno,conditionid,lexpr,opsign,rexpr,null,null,1,2 from r243 WHERE typeno=@typeno and settableno=@settableno  and tableno=@tabno and (isnull(lexpr1,'')='' or  isnull(rexpr1,'')='')

--*****************************	  
  --     select * from r243 where tableno=4
/*       
       while(@@FETCH_STATUS=0)
       BEGIN
       set @strsql='insert into #check select '+@settableno+','+@tabno+','+@conditionid+','+@lexpr+','+@opsign+','+@rexpr+','+@lexpr1+','+@rexpr1+',rowid,2 from t_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
                +' where not ((@opsign='=' and "+@lexpr1+'='+@rexpr1+") or (@opsign='>' 
                                and "+@lexpr1+'='+@rexpr1+") or (@opsign='>=' and "+@lexpr1+'='+@rexpr1+")
                                or (@opsign='<=' and "+@lexpr1+'='+@rexpr1+") or (@opsign='<' and "+@lexpr1+'='+@rexpr1+") 
                                or (@opsign='<>' and "+@lexpr1+'='+@rexpr1+"))      
           exec(@strsql)                     
           fetch next from temp_value into @tabno,@strtemp, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1
       end
*/

  set @strsql='INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1,conditionid,3 FROM R244  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno
  exec(@strsql)


    fetch next from T_ColCount 
    into @tabno,@tabname                                
end

close T_ColCount 
deallocate T_ColCount 


--�ѵ�Ԫ����鹫ʽ���뵽��ʱ����



--��ȡÿ�����鹫ʽ
DECLARE R242_cursor CURSOR FOR   SELECT lexpr1,rexpr1,tableno  FROM #check where checktype<>2  for update
OPEN R242_cursor
FETCH NEXT FROM R242_cursor
INTO @lexpr,@rexpr,@tabno

--ѭ������ÿ��һ���鹫ʽ
WHILE @@FETCH_STATUS = 0
BEGIN
    --��ȡ����鹫ʽ
  if  isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>''
    begin
	while(charindex('[',@lexpr)<>0)
	begin
	
	set @tablename='t'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
	
	    set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
		set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
		--set @col=replace(@strtemp,@row+':','')
		set @strsql='SELECT c'+@col+' FROM '+@tablename+' where rowid='+@row+@strwhere
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        set @value=null
	        exec(@strsql)
	        open temp_value
	        if @@error=0
	        begin
				fetch next from temp_value into @value
    			if @@FETCH_STATUS <> 0
				set @value=null

				close temp_value
				deallocate temp_value
			end
            set @lexpr=replace(@lexpr,'['+@strtemp+']',@value)
	end
    --��ȡ�Ҽ��鹫ʽ
	while(charindex('[',@rexpr)<>0)
	begin
  
        set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1) 
	    set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
	    set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
	    --set @col=replace(@strtemp,@row+':','')
  	    set @strsql='SELECT c'+@col+' FROM '+@tablename+' where rowid='+@row+@strwhere
        set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        
	        set @value=null
	        exec(@strsql)
	        open temp_value
	        if @@error=0
	        begin
				fetch next from temp_value into @value
				if @@FETCH_STATUS <> 0
					set @value=null
				close temp_value
				deallocate temp_value
			end
           set @rexpr=replace(@rexpr,'['+@strtemp+']',@value)
       end
    
     --ͨ���α��ȡ��ʽ��ֵ
     set @v1=null
     set @v2=null
     if isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>'' 
      begin
		set @strsql="DECLARE temp_lexpr CURSOR static FOR select "+@lexpr+","+@rexpr
		exec(@strsql)
		open temp_lexpr
		fetch next from temp_lexpr into @v1,@v2
		CLOSE temp_lexpr
		DEALLOCATE temp_lexpr
      end 
   
   /*
     --ͨ���α��ȡ��ʽ��ֵ
     set @v2='0'
     if isnull(@rexpr,'')<>'' 
      begin
		set @strsql='dECLARE temp_rexpr CURSOR static FOR select '+ @rexpr
		exec(@strsql)
		open temp_rexpr
		fetch next from temp_rexpr into @v2
		CLOSE temp_rexpr
		DEALLOCATE temp_rexpr
      end
     */

--������ʱ������ʽ����ʽ��ֵ�������ݿ���       
        UPDATE #check SET lexpr1=replace(@v1,' ','') ,rexpr1=replace(@v2,' ','')
	WHERE CURRENT OF R242_cursor
 end
 else
        UPDATE #check SET lexpr1=null ,rexpr1=null WHERE CURRENT OF R242_cursor

    --����һ���鹫ʽ
    FETCH NEXT FROM R242_cursor
	INTO @lexpr,@rexpr,@tabno

end

CLOSE R242_cursor
DEALLOCATE R242_cursor

delete from #check where (checktype<>2 and  (isnull(lexpr1,'')<>'' and  isnull(rexpr1,'')<>'') and (opsign='=' and cast(lexpr1 as float)=cast(rexpr1 as float)) or (opsign='>' 
                                and cast(lexpr1 as float)>cast(rexpr1 as float)) or (opsign='>=' and cast(lexpr1 as float)>=cast(rexpr1 as float))
                                or (opsign='<=' and cast(lexpr1 as float)<=cast(rexpr1 as float)) or (opsign='<' and cast(lexpr1 as float)<cast(rexpr1 as float)) 
                             or (opsign='<>' and cast(lexpr1 as float)<>cast(rexpr1 as float)) )
--select * from #check
--drop table #check

  if isnull(@rptno,'')=''
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno='+@settableno
  else
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

    set @strsql='DECLARE T_ColCount cursor static for '+@strsql  
    execute(@strsql)
    
    open T_ColCount 
    fetch next from T_ColCount  
    into @tabno,@tabname
set @revalue=''
--�ֱ�ѱ�ļ��������
while(@@FETCH_STATUS = 0)
begin
      set @strtabchk='==================================================='
      set @strtabchk=@strtabchk+char(13)+@tabno+' : '+@tabname
      set @strtabchk=@strtabchk+char(13)+'==================================================='

	--��ȡ����δͨ���ļ��鹫ʽ
	dECLARE temp_export CURSOR static FOR 
		select  conditionid, lexpr,opsign,rexpr,lexpr1, rexpr1,cucol,checktype from #check where  settableno=@settableno  and tableno=@tabno  order by settableno,tableno,checktype,conditionid,cucol

/*	select conditionid, lexpr,opsign,rexpr,lexpr1, rexpr1,cucol,checktype from #check where not ((opsign='=' and cast(lexpr1 as float)=cast(rexpr1 as float)) or (opsign='>' 
                                and cast(lexpr1 as float)>cast(rexpr1 as float)) or (opsign='>=' and cast(lexpr1 as float)>=cast(rexpr1 as float))
                                or (opsign='<=' and cast(lexpr1 as float)<=cast(rexpr1 as float)) or (opsign='<' and cast(lexpr1 as float)<cast(rexpr1 as float)) 
                                or (opsign='<>' and cast(lexpr1 as float)<>cast(rexpr1 as float))   ) and settableno=@settableno  and tableno=@tabno  order by settableno,tableno,checktype,conditionid,cucol
 */
 	open temp_export

	FETCH NEXT FROM temp_export
	INTO @conditionid, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@col,@checktype
	--@strtemp���鹫ʽ��

	set @revalue=@revalue+char(13)+@strtabchk+char(13)
	set @cutno=''
        set @row=''

        if @@FETCH_STATUS = 0
             update r220 set checkpass='00' where typeno=@typeno and settableno=@settableno  and tableno=@tabno and zc9993='1' and zb0110=@za0100
        else
             update r220 set checkpass='10' where typeno=@typeno and settableno=@settableno  and tableno=@tabno and zc9993='1' and zb0110=@za0100



	WHILE @@FETCH_STATUS = 0
	BEGIN
	    set @blnresult=1
  	  set @strtabchk=(select case @checktype when '1' then '��' when '2' then '��' when '3' then '��Ԫ��' end)
	   set @custr=char(13)
	   if isnull(@lexpr1,'')<>'' and isnull(@rexpr1,'')<>'' 
	    begin
	    
		if @cutno<>@conditionid or @row<>@checktype
		begin
			set @custr=char(13)+char(13)+@strtabchk+'���鹫ʽ��'+ @lexpr+@opsign+@rexpr+char(13)
			set @cutno=@conditionid
			set @row=@checktype
		end
		set @strsql=''
		if @strtabchk='��'
		    set @strsql='��'+@col+'�� '
		if @strtabchk='��'
		    set @strsql='��'+@col+'�� '
		set   @revalue =@revalue+@custr+@strsql+@lexpr1+@opsign+@rexpr1
         end
         else
            begin
              if charindex(@strtabchk+'���鹫ʽ��'+ @lexpr+@opsign+@rexpr+' ����',@revalue)=0
                set   @revalue =@revalue+@custr+'***** '+@strtabchk+'���鹫ʽ��'+ @lexpr+@opsign+@rexpr+' ����'
            end  
		FETCH NEXT FROM temp_export
		INTO @conditionid, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@col,@checktype
	end

	CLOSE temp_export
	DEALLOCATE temp_export
 
    fetch next from T_ColCount  
    into @tabno,@tabname

end

--��ӱ���У������
set @strsql = "delete from RptInnerCheck where typeno = "+ @typeno + " and settableno =" + @settableno + " and tableno = " + @rptno + " and za0100 = '" + @za0100 + "' "
execute(@strsql)

insert into RptInnerCheck 
select @za0100,@typeno,* from  #check

            --���ȫ���ɹ��򷵻ؿ�ֵ
	if @blnresult=0
                   set @revalue=''

	CLOSE T_ColCount
	DEALLOCATE T_ColCount

return






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
