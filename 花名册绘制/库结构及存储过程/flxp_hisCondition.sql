

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create        PROCEDURE flxp_hisCondition
	@p_table varchar(20), --传入表名
	@m_hisId int --历史条件号
as
	SET QUOTED_IDENTIFIER OFF  
	declare	@m_strSql varchar(4000) --构造语句
	declare @m_selectsql varchar(4000)
	declare @m_tmptable varchar(30) --临时表
	declare @m_leftsql varchar(4000)--子集连接串
	declare @m_hissql varchar(4000)
	declare @m_strwhere varchar(4000)

	declare @m_table varchar(4) --存放历史条件中的拆分表
	declare @m_len int 
	declare @m_i int --截取位置
	

	declare @m_counttimefield Varchar(11) --统计时间字段
	declare @m_rangetime Int --时间范围
	declare @m_endyear datetime --截至年
	declare @m_endyear1 int --截至年
	declare @m_startyear int --起始年
	declare @m_times   int --次数
	declare @m_setsql_man  varchar(4000) --人员范围条件
	declare @m_setsql_his varchar(4000) --历史条件
	declare @m_canlink varchar(1) --是否连续
	declare @m_statTable varchar(4)

	declare @m_year int
	declare @i_count int

	--set @m_hisId = 11
	--set @p_table = 'a_his'
	set @m_tmptable = '[##t'+convert(varchar(20),getdate(),120)+']'

	set @m_leftsql = ''
	--取历史记录查询表记录
	set @m_strSql='declare curs_gwmc cursor for select counttimefield,rangetime,endyear,times,setsql_man,setsql_his,canlink from gs_hisCondition where hiscondid = '+ cast(@m_hisId as varchar) +' open curs_gwmc'
	exec(@m_strSql)
	fetch next from  curs_gwmc into @m_counttimefield,@m_rangetime,@m_endyear,@m_times,@m_setsql_man,@m_setsql_his,@m_canlink
	close Curs_gwmc
	deallocate Curs_gwmc

	--删除临时表
	select   @i_count = count(*) from sysobjects where name = @m_tmptable
	if(@i_count >=1) 
	begin
		set @m_strsql = 'drop table ' + @m_tmptable
		exec(@m_strsql)
	end
	--创建临时表
	set @m_strsql = 'create table ' + @m_tmptable + ' (za0100 varchar(20))'
	exec(@m_strsql)
	set @m_strsql = 'create table ' + @p_table + ' (za0100 varchar(20))'
	exec(@m_strsql)
print @m_strsql
	
	if(isnull(@m_setsql_man,'') = '')
		set @m_setsql_man = ' select za0100 from aa01 '
	--拆分出统计表
	set @m_statTable = substring(@m_counttimefield,1,4)
	--计算统计起始时间时间
	set @m_endyear1 = year(@m_endyear)
	set @m_startyear = year(@m_endyear) - @m_rangetime

	--处理没有时间范围，没有次数的情况
	if(@m_times = 0)
	begin
		set @m_setsql_his = replace(@m_setsql_his,'[','')
		set @m_setsql_his = replace(@m_setsql_his,']','')

		set @m_selectsql = 'select za0100,count(*) as icount from ' + @m_stattable + ' where  '+@m_stattable+'.za0100 in (' + @m_setsql_man + ') and ' + @m_setsql_his + ' and year(' + @m_counttimefield + ') > ' + cast(@m_startyear as varchar) + ' and year(' + @m_counttimefield + ') < ' + cast(@m_endyear1 as varchar)
		set @m_strSql = 'insert into ' + @p_table + ' select za0100 from (' + @m_selectsql + ' group by za0100) kk where icount >=1' 
print @m_strSql
		exec(@m_strsql)
		
		set @m_strsql = 'drop table ' + @m_tmptable
		exec(@m_strsql)
		
		return

	end

	--构造insert into 部分
	--set @m_strSql='insert into ' + @m_tmptable + ' select za0100 from '
	
	--处理历史条件,拆分成其他子表组合成语句
	set @m_hissql = @m_setsql_his
	set @m_len = DATALENGTH(@m_hissql)
print @m_len
	WHILE (@m_len > 0)
	BEGIN
		--从表名字串中取出表名
		set @m_i = charindex('[',@m_hissql)
		if (@m_i<>0)
		begin
			set @m_hissql = substring(@m_hissql,@m_i+1,len(@m_hissql))
			set @m_table = substring(@m_hissql,1,4)
			if(@m_table<>@m_statTable)
			begin
				if(@m_leftsql<>'')
					set @m_leftsql=@m_leftsql+' left join '+@m_table+' on '+@m_statTable+'.za0100='+@m_table+'.za0100 and '+  @m_table + '.zc9993 = ''1'' '
				else
					set @m_leftsql=' left join '+@m_table+' on '+@m_statTable+'.za0100='+@m_table+'.za0100 and '+  @m_table + '.zc9993 = ''1'' '
	
			end
		end
		else
			set @m_len = 0
	end
print @m_leftsql
print @m_statTable

	set @m_setsql_his = replace(@m_setsql_his,'[','')
	set @m_setsql_his = replace(@m_setsql_his,']','')
	--判断连续构造语句
	if (@m_canlink = 0)
	begin
		--不连续处理
		if(@m_leftsql <> '')
			set @m_selectsql = 'select za0100,count(*) as icount from ' + @m_stattable + @m_leftsql + ' where '+@m_stattable+'.za0100 in (' + @m_setsql_man + ') and ' + @m_setsql_his + ' and year(' + @m_counttimefield + ') > ' + cast(@m_startyear as varchar) + ' and year(' + @m_counttimefield + ') < ' + cast(@m_endyear1 as varchar) 
		else
			set @m_selectsql = 'select za0100,count(*) as icount from ' + @m_stattable + ' where  '+@m_stattable+'.za0100 in (' + @m_setsql_man + ') and ' + @m_setsql_his + ' and year(' + @m_counttimefield + ') > ' + cast(@m_startyear as varchar) + ' and year(' + @m_counttimefield + ') < ' + cast(@m_endyear1 as varchar) 
		set @m_strSql = 'insert into ' + @m_tmptable + ' select za0100 from (' + @m_selectsql + ' group by za0100) kk where icount >=' + cast(@m_times as varchar)
		exec(@m_strsql)

print @m_strSql
	end
	else
	begin
		--连续处理
		set @m_year = @m_endyear1 - @m_times
print @m_year
print @m_startyear
print @m_leftsql

		while (@m_startyear <= @m_year)
		begin
			set @m_selectsql = ''
			set @m_i = @m_times
			set @m_strwhere = ''			while (@m_i <> 0) 
			begin
				if(@m_leftsql <> '')
					set @m_selectsql = @m_selectsql + '(select '+@m_stattable+'.za0100 from ' + @m_stattable + @m_leftsql + ' where  '+@m_stattable+'.za0100 in (' + @m_setsql_man + ') and  year(' + @m_counttimefield + ') = ' + cast(@m_endyear1 - @m_i as varchar) + ' and ' + @m_setsql_his + ') a' + cast(@m_i as varchar) + ','
				else
					set @m_selectsql = @m_selectsql + '(select '+@m_stattable+'.za0100 from ' + @m_stattable + ' where  '+@m_stattable+'.za0100 in (' + @m_setsql_man + ') and  year(' + @m_counttimefield + ') = ' + cast(@m_endyear1 - @m_i as varchar) + ' and ' + @m_setsql_his + ') a' + cast(@m_i as varchar) + ','
print @m_selectsql
				if(@m_i <> 1)
					set @m_strwhere = @m_strwhere + 'a' + cast(@m_i as varchar) + '.za0100=a'+cast(@m_i-1 as varchar) +'.za0100 and  '
				set @m_i = @m_i -1
			end
			set @m_selectsql = substring(@m_selectsql,1,len(@m_selectsql)-1)
				
			set @m_strsql = 'insert into ' + @m_tmptable + ' select a'+cast(@m_times as varchar)+'.za0100 from ' + @m_selectsql + ' where ' + @m_strwhere + ' 1=1'
print @m_strsql
			exec(@m_strsql)
			set @m_year = @m_year - 1
			set @m_endyear1 = @m_endyear1-1
			
		end
	end
			--处理重复记录
	set @m_strsql = 'insert into ' + @p_table + ' select distinct za0100 from ' + @m_tmptable
	exec(@m_strsql)	
	set @m_strsql = 'drop table ' + @m_tmptable
	exec(@m_strsql)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

