

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO


create        PROCEDURE flxp_hisCondition
	@p_table varchar(20), --�������
	@m_hisId int --��ʷ������
as
	SET QUOTED_IDENTIFIER OFF  
	declare	@m_strSql varchar(4000) --�������
	declare @m_selectsql varchar(4000)
	declare @m_tmptable varchar(30) --��ʱ��
	declare @m_leftsql varchar(4000)--�Ӽ����Ӵ�
	declare @m_hissql varchar(4000)
	declare @m_strwhere varchar(4000)

	declare @m_table varchar(4) --�����ʷ�����еĲ�ֱ�
	declare @m_len int 
	declare @m_i int --��ȡλ��
	

	declare @m_counttimefield Varchar(11) --ͳ��ʱ���ֶ�
	declare @m_rangetime Int --ʱ�䷶Χ
	declare @m_endyear datetime --������
	declare @m_endyear1 int --������
	declare @m_startyear int --��ʼ��
	declare @m_times   int --����
	declare @m_setsql_man  varchar(4000) --��Ա��Χ����
	declare @m_setsql_his varchar(4000) --��ʷ����
	declare @m_canlink varchar(1) --�Ƿ�����
	declare @m_statTable varchar(4)

	declare @m_year int
	declare @i_count int

	--set @m_hisId = 11
	--set @p_table = 'a_his'
	set @m_tmptable = '[##t'+convert(varchar(20),getdate(),120)+']'

	set @m_leftsql = ''
	--ȡ��ʷ��¼��ѯ���¼
	set @m_strSql='declare curs_gwmc cursor for select counttimefield,rangetime,endyear,times,setsql_man,setsql_his,canlink from gs_hisCondition where hiscondid = '+ cast(@m_hisId as varchar) +' open curs_gwmc'
	exec(@m_strSql)
	fetch next from  curs_gwmc into @m_counttimefield,@m_rangetime,@m_endyear,@m_times,@m_setsql_man,@m_setsql_his,@m_canlink
	close Curs_gwmc
	deallocate Curs_gwmc

	--ɾ����ʱ��
	select   @i_count = count(*) from sysobjects where name = @m_tmptable
	if(@i_count >=1) 
	begin
		set @m_strsql = 'drop table ' + @m_tmptable
		exec(@m_strsql)
	end
	--������ʱ��
	set @m_strsql = 'create table ' + @m_tmptable + ' (za0100 varchar(20))'
	exec(@m_strsql)
	set @m_strsql = 'create table ' + @p_table + ' (za0100 varchar(20))'
	exec(@m_strsql)
print @m_strsql
	
	if(isnull(@m_setsql_man,'') = '')
		set @m_setsql_man = ' select za0100 from aa01 '
	--��ֳ�ͳ�Ʊ�
	set @m_statTable = substring(@m_counttimefield,1,4)
	--����ͳ����ʼʱ��ʱ��
	set @m_endyear1 = year(@m_endyear)
	set @m_startyear = year(@m_endyear) - @m_rangetime

	--����û��ʱ�䷶Χ��û�д��������
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

	--����insert into ����
	--set @m_strSql='insert into ' + @m_tmptable + ' select za0100 from '
	
	--������ʷ����,��ֳ������ӱ���ϳ����
	set @m_hissql = @m_setsql_his
	set @m_len = DATALENGTH(@m_hissql)
print @m_len
	WHILE (@m_len > 0)
	BEGIN
		--�ӱ����ִ���ȡ������
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
	--�ж������������
	if (@m_canlink = 0)
	begin
		--����������
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
		--��������
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
			--�����ظ���¼
	set @m_strsql = 'insert into ' + @p_table + ' select distinct za0100 from ' + @m_tmptable
	exec(@m_strsql)	
	set @m_strsql = 'drop table ' + @m_tmptable
	exec(@m_strsql)


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

