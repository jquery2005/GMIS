if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_SQLcondition]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_SQLcondition]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO













--����SQL���ĳ��������ʽ�����������SQL���
CREATE          PROCEDURE  flxp_rpt_SQLcondition
@strMainObject varchar(4),
@strTBL varchar(100),
@strFLD varchar(500),
@strCON varchar(500),
@strEXP varchar(500),
@strFUN varchar(500),
@strSQL varchar(8000),
@typeno int=null,
@settableno int=null,
@tableno int=null,
@userid varchar(100)=null,
@stroutSQL varchar(8000) out
 
  AS
	
	SET QUOTED_IDENTIFIER OFF  
	declare @tempSQL varchar(8000)
             declare @declareSQL varchar(8000)
	declare @createSQL varchar(8000)
	declare @SQL varchar(8000)
	declare @za0101 varchar(50)
	declare @value varchar(8000)
	--�����ַ������ȵı���
	declare @length int
	declare @ItemIdList varchar(8000)
	declare @FirstItemIdWord varchar(5000)
	declare @starttime varchar(10)
	declare @endTime varchar(10)
	declare @rptType varchar(1)

	declare @currDate varchar(20)
	set @tempSQL=@strSQL
	set @ItemIdList=@strTBL
	declare @blnrelation varchar(1)  --1:end 2:start
	set @blnrelation='2'
---------------------����ʼʱ��ͽ���ʱ��
	if not @typeno is null
	begin
	select  @currDate=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='030'
	if(isnull(@currDate,'')='')
		set @currDate= convert(datetime,getdate(),21)
	
	if(isnull(@endTime,'')='')
		begin 
		select @rptType=type from r100 where typeno=@typeno and settableno=@settableno
		if (@rpttype='1')--�걨
			begin
				select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @starttime=replace(@starttime,'����|',cast(year(cast(@currDate as datetime))-1 as varchar(4))+'-')
				set @starttime=replace(@starttime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
				select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @endTime=replace(@endTime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
				set @endTime=replace(@endTime,'����|',cast(year(cast(@currDate as datetime))+1 as varchar(4))+'-')
				set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
			end
		if (@rpttype='3')--�±�
			begin
				--convert(varchar(40),getdate(),21)
				select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @starttime=replace(@starttime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
				set @starttime=replace(@starttime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
				select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
				set @endTime=replace(@endTime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
				set @endTime=replace(@endTime,'����|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
				set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
				set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
			end
		end
	--���ֿ�ʼʱ��
	if(isnull(@endTime,'')='')
		begin
			select @starttime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='028'
			select @endTime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='029'
		end
	
	if(isnull(@endTime,'')='')
		begin
			set 	@endTime=@currDate	
			set 	@starttime=@currDate
		end	
	
	end

---------------------



	--������
	if(@strCON<>'')
	begin
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01 where za0101 in ("+@strCON+") open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'$'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--������
	declare @ed0114 varchar(100)

	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='���ֿ�ʼʱ��' or @za0101='���ֽ�ֹʱ��')
					begin
						if @typeno is null
							set @tempSQL=replace(@tempSQL,'#'+@za0101,getdate())
						else
						begin
							if @za0101='���ֿ�ʼʱ��'
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@starttime)
							else
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@endtime)
		
						end
					end
				else if(@za0101='ͬ�����ֿ�ʼʱ��' or @za0101='ͬ�����ֽ�ֹʱ��')
						if @typeno is null
							set @tempSQL=replace(@tempSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,getdate()),120))
						else
						begin
							if @za0101='ͬ�����ֿ�ʼʱ��'
								set @tempSQL=replace(@tempSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,cast(@starttime as datetime)),120))
							else
								set @tempSQL=replace(@tempSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,cast(@endtime as datetime)),120))
		
						end

				else
					set @tempSQL=replace(@tempSQL,'#'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--������ʽ��ǰ����

	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @declareSQL=@declareSQL +' '+@value
				--��SQL���е�^�ӱ����滻��@�ӱ���
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'('+@value+')')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--����SQL���
	--���ݱ�������SQL���
	set	@strsql=''--��ʱ�����ֶδӶ������ȡ�����ֶ�
	set @createsql='from '+@strMainObject+' '
	if(@strTBL<>'')
		begin
		------------------------------------------------------------
			SELECT @Length = DATALENGTH(@strTBL)
			
			    WHILE @Length > 0
			    BEGIN
				--�ӱ����ִ���ȡ������
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				if(left(@FirstItemIdWord,2)<>left(@strMainObject,2))
				begin
					select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=left(@FirstItemIdWord,2)+'01' and infoid= @strMainObject 
					if(@strsql<>'')
						if(right(@FirstItemIdWord,2)='01')
						begin
							if @blnrelation='2'
							begin
							set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.'+@strsql+'='+@FirstItemIdWord+'.za0100'
							end
						end
						else
							begin
								--hjh 12.25
								--if @blnrelation='2'
								--begin
								--set @createsql=@createsql+' left join '+left(@FirstItemIdWord,2)+'01 on '+@strMainObject+'.'+@strsql+'='+left(@FirstItemIdWord,2)+'01.za0100'
								--end
								--set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+left(@FirstItemIdWord,2)+'01.za0100='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
								set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.'+@strsql+'='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
							end
					else
						set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.za0100='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
						
				end
					else
				begin
					--if (@strsql="")
						set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+".za0100="+@FirstItemIdWord+'.za0100 and ' +@FirstItemIdWord++".zc9993='1'"
					--else
					--	set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+"."+@strsql+'='+@FirstItemIdWord+'.za0100 and ' +@FirstItemIdWord++".zc9993='1'"

				end
			END
	
		end
	--���ݱ��ʽ����SQL���
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @createsql=@createsql+' left join ( '+@value+') as '+@za0101+ ' on '+@strMainObject+'.za0100='+@za0101+'.za0100 '
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'['+@za0101+']')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--�������SQL
	set 	@createsql='select '+@strMainObject+'.za0100 '+@createsql+' where ('+@tempSQL+') and  '+@strMainObject+".zc9993='1'"
 	set @stroutSQL=  @createsql
	set @stroutSQL=replace(@stroutSQL,"[","")
	set @stroutSQL=replace(@stroutSQL,"]","")


	SET QUOTED_IDENTIFIER on


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

