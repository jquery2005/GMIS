if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[gsp_innerformula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[gsp_innerformula]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


--行计算公式处理

CREATE procedure dbo.gsp_innerformula
      @typeno varchar(20),--类别
      @settableno varchar(20),--套表
      @rptno      varchar(20),--报表表号
      @za0100 varchar(20),--单位编码
      @starttime varchar(10)--统计时间
     -- @revalue  varchar(8000)  OUT

as

/*
select * from t4_1_4
select * from r252
drop table #check
DECLARE @typeno varchar(20)
DECLARE @settableno varchar(20)
DECLARE @rptno varchar(20)
DECLARE @za0100 varchar(20)
DECLARE @starttime varchar(10)

SELECT @typeno = '4'
SELECT @settableno = '1'
SELECT @rptno = '4'
SELECT @za0100 = '0'
SELECT @starttime = NULL

*/
	SET NOCOUNT ON
	SET QUOTED_IDENTIFIER off
  
declare @v1 varchar(20)--左表达式值
declare @v2 varchar(20)--右表达式值
declare @strwhere varchar(200) --时间条件和当前条件

declare @lexpr varchar(500)--左表达式
declare @rexpr varchar(500)--右表达式
declare @lexpr1 varchar(500)--左表达式
declare @rexpr1 varchar(500)--右表达式

declare @rexpr0 varchar(500)--除号后字段

--declare @tableno varchar(20) ----------表号

declare @strsql varchar(500)--生成临时sql语句
declare @strtemp varchar(500)--存检验公式
declare @value varchar(20)  --临时值
declare @conditionid varchar(20)
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

--表R244存放单元格检验公式
--先生成临时表结构
set @colcount=0
set @rowcount=0

SELECT conditionid,lexpr,rexpr,rexpr rexpr1,tableno checktype into #check  FROM R252 WHERE 1=2

if  isnull(@starttime,'')=''
   set @strwhere=" and  zc9993='1'"
else
  set   @strwhere="  and starttime='"+@starttime +char(39)

--根据每个表的行数转换公式
	  --其中checktype为公式类别： 1为行 3为单元格，
      --取表的总列数
		set @strsql="select count(*) from  syscolumns where id=OBJECT_ID('"+'t'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+"') and name like 'C%'"
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
			--set @strsql="INSERT into #check SELECT conditionid,lexpr,'['"+rexpr+"']',replace(rexpr,']',':"+cast(@i as varchar(20))+"]') rexpr1,1 FROM R252  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno
                 INSERT into #check SELECT conditionid,'['+lexpr+':'+cast(@i as varchar(20))+']',rexpr,replace(rexpr1,']',':'+cast(@i as varchar(20))+']') ,1 FROM R252  WHERE typeno=@typeno  and settableno= @settableno  and tableno=@rptno
			--exec(@strsql)
			set @i=@i+1
		end




--把单元格检验公式插入到临时表中
    set @strsql='INSERT into #check SELECT conditionid, lexpr,rexpr,rexpr rexpr1,3 FROM R254  WHERE typeno='+@typeno +' and settableno=' + @settableno +' and tableno='+@rptno
    exec(@strsql)


--读取每个检验公式

DECLARE R252_cursor CURSOR static FOR 
SELECT lexpr,rexpr1 FROM #check order by checktype desc,conditionid

OPEN R252_cursor
FETCH NEXT FROM R252_cursor
INTO @lexpr,@rexpr

--循环处理每个一检验公式
WHILE(@@FETCH_STATUS = 0)
BEGIN
	    
    --读取右检验公式
	while(charindex('[',@rexpr)<>0)
	begin
  
        set @strtemp= substring(@rexpr,CHARINDEX('[',@rexpr)+1,CHARINDEX(']',@rexpr)-CHARINDEX('[',@rexpr)-1) 
	    set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
	    set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
  	    set @strsql='SELECT c'+@col+' FROM T'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+' where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
        set @strsql='DECLARE temp_value CURSOR static FOR '+@strsql
	        
	        exec(@strsql)
	        open temp_value
	        fetch next from temp_value into @value
	        close temp_value
	        deallocate temp_value
           set @rexpr=replace(@rexpr,'['+@strtemp+']',isnull(@value,'0'))
    end

--hjh 2003.12.10
set @rexpr=replace(@rexpr,'C','')
--hjh

     --通过游标读取右式的值
     set @v1='0'
     if isnull(@rexpr,'')<>'' 
      begin
		set @strsql='DECLARE temp_lexpr CURSOR static FOR select '+@rexpr
		exec(@strsql)
		open temp_lexpr
		fetch next from temp_lexpr into @v1
		CLOSE temp_lexpr
		DEALLOCATE temp_lexpr
      end 


    --为公式左式赋值
 set @strtemp= substring(@lexpr,CHARINDEX('[',@lexpr)+1,CHARINDEX(']',@lexpr)-CHARINDEX('[',@lexpr)-1)         
		set @row=substring(@strtemp,1,charindex(':',@strtemp,1)-1)
		set @col=right(@strtemp,len(@strtemp)-len(@row)-1)
        set @strsql='update T'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+' set c'+@col+'='+isnull(@v1,'0')+'  where rowid='+@row+' and zb0110='+char(39)+@za0100+char(39)+@strwhere
        exec(@strsql)   

    --读下一检验公式
    FETCH NEXT FROM R252_cursor
	INTO @lexpr,@rexpr
end

CLOSE R252_cursor
DEALLOCATE R252_cursor
--select * from r253
--列校验公式
--***************************
	declare @ilen int
	--declare @rexpr1 varchar(1000)

       DECLARE temp_value CURSOR static FOR 
       select lexpr,rexpr1 from r253 WHERE typeno=@typeno and settableno=@settableno  and tableno=@rptno order by conditionid
       open temp_value
       fetch next from temp_value into  @lexpr,@rexpr

       while(@@FETCH_STATUS=0)
       begin
          set @lexpr='[c'+@lexpr+']'
          set @rexpr=replace(@rexpr,'[','[c')

--hjh2004.03.23
	set @rexpr0 = ''
--处理除数为零的问题
	set @rexpr1=@rexpr
	set @ilen = len(@rexpr)

	while(@ilen>0)
	begin
		set @i = charindex('/',@rexpr1)
		if(@i<>0)
		begin
			set @rexpr1 = substring(@rexpr1,@i+1,len(@rexpr1))
			set @i = charindex(']',@rexpr1)
			if(substring(@rexpr1,2,1) = 'c')
			begin
				if (@rexpr0 = '')
					set @rexpr0 = substring(@rexpr1,1,@i) + ' <> 0'
				else
					set @rexpr0 = @rexpr0 + ' and ' + substring(@rexpr1,1,@i) + ' <> 0'
			end

		end
		else
			set @ilen = 0
	end
--print @i
--print @rexpr
if @rexpr0 = ''
          set @strsql='update  t'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+ ' set '+@lexpr+'='+@rexpr+' where zb0110='+char(39)+@za0100+char(39)+@strwhere
else
          set @strsql='update  t'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+ ' set '+@lexpr+'='+@rexpr+' where zb0110='+char(39)+@za0100+char(39)+@strwhere + ' and ' + @rexpr0 

--hjh          set @strsql='update  t'+@TYPENO+'_'+@SETTABLENO+'_'+@rptno+ ' set '+@lexpr+'='+@rexpr+' where zb0110='+char(39)+@za0100+char(39)+@strwhere
          exec(@strsql) 
          print  @strsql
          fetch next from temp_value into  @lexpr,@rexpr
       end  
       close temp_value
       deallocate temp_value

--*****************************	  

return

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

