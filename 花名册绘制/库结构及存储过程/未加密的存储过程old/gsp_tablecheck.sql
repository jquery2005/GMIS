SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--�����У�鹫ʽ������δͨ���ļ��鹫ʽ
alter     procedure dbo.gsp_tablecheck
      @typeno varchar(20),--���
      @settableno varchar(20),--�ױ�
      @za0100 varchar(20),--��Ԫ����
     @starttime varchar(10),--ͳ��ʱ��
      @revalue  varchar(8000)  OUT
with ENCRYPTION 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off

declare @v1 varchar(20)--����ʽֵ
declare @v2 varchar(20)--�ұ��ʽֵ
declare @strwhere varchar(200) --ʱ�������͵�ǰ����


declare @lexpr varchar(200)--����ʽ
declare @rexpr varchar(200)--�ұ��ʽ
declare @lexpr1 varchar(200)--����ʽ
declare @rexpr1 varchar(200)--�ұ��ʽ
declare @opsign varchar(2)------�ȽϷ�

declare @strsql varchar(200)--������ʱsql���
declare @strtemp varchar(200)--���鹫ʽ
declare @value varchar(20) --��ʱֵ
declare @tabno  varchar(20) --���鹫ʽ���ڱ�ı���
declare @lefttabno  varchar(20) --���鹫ʽ���ڱ�ı���
declare @row  varchar(20)   --��Ԫ�����
declare @col  varchar(20)  --��Ԫ�����
declare @cTableNo varchar(20)
declare @cTableName varchar(200)
declare @strtabchk varchar(500)
declare @tval int   
 


--�Ѽ��鹫ʽ����ʱ����У������ɽ������ʽֱ���滻��ʵ��ֵ
SELECT lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1,tableno into #check
FROM r241
WHERE typeno=@typeno and settableno=@settableno
ORDER BY conditionid

--��ҪУ��ı���Ϊδͨ��
update  r220 set checkpass='00' where isnull(checkpass,'')=''
update  r220 set checkpass=substring(checkpass,1,1)+'0' where typeno=@typeno and settableno=@settableno and zb0110=@za0100 and  zc9993='1'



if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1'"
else
   set @strwhere="  and starttime='"+@starttime +char(39)



DECLARE r241_cursor CURSOR FOR
SELECT lexpr,rexpr,tableno
FROM #check for update


OPEN r241_cursor
FETCH NEXT FROM r241_cursor 
INTO @lexpr,@rexpr,@lefttabno

--��ȡ���еļ��鹫ʽ
WHILE @@FETCH_STATUS = 0
BEGIN
  if  isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>''
    begin
             ---ȡ����鹫ʽ
	while(charindex('[',@lexpr)<>0) --���鹫ʽ�����ж��ʽ�磺[2��2��1]+[4��5��32]
	begin
         
   	   set @tval=0
	   select @tval=3 where  @lexpr like '%:%:%'

	   if @tval=3
	       begin	
	          set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
	          set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
		  set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
	          set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
                  set @tabno=@lefttabno    
	        end
           else
	      begin	
                 set @tabno=@lefttabno 
 		 set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		 set @row=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
		 set @col=replace(@strtemp,@row+':','')                  
              end
           
	   --��Ӧ�ñ���ȡʵ��ֵ
	   set @strsql='SELECT c'+@col+' FROM T'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
	   set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	   
	   
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

             ---ȡ�Ҽ��鹫ʽ
	while(charindex('[',@rexpr)<>0)
	begin
	   set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1)         
                set @tabno=LEFT(@strtemp,CHARINDEX(':',@strtemp)-1)
	   set @row=substring(@strtemp,len(@tabno)+2,charindex(':',@strtemp,len(@tabno)+2)-len(@tabno)-2)                  
                set @col=right(@strtemp,len(@strtemp)-len(@tabno)-len(@row)-2)
	 
                     set @strsql='SELECT c'+@col+' FROM T'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno+' where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
	        set @strsql='DECLARE temp_value CURSOR FOR '+@strsql

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

 
--������ʱ���еļ��鹫ʽΪʵ��ֵ       
        UPDATE #check SET lexpr=replace(@v1,' ','') ,rexpr=replace(@v2,' ','')
	WHERE CURRENT OF r241_cursor
 end
 else
        UPDATE #check SET lexpr=null ,rexpr=null WHERE CURRENT OF R242_cursor
    FETCH NEXT FROM r241_cursor
    INTO @lexpr,@rexpr,@lefttabno
end

CLOSE r241_cursor
DEALLOCATE r241_cursor



delete from #check where ((isnull(lexpr,'')<>'' and  isnull(rexpr,'')<>'') and (opsign='=' and cast(lexpr as float)=cast(rexpr as float)) or (opsign='>'   and cast(lexpr as float)>cast(rexpr as float)) or (opsign='>=' and cast(lexpr as float)>=cast(rexpr as float)) or (opsign='<=' and cast(lexpr as float)<=cast(rexpr as float)) or (opsign='<' and cast(lexpr as float)<cast(rexpr as float)))


update  r220 set checkpass=substring(checkpass,1,1)+'1' where typeno=@typeno and settableno=@settableno  and zb0110=@za0100 and  zc9993='1'  and tableno not in (select substring(lexpr1,CHARINDEX('[',lexpr1)+1,CHARINDEX(':',lexpr1)-2) from #check)
--set @strsql="update  r220 set checkpass=substring(checkpass,1,1)+'1' where typeno="+@typeno+" and settableno="+@settableno +"  and zb0110="+@za0100+" and  zc9993='1'  and tableno not in (select substring(lexpr1,CHARINDEX('[',lexpr1)+1,CHARINDEX(':',lexpr1)-2) from #check) "




--ȡ����δͨ���ļ�����
  dECLARE temp_export CURSOR FOR  select lexpr,opsign,rexpr,lexpr1,rexpr1,
    tableno,(select name from r200 where typeno=@typeno and settableno=@settableno and r200.tableno=#check.tableno) from #check order by tableno
                                  
    open temp_export
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@tabno,@cTableName
set @revalue=''
set @cTableNo=''
WHILE @@FETCH_STATUS = 0
BEGIN
      set @strtabchk='==================================================='
      set @strtabchk=@strtabchk+char(13)+@tabno+' : '+@cTableName
      set @strtabchk=@strtabchk+char(13)+'==================================================='
      if @cTableNo<>@tabno
      begin
	set @revalue =@revalue+char(13)+@strtabchk+char(13)	
      end
    if isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>'' 
      begin
        set   @revalue =@revalue+'���У�鹫ʽ:'+char(13)+@lexpr1+@opsign+@rexpr1+char(13)+@lexpr+@opsign+@rexpr+char(13)
      end
    else
      begin
        set   @revalue =@revalue+'***** '+'У�鹫ʽ:'+@lexpr1+@opsign+@rexpr1+"����"+char(13)
      end
    set @cTableNo=@tabno
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@tabno,@cTableName
--  INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
end
CLOSE temp_export
DEALLOCATE temp_export

--��ӱ��У������
set @strsql = "delete from tablecheck where typeno = "+ @typeno + " and settableno =" + @settableno + " and za0100 = '" + @za0100 + "' "

--delete from tablecheck where typeno = @typeno and settableno = @settableno
insert into tablecheck 
select @za0100,*,@settableno,@typeno from  #check

return

