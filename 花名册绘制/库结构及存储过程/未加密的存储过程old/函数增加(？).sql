if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_create_condition]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_create_condition]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_info_formula]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_info_formula]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_SQLcondition]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_SQLcondition]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_rptdealQuery]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_rptdealQuery]
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[flxp_rpt_stat]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
drop procedure [dbo].[flxp_rpt_stat]
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







--处理SQL语句的常量、表达式、函数、组成SQL语句
CREATE    PROCEDURE  flxp_create_condition
@strMainObject varchar(4),
--@strTBL varchar(100),
--@strFLD varchar(500),
--@strCON varchar(500),
--@strEXP varchar(500),
--@strFUN varchar(500),
@strSQL varchar(8000),
@stroutSQL varchar(8000) out
 
  AS
	
	SET QUOTED_IDENTIFIER OFF  
	declare @tempSQL varchar(5000)
        declare @declareSQL varchar(1000)
	declare @createSQL varchar(1000)
	declare @SQL varchar(2000)
	declare @za0101 varchar(50)
	declare @value varchar(500)
	--处理字符串长度的变量
	declare @length int
	declare @ItemIdList varchar(5000)
	declare @FirstItemIdWord varchar(1000)
	declare @strTBL varchar(100)

	set @ItemIdList=@strSQL
	set @strTBL=''

---------------------------------------------------

			SELECT @Length = DATALENGTH(@strSQL)
		
			    WHILE @Length > 0
			    BEGIN
				--从表名字串中取出表名
			   	 EXECUTE @Length = Zwd_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT,'['
				if(substring(@FirstItemIdWord,5,1)='.')
				begin
				if @strTBL=''
					set @strTBL=left(@FirstItemIdWord,4)
				else 
					set @strTBL=@strTBL+','+left(@FirstItemIdWord,4)

				end
			     end

-----------------------------------------------------


	EXECUTE flxp_info_combTable @strTBL, @strMainObject,null,@tempSQL output
	set @strTBL=@tempSQL
	set @tempSQL=@strSQL
	set @ItemIdList=''
	--处理常量
		set @strsql="declare curs_gwmc cursor for select za0101,ec0111 from ec01  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'$'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	--处理函数
	declare @ed0114 varchar(100)

		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where ed0111 in ('0','1')  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间' or @za0101='数字截止时间')
					set @tempSQL=replace(@tempSQL,'#'+@za0101,'getdate()')

				else if(@za0101='同期数字开始时间' or @za0101='同期数字截止时间')
					set @tempSQL=replace(@tempSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,getdate()),120))
				else
					set @tempSQL=replace(@tempSQL,'#'+@za0101,@value)
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	--处理表达式的前五种

	set @declareSQL=''
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @declareSQL=@declareSQL +' '+@value
				--将SQL语中的^加变量替换成@加变量
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'('+@value+')')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc



			set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where   ee0115='6'  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'['+@za0101+']')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
        set  @stroutSQL="select "+@strMainObject+".za0100 from "+@strTBL+" where "+@tempSQL
	set @stroutsql=replace(@stroutsql,'[','')
	set @stroutsql=replace(@stroutsql,']','')

	SET QUOTED_IDENTIFIER on
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

--select * from gs_formula
CREATE                                          PROCEDURE flxp_info_formula 
 @Mainobject varchar(4) ,--主对象
 @infoid varchar(4),--表
 @infofield varchar(6),--字段 
 @formulaSQL varchar(1000),--公式
 @formulaFieldname varchar(500),--字段列表,if 次数，表名
 @Condition varchar(1000),--使用范围
 @subCondition varchar(1000),--子条件
 @Fieldtype varchar(1),--类型
 @isHistory varchar(1),--历史
 @rycondition varchar(2000)
 
AS
--计算方式是分类处理
--1.无参数，2一个参数，3两个参数4，历史记录，5特殊处理 
--1,2,3
declare @strwhereSQL varchar(1000)
declare @za0101 varchar(1000)
declare @value varchar(500)
declare @ed0114 varchar(100)
declare @strsql varchar(2000)
declare @FirstItemIdWord varchar(100)
declare @style varchar(10)--1正数，2倒数
declare @num varchar(10)--个数
declare @length int
declare @tablename varchar(1000)
declare @strtempSQL varchar(1000)
declare @ItemIdList varchar(2000)
declare @datatype varchar(10)
declare @intNum int

--declare  @Mainobject varchar(4)--主对象
--declare   @infoid varchar(4)--表
--declare   @infofield varchar(6)--字段
--declare   @formulaSQL varchar(1000)--公式
--declare   @formulaFieldname varchar(100)--字段列表,if 次数，表名
--declare   @Condition varchar(1000)--使用范围
--declare   @subCondition varchar(1000)--子条件
--declare   @Fieldtype varchar(1)--类型
--declare   @isHistory varchar(1)--历史
--set @Mainobject='AA01'
--set @infoid='AA01'
--set @infofield='wl1'
--set @formulaSQL='#进元(int,[aa01.aa01id])'
--set @formulaFieldname='aa01.aa01id'
--set @Fieldtype='3'
--set @ishistory='1'
--set @Condition=''
--set @subCondition=''
SET QUOTED_IDENTIFIER OFF 
if(isnull(@rycondition,'')='')
	begin
	set @rycondition="1=1"
	end
else
    if upper(left(ltrim(@rycondition),6))='SELECT'
	begin
	set @rycondition=@infoid+".za0100 in ("+@rycondition+")"
	end
    else
	begin
	set @rycondition=@infoid+".za0100 in (select za0100 from "+ @Mainobject+" where "+@rycondition+")"
	end
if(isnull(@Condition,'')='')
	begin
		if charindex('汇总',@formulaSQL,1)<=0
			begin
				set @Condition="1=1"
			end
	end
else
	begin
		if charindex('汇总',@formulaSQL,1)<=0
		begin
			set @Condition=@infoid+".za0100 in ("+@Condition+") "
		end
		--	set @Condition="za0100 in ("+@Condition+") "
	end

if(isnull(@subCondition,'')='')
	begin
	set @subCondition='1=1'
	end
--else
--	set @subCondition=@infoid+"."+@Condition

set @strwhereSQL=@formulaSQL

if not  (charindex('税前',@formulaSQL,1)>0  or charindex('扣税',@formulaSQL,1)>0  or charindex('扣零',@formulaSQL,1)>0  or charindex('税后',@formulaSQL,1)>0  or charindex('取描述',@formulaSQL,1)>0  or charindex('上层',@formulaSQL,1)>0  or charindex('下层',@formulaSQL,1)>0  or  charindex('次数',@formulaSQL,1)>0  or charindex('取值',@formulaSQL,1)>0 or charindex('计算',@formulaSQL,1)>0 or charindex('汇总',@formulaSQL,1)>0 or charindex('简拼',@formulaSQL,1)>0 )
begin
if charindex('#分情况',@formulaSQL,1)>0
	begin
		set @strwhereSQL=replace(@strwhereSQL,"#分情况","case")
		set @strwhereSQL=replace(@strwhereSQL,"如果","when")
		set @strwhereSQL=replace(@strwhereSQL,"那么","then")
		set @strwhereSQL=replace(@strwhereSQL,"否则","else")
		set @strwhereSQL=replace(@strwhereSQL,"结束","end")
	select @datatype=datatype from gs_property where infoid=@infoid and infofield=@infofield
	set @intNum=0
	select @intnum=count(*) from ed01 where charindex(za0101,@formulaSQL)>0
	if @datatype='2'  and @intNum>=1
		begin
			set @ItemIdList=@formulaFieldname
			SELECT @Length = DATALENGTH(@formulaFieldname)
			    WHILE @Length > 0
			    BEGIN
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,"isnull("+@FirstItemIdWord+",0)")
		    end 
		end

		set @strwhereSQL=replace(@strwhereSQL,"[",'')
		set @strwhereSQL=replace(@strwhereSQL,"]",'')
	end
else 
begin
if(isnull(@rycondition,'')='1=1')
	begin
	set @rycondition=@Mainobject+".zc9993='1' "
	end

if(isnull(@Condition,'')='1=1')
	set @Condition=@Mainobject+".zc9993='1' "


	set @strSQL="declare curs_gwmc cursor for select isnull(za0101,''),isnull(ed0110,'') from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'    and za0101<>'同期数字截止时间'  and  za0101<>同期'数字开始时间'   open curs_gwmc"

	exec(@strsql)
		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin
			set @strwhereSQL=replace(@strwhereSQL,"#"+@za0101,@value)
			fetch next from  curs_gwmc into @za0101,@value

		end
	close Curs_gwmc
	deallocate Curs_gwmc
	set @strwhereSQL=replace(@strwhereSQL,"[",'')
	set @strwhereSQL=replace(@strwhereSQL,"]",'')
	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output

		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
	 EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
	if charindex(@infoid,@tablename,1)<=0
		 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
       if(@tablename = '' or @tablename = null)
		set @tablename = @Mainobject
	set @strsql=''
	--if (@tablename<>@infoid)
	--	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@Condition+" and "+@infoid+".zc9993='1' and "+@rycondition

	--else

	if(@strwhereSQL='')
		set @strwhereSQL="null"
	set @intNum=0
	select @intnum=count(*) from ed01 where charindex(za0101,@formulaSQL)>0
	select @datatype=datatype from gs_property where infoid=@infoid and infofield=@infofield

------  
        if @datatype='4'
		begin
		if(len(ltrim(@strwhereSQL))=9 and substring(ltrim(@strwhereSQL),6,1)='-' and substring(ltrim(@strwhereSQL),2,4)>='1900' and substring(ltrim(@strwhereSQL),2,4)<='2600' and substring(ltrim(@strwhereSQL),7,2)>='01' and substring(ltrim(@strwhereSQL),7,2)<='12')
			begin
			set @strwhereSQL="'"+replace(@strwhereSQL,"'","")+"-28'"
			end
		else
			begin
			set @strwhereSQL='null'
			end
		end
        else if @datatype='3'
		begin
		if(len(@strwhereSQL)=4  and substring(ltrim(@strwhereSQL),2,4)>='1900' and substring(ltrim(@strwhereSQL),2,4)<='2600')
			begin
			set @strwhereSQL="'"+replace(@strwhereSQL,"'","")+"-12-31'"
			end
		else
			begin
			set @strwhereSQL='null'
			end
		end
	else if @datatype='2'  and @intNum<=0
		begin
			set @ItemIdList=@formulaFieldname
			SELECT @Length = DATALENGTH(@formulaFieldname)
			    WHILE @Length > 0
			    BEGIN
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,"isnull("+@FirstItemIdWord+",0)")
		    end 
		end

	else if (@datatype='0' or @datatype='1' or @datatype='6' or @datatype='10' or @datatype='12' or @datatype='13') and @intNum<=0
		begin
		--declare @ItemIdList varchar(2000)
		set @ItemIdList=@formulaFieldname
		SELECT @Length = DATALENGTH(@formulaFieldname)
		    WHILE @Length > 0
		    BEGIN
			--从表名字串中取出表名
	
		   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
			set @strwhereSQL=replace(@strwhereSQL,@FirstItemIdWord,'isnull('+@FirstItemIdWord+",'')")
		    end 

		end
end
---------

	if(@isHistory='1')
		begin
		if isnull(ltrim(@tablename),'')=''
			begin
				set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+"  where  " +@Condition+" and "+@rycondition--历史
			end
		else
			begin
			if len(@tablename)>=5
				set @tablename =@tablename+" and "+@subCondition
				set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
			end
		end
	else
		if isnull(@tablename,'')=''
			begin
		 		set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+"  where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
			end
		else
			begin
		 		set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
			end

end
else if charindex('次数',@formulaSQL,1)>0
	    set @strsql='update ' +@infoid+" set "+@infofield+" = 次数.次数  from ( select za0100,count(*) as 次数  from "+left(@formulaFieldname,4)+" where "+@Condition+" and  "+@subCondition+" and "+@rycondition+" group by  za0100 ) as  次数  where 次数.za0100="+@infoid+".za0100 "

else if charindex('取值',@formulaSQL,1)>0
begin
   set	@Length=len(@formulaFieldname)
    --@FirstItemIdWord字段，@num：记录数,@style1正数2倒数
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @num OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT

    set @Length=cast(@num as int)
    set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='' "
    exec(@strsql)
if(@isHistory='1')
    if(@style='1')
	begin

		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1 
		end
		if (@Condition=' 1=1 ')

	 		 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and  "+@rycondition
		else
			 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and  "+@Condition+" and  "+@rycondition
	end
    else 
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select zc9995+cast(max("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from  WHERE ZC9995<>'*'"+left(@FirstItemIdWord,4)+" group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and "+@rycondition
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@subCondition+" and "+@Condition +" and "+@rycondition

	end
else

    if(@style='1')
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)

			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
	 		 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where    za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and  "+@rycondition
		else
			 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where    za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@Condition+" and  "+@rycondition
	end
    else 
	begin
		while(@Length>1 )
		begin
			set @strsql="update "+left(@FirstItemIdWord,4)+" set zc9995='*' where   za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select zc9995+cast(max("+left(@FirstItemIdWord,4)+"id) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+"  WHERE ZC9995<>'*' group by za0100,ZC9995) "
			exec(@strsql)
			set @Length=@Length-1
		end
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*' group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,"+@FirstItemIdWord+"  from "+left(@FirstItemIdWord,4)+" where  za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10))+ZC9995 in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10))+ZC9995 from "+left(@FirstItemIdWord,4)+" WHERE ZC9995<>'*'  group by za0100,ZC9995)) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@Condition +" and "+@rycondition


	end
end
else if charindex('上层',@formulaSQL,1)>0
begin
  set	@Length=len(@formulaFieldname)
    --@FirstItemIdWord字段，@tablename：关联表名,@style 1其他表2本表
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT
   -- EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 

   select @tablename=left(isnull(dictid,''),4) from gs_property where infoid=left(@FirstItemIdWord,4) and infofield=right(@FirstItemIdWord,6)
   if @tablename='' 
	goto abandon
   if(@style='1')
   begin
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk.kk  from ( select za0100,(select za9996 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  "
		else
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk.kk  from ( select za0100,(select za9996 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  and "+@Condition
	--update aa01 set zc9995=kk.kk from (select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01) as kk where kk.za0100=aa01.za0100
	--update aa01 set zc9995=ab0110.ab0110 from (select za0100,(select za0101 from ab01 where ab01.za0100=aa01.ab0110 )as ab0110 from aa01 ) as ab0110 where ab0110.za0100=aa01.za0100
		set @strsql=@strsql+"  update  " +@infoid+" set "+@infofield+"=kk.kk from (select za0100,(select za0101 from "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk  from "+left(@FirstItemIdWord,4)+") as kk where kk.za0100="+left(@FirstItemIdWord,4)+".za0100  and "+left(@FirstItemIdWord,4)+".zc9993='1'  "
		exec(@strsql)
		set @strsql=''
   end
else
 begin
	set @strSQL="declare curs_gwmc cursor for select za0100,(select isnull(za9996,'') from  "+@tablename+" where "+@FirstItemIdWord+"="+@tablename+".za0100) as kk from "+left(@FirstItemIdWord,4)+"  open curs_gwmc"

	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)


		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0 )
		begin
		set @strtempSQL=''
		if(@value='') goto abandon10
			set @strSQL="declare curs_gw cursor for select  top 5 isnull(za0101,'') from "+left(@FirstItemIdWord,4)+" where "+right(@FirstItemIdWord,6)+"='"+ @value+"'  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114

				end
			close Curs_gw
			deallocate Curs_gw
			if(@strtempSQL<>'')
			begin
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+left(@strtempSQL,25)+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
				exec(@strsql)
			end
abandon10:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
 end
end
else if charindex('下层',@formulaSQL,1)>0


begin
  set	@Length=len(@formulaFieldname)
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
   -- EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
   select @tablename=left(isnull(dictid,''),4) from gs_property where infoid=left(@FirstItemIdWord,4) and infofield=right(@FirstItemIdWord,6)
   if @tablename='' 
	goto abandon
   if(@style='1')
   begin
	if (@Condition=' 1=1 ')
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"  where  "+left(@FirstItemIdWord,4)+".zc9993='1'    open curs_gwmc"
	else

		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"   where  "+left(@FirstItemIdWord,4)+".zc9993='1'    and  "+@infoid+"."+@Condition +" open curs_gwmc"

	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)
	set @strtempSQL=''		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin


		if (@value='') goto abandon11
			set @strSQL="declare curs_gw cursor for select top 10  isnull(za0101,'') from "+@tablename +" where za9996='"+ @value+"'  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114
				end
			close Curs_gw
			deallocate Curs_gw
			if (@Condition=' 1=1 ')
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
			else
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and  "+@Condition +" and "+@rycondition
			exec(@strsql)
abandon11:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
   end
else
   begin
	if (@Condition=' 1=1 ')
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"  where  "+left(@FirstItemIdWord,4)+".zc9993='1'    open curs_gwmc"
	else
		set @strSQL="declare curs_gwmc cursor for select za0100,isnull("+substring(@FirstItemIdWord,6,6)+",'') from " +substring(@FirstItemIdWord,1,4)+"   where  "+left(@FirstItemIdWord,4)+".zc9993='1'    and  "+@infoid+"."+@Condition +" open curs_gwmc"
	--select za0100,(select za9996 from ab01 where aa01.ab0110=ab01.za0100 ) as kk from aa01
	exec(@strsql)

		fetch next from  curs_gwmc into @za0101,@value
	while(@@fetch_status=0)
		begin
		set @strtempSQL=''
		if(@value='') goto abandon12
			set @strSQL="declare curs_gw cursor for select top 4 isnull(za0101,'') from "+substring(@FirstItemIdWord,1,4)+" where "+substring(@FirstItemIdWord,6,6)+" in (  select   za0100 from "+@tablename +" where za9996='"+ @value+"')  open curs_gw"
			exec(@strsql)
				fetch next from  curs_gw into @ed0114
			while(@@fetch_status=0)
				begin
					if(@strtempSQL='')
						set  @strtempSQL=@ed0114
					else
						set  @strtempSQL=@strtempSQL+","+@ed0114
					fetch next from  curs_gw into @ed0114
				end
			close Curs_gw
			deallocate Curs_gw
			if (@Condition=' 1=1 ')
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and "+@rycondition
			else
				set @strsql='update ' +@infoid+" set "+@infofield+"='"+@strtempSQL+"' where za0100='"+@za0101+"' and zc9993='1' and  "+@Condition+" and "+@rycondition
			exec(@strsql)
abandon12:
			set @strsql=''
			fetch next from  curs_gwmc into @za0101,@value
		end
	close Curs_gwmc
	deallocate Curs_gwmc
   end
end


--简拼
else if charindex('简拼',@formulaSQL,1)>0
--set @objName='aa01'
--set @za9999A='wl2'
--set @za0101A='za0101'
	begin
		set @strsql=''
		execute flxp_updateza9999 @infoid,@infofield,@formulaFieldname
	end
--计算
--@formulaFieldname0:计数1：倒第一条，2：第一条，3：求和，4：最大，5：最小，6：平均，7：中位
else if charindex('计算',@formulaSQL,1)>0
	begin
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
	    if(@style='7')
	          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,(max(isnull("+right(@FirstItemIdWord,6)+",0))+min(isnull("+right(@FirstItemIdWord,6)+",0)))/2 as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"
                 else  if(@style='6')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,avg(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where " +@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='5')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,min(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='4')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,max(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='3')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,sum(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100 ) as kk where "+@Condition+" and "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
                 else  if(@style='2')
                      set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,"+right(@FirstItemIdWord,6)+" as kk from "+left(@FirstItemIdWord,4)+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(min("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100)) as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1' and "+@Condition
	  	 else  if(@style='1')
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,"+right(@FirstItemIdWord,6)+" as kk from "+left(@FirstItemIdWord,4)+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where "+@subCondition+" group by za0100)) as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1' and "+@Condition
		 else
                       set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  za0100,count(isnull("+right(@FirstItemIdWord,6)+",0)) as kk from "+left(@FirstItemIdWord,4)+" where "+@Condition+" and "+@subCondition+" group by za0100 ) as kk where "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100


--" where "+@Condition+" and "+@subCondition+" group by za0100 ) 
--as kk where "+@infoid+".za0100=kk.za0100 and "+@infoid+".zc9993='1'"                  --update aa01 set wl1=kk.kk from (select za0100,max(aa04id) as kk from  aa04  where  aa04id>200 group by za0100 having kk) as kk  where aa01.za0100=kk.za0100
--select za0100,aa04id from aa04 where za0100+cast(aa04id as varchar(10)) in (select za0100+cast(min(aa04id) as varchar(10)) from aa04  group by za0100)
--+" where za0100+cast("+left(@FirstItemIdWord,4)+"id as varchar(10)) in (select za0100+cast(max("+left(@FirstItemIdWord,4)+"id ) as varchar(10)) from "+left(@FirstItemIdWord,4)+" where zc9995<>'*' group by za0100)) as "+left(@FirstItemIdWord,4)+"  where "+left(@FirstItemIdWord,4)+".za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1'"
	end

else if charindex('取描述',@formulaSQL,1)>0
	begin
	   set @strsql="update "+@infoid+" set "+@infofield+"='' where "+@subCondition +" and "+@Condition+" and "+@rycondition
   	   exec(@strsql)
	   select @tablename=isnull(dictid,'') from gs_property where infoid=left(@formulaFieldname,4) and infofield=right(@formulaFieldname,6)
	   if @tablename=''
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select  za0100,"+@formulaFieldname+" as kk  from "+left(@formulaFieldname,4)+") as kk where kk.za0100="+@infoid+".za0100 and "+@infoid+".zc9993='1'  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	   else if len(@tablename)>=4
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select za0100,za0101 as kk from "+left(@tablename,4)+ ") as kk where kk.za0100="+@formulaFieldname+"  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	   else
		begin
			set @strsql="update "+@infoid+" set "+@infofield+"=kk.kk from (select dictvalue as za0100,description as kk from  gs_dictitem where dictid='"+@tablename+"') as kk where kk.za0100="+@formulaFieldname+"  and  "+@subCondition +" and "+@Condition+" and "+@rycondition
		end
	end
else if charindex('汇总',@formulaSQL,1)>0
	begin
	    declare @Flength varchar(4)
	    declare @Fdecimal varchar(2)
	    select @Flength=length ,@fdecimal=decimal from gs_property where infoid=@infoid and infofield=@infofield 
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---赋值字段
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT---关联字段
	    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT --汇总方式2:个数，3：求和，4：最大，5：最小，6：平均，7：中位

	   if(left(@FirstItemIdWord,4)<>left(@tablename,4))
		set @strtempSQL=left(@tablename,4)+' left join '+left(@FirstItemIdWord,4)+' on '+left(@FirstItemIdWord,4)+'.za0100='+left(@tablename,4)+'.za0100 and '+left(@FirstItemIdWord,4)+".zc9993='1' "
	   else
		set @strtempSQL=left(@tablename,4)
	    if @rycondition=@Mainobject+".zc9993='1' " 
		set @rycondition=left(@tablename,2)+"01.zc9993='1'  " 
	    if @Condition=@Mainobject+".zc9993='1' " or @Condition="1=1" or isnull(@condition,'')=''
		set @Condition=left(@tablename,2)+"01.za0100 in (select za0100 from AA01  where AA010D ='1' and  zc9993='1')"
	    else
		set @Condition=left(@tablename,2)+"01.za0100 in ("+@condition+")"

		if right(@tablename,6)='AE0122'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+"  and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1'  and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end
		else if right(@tablename,6)='AE0123'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AE0122"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

		end
		else if right(@tablename,6)='AE0124'
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AE0122"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+" group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4') 
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""

			exec(@strsql)
			SET @tablename=left(@tablename,4)+".AB0110"
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end
		else 
		begin
		  	  if(@style='7')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast((max(isnull("+@FirstItemIdWord+",0))+min(isnull("+@FirstItemIdWord+",0)))/2 as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='6')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(avg(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='5')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(min(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else  if(@style='4')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(max(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else if(@style='3')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",cast(sum(isnull("+@FirstItemIdWord+",0)) as numeric("+@Flength+","+@Fdecimal+")) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
	                 else--if(@style='2')
		          set @strsql='update ' +@infoid+" set "+@infofield+"=kk.kk from ( select  "+@tablename+",count(*) as kk from "+@strtempSQL+" where "+@Condition+" and "+@subCondition+"  group by "+right(@tablename,6)+") as kk where "+@infoid+".za0100=kk."+right(@tablename,6)+" and "+@infoid+".zc9993='1' and "+@rycondition+""
		end

	end
--执行
else if charindex('税后',@formulaSQL,1)>0--税后
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1500 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1000)*0.05 as varchar)  when "+@formulaFieldname+"<=3000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1500)*0.1-25 as varchar)  when "+@formulaFieldname+"<=5000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-3000)*0.15-175 as varchar)  when "+@formulaFieldname+"<=20000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-5000)*0.2-475 as varchar)  when "+@formulaFieldname+"<=40000 then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.25-3475 as varchar) 	else cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.3-8475 as varchar)  end "
	if @isHistory='1'
	begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
        end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
	print @strsql
end

else if charindex('税前',@formulaSQL,1)>0--税前
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1475 then ("+@formulaFieldname+"-1000)/0.95+1000  when "+@formulaFieldname+"<=2825 then ("+@formulaFieldname+"-1475)/0.9+1500   when "+@formulaFieldname+"<=4525 then ("+@formulaFieldname+"-2825)/0.85+3000  when "+@formulaFieldname+"<=16525 then ("+@formulaFieldname+"-4525)/0.8+5000  when "+@formulaFieldname+"<=31525 then ("+@formulaFieldname+"-16525)/0.75+20000 	else ("+@formulaFieldname+"-31525)/0.7+40000  end "
	if @isHistory='1'
	begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
        end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
	print @strsql
end

else if charindex('扣税',@formulaSQL,1)>0--扣税
begin
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000 then 0 when "+@formulaFieldname+"<=1500 then (cast("+@formulaFieldname+" as numeric(20,2))-1000)*0.05   when "+@formulaFieldname+"<=3000 then (cast("+@formulaFieldname+" as numeric(20,2))-1500)*0.1+25   when "+@formulaFieldname+"<=5000 then (cast("+@formulaFieldname+" as numeric(20,2))-3000)*0.15+175   when "+@formulaFieldname+"<=20000 then (cast("+@formulaFieldname+" as numeric(20,2))-5000)*0.2+475   when "+@formulaFieldname+"<=40000 then (cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.25+3475 	else (cast("+@formulaFieldname+" as numeric(20,2))-20000)*0.3+8475   end "

	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
		EXECUTE  flxp_info_combTable @formulaFieldname,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史
end
else --扣零
begin
--style
--四舍五入：1
--取整　　：2
--进元　　：3
--进角　　：4
--取元　　：
--取角　　：7
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---赋值字段
    EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @style OUTPUT 
	if @style='1'--四舍五入
		begin
			set @strwhereSQL="ROUND("+@FirstItemIdWord+",0)"
		end
	else if @style='2'--取整
		begin
			set @strwhereSQL="convert(int,"+@FirstItemIdWord+")"
		end
	else if @style='3'--进元
		begin

			set @strwhereSQL="case when convert(int,"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(int,"+@FirstItemIdWord+")+1 else "+@FirstItemIdWord+" end"
		end
	else if @style='4'--进角
		begin
			set @strwhereSQL="case when  convert(numeric(20,1),"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(numeric(20,1), "+@FirstItemIdWord+")+0.1  else convert(numeric(20,1),"+@FirstItemIdWord+") end"
		end
	else if @style='5'--取元
		begin
			set @strwhereSQL="case when convert(int,"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(int,"+@FirstItemIdWord+") else "+@FirstItemIdWord+" end"
		end
	else if @style='6'--取角
		begin
			set @strwhereSQL="case when  convert(numeric(20,1),"+@FirstItemIdWord+")<"+@FirstItemIdWord+" then convert(numeric(20,1), "+@FirstItemIdWord+")  else convert(numeric(20,1),"+@FirstItemIdWord+")-0.1 end"

		end
	if @isHistory='1'
	 begin
	if charindex(@infoid,@formulaFieldname+","+@Mainobject,1)<=0
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'0', @tablename output
        else
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'1', @tablename output
		if charindex(@infoid,@tablename,1)<=0
		         EXECUTE  flxp_info_combTable @tablename,@infoid,'1', @tablename output
         end
	else
	  begin
		EXECUTE  flxp_info_combTable @FirstItemIdWord,@Mainobject,'0', @tablename output
		if charindex(@infoid,@tablename,1)<=0
			 EXECUTE  flxp_info_combTable @tablename,@infoid,'0', @tablename output
          end
	if(@isHistory=1)
		begin
		if len(@tablename)>=5
			set @tablename =@tablename+" and "+@subCondition
			set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename +" where  " +@Condition+" and "+@rycondition--历史
		end
	else
		 	set @strsql='update ' +@infoid+" set "+@infofield+" = "+@strwhereSQL+" from "+@tablename+" where "+@infoid+".zc9993='1' and "+@Condition+" and "+@rycondition--非历史

end
if(@strsql<>'')
exec(@strsql)
abandon:
SET QUOTED_IDENTIFIER On





SET QUOTED_IDENTIFIER OFF
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO











--处理SQL语句的常量、表达式、函数、组成SQL语句
CREATE        PROCEDURE  flxp_rpt_SQLcondition
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
	--处理字符串长度的变量
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
---------------------处理开始时间和结束时间
	if not @typeno is null
	begin
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
			select @starttime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='28'
			select @endTime=isnull(zb0102,'') from eb01 where za0101=@userid and eb0111='29'
		end
	
	if(isnull(@endTime,'')='')
		begin
			set 	@endTime=@currDate	
			set 	@starttime=@currDate
		end	
	
	end

---------------------



	--处理常量
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
	--处理函数
	declare @ed0114 varchar(100)

	if(@strFUN<>'')
	begin
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101 in ("+@strFUN+") open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				if(@za0101='数字开始时间' or @za0101='数字截止时间')
					begin
						if @typeno is null
							set @tempSQL=replace(@tempSQL,'#'+@za0101,getdate())
						else
						begin
							if @za0101='数字开始时间'
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@starttime)
							else
								set @tempSQL=replace(@tempSQL,'#'+@za0101,@endtime)
		
						end
					end
				else if(@za0101='同期数字开始时间' or @za0101='同期数字截止时间')
						if @typeno is null
							set @tempSQL=replace(@tempSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,getdate()),120))
						else
						begin
							if @za0101='数字开始时间'
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
	--处理表达式的前五种

	set @declareSQL=''
	if(@strEXP<>'')
	begin
		set @strSQL=" declare Curs_gwmc cursor for 	select za0101,ee0114  from ee01  where  za0101 in ("+@strEXP+") and ee0115<>'6'  open curs_gwmc"
		exec(@strsql)

	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				
				set @declareSQL=@declareSQL +' '+@value
				--将SQL语中的^加变量替换成@加变量
				set @tempSQL=replace(@tempSQL,'^'+@za0101,'('+@value+')')
			        	fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
	end
	--构造SQL语句
	--根据表名构造SQL语句
	set	@strsql=''--暂时将该字段从对象表中取关联字段
	set @createsql='from '+@strMainObject+' '
	if(@strTBL<>'')
		begin
		------------------------------------------------------------
			SELECT @Length = DATALENGTH(@strTBL)
			
			    WHILE @Length > 0
			    BEGIN
				--从表名字串中取出表名
			   	 EXECUTE @Length = flxp_PopFirstWord @ItemIdList OUTPUT, @FirstItemIdWord OUTPUT
				if(left(@FirstItemIdWord,2)<>left(@strMainObject,2))
				begin
					select top 1 @strsql=isnull(infofield,'') from gs_property where left(dictid,4)=@FirstItemIdWord and infoid= @strMainObject
					if(@strsql<>'')
						if(right(@FirstItemIdWord,2)='01')
							if @blnrelation='2'
							begin
							set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+@strMainObject+'.'+@strsql+'='+@FirstItemIdWord+'.za0100'
							end
						else
							begin
								if @blnrelation='2'
								begin
								set @createsql=@createsql+' left join '+left(@FirstItemIdWord,2)+'01 on '+@strMainObject+'.'+@strsql+'='+left(@FirstItemIdWord,2)+'01.za0100'
								end
								set @createsql=@createsql+' left join '+@FirstItemIdWord+' on '+left(@FirstItemIdWord,2)+'01.za0100='+@FirstItemIdWord+'.za0100 and '+@FirstItemIdWord+".zc9993='1'"
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
	--根据表达式构造SQL语句
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
	--组合最后的SQL
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

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO





CREATE  PROCEDURE flxp_rpt_rptdealQuery 
    @strwhereSQL varchar(8000) output
 
AS
declare @za0101 varchar(1000)
declare @value varchar(1000)
--declare @ed0114 varchar(100)

		declare @strsql varchar(1000)
SET QUOTED_IDENTIFIER OFF 
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'   and za0101<>'同期数字截止时间'  and  za0101<>同期'数字开始时间'    and ed0111 in ('0','1','2')  open curs_gwmc"
		exec(@strsql)
	        	fetch next from  curs_gwmc into @za0101,@value
		while(@@fetch_status=0)
			begin
				set @strwhereSQL=replace(@strwhereSQL,"#"+@za0101,@value)

				fetch next from  curs_gwmc into @za0101,@value
			end
		close Curs_gwmc
		deallocate Curs_gwmc
		set @strwhereSQL=replace(@strwhereSQL,"[","")
		set @strwhereSQL=replace(@strwhereSQL,"]","")
SET QUOTED_IDENTIFIER On
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
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
declare @tempstarttime varchar(10)
declare @tempendtime varchar(10)
--if(isnull(@endTime,'')='')
--	set @endTime=convert(varchar(20),getdate(),21)
--表示该表已经归档
if (@rpttype='1')--年报
begin
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and left(starttime,4)=left(@endTime,4) and  zc9993='0'
	if (@row>0)
		goto abandon1
end

if (@rpttype='2')--季报
begin
	set @row=0
	set @tempstarttime=right('0'+cast(month(cast(@starttime as datetime)) as varchar(2)),2)+'-'+right('0'+cast(day(cast(@starttime as datetime)) as varchar(2)),2)
	set @tempendtime=right('0'+cast(month(cast(@endtime as datetime)) as varchar(2)),2)+'-'+right('0'+cast(day(cast(@endtime as datetime)) as varchar(2)),2)
	if (@tempstarttime<>'01-01' and @tempendtime<>'03-31') and (@tempstarttime<>'04-01' and @tempendtime<>'06-30') and (@tempstarttime<>'07-01' and @tempendtime<>'09-30')  and (@tempstarttime<>'10-01' and @tempendtime<>'12-31')
		begin
			goto abandon1
		end
	select @row=count(*) from r220 where  typeno=@typeno and settableno=@settableno and tableno=@tableno and zb0110=@ZB0110 and convert(varchar(10),starttime,21)= @endtime and  zc9993='0'
	if (@row>0)
		begin
			goto abandon1
		end
end


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
				else if(@za0101='同期数字截止时间')
						update r203 set statSQL=replace(statSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,cast(@endtime as datetime)),120))   where typeno=@typeno and settableno=@settableno and tableno=@tableno
				else if(@za0101='同期数字开始时间')
						update r203 set statSQL=replace(statSQL,'#'+@za0101,convert(varchar(10),dateadd(year,-1,cast(@starttime as datetime)),120))   where typeno=@typeno and settableno=@settableno and tableno=@tableno

				else



--,convert(varchar(10),dateadd(year,-1,cast(@endtime as datetime)),120))
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

