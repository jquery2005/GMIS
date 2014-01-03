SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO

















ALTER              PROCEDURE   flxp_CheckField  
@StrServer1 varchar(20),--本数据库名称
@StrServer2 varchar(20),--导入数据库名称
@strOut varchar(5000) output--输出


AS


declare @strSQl varchar(8000)
declare @strinsert varchar(8000)
declare @strdel varchar(8000)
declare @fieldlen1 int
declare @fieldtype1 varchar(20)
declare @fieldlen2 int
declare @fieldtype2 varchar(20)
--错误信息
declare @Messerror varchar(6000)
declare @fieldname1 varchar(6000)
declare @fieldname2 varchar(6000)


declare @field1 varchar(20)
declare @fielddec1 int
declare @field2 varchar(20)
declare @fielddec2 int
declare @restriction varchar(10)

declare @StrField1 varchar(20)--本数据库表名  
declare @StrField2  varchar(20)--导入数据库表名 

declare @tmpField1 varchar(20)--本数据库表名  临时
declare @tmpField2 varchar(20)--导入数据库表名 临时
--本数据库字段集合
declare @fieldlist1 varchar(1000)
declare @fieldlisterr1 varchar(1000)
--导入数据库字段集合
declare @fieldlist2 varchar(1000)
declare @fieldlisterr2 varchar(1000)
declare @fieldupdate varchar(1000)--替换机构数据

--人员类别
declare @aa010d varchar(2)

--人员编码
declare @a0100 varchar(50)
declare @za0100 varchar(20)
declare @bl varchar(1)
declare @temp varchar(50)
declare @temp1 varchar(50)

declare @iii int
set @iii = 1

--declare @StrServer1 varchar(20)
--declare @StrServer2 varchar(20)
--declare @strOut varchar(500)

--set @StrServer1 = "gmisinfo"
--set @StrServer2 = "gpms2000"
--set @strfield1 = "AA01"
--set @strfield2 = "A001A001"

set @strOut = ''
set @fieldlist1 = ''
set @fieldlisterr1 = ''
set @fieldlist2 = ''
set @fieldlisterr2 = ''
set @messerror = ''
--临时表
declare @jstable varchar(40)
declare @maxid int
set @maxid = 1
set @jstable ="[##"+convert(varchar(40),getdate(),21)+"]"
set @strSql = " create table "+ @jstable  + "(orderid int,strField varchar(50),strtmp varchar(10))"
exec(@strsql)


SET QUOTED_IDENTIFIER OFF  


--导入部门单位数据
declare @za0101 varchar(50)
declare @ZA9996 varchar(20)
declare @ZA9997 varchar(2)
declare @ZA9999 varchar(10)
declare @AB0160 varchar(10)
declare @AB01ID int
------------------------------
set @strSQL ="ALTER TABLE "+ @strserver1 +".dbo.ab01 ADD wljj INT IDENTITY(100,100)"
exec(@strSQL)
------------------------------
--set @iii = 1
--set @strSQL="declare curs_gwmc cursor for select code,cast(description as varchar(50)),case PPtr when 'UN' then null when 'UM' then null else cast(PPtr as varchar(20)) end,cast(CPtr as bit),cast(Spell as varchar(10)),case Dtype when 'C001' then '3' when 'C002' then '2' when 'C003' then '1' else '' end ,(select isnull(max(AB01ID),100) from " + @strserver1 + ".dbo.ab01) from " + @strserver2 + ".dbo.sr_department order by code open curs_gwmc"
--exec(@strsql)
--       	fetch next from  curs_gwmc into @za0100,@za0101,@ZA9996,@ZA9997,@ZA9999,@AB0160,@AB01ID
--while(@@fetch_status=0)
--begin-
--	set @AB01ID = @AB01ID + 100 *@iii
--set @strSQL = " delete "+ @strserver1 +".dbo.ab01 where ZA0100 = '" + @za0100 + "' "
--exec(@strsql)
--if isnull(@ZA9996,'') = ''
--	set @strSQL = " insert into "+ @strserver1 +".dbo.ab01 (ZA0100,ZA0101,ZA9996,ZA9997,ZA9999,AB0160,AB01ID) values ('" + @za0100 + "','" + @za0101 + "',null,cast('" + isnull(@ZA9997,'')+"' as bit),'" + isnull(@ZA9999,'') + "','" + isnull(@AB0160,'') + "'," + cast(@AB01ID as varchar(10)) + ") "
--else
--	set @strSQL = " insert into "+ @strserver1 +".dbo.ab01 (ZA0100,ZA0101,ZA9996,ZA9997,ZA9999,AB0160,AB01ID) values ('" + @za0100 + "','" + @za0101 + "','" + @ZA9996 + "',cast('" + isnull(@ZA9997,'')+"' as bit),'" + isnull(@ZA9999,'') + "','" + isnull(@AB0160,'') + "'," + cast(@AB01ID as varchar(10)) + ") "
--set @iii = @iii+1
--exec(@strsql)
--print @strSQL
--fetch next from  curs_gwmc into @za0100,@za0101,@ZA9996,@ZA9997,@ZA9999,@AB0160,@AB01ID
--end
--close Curs_gwmc
--deallocate Curs_gwmc
set @strSQL = " insert into "+ @strserver1 +".dbo.ab01 (ZA0100,AB01Id,ZA0101,ZA9996,ZA9997,ZA9999,AB0160) select code,'100',cast(description as varchar(50)),case PPtr when 'UN' then null when 'UM' then null else cast(PPtr as varchar(20)) end,cast(CPtr as bit),cast(Spell as varchar(10)),case Dtype when 'C001' then '3' when 'C002' then '2' when 'C003' then '1' else '' end  from " + @strserver2 + ".dbo.sr_department"
exec(@strsql)
set @strSQL="update "+ @strserver1 +".dbo.ab01 set za9996=null where za9996=''"
exec(@strsql)
set @strSQL="update "+ @strserver1 +".dbo.ab01 set ab01id=wljj"
exec(@strsql)
---------------------------------
set @strSQL="alter table "+ @strserver1 +".dbo.ab01 drop column wljj"
exec(@strsql)

---------------------------------
--取本数据库和导入数据库中的表对应
set @strsql = "declare curs_gwmc cursor for select ('A'+left(setId,1)+Right(setId,2)) as InfoId,(setId + typeid) as aa from " + @strserver2+ ".dbo.sr_builtcollect where ('A'+left(setId,1)+Right(setId,2)) in (Select InfoId from " + @strserver1 + ".dbo.gs_structure) order by aa  open curs_gwmc "
exec(@strsql)
fetch next from  curs_gwmc into @strField1,@strField2
while(@@fetch_status=0)
	begin
	set @strdel = ''
	set @strinsert = ''

set @strsql = "declare curs11 cursor for select cast(count(*) as varchar(10)) from " + @strserver2+ ".dbo."+ @strField2 +"   open curs11 "
--print @strsql
exec(@strsql)
fetch next from  curs11 into @temp1
while(@@fetch_status=0)
	begin
				fetch next from  curs11 into @temp1
			end
		close curs11
		deallocate curs11
if isnull(@temp1,'0') <> '0'
begin
		if substring(@StrField2,5,4) = 'A001'
			set @aa010d = '1'
		else if substring(@StrField2,5,4) = 'A002'
			set @aa010d = '2'
		else if substring(@StrField2,5,4) = 'A003'
			set @aa010d = '3'
		else
			set @aa010d = '3'

		set @fieldlist1 = ''
		set @fieldlist2 = ''
		set @fieldupdate = ''

		set @strSql = "declare curs_gwmc1 cursor for select  infofield,fieldname,datatype,length,decimal,fieldtype,fieldlen,fielddec,restriction,a.description,b.description from " + @strserver1 + ".dbo.gs_property  a left join " + @strserver2 + ".dbo.SR_SourceItem b on secondname = fieldname and fieldname in (select fieldname from " + @strserver2 + ".dbo.sr_builtitem   where setid + typeid = '" + @strfield2 + "') where isnull(secondname,'') <> '' and isnull(fieldname,'') <> '' and setid = '"+substring(@strfield2,1,4)+"' and infoid = '" + @strfield1 + "'  open curs_gwmc1 "

		--print @strsql
		exec(@strsql)

		fetch next from  curs_gwmc1 into @field1,@field2,@fieldtype1,@fieldlen1,@fielddec1,@fieldtype2,@fieldlen2,@fielddec2,@restriction,@fieldname1,@fieldname2
		while(@@fetch_status=0)
			begin
			--查找对应字段并且修改本数据库中比较短的字段长度，数据类型不匹配提出错误信息

				if @restriction = '7'
				begin
					set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
					set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
					set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":计算字段~" + @field2 + ":" + @fieldname2 + ":" + @fieldtype2
				end
				else
				begin
					if @fieldtype2 = 'VARCHAR'
					begin
						if @fieldtype1 <> '2' and @fieldtype1 <> '3' and @fieldtype1 <> '4' and @fieldtype1 <> '5' and @fieldtype1 <> '9' and @fieldtype1 <> '11'  and @fieldtype1 <> '15'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " varchar(" + cast(@fieldlen2 as varchar(10)) + ") "
								exec(@strsql)
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10)) + " where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								exec(@strsql)
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":字符"  
						end
					end
					else if @fieldtype2 = 'DATETIME' or  @fieldtype2 = 'DATETIME6'
					begin
						if @fieldtype1 = '3' or @fieldtype1 = '4' or @fieldtype1 = '5'
						begin
							if @fieldtype2 = 'DATETIME'
							begin
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = 8,datatype = '5'  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								exec(@strsql)
							end
							else
							begin
								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = 6,datatype = '4'  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":日期"
						end
					end
					else if @fieldtype2 = 'INT'
					begin
						if @fieldtype1 = '2'
						begin
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":整型"
						end
					end
					else if @fieldtype2 = 'NUMERIC'
					begin
						if @fieldtype1 = '2'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ",0) "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @fielddec1<@fielddec2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ","+ cast(@fielddec2 as varchar(10)) +") "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set decimal = " + cast(@fielddec2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":数值" 
						end
					end
					else if @fieldtype2 = 'TEXT'
					begin
						if @fieldtype1 = '2'
						begin
							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":备注"
						end
			    
					end
					else if @fieldtype2 = 'FLOAT'
					begin
						if @fieldtype1 = '2'
						begin
							if @fieldlen1<@fieldlen2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ",0) "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set length = " + cast(@fieldlen2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end
							if @fielddec1<@fielddec2
							begin
								set @strSql = "alter table " + @StrServer1 + ".dbo." + @StrField1 + " ALTER COLUMN " + @field1 + " NUMBERIC(" + cast(@fieldlen2 as varchar(10)) + ","+ cast(@fielddec2 as varchar(10)) +") "
								exec(@strsql)

								set @strSql = "update " + @StrServer1 + ".dbo.gs_property set decimal = " + cast(@fielddec2 as varchar(10))+"  where infoid = '" + @StrField1 + "' and  infofield = '" + @field1 + "' "
								--print @strSql
								exec(@strsql)
						
							end

							if @strfield1 = 'AB01'
							begin
								set @fieldupdate = @fieldupdate + "," + @field1 + " = " + @field2
							end
							else
							begin
								set @fieldlist1 = @fieldlist1 + "," + @field1
								set @fieldlist2 = @fieldlist2 + "," + @field2
							end
						end
						else
						begin
							set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
							set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
							--set @messerror = @messerror + "," + @field1 + ":" + @fieldname1 + ":" + dbo.field_typename(@fieldtype1) + "~" + @field2 + ":" + @fieldname2 + ":备注"
						end
			    
					end
					else	
					begin
						set @fieldlisterr1 = @fieldlisterr1 + "," + @field1
						set @fieldlisterr2 = @fieldlisterr2 + "," + @field2
					end
				end

				fetch next from  curs_gwmc1 into @field1,@field2,@fieldtype1,@fieldlen1,@fielddec1,@fieldtype2,@fieldlen2,@fielddec2,@restriction,@fieldname1,@fieldname2
			end
		close curs_gwmc1
		deallocate curs_gwmc1

		if substring(@strField2,1,4) = 'A001'
		begin
			--处理人员信息（主集）
			--替换status2，人员编号唯一

			if @strField2 = 'A001A001'

			begin
				set @strsql = "declare curs cursor for select ('A'+left(setId,1)+Right(setId,2)) as InfoId,setId + typeid from " + @strserver2+ ".dbo.sr_builtcollect where ('A'+left(setId,1)+Right(setId,2)) in (Select InfoId from " + @strserver1 + ".dbo.gs_structure) and setid = 'A001'  open curs "
				exec(@strsql)
			   	fetch next from  curs into @tmpField1,@tmpField2
				while (@@fetch_status=0)
				begin
					--将导入库中人员信息中的status2字段提空
					set @strSql = "update " + @StrServer2 + ".dbo." + @tmpField2 +" set status2 = null "
					exec(@strsql)
					
						set @strSQL="declare curs2 cursor for select  max(isnull(orderid,1)) from " + @jstable + "   open curs2" 
						exec(@strsql)
				 		fetch next from  curs2 into @maxid
						while(@@fetch_status=0)
						begin
							fetch next from  curs2 into @maxid
						end
						close Curs2
						deallocate Curs2
						set @maxid = isnull(@maxid,0) +1
						set @strSQL="select identity(int,"+ cast(@maxid as varchar) +",1) as aa,b0110+'_'+a0100 as bb,'" + @tmpfield2 + "' as cc into ##kk from  " + @StrServer2 + ".dbo." + @tmpField2 
						
						exec(@strsql)
						set @strSQL="insert into "+ @jstable + " select cast(aa as int),bb,cc from ##kk"
						exec(@strsql)
						drop table ##kk

/*
						set @strSQL="declare curs2 cursor for select  a0100 from " + @StrServer2 + ".dbo." + @tmpField2 + "   open curs2" 
						exec(@strsql)
				 		fetch next from  curs2 into @temp1
						while(@@fetch_status=0)
						begin
							set @maxid = isnull(@maxid,0) +1
							set @strsql = " insert into " + @jstable + " values (" + cast(@maxid as varchar(10)) + ",'" + @temp1 + "','" + @tmpfield2 + "') "
							
							exec(@strsql)

							fetch next from  curs2 into @temp1
						end
						close Curs2
						deallocate Curs2
*/

					--替换人员编码
					set @strSql = "update " + @StrServer2 + ".dbo." + @tmpField2 +" set status2 = cast(orderid  as varchar(20)) from " + @jstable  + "  where b0110 + '_' + a0100 = strfield  and strtmp = '" + @tmpField2 + "' "
					exec(@strsql)

					fetch next from  curs into @tmpField1,@tmpField2
				end
				close Curs
				deallocate Curs

				--替换子集中的人员编号在status2
				set @strSQL="declare curs_gwmc2 cursor for select  setid,typeid from "+ @StrServer2 + ".dbo.sr_builtcollect" +" where substring(isnull(typeid,'A'),1,1) = 'A'   open curs_gwmc2" 

				exec(@strsql)
				fetch next from  curs_gwmc2 into @temp,@temp1
				while(@@fetch_status=0)
				begin
					if @temp <> 'A001'
					begin
						set @strsql = " update " + @StrServer2 + ".dbo." + @temp + @temp1 + "  set status2 = b.status2 from " + @StrServer2 + ".dbo.A001" + @temp1 + "  b," + @StrServer2 + ".dbo." + @temp + @temp1 + " a where a.b0110 + '_' + a.a0100 = b.b0110 + '_' + b.a0100 "
						--print @strSQL
						exec(@strsql)
					end

					fetch next from  curs_gwmc2 into @temp,@temp1
				end
				close Curs_gwmc2
				deallocate Curs_gwmc2

			end

			--输出语句
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select status2 from "  + @StrServer2 + ".dbo." + @strField2 + ") "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993,AB0110,AA010D," + @strField1 + "ID" + @fieldlist1 + ") select status2,substring(status,1,1),B0110," + @aa010d + ",ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where status2 is not null "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
		end
		else
		begin
			--处理人员信息（子集）
			if substring(@strField1,1,2) = 'AA'
			begin
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select status2 from "  + @StrServer2 + ".dbo." + @strField2 + " ) "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993," + @strField1 + "ID" + @fieldlist1 + ") select status2,substring(status,1,1),ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where status2 in (select za0100 from " + @StrServer1 + ".dbo.AA01) "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
			end
			else if @strfield1 = 'AB01'
			begin
				if isnull(@fieldupdate,'') <>'' 
				begin
					set @strinsert = " update " + @StrServer1 + ".dbo." + @strField1 +" set " + substring(@fieldupdate,2,len(@fieldupdate)) + " from " + @StrServer2 + ".dbo." + @strField2 + "  where ZA0100 = b0110 "
				end
				else
						set @strinsert = ''
			end
			else
			begin
				if isnull(@fieldlist1,'') <>'' and isnull(@fieldlist2,'')<>''
				begin
					set @strdel = " delete  " + @StrServer1 + ".dbo." + @strField1 +" where ZA0100 in (select b0110 from "  + @StrServer2 + ".dbo." + @strField2  + ") "
					set @strinsert = " insert into  " + @StrServer1 + ".dbo." + @strField1 +"(ZA0100,ZC9993," + @strField1 + "ID" + @fieldlist1 + ") select b0110,substring(status,1,1),ID" + @fieldlist2 + " from "  + @StrServer2 + ".dbo." + @strField2 + " where b0110 in (select za0100 from " + @StrServer1 + ".dbo.AB01) "
				end
				else
				begin
					set @strdel = ''
					set @strinsert = ''
				end
			end
		end

		exec(@strdel)
		exec(@strinsert)
--print @strinsert
end
		fetch next from  curs_gwmc into @strField1,@strField2

	END	

close curs_gwmc
deallocate curs_gwmc

set @strsql = " drop table " + @jstable
exec(@strsql)

DECLARE @retstat varchar(20)
set @retstat = cast(@@ERROR  as varchar(10))
set @strOut= @fieldlisterr1 + ";" + @fieldlisterr2 + ";" + @retstat + ";" + @messerror
















GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

