SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO


--select * from gs_formula
ALTER                                         PROCEDURE flxp_info_formula 
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

if not  (charindex('#税前',@formulaSQL,1)>0  or charindex('#扣税',@formulaSQL,1)>0  or charindex('#扣零',@formulaSQL,1)>0  or charindex('#税后',@formulaSQL,1)>0  or charindex('#取描述',@formulaSQL,1)>0  or charindex('#上层',@formulaSQL,1)>0  or charindex('#下层',@formulaSQL,1)>0  or  charindex('#次数',@formulaSQL,1)>0  or charindex('#取值',@formulaSQL,1)>0 or charindex('#计算',@formulaSQL,1)>0 or charindex('#汇总',@formulaSQL,1)>0 or charindex('#简拼',@formulaSQL,1)>0 )
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


	set @strSQL="declare curs_gwmc cursor for select isnull(za0101,''),isnull(ed0110,'') from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'    and za0101<>'同期数字截止时间'  and  za0101<>'同期数字开始时间'   open curs_gwmc"

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
    else if(@style='2')
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
	begin
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,sum(isnull("+@FirstItemIdWord+",0)) as "+right(@FirstItemIdWord,6)+"  from "+left(@FirstItemIdWord,4)+" where "+@subCondition+"  group by za0100) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition
		else

		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,sum(isnull("+@FirstItemIdWord+",0)) as "+right(@FirstItemIdWord,6)+"  from "+left(@FirstItemIdWord,4)+" where "+@subCondition+"  group by za0100) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition+" and "+@Condition
	--update AA59 set ae5831 =kk.AE6117  from ( select za0100,sum(isnull(AA59.AE6117,0)) as AE6117    from AA59 where  za0100+cast(AA59id as varchar(10))+ZC9995 in (select za0100+cast(max(AA59id ) as varchar(10))+ZC9995 from AA59 WHERE ZC9995<>'*' group by za0100,ZC9995) group by za0100) as kk  where kk.za0100=AA59.za0100  and AA59.ZD0005 = '2003-8-1' and AA59.ZD0013 = '2' and AA59.ZD0014 = '1'  and AA59.ZD0008 = '0'  and 1=1 and 1=1

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
    else     if(@style='2')
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
   else
	begin
		if (@Condition=' 1=1 ')
		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,sum(isnull("+@FirstItemIdWord+",0)) as "+right(@FirstItemIdWord,6)+"  from "+left(@FirstItemIdWord,4)+" where "+@subCondition+"  group by za0100) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition
		else

		 	 set @strsql='update ' +@infoid+" set "+@infofield+" =kk."+right(@FirstItemIdWord,6)+"  from ( select za0100,sum(isnull("+@FirstItemIdWord+",0)) as "+right(@FirstItemIdWord,6)+"  from "+left(@FirstItemIdWord,4)+" where "+@subCondition+"  group by za0100) as kk  where kk.za0100="+@infoid+".za0100  and "+@infoid+".zc9993='1' and "+@rycondition+" and "+@Condition
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
	    select  @Flength=length ,@fdecimal=decimal from gs_property where infoid=@infoid and infofield=@infofield 
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
	 
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---取出字段
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT---取出校验值，在本函数中，@tablename为校准值
  set @tablename=cast(cast(@tablename as int)-1000 as varchar)
	set @formulaFieldname=@FirstItemIdWord
	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000+"+@tablename+" then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1500+"+@tablename+" then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1000)*0.05 as varchar)  when "+@formulaFieldname+"<=3000+"+@tablename+" then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-1500+"+@tablename+")*0.1-25 as varchar)  when "+@formulaFieldname+"<=5000+"+@tablename+" then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-3000+"+@tablename+")*0.15-175 as varchar)  when "+@formulaFieldname+"<=20000+"+@tablename+" then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-5000+"+@tablename+")*0.2-475 as varchar)  when "+@formulaFieldname+"<=40000+"+@tablename+" then cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000+"+@tablename+")*0.25-3475 as varchar) 	else cast(cast("+@formulaFieldname+" as numeric(20,2))-(cast("+@formulaFieldname+" as numeric(20,2))-20000+"+@tablename+")*0.3-8475 as varchar)  end "
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
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---取出字段
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT---取出校验值，在本函数中，@tablename为校准值
	set @formulaFieldname=@FirstItemIdWord
  set @tablename=cast(cast(@tablename as int)-1000 as varchar)

	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000+"+@tablename+" then "+@formulaFieldname 	+" when "+@formulaFieldname+"<=1475+"+@tablename+" then ("+@formulaFieldname+"-(1000+"+@tablename+"))/0.95+1000+"+@tablename+"  when "+@formulaFieldname+"<=2825+"+@tablename+" then ("+@formulaFieldname+"-(1475+"+@tablename+"))/0.9+1500+"+@tablename+"   when "+@formulaFieldname+"<=4525+"+@tablename+" then ("+@formulaFieldname+"-(2825+"+@tablename+"))/0.85+3000+"+@tablename+"  when "+@formulaFieldname+"<=16525+"+@tablename+" then ("+@formulaFieldname+"-(4525+"+@tablename+"))/0.8+5000  when "+@formulaFieldname+"<=31525+"+@tablename+" then ("+@formulaFieldname+"-(16525+"+@tablename+"))/0.75+20000+"+@tablename+" 	else ("+@formulaFieldname+"-(31525+"+@tablename+"))/0.7+40000+"+@tablename+"  end "
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
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @FirstItemIdWord OUTPUT---取出字段
	EXECUTE @Length = flxp_PopFirstWord @formulaFieldname OUTPUT, @tablename OUTPUT---取出校验值，在本函数中，@tablename为校准值
	set @formulaFieldname=@FirstItemIdWord
  set @tablename=cast(cast(@tablename as int)-1000 as varchar)

	set @strwhereSQL=" case when "+@formulaFieldname+"<=1000+"+@tablename+" then 0 when "+@formulaFieldname+"<=1500+"+@tablename+" then (cast("+@formulaFieldname+" as numeric(20,2))-(1000+"+@tablename+"))*0.05   when "+@formulaFieldname+"<=3000+"+@tablename+" then (cast("+@formulaFieldname+" as numeric(20,2))-(1500+"+@tablename+"))*0.1+25   when "+@formulaFieldname+"<=5000+"+@tablename+" then (cast("+@formulaFieldname+" as numeric(20,2))-(3000+"+@tablename+"))*0.15+175   when "+@formulaFieldname+"<=20000+"+@tablename+" then (cast("+@formulaFieldname+" as numeric(20,2))-(5000+"+@tablename+"))*0.2+475   when "+@formulaFieldname+"<=40000+"+@tablename+" then (cast("+@formulaFieldname+" as numeric(20,2))-(20000+"+@tablename+"))*0.25+3475 	else (cast("+@formulaFieldname+" as numeric(20,2))-(20000+"+@tablename+"))*0.3+8475   end "

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

