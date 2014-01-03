SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

--行检验公式处理，返回检验未通过的校验公式
alter   procedure dbo.gsp_innercheck
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @rptno      varchar(20),--报表表号
      @za0100 varchar(20),--单位编码
      @starttime varchar(10),--统计时间
      @revalue  varchar(8000)  OUT
with ENCRYPTION 
as
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off
  
declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件

declare @lexpr varchar(500)--左表达式
declare @rexpr varchar(500)--右表达式
declare @lexpr1 varchar(500)--左表达式
declare @rexpr1 varchar(500)--右表达式
declare @opsign varchar(2)------比较符
--declare @tableno varchar(20) ----------表号
declare @blnresult bit;

declare @strsql varchar(500)--生成临时sql语句
declare @strtemp varchar(500)--存检验公式
declare @value varchar(20)  --临时值
declare @tabno  varchar(20)--检验公式所在的表
declare @conditionid varchar(20)
declare @tabname varchar(40) --报表表名
declare @row  varchar(20) --单元格行
declare @col  varchar(20) --单元格列
declare @colcount varchar(20)--数据表的总列数
declare @rowcount varchar(20)--数据表的总行数
declare @i int 
declare @cutno varchar(20)
declare @checktype varchar(1) --检验类型 
declare @custr varchar(100)
declare @strtabchk varchar(500)
declare @removerow varchar(200)
declare @removecol varchar(200)

declare @tablename varchar(20)

--表R244存放单元格检验公式
--先生成临时表结构
set @blnresult=0;
set @colcount=0
set @rowcount=0
SELECT settableno,tableno,conditionid,lexpr,opsign,rexpr,lexpr1,rexpr1,tableno cucol,tableno checktype into #check  FROM R242 WHERE 1=2

if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1' and zb0110='"+@za0100+"'"
else
  set   @strwhere="  and starttime='"+@starttime +"' and zb0110='"+@za0100+"'"

--取共有多少表,不同表的总行数的总列数不同
  if isnull(@rptno,'')=''
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno='+@settableno
  else
    set @strsql='select distinct tableno,name from r200 WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno

    set @strsql='DECLARE T_ColCount cursor static for '+@strsql  
    execute(@strsql)
    
    open T_ColCount 
    fetch next from T_ColCount  
    into @tabno,@tabname



--根据每个表的行数及列数把行、列检验公式转换
while(@@FETCH_STATUS = 0)
begin
     set @tablename='t'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno
	  --其中checktype为检验公式类别： 1为行检验 2为列 3为单元格，
      --取表的总列数
		set @strsql="select count(*) from  syscolumns where id=OBJECT_ID('"+@tablename+"') and name like 'C%'"
		set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @colcount
	        close temp_value
	        deallocate temp_value
	        
	        
	        	--把行检验公式转换成单元格公式并插入到临时表中
		set @i=1
		while(@i<=@colcount)
		begin
			set @strsql="INSERT into #check SELECT settableno,tableno,conditionid, lexpr,opsign,rexpr,replace(lexpr1,']',':"+cast(@i as varchar(20))+"]') lexpr1,replace(rexpr1,']',':"+cast(@i as varchar(20))+"]') rexpr1,"+cast(@i as varchar(20)) +',1 FROM R242  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@tabno+" and isnull(removecol,'')=''"
			exec(@strsql)
			set @i=@i+1
		end
		
--**********************对于有排除列的处理
		
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
		---取表的总行数
		set @strsql='select MAX(ROWID) from t_'+@TYPENO+'_'+@SETTABLENO+'_'+@tabno 
		set @strsql='DECLARE temp_value CURSOR FOR '+@strsql
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @rowcount
	        close temp_value
	        deallocate temp_value
*/
/*
	--把列检验公式转换成单元格公式并插入到临时表中
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
--列校验公式
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
       --//插入错误的校验公式  
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


--把单元格检验公式插入到临时表中



--读取每个检验公式
DECLARE R242_cursor CURSOR FOR   SELECT lexpr1,rexpr1,tableno  FROM #check where checktype<>2  for update
OPEN R242_cursor
FETCH NEXT FROM R242_cursor
INTO @lexpr,@rexpr,@tabno

--循环处理每个一检验公式
WHILE @@FETCH_STATUS = 0
BEGIN
    --读取左检验公式
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
    --读取右检验公式
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
   
   /*
     --通过游标读取右式的值
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

--更新临时表，将左式及右式的值赋到数据库中       
        UPDATE #check SET lexpr1=replace(@v1,' ','') ,rexpr1=replace(@v2,' ','')
	WHERE CURRENT OF R242_cursor
 end
 else
        UPDATE #check SET lexpr1=null ,rexpr1=null WHERE CURRENT OF R242_cursor

    --读下一检验公式
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
--分别把表的检验结果输出
while(@@FETCH_STATUS = 0)
begin
      set @strtabchk='==================================================='
      set @strtabchk=@strtabchk+char(13)+@tabno+' : '+@tabname
      set @strtabchk=@strtabchk+char(13)+'==================================================='

	--读取检验未通过的检验公式
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
	--@strtemp检验公式号

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
  	  set @strtabchk=(select case @checktype when '1' then '行' when '2' then '列' when '3' then '单元格' end)
	   set @custr=char(13)
	   if isnull(@lexpr1,'')<>'' and isnull(@rexpr1,'')<>'' 
	    begin
	    
		if @cutno<>@conditionid or @row<>@checktype
		begin
			set @custr=char(13)+char(13)+@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+char(13)
			set @cutno=@conditionid
			set @row=@checktype
		end
		set @strsql=''
		if @strtabchk='行'
		    set @strsql='第'+@col+'列 '
		if @strtabchk='列'
		    set @strsql='第'+@col+'行 '
		set   @revalue =@revalue+@custr+@strsql+@lexpr1+@opsign+@rexpr1
         end
         else
            begin
              if charindex(@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+' 出错',@revalue)=0
                set   @revalue =@revalue+@custr+'***** '+@strtabchk+'检验公式：'+ @lexpr+@opsign+@rexpr+' 出错'
            end  
		FETCH NEXT FROM temp_export
		INTO @conditionid, @lexpr,@opsign,@rexpr,@lexpr1,@rexpr1,@col,@checktype
	end

	CLOSE temp_export
	DEALLOCATE temp_export
 
    fetch next from T_ColCount  
    into @tabno,@tabname

end

--添加表内校验数据
set @strsql = "delete from RptInnerCheck where typeno = "+ @typeno + " and settableno =" + @settableno + " and tableno = " + @rptno + " and za0100 = '" + @za0100 + "' "
execute(@strsql)

insert into RptInnerCheck 
select @za0100,@typeno,* from  #check

            --如果全部成功则返回空值
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
