SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--检查表间校验公式，返回未通过的检验公式
alter     procedure dbo.gsp_tablecheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @za0100 varchar(20),--单元编码
     @starttime varchar(10),--统计时间
      @revalue  varchar(8000)  OUT
with ENCRYPTION 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off

declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件


declare @lexpr varchar(200)--左表达式
declare @rexpr varchar(200)--右表达式
declare @lexpr1 varchar(200)--左表达式
declare @rexpr1 varchar(200)--右表达式
declare @opsign varchar(2)------比较符

declare @strsql varchar(200)--生成临时sql语句
declare @strtemp varchar(200)--检验公式
declare @value varchar(20) --临时值
declare @tabno  varchar(20) --检验公式所在表的表表号
declare @lefttabno  varchar(20) --检验公式所在表的表表号
declare @row  varchar(20)   --单元格的行
declare @col  varchar(20)  --单元格的列
declare @cTableNo varchar(20)
declare @cTableName varchar(200)
declare @strtabchk varchar(500)
declare @tval int   
 


--把检验公式导入时间表中，处理后可将检验达式直接替换成实际值
SELECT lexpr,opsign,rexpr,lexpr lexpr1,rexpr rexpr1,tableno into #check
FROM r241
WHERE typeno=@typeno and settableno=@settableno
ORDER BY conditionid

--把要校验的表设为未通过
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

--读取所有的检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
  if  isnull(@lexpr,'')<>'' and isnull(@rexpr,'')<>''
    begin
             ---取左检验公式
	while(charindex('[',@lexpr)<>0) --检验公式可能有多个式如：[2：2：1]+[4：5：32]
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
           
	   --从应用表中取实际值
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

             ---取右检验公式
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
    
     --通过游标读取左式的值
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

 
--更新临时表中的检验公式为实际值       
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




--取检验未通过的检验项
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
        set   @revalue =@revalue+'表间校验公式:'+char(13)+@lexpr1+@opsign+@rexpr1+char(13)+@lexpr+@opsign+@rexpr+char(13)
      end
    else
      begin
        set   @revalue =@revalue+'***** '+'校验公式:'+@lexpr1+@opsign+@rexpr1+"出错"+char(13)
      end
    set @cTableNo=@tabno
    FETCH NEXT FROM temp_export
    INTO @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@tabno,@cTableName
--  INTO @lexpr,@opsign,@rexpr,@rexpr1,@rexpr1
end
CLOSE temp_export
DEALLOCATE temp_export

--添加表间校验内容
set @strsql = "delete from tablecheck where typeno = "+ @typeno + " and settableno =" + @settableno + " and za0100 = '" + @za0100 + "' "

--delete from tablecheck where typeno = @typeno and settableno = @settableno
insert into tablecheck 
select @za0100,*,@settableno,@typeno from  #check

return

