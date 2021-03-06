if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_stat]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_stat]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







--报表统计部分
CREATE         PROCEDURE flxp_rpt_stat
--主对象
@strMainObject varchar(4),
--单位编码
@ZB0110 varchar(20),
--类别
@typeno int,
--套表
@settableNo int, 
--表号 
@tableno int,
--表名列表
@strTBL varchar(100),
--字段名列表 
@strFLD varchar(500),
--常量
@strCON varchar(500),
--表达式
@strEXP varchar(500),
--函数
@strFUN varchar(500),
--数字开始时间
@starttime varchar(10),
--数字结束时间
@endTime varchar(10),
--全表条件
@WholeCondition varchar(2000),--全表条件应该是与单位或部门合并后的条件
--全表条件定义项,如果全表条件用到前五种表达式，则用到该变量
--@WholeConditionDEF varchar(2000),
--关联字段
@objectAssicate varchar(2000),
@userid varchar(20),
@outSQL varchar(5000)  =null output
 --@Userid varchar(50)=null
 
 AS
--1、将SETSQL的值赋给statSQL
--2、将STATSQL进行替换
--3、生成临时表
--4、进行统计
--具体的处理过程处下-
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
declare @tempSQL varchar(8000)
declare @declareSQL varchar(1000)
--declare @createSQL varchar(1000)
declare @strSQL varchar(8000)
declare @za0101 varchar(50)
declare @value varchar(1000)
--处理字符串长度的变量
declare @length int
declare @ItemIdList varchar(5000)
declare @FirstItemIdWord varchar(1000)
declare @tableName varchar(20)
declare @FieldName varchar(6)
declare @row int
declare @col int
declare @currDate varchar(20)
declare @rptType varchar(1)
declare @jstable varchar(40)
declare @otherMainobject varchar(4)
SET QUOTED_IDENTIFIER OFF  
set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
--计算数字开始时间和数字截止时间
--数字开始时间
--@starttime varchar(20),
--数字结束时间
--@endTime varchar(20),
set @tempSQL=""
set @declareSQL=''
--set @strMainObject='AA01'
--set @ZB0110='1'
--set @typeno=2
--set @settableNo=1
--set @tableno=1
--set @strTBL='AA22,AA37'
--set @strFLD='AA01.AA0114,AA01.AA0107,AA37.AE3731,AA22.AA2205'
--set @strCON=''
--set @strFUN=''
--set @strEXP=''
--set @starttime='1999-01-01'
--set @endtime='2002-01-01'
--set @WholeCondition=''
--set @WholeConditionDEF=''
--set @objectAssicate=''
--给单位编码岍初值
if  isnull(@zb0110,'')='' or isnull(@zb0110,'')='-1'
	set @zb0110='0'


--select @row=flag from r200 where   typeno=@typeno and settableno=@settableno and tableno=@tableno
--if(@row=0)
--	goto abandon1
--用户
if (charindex( upper(@strMainObject+".ZA0100"),upper(@strFLD))>0)
	begin
		set @ItemIdList=@strFLD
		set @strFLD=''
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			if upper(@FirstItemIdWord)<>upper(@strMainObject+".ZA0100")
				if ( @strFLD='')
					set @strfld=@FirstItemIdWord
				else
					set @strfld=@strfld+","+@FirstItemIdWord
		
		    end 
	end
--if upper(@strMainObject)<>'AB01'
--	begin
--		select @length=isnull(count(*),0) from r203 where typeno=@typeno and settableno=@settableno and isnull(mainobject,'')='AB01' 
--		if ( @strFLD='')
--			set @strfld="AB01.ZA0100"
--		else
--			set @strfld=@strfld+",AB01.ZA0100"
--	end
if(isnull(@userid,'')='')
	set @userid='sa'
--当前时间

select  @currDate=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='30'
if(isnull(@currDate,'')='')
	set @currDate= convert(datetime,getdate(),21)



if(isnull(@endTime,'')='')
	begin 
	select @rptType=type from r100 where typeno=@typeno and settableno=@settableno
	if (@rpttype='1')--年报
		begin
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime))-1 as varchar(4))+'-')
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-')
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime))+1 as varchar(4))+'-')
			set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
		end
	if (@rpttype='3')--月报
		begin
			--convert(varchar(40),getdate(),21)
			select @starttime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @starttime=replace(@starttime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
			set @starttime=replace(@starttime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
			select @endTime=startdate from r100 where typeno=@typeno and settableno=@settableno
			set @endTime=replace(@endTime,'上期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,1,cast(@currdate as datetime)),120)
			set @endTime=replace(@endTime,'本期|',cast(year(cast(@currDate as datetime)) as varchar(4))+'-'+right('0'+cast(month(cast(@currDate as datetime)) as varchar(4)),2)+'-')
			set @currdate=convert( varchar(10),dateadd(month,-1,cast(@currdate as datetime)),120)
			set @endTime=convert(varchar(10),dateadd(day,-1, @endTime),120)
		end
	end
--数字开始时间
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
--if(isnull(@starttime,'')='')
--	set @starttime=convert(varchar(20),getdate(),21)

--if(isnull(@endTime,'')='')
--	set @endTime=convert(varchar(20),getdate(),21)
--表示该表已经归档
declare @tempstarttime varchar(10)
declare @tempendtime varchar(10)

if (@rpttype='1')--年报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,4)=left(@endTime,4) and  zc9993='0'
	if (@row>0)
		goto abandon1
end

if (@rpttype='2')--季报
begin
	set @tempstarttime=right('0'+cast(month(@starttime) as varchar(2)),2)+'-'+right('0'+cast(day(@starttime) as varchar(2)),2)
	set @tempendtime=right('0'+cast(month(@endtime) as varchar(2)),2)+'-'+right('0'+cast(day(@endtime) as varchar(2)),2)
	if @tempstarttime<>'01-01' and @tempendtime<>'03-31' or @tempstarttime<>'04-01' and @tempendtime<>'06-30' or @tempstarttime<>'07-01' and @tempendtime<>'09-30'  or @tempstarttime<>'10-01' and @tempendtime<>'12-31' 
		goto abandon1
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and starttime= @endtime and  zc9993='0'
	if (@row>0)
		goto abandon1
end
select * from r220
if (@rpttype='3')--月报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,7)= left(@endTime,7)  and  zc9993='0'
	if (@row>0)
		goto abandon1
end
set @ItemIdList=''
--1、将SETSQL的值赋给statSQL
--begin tran

update r203 set statsql=setsql where typeno=@typeno and settableno=@settableno and tableno=@tableno
--2、将STATSQL进行替换
--2.1 处理常量
	if(@strCON<>'')
	begin
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01 where za0101 in ("+@strCON+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--2.2处理函数
	declare @ed0114 varchar(100)
	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间')
					update r203 set statSQL=replace(statSQL,'#'+@za0101,@starttime ) where  typeno=@typeno and settableno=@settableno and tableno=@tableno
				else if(@za0101='数字截止时间')
						update r203 set statSQL=replace(statSQL,'#'+@za0101,@endtime )  where typeno=@typeno and settableno=@settableno and tableno=@tableno
				else
--						if(@ed0114='')
							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value)  where typeno=@typeno and settableno=@settableno and tableno=@tableno
--						else
--							begin
--								update r203 set statSQL=replace(statSQL,'#'+@za0101,'#'+@za0101+@ed0114) where typeno=@typeno and settableno=@settableno and tableno=@tableno
---							update r203 set statSQL=replace(statSQL,'#'+@za0101,@value) where typeno=@typeno and settableno=@settableno and tableno=@tableno
--							end


			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end

	--2.3处理表达式的前五种,缺少对于全表条件的处理
	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				update r203 set statSQL=replace(statSQL,'^'+@za0101,"("+@value+")")  where  typeno=@typeno and settableno=@settableno and tableno=@tableno	
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--###########################################
	update r203 set statsql=replace(statsql,'^','') where typeno=@typeno and settableno=@settableno and tableno=@tableno
	set @tempSQL= @tempSQL+"   "
	set @strsql="select  "
	--3、生成临时表
	
	--3.1处理关联表
	set @ItemIdList=@objectAssicate
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	
	--3.2处理字段
	set @ItemIdList=@strFLD
	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN
		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT

		set @strSQL=@strSQL+@FirstItemIdWord+" as ["+@FirstItemIdWord+"],"
	    end 
	    if(right(@strsql,1)=',')
	    set @strsql=left(@strsql,len(@strsql)-1)
	--生成临时表结构
		if @strTBL=""
			if(rtrim(@strsql)='select')
				set @strsql=@strsql+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+" where 1=2"
			else
				set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+" where 1=2"

		else
			if(rtrim(@strsql)='select')
				set @strsql=@strsql+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+","+@strTBL+" where 1=2"
			else
				set @strsql=@strsql+","+@strMainObject+".ZA0100 as za0100,"+@strMainObject+".zb9991 as zb9991,"+@strMainObject+".zb9992 as zb9992  into "+@jstable+" from "+@strMainObject+","+@strTBL+" where 1=2"

	exec(@strsql)
	--处理表达式，将表达式做为表的一个字段
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)

			begin
				
				set @strSQL="alter table "+@jstable+" add ["+@za0101+"]  numeric(15,2)"
				exec(@strsql)
				--将SQL语中的^加变量替换成@加变量
				fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--3.3根据全表条件向临时表中增加记录
	--select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=@FirstItemIdWord
	if(@WholeCondition='') 
		if(@zb0110='0' or @zb0110='-1')
			set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where zc9993='1'"
		else
			if(upper(@strMainObject)<>'AB01')
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where  "+@strMainObject+".Ab0110  like '"+@zb0110+"%'   and zc9993='1'"
			else
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where  "+@strMainObject+".za0100  = '"+@zb0110+ "'  and  zc9993='1' "
	else
		if(@zb0110='0' or @zb0110='-1')
			set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and zc9993='1'"
		else
			if(upper(@strMainObject)<>'AB01')
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".Ab0110  like '"+@zb0110+"%'  and zc9993='1'"
			else
				set @strsql=" insert into "+@jstable+" (za0100,zb9991,zb9992)   select za0100,zb9991,zb9992 from "+@strMainObject+" where za0100 in ("+@WholeCondition+") and "+@strMainObject+".za0100  = '"+@zb0110+"' and zc9993='1'"


	exec(@strsql)


	--让row暂做为记录个数
	set @strSQL=" declare Curs_gwmc cursor for select count(*) from "+@jstable+"  open curs_gwmc"
	exec(@strsql)
       	fetch next from  curs_gwmc into @row
	close Curs_gwmc
	deallocate Curs_gwmc
		if @row=0 
		BEGIN
			--增加数据索引表
			 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
			set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
			exec(@strsql)
			--41复制数据表的数据
			set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
			exec(@strsql)
			set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
			exec(@strsql)
			set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
			exec(@strsql)
			goto abandon
		END

		--3.4向临时表中增加每一列的值
---------------------------------------------------------------------
		--考虑表达式的处理

			if(@strEXP<>'')
			begin
				set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115='6'  open curs_gwmc"
				exec(@strsql)
		
			        	fetch next from  curs_gwmc into @za0101,@value
				while(@@fetch_status=0)
					begin
						
						--set @value="update "+@jstable+" set ["+@za0101+"]="+@za0101+"."+@za0101+"  from ("+@value+") as " + @za0101+" where "+@za0101+".za0100="+@jstable+".za0100"
						--exec(@value)
						set @strSQL="update "+@jstable+" set ["+@za0101+"]=["+@za0101+"].["+@za0101+"] from ("+@value+") as ["+@za0101+"] where "+@jstable+".za0100=["+@za0101+"].za0100"
						exec(@strsql)

						fetch next from  curs_gwmc into @za0101,@value
					end
				close Curs_gwmc
				deallocate Curs_gwmc
			end


---------------------------------------------------关联主对象中的数据赋值
		set @ItemIdList=@objectAssicate
		SELECT @Length = DATALENGTH(@ItemIdList)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
	
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			set @strsql="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@strsql)
	
		    end 

--------------------------------------------------------------

	set @ItemIdList=@strFLD
	set @tablename=""
	set @FieldName=""

	SELECT @Length = DATALENGTH(@ItemIdList)
	    WHILE @Length > 0
	    BEGIN


		--从表名字串中取出表名
	   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
		set @tablename=left(@FirstItemIdWord,4)
		set @FieldName=substring(@FirstItemIdWord,6,6)

		--是主对象
		if(@strMainObject=left(@FirstItemIdWord,4))
		begin
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100"
			exec(@value)
		end
		--主对象的子集
		else if(left(@strMainObject,2)=left(@FirstItemIdWord,2))
		begin
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]="+@FirstItemIdWord+" from "+left(@FirstItemIdWord,4)+" where "+@jstable+".za0100="+left(@FirstItemIdWord,4)+".za0100 and "+left(@FirstItemIdWord,4)+".zc9993='1'"
			exec(@value)
		end
		--关联对象的主集
		else if(left(@strMainObject,2)<>left(@FirstItemIdWord,2) and substring(@FirstItemIdWord,3,2)='01' )


		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=@tablename
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+@tablename+" on "+@strMainObject+"."+@za0101+"="+@tablename+".za0100) as kk where kk.za0100="+@jstable+".za0100"
			exec(@value)
		end
		--关联对象的子集
		else
		begin
			select top 1 @za0101=isnull(infofield,'') from gs_property where left(dictid,4)=left(@tablename,2)+'01'
			set @value="update "+@jstable+" set ["+@FirstItemIdWord+"]=kk."+@FieldName+" from (select "+@strMainObject+".za0100," +@FirstItemIdWord+" from "+@strMainObject+" left join "+left(@tablename,2)+'01'+" on "+@strMainObject+"."+@za0101+"="+left(@tablename,2)+'01'+".za0100 left join "+@tableName+"  on  " +left(@tablename,2)+'01'+".za0100= "+@tablename+".za0100 and "  +@tablename +".zc9993='1' ) as kk where kk.za0100="+@jstable+".za0100"
			exec(@value)
		end
	    end 
--4报表统计
	--增加数据索引表
	set @strsql="delete from r220  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="update r220  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="insert into r220 (typeno,settableno,tableno,zb0110,starttime,startdate)  values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"','"+@starttime +"')"
	exec(@strsql)
	 set @tableName='T'+cast(@typeNo as varchar(10))+'_'+cast(@settableno as varchar(10))+'_'+cast(@tableno as varchar(10))
	if  not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].['+@tableName+']') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
		goto dealunit
	--41复制数据表的数据
	set @strsql="delete from  "+@tableName+" where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"' "-- and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set @strsql="select * into ##wltemp from "+@tableName+" where  ZB0110 is null 	update ##wltemp set zb0110='"+@zb0110+"',starttime='"+@endTime+"' ,zc9993='1'"
	exec(@strsql)
	set @strsql="update " +@tableName+" set  zc9993='0' where zb0110='"+@zb0110+"'   insert into "+@tableName+" select * from 	 ##wltemp  drop table ##wltemp"
	exec(@strsql)
	--数据表生成完毕
	--数据表生成完毕
	--4.2
	--@length暂用来表示序列
	declare @RowSQl varchar(2000)
	declare @ColSQl varchar(2000)
	declare @ROWdealstyle varchar(1)
	declare @ROWstatObject varchar(20)
	declare @ROWSequencetype varchar(1)
	declare @COLdealstyle varchar(1)
	declare @COLstatObject varchar(20)
	declare @COLSequencetype varchar(1)
	declare @RowdealFieldname varchar(1000)
	declare @ColdealFieldname varchar(1000)
	--计算行条件统计的结果
	declare @statValue int
	set @row=1
	set @col=1
	declare curs_gwmc cursor for select serialNo from r202 where   icount<>0   and   serialtype='1' and  typeno=@typeno and settableno=@settableno and tableno=@tableno open curs_gwmc
        	fetch next from  curs_gwmc into @length
	--处理只有列的序列

	if( @@fetch_status<>0)
		begin
			declare curs_OnlyCol cursor for select statSQL,dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname,mainobject  from r203  where typeno=@typeno and settableno=@settableno and tableno=@tableno  and cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) from r202 where serialtype='2') order by r203.serialno,sequenceno open curs_OnlyCol
        			fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
			set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			while(@@fetch_status=0)
			begin
			if(@colSequencetype<>'4') 
				begin
--					处理方式0:计数，1:求和2:最大值3:最小值4:平均值5:中位值6:平均人数
					if(@colSequencetype='2') set @colSQl=' 1=1 '
					if(@colSequencetype='1' or @colSequencetype='2')
						begin
						if @othermainobject<>"" 
							set @coldealFieldname=" distinct "+@coldealFieldname
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@ColSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@ColSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
							end


						else if (@coldealstyle='5')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull((max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2,0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'and rowid=1" 
						else if(@coldealstyle='4')
							
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(avg("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else if(@coldealstyle='3')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(min("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='2')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(max("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
						else if(@coldealstyle='1')
							set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(sum("+@coldealFieldname+"),0) from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1"
						else 
							begin
							if(@colstatObject="")
								set @colstatObject="za0100"
								set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from "+@jstable+"  where "+rtrim(@ColSQl)+") where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=1" 
							end

	
					
						exec(@strsql)
						end
				end 
        				fetch next from  curs_OnlyCol into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
					set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
		
				set @col=@col+1
			end
			close curs_OnlyCol
			deallocate curs_OnlyCol

		end		
	else--处理有行/列的序列
	while(@@fetch_status=0)
		begin
		--update r203 set statSQL=replace(statSQL,'$'+@za0101,@value)  where  typeno=@typeno and settableno=@settableno and tableno=@tableno
			declare curs_row cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname from r203 where    typeno=@typeno and settableno=@settableno and tableno=@tableno and serialno=@length open curs_row
        			fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
			set @RowSQl=replace(@RowSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			while(@@fetch_status=0)
			begin	
				set @col=1
				if(isnull(@RowSQl,'')='')
				set @RowSQl='1=1'
				set @strsql="declare curs_Onlyrow cursor for   select count(*)  from "+@jstable+"  where "+@RowSQl+" open curs_Onlyrow"
				exec(@strsql)
        				fetch next from  curs_Onlyrow into @statValue
				close curs_Onlyrow

				deallocate curs_Onlyrow
				--set  @statValue = select count(*)  from "+@jstable+"  where @RowSQl
				--set @strsql='select @statValue=count(*)  from "+@jstable+"  where ' +@RowSQl
				--exec(@strsql)
				if(@rowSequencetype<>'4')
				begin
				if(@rowSequencetype='2') set @RowSQl=' 1=1 '
				if(@statvalue>0)
				begin
					declare curs_col cursor for select rtrim(statSQL),dealstyle,isnull(statObject,'za0100'),sequenceType,dealfieldname,isnull(mainobject,'')  from r203  where cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) in (select cast(typeno as varchar(10))+'A'+cast(settableno as varchar(10))+'A'+cast(tableno as varchar(10))+'A'+cast(serialno as varchar(10)) from r202 where typeno=@typeno and settableno=@settableno and tableno=@tableno  and serialtype='2')   order by r203.serialno,r203.sequenceno open curs_col
		        			fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
					set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

					if(@@fetch_status<>0)--处理没有列的行序列
--------------------------------------------------------------------------------------------------------------
					begin
						if @othermainobject<>"" 
							set @coldealFieldname=" distinct "+@coldealFieldname
	
						if(@rowSequencetype='1' or @rowSequencetype='2')
						if (@coldealstyle='6')
							begin
								set @strsql=" declare @startdata int  declare @enddata int "
								set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
								set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
								set @strsql=@strsql+" update "+@tableName+" set C1=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							end

						else if (@coldealstyle='5')

							set @strsql=" update "+@tableName+" set C1=(select isnull((max("+@RowdealFieldname+") +min("+@RowdealFieldname+"))/2,0) from "+@jstable+"  where "+rtrim(@RowSQl)+") where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='4')
								set @strsql="update "+@tableName+" set C1=(select isnull(avg("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else if(@rowdealstyle='3')
								set @strsql="update "+@tableName+" set C1=(select isnull(min("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))

							else if(@rowdealstyle='2')
								set @strsql="update "+@tableName+" set C1=(select isnull(max("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid=" +cast(@row as varchar(3))
							else if(@rowdealstyle='1')
								set @strsql="update "+@tableName+" set C1=(select isnull(sum("+@RowdealFieldname+"),0) from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1' and  rowid="+ cast(@row as varchar(3))
							else 
								begin
								if(@rowstatObject="")
									set @rowstatObject="za0100"
								
								set @strsql="update "+@tableName+" set C1=(select count( distinct "+@rowstatObject+") from "+@jstable+"  where "+@RowSQl+") where zb0110='"+@zb0110+"' and zc9993='1'  and   rowid=" +cast(@row as varchar(3))
								end

							exec(@strsql)
					end
					else--处理有行列的序列
						begin


							while(@@fetch_status=0)
							begin
								
	-------------------------------------------------------------------------------处理行列条件的单元数据
								if @colSequencetype<>'4'
								begin
									if(@colSequencetype='1' or  @colSequencetype='2' )
										if(@coldealstyle='0' and @rowdealstyle<>'0')
										begin
											set @coldealstyle=@rowdealstyle
											set @coldealFieldname=@rowdealFieldname
										end
										if(@colSequencetype='2') set @colSQl=' 1=1 '
										if (@coldealstyle='6')
											begin
												set @strsql=" declare @startdata int  declare @enddata int "
												set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
												set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+") and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
												set @strsql=@strsql+" update "+@tableName+" set C"+cast(@col as varchar(3))+"=isnull((@startdata+@enddata)/2,0)  where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
											end
										else if (@coldealstyle='5')
											set @strsql=" update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull((max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2,0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where  zb0110='"+@zb0110+"' and zc9993='1'  and  rowid="+ cast(@row as varchar(3))
										else if(@coldealstyle='4')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(avg("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='3')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(min("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='2')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(max("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else if(@coldealstyle='1')
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select isnull(sum("+@coldealFieldname+"),0) from "+@jstable+"  where ("+@colSQl+") and ("+@RowSQl+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
										else 
											begin
											if(@colstatObject='' )
												if(@rowstatObject<>'')
													set @colstatObject=@rowstatObject
												else
													set @colstatObject="za0100"
											
											set @strsql="update "+@tableName+" set C"+cast(@col as varchar(3))+"=(select count( distinct "+@colstatObject+") from "+@jstable+"  where ("+rtrim(@colSQl)+") and  ("+rtrim(@RowSQl)+")) where zb0110='"+@zb0110+"' and zc9993='1'and  rowid=" +cast(@row as varchar(3))
											end

									--else goto abandon1
	 								exec(@strsql)
									if @@error<>0
										begin
										goto abandon1
										end
								end

	---------------------------------------------------------------------------------
								fetch next from  curs_col into @ColSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname,@otherMainobject
								set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
								set @col=@col+1
							end

						end
						
					close Curs_col
					deallocate Curs_col
	

----------------------------------------------------------------------------------------------------------------
				end
				end
				set @row=@row+1
				fetch next from  curs_row into @RowSQl,@rowdealstyle,@rowstatObject,@rowSequencetype,@RowdealFieldname
				set @RowSQl=replace(@RowSQl,upper(@strMainObject+".ZA0100"),'ZA0100')
			end
			close Curs_row
			deallocate Curs_row

		        	fetch next from  curs_gwmc into @length
		end
	close Curs_gwmc
	deallocate Curs_gwmc
	dealunit:
	--处理单元条件，即补充资料的数据
	--set @strsql=" delete from r230  where   zb0110='"+@zb0110+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	--exec(@strsql)
	--处理单元数据
	set @strsql="update r230  set  zc9993='0' where zb0110='"+@zb0110+"'   and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	set    @strsql="delete from r230  where   zb0110='"+@zb0110+"' and  starttime='"+@endTime+"'  and typeno="+ cast(@typeno as varchar(10))+" and settableno="+cast(@settableno as varchar(10))+" and tableno="+cast(@tableno as varchar(10))
	exec(@strsql)
	if @@error<>0
	    goto abandon1

	----------------------------------------------------------------------------
	declare curs_unit cursor for select  startrow,startcol, rtrim(isnull(statSQL,'1=2')),isnull(dealstyle,'0'),isnull(statObject,'za0100'),isnull(sequenceType,'1'),dealfieldname from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno left join  r203 on  r201.typeno=r203.typeno and r201.settableno=r203.settableno and r201.tableno=r203.tableno  and r201.serialno=r203.serialno where r203.typeno=@typeno and r203.settableno=@settableno and r203.tableno=@tableno  and r202.serialtype='3'   order by r203.serialno,r203.sequenceno open curs_unit
	fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
	set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

	if @colstatObject=""
		set @colstatObject='za0100'
	while(@@fetch_status=0)
--------------------------------------------------------------------------------------------------------------
	begin
	
		if(@colSequencetype='1' or @colSequencetype='2')
		--6-1程序处理均有错误
		if (@coldealstyle='6')
			begin
				set @strsql=" declare @startdata int  declare @enddata int "
				set @strsql=@strsql+" set  @startdata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @starttime+"' and zb9992>='"+@starttime+"') " 
				set @strsql=@strsql+" set  @enddata=(select count(*) from "+@jstable+"  where "+rtrim(@RowSQl)+" and zb9991<='" + @endtime+"' and zb9992>='"+@endtime+"') " 
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",(@startdata+@enddata)/2)"
			end

		else if (@coldealstyle='5')
			--enddata表示一个变量，即计算出来的结果
			begin
				set @strsql=+" set  @enddata=(select (max("+@coldealFieldname+") +min("+@coldealFieldname+"))/2 from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

			end
		else if(@rowdealstyle='4')--平均人数暂不做
			begin
				set @strsql=+" set  @enddata=(select avg("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end

		else if(@rowdealstyle='3')
			begin
				set @strsql=+" set  @enddata=(select min("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"

				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='2')
			begin
				set @strsql=+" set  @enddata=(select max("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else if(@rowdealstyle='1')
			begin
				set @strsql=+" declare  @enddata int   set  @enddata=(select sum("+@coldealFieldname+")  from "+@jstable+"  where "+rtrim(@colSQl)
				--set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"',"+@row+","+@col+",@enddata)"
				set @strsql=@strsql+"  insert into r230 (typeno,setableno,tableno,zb0110,starttime,row,col,svalue) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
		else 
			begin
				set @strsql=" declare  @enddata int  set  @enddata=(select  count( distinct "+@colstatObject+") from "+@jstable+"  where "+rtrim(@colSQl)+")"
				set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) values ("+cast(@typeno as varchar(10))+","+cast(@settableno as varchar(10))+","+cast(@tableno as varchar(10))+",'"+@zb0110+"','"+@endtime+"',"+cast(@row as varchar(10))+","+cast(@col as varchar(10))+",@enddata )"
				--set @strsql=@strsql+"  insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,value) values ("+@typeno+","+@settableno+","+@tableno+",'"+@zb0110+"','"+@endtime+"',"+@row+","+@col+",@enddata)"
			end
			exec(@strsql)
			fetch next from  curs_unit into @row,@col,@colSQl,@coldealstyle,@colstatObject,@colSequencetype,@coldealFieldname
			set @ColSQl=replace(@ColSQl,upper(@strMainObject+".ZA0100"),'ZA0100')

			if @colstatObject=""
				set @colstatObject='za0100'
		end
	close curs_unit
	deallocate curs_unit
	----------------------------------------------------------------------------
	abandon:
        --处理当前日期030


	declare @pkey varchar(20)
	select @pkey=right('000'+cast(max(cast(za0100 as int))+1 as varchar),3) from eb01
	if @pkey is null
		set @pkey='100'
	delete from  eb01 where eb0111 ='030' and za0101=@userid

	--delete from  eb01 where eb0111 in ('030','028','029') and za0101=@userid
	set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+"',200,'"+@userid+"','030','"+convert(varchar(10),getdate(),21)+"')"
	exec(@strsql)
	--set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+'1'+"',300,'"+@userid+"','028','"+@starttime+"')"
	--exec(@strsql)
	--set @strsql="insert into eb01 (za0100,eb01id,za0101,eb0111,zb0102) values ('"+ @pkey+'2'+"',300,'"+@userid+"','029','"+@endTime+"')"
	--exec(@strsql)

	--@endTime
	--@starttime
	--update eb01 set zb0102=convert(varchar(10),getdate(),21) where eb0111='030'

	--变量处理
	--@Userid

	--set @strsql="insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) select typeno,settbl,tablno,'"+@ZB0110+"','"+@endtime+ "',startr,startc,case when eb0111='028' then  '"+@starttime+"' when eb0111='029'  then '"+@endtime+"' else zb0102  end from eb01 left join eg01 on eb01.eb0111=eg01.za0100 and eb01.za0101=eg01.userid where eg01.settbl="+cast(@settableNo as varchar(10))+" and typeno="+cast(@typeno as varchar(10))+" and tablno="+cast(@tableno as varchar(10))+" and userid='"+@userid +"' "
	set @strsql="insert into r230 (typeno,settableno,tableno,zb0110,starttime,row,col,svalue) select typeno,settbl,tablno,'"+@ZB0110+"','"+@endtime+ "',startr,startc,case when eb0111='028' then  '"+@starttime+"' when eb0111='029'  then '"+@endtime+"' else zb0102  end from eb01 left join eg01 on eb01.eb0111=eg01.za0100  where eg01.settbl="+cast(@settableNo as varchar(10))+" and typeno="+cast(@typeno as varchar(10))+" and tablno="+cast(@tableno as varchar(10))+" and eb01.za0101='"+@userid +"' "
	exec(@strsql)
	--delete from  eb01 where eb0111 in ('030','028','029') and za0101=@userid
	set @strsql="	drop table "+@jstable
	exec(@strsql)
--	commit tran
	abandon1:
set @outsql=@strsql






GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

