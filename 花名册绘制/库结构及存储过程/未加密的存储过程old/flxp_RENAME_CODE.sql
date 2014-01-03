alter     PROCEDURE  flxp_RENAME_CODE 
 @MAINOBJECT  varchar(4),--主对象
 @sourceCode varchar(100),--源代码
 @targetCode varchar(100),--目标代码
 @SourcePPtr varchar(100),--原代码父节点
 @targetPPtr varchar(100)--目标代码父节点
with ENCRYPTION 
    AS
--

--delete  from aaoo

--
--declare @MAINOBJECT  varchar(4)--主对象
--declare @sourceCode varchar(100)--源代码
--declare @targetCode varchar(100)--目标代码
--declare @SourcePPtr varchar(100)--原代码父节点
--declare @targetPPtr varchar(100)--目标代码父节点
--set @mainobject='AB01'
--set @sourceCode=''
--set @targetCode=''
--set @sourcePPtr=''
--set @targetpptr=''
declare @strSQL varchar(2000)
--
declare @intCount int
declare @za0100 varchar(50)
declare @infofield varchar(32)
declare @infoid varchar(4)
declare @intC1 int
declare @intC2 int
declare @jstable varchar(100)
set @za0100=@sourceCode
SET QUOTED_IDENTIFIER OFF  
set @strsql="update aaoo set zc9995=null  where zc9995='A'"
exec(@strsql)
	
set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
set @strsql="select za0100  into "+@jstable+" from " +@mainobject+" where za0100 like '"+@sourcecode+"%'"
exec(@strsql)
set @strsql="declare curs_gwmc cursor for select count(*) from gs_property where infofield='za0100' and right(infoid,2)='01' and restriction='9' and infoid='" +@MAINOBJECT+"'   open curs_gwmc"
exec(@strsql)
fetch next from  curs_gwmc into @intcount
close Curs_gwmc
deallocate Curs_gwmc
if (@intCount>0)
	begin
		set @strsql="declare curs_gwmc cursor for select za0100 from " +@jstable+"   open curs_gwmc"
		exec(@strsql)
		fetch next from  curs_gwmc into @za0100
		while(@@fetch_status=0)
			begin
			----------------------------			
				set @strsql="declare curs_gw cursor for select infoid,infofield  from gs_property where left(dictid,4)='"+@mainobject+"'   open curs_gw"
				exec(@strsql)
				fetch next from  curs_gw into @infoid,@infofield
				while(@@fetch_status=0)
					begin
						set @intC1=len(@za0100)
						set @intC2=len(@infofield)-len(@za0100)
						--update aa01 set ab0110=replace(left(ab0110,len('110')),'110','20509')+right(ab0110,len('1100201')-len('110')) where ab0110='1100201'
						set @strsql="update "+@infoid+" set "+@infofield+"= replace(left("+@infofield+","+cast(len(@sourceCode) as varchar(10))+"),'"+@sourceCode+"','"+@targetCode+"')+right("+@infofield+",len('"+@za0100+"')-len('"+@sourceCode+"')) where "+@infofield+"='"+@za0100+"'"
						exec(@strsql)
						if @infofield='AB0110'
						begin
							set @strsql="delete from aaoo where zc9995='A' "
							exec(@strsql)
						end
						else
						begin
							set @strsql="update  aaoo set zc9995='B' "
							exec(@strsql)
						end

						fetch next from  curs_gw into @infoid,@infofield
					end
				close Curs_gw
				deallocate Curs_gw
				set @strsql="update  aaoo set zc9995=null "
				exec(@strsql)

			----------------------------
				if(@targetPPtr='NULL')
					begin
					if(@za0100=@sourcecode)
						set @strsql="update "+@mainobject+" set za9996=NULL  where za0100='"+@za0100+"'"
					else
						set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@SourceCode) as varchar(10))+"),'"+@SourceCode+"','"+@targetCode+"')+right(za9996,len(za9996)-len('"+@SourceCode+"')) where za0100='"+@za0100+"'"
					end

				if(@SourcePPtr='NULL')
					begin
						set @SourcePPtr=''
						--set @strsql="update "+@mainobject+" set za9996='"+@targetPPtr+"' where za0100='"+@za0100+"'"
						if(@za0100=@sourcecode)
							--set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@SourcePPtr) as varchar(10))+"),'"+@SourcePPtr+"','"+@targetPPtr+"')+right(za9996,len(za9996)-len('"+@SourcePPtr+"')) where za0100='"+@za0100+"'"
							set @strsql="update "+@mainobject+" set za9996= '"+@targetPPtr+"' where za0100='"+@za0100+"'"
						else
							set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@SourceCode) as varchar(10))+"),'"+@SourceCode+"','"+@targetCode+"')+right(za9996,len(za9996)-len('"+@SourceCode+"')) where za0100='"+@za0100+"'"

						set @SourcePPtr='NULL'
					end
				if(@targetPPtr='NULL' and @sourcepptr='NULL')
					if(@za0100=@sourcecode)
						set @strsql="update "+@mainobject+" set za9996=null  where za0100='"+@za0100+"'"
					else
						set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@Sourcecode) as varchar(10))+"),'"+@Sourcecode+"','"+@targetcode+"')+right(za9996,len(za9996)-len('"+@Sourcecode+"')) where za0100='"+@za0100+"'"

				if (@SourcePPtr<>'NULL' and @targetPPtr<>'NULL')
					begin
					if(@za0100=@sourcecode)
						set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@SourcePPtr) as varchar(10))+"),'"+@SourcePPtr+"','"+@targetPPtr+"')+right(za9996,len(za9996)-len('"+@SourcePPtr+"')) where za0100='"+@za0100+"'"
					else
						set @strsql="update "+@mainobject+" set za9996= replace(left(za9996,"+cast(len(@Sourcecode) as varchar(10))+"),'"+@Sourcecode+"','"+@targetcode+"')+right(za9996,len(za9996)-len('"+@Sourcecode+"')) where za0100='"+@za0100+"'"
					end
				exec(@strsql)
				
				set @strsql="update "+@mainobject+" set  za0100= replace(left(za0100,"+cast(len(@sourceCode) as varchar(10))+"),'"+@sourceCode+"','"+@targetCode+"')+right(za0100,len(za0100)-len('"+@sourceCode+"')) where za0100='"+@za0100+"'"
				exec(@strsql)
				--if @@error<>0 goto abandon
			----------------------------
				fetch next from  curs_gwmc into @za0100

			end

		close Curs_gwmc
		deallocate Curs_gwmc
		set @strsql="drop table  "+@jstable
		exec(@strsql)

		--set @strsql="update "+@mainobject+" set za9996=replace(substring(za9996,1,"+cast(len(@SourcePPtr) as varchar(50))+"),'"+@SourcePPtr+"','"+@targetPPtr+"')+substring(za9996,"+cast(len(@SourcePPtr)+1 as varchar(10))+",cast(len(za9996)-len("+@SourcePPtr+")+1 as varchar(20))) where za0100='"+@sourceCode+"'"
	--处理机构中单位、部门之间关系不正确的数据
		declare @Ainfoid varchar(4)
		declare @Ainfofield varchar(6)
		declare @AE0122 varchar(50)
		declare @AB0110 varchar(50)
		declare @value varchar(50)
		set @strsql="declare curs_property cursor for select infoid,infofield from gs_property where dictid like 'AB01%' and infofield ='AE0122' open curs_property"
		exec(@strsql)
		fetch next from  curs_property into @Ainfoid,@Ainfofield
			while(@@fetch_status=0)
			begin
				--处理ae0122
				begin
					set @strsql="declare curs_AA01 cursor for select distinct ab0110,ae0122 from "+@ainfoid+" where charindex(ab0110,ae0122,1)<=0 and isnull(ae0122,'')<>'' open curs_AA01"
					exec(@strsql)
					fetch next from  curs_AA01 into @AB0110,@AE0122

					while(@@fetch_status=0)
					begin
	
						set @strsql="declare curs_AB cursor for  select za0100 from ab01 where charindex(za0100,'"+@AE0122+"',1)>=1   and za0100<>'"+@AE0122+"'  and zb0199 in ('UN','UO') and len(za0100) in (select max(len(za0100)) from ab01 where charindex(za0100,'"+@AE0122+"',1)>=1  and za0100<>'"+@AE0122+"' and zb0199 in ('UN','UO') )  open curs_AB"
						exec(@strsql)
						fetch next from  curs_AB into @value
							if (isnull(@value,'')<>'')
							begin
								set @strsql="update  "+@Ainfoid+" set AB0110='"+@value+"' where ae0122='"+@AE0122+"'"
								exec(@strsql)
							end
						
						close curs_AB
						deallocate curs_AB		
						fetch next from  curs_AA01 into @AB0110,@AE0122
					end
					close curs_AA01
					deallocate curs_AA01
					set @strsql="update "+@Ainfoid+" set  ab0110=null,ae0122=null where not (ab0110 in (select za0100 from ab01 where zb0199='UN') and  ae0122 in (select za0100 from ab01 where zb0199='UM'))"
					exec(@strsql)
	
				end		
				fetch next from  curs_property into @Ainfoid,@Ainfofield
			end
		close curs_property
		deallocate curs_property

		set @strsql="update "+@Ainfoid+" set  ab0110=null,ae0122=null where not (ab0110 in (select za0100 from ab01 where zb0199='UN') and  ae0122 in (select za0100 from ab01 where zb0199='UM') )"
		exec(@strsql)


	end
else
	begin
		set @strsql="declare curs_gw cursor for select infoid,infofield from gs_property where left(dictid,4)='"+@mainobject+"'  and state='1'  open curs_gw"
		exec(@strsql)
		fetch next from  curs_gw into @infoid,@infofield
		while(@@fetch_status=0)
			begin
				--set @strsql="update "+@infoid+" set "+@infofield+"= replace("+substring(@infofield,1,len(@za0100))+",'"+@za0100+"','"+@targetCode+"')"+substring(@infofield,len(@za0100)+1,len(@infofield)-len(@za0100)+1)+" where "+@infofield+"='"+@sourceCode+"'"
				set @strsql="update "+@infoid+" set "+@infofield+"= replace("+@infofield+",'"+@sourceCode+"','"+@targetCode+"') where "+@infofield+"='"+@za0100+"'"
				exec(@strsql)
				fetch next from  curs_gw into @infoid,@infofield
			end
		close Curs_gw
		deallocate Curs_gw
		if(@targetPPtr = 'NULL')
		   set @strsql="update "+@mainobject+" set za9996=NULL where za0100='"+@za0100+"'"
		else
			set @strsql="update "+@mainobject+" set za9996='"+@targetPPtr+"' where za0100='"+@za0100+"'"
		exec(@strsql)
		set @strsql="update "+@mainobject+" set za9996='"+@targetCode+"' where za9996='"+@za0100+"'"
		exec(@strsql)
		set @strsql="update "+@mainobject+" set za0100='"+@targetCode+"' where za0100='"+@za0100+"'"
		exec(@strsql)
	end
	set @strsql='update '+@mainobject+" set za9997='1' "
	exec(@STRSQL)
	set @strsql='update '+@mainobject+" set za9997='0'  where not za0100  in (select distinct za9996 from "+@mainobject+" where not za9996 is null)"
	exec(@STRSQL)
SET QUOTED_IDENTIFIER OFF




GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO




