
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO






--处理SQL语句的常量、表达式、函数、组成SQL语句
alter                 PROCEDURE  flxp_salary_standcompute
@strMainObject varchar(4),
@standid integer,
@strCondition varchar(2000)
 
  AS

	SET QUOTED_IDENTIFIER OFF  
	declare @isusual  bit--简单还是复杂
	declare @strsql varchar(2000)--SQL 语句
	declare @rowTarget varchar(200)--行指标
        declare @colTarget varchar(200)--列指标
	declare @createSQl varchar(2000)--SQL语句
	declare @colvalue varchar(100)--列值
        declare @rowvalue varchar(100)--行值
	declare @resulttarget varchar(100)--结果字段
	declare @rowinfofield varchar(100)--控制对象的字段
	declare @colinfofield varchar(100)--控制对象的字段
	declare @updatevalue varchar(100)--待更新的值
	declare @infoid varchar(10)--控制对象名
	declare @strwhere varchar(2000)--构造更新条件
	declare @rowcount int--行：记录的个数
	declare @colcount int--列：记录的个数
	declare @strcondition1 varchar(2000)--范围过滤
	declare @strcondition2 varchar(2000)--更新过滤
	declare @strFirstcol varchar(2000)--第一列条件
	declare @strsecondcol varchar(2000)--第二列条件
	declare @strFirstrow varchar(2000)--第一行条件
	declare @strsecondrow varchar(2000)--第二行条件
 	declare @j int --计数
	declare @i int --计数
	declare @m int
	declare @secondrowcount int
        declare @dispfield varchar(200)
	declare @jstable varchar(200)
        declare @standbyvarchar varchar(3000)
	set @jstable="[##"+convert(varchar(40),getdate(),21)+"]"
	SET QUOTED_IDENTIFIER OFF  
        --获得简单
        --获得简单

	select @isusual=isusual, @resulttarget =left(target,11), @infoid =infoid,@strwhere=isnull(setsql,''),@standbyvarchar=isnull(standbyvarchar,'') from gs_stand where standid=cast(@standid as varchar(10))
	if @standbyvarchar<>''
		begin
			set @strwhere=@standbyvarchar
		end
	if isnull(@strCondition,'')=''
	   begin
		set  @strCondition1=@strMainObject+".zc9993='1'"
		set  @strCondition2="1=1"
		if @strwhere<>''
			begin
				set @strCondition1=@strMainObject+".za0100 in ("+@strwhere+")"
				set @strCondition2=left(@resulttarget,4)+".za0100 in ("+@strwhere+")"
			end
           end

	ELSE
	   begin
		set @strCondition1=@strMainObject+".za0100 in ("+@strCondition+")"
		set @strCondition2=left(@resulttarget,4)+".za0100 in ("+@strCondition+")"
		if @strwhere<>''
			begin
				set @strCondition1= @strCondition1+" and "+@strMainObject+".za0100 in ("+@strwhere+")"
				set @strCondition2=@strCondition2+" and "+left(@resulttarget,4)+".za0100 in ("+@strwhere+")"
			end

	   end
	set @strwhere=''

--single stand table

	if @isusual=1 
	  begin
	    select @coltarget=infoid+'.'+infofield from gs_standitem where standid=cast(@standid as varchar(10)) and type=0--列
	    select @rowtarget=infoid+'.'+infofield from gs_standitem where standid=cast(@standid as varchar(10)) and type=1--行

            set @strwhere ="select "+@strMainObject+".za0100  from "+@strMainObject 

	    if upper(@coltarget)<>upper(@rowtarget) and not isnull(@coltarget,'')='' and not isnull(@rowtarget,'')=''
	      begin
	        set @createsql="select "+@strMainObject+".za0100,"+@coltarget+","+@rowtarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@coltarget,6)+","+right(@rowtarget,6)
              end
	    else
	      if isnull(@rowtarget,'')='' 
		begin
	        set @createsql="select "+@strMainObject+".za0100,"+@coltarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@coltarget,6)

		end
	      else
		begin
	        set @createsql="select "+@strMainObject+".za0100,"+@rowtarget+" into "+@jstable+" from "+@strMainObject 
		set @dispfield=right(@rowtarget,6)
		end

	    if left(upper(@rowtarget),4)=upper(@strMainObject)
		begin
		    if left(upper(@coltarget),4)<>upper(@strMainObject)
			begin
			set @createsql=@createsql+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
			set @strwhere=@strwhere+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"

			end
		end
	    else
		BEGIN
			if not isnull(@rowtarget,'')='' 
			begin
				set @createsql=@createsql+" left join "+left(upper(@rowtarget),4)+" on "+@strMainObject +".za0100="+left(upper(@rowtarget),4)+".za0100 and "+left(upper(@rowtarget),4)+".zc9993='1'"
				set @strwhere= @strwhere+ " left join "+left(upper(@rowtarget),4)+" on "+@strMainObject +".za0100="+left(upper(@rowtarget),4)+".za0100 and "+left(upper(@rowtarget),4)+".zc9993='1'"
			end
			if left(upper(@coltarget),4)<>upper(@strMainObject) and not isnull(@coltarget,'')=''
			    begin
				set @createsql=@createsql+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
				set @strwhere=@strwhere+" left join "+left(upper(@coltarget),4)+" on "+@strMainObject +".za0100="+left(upper(@coltarget),4)+".za0100 and "+left(upper(@coltarget),4)+".zc9993='1'"
			    end
		end
	    --行列指标不等且不为空
--if(charindex(@createsql,'left join')<=0)
	exec(@createsql+" where "+@strCondition1)
--else
--	exec(@createsql+" and  "+@strCondition1)
--print @strwhere

	    if upper(@coltarget)<>upper(@rowtarget) and not isnull(@coltarget,'')='' and not isnull(@rowtarget,'')=''
		begin
	         -- set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@coltarget+","+@rowtarget+" order by "+@rowtarget+" desc open curs_gwmc "
 		set @createsql="declare curs_gwmc cursor for select "+@dispfield+" from "+@jstable+" group by " +@dispfield+" open curs_gwmc "
                  exec(@createsql)
	          fetch next from  curs_gwmc into @colvalue,@rowvalue
		  while(@@fetch_status=0)
			begin
				set @colinfofield=''
				set @rowinfofield=''
				select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and type=0 and dictvalue=@colvalue
				select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and type=1 and dictvalue=@rowvalue
				if(isnull(@colinfofield,'')<>'' and isnull(@rowvalue,'')<>'' and isnull(@rowinfofield,'')<>'')
				begin
					set @updatevalue=''
					set @createsql="declare curs_g cursor for select "+@colinfofield+" from "+@infoid+" where za0100='"+isnull(@rowvalue,'')+"' open curs_g"
 		        	          exec(@createsql)
	     				  fetch next from  curs_g into @updatevalue
		 			  close Curs_g
					  deallocate Curs_g

					if isnull(@updatevalue,'')>""
					begin
						set @createsql=""
						set @strwhere=@strwhere

						set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in (select za0100 from "+@jstable+" where "+right(@coltarget,6)+"='"+@colvalue+"' and "+right(@rowtarget,6)+"='"+@rowvalue+"')"
						 exec(@createsql)
					end
				end
		        	fetch next from  curs_gwmc into @colvalue,@rowvalue
			end
		  close Curs_gwmc
		  deallocate Curs_gwmc

		end
	    else
	        if isnull(ltrim(@rowtarget),'')=''

		begin

	          --set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@coltarget+" open curs_gwmc "
 		set @createsql="declare curs_gwmc cursor for select "+@dispfield+" from "+@jstable+" group by " +@dispfield+" open curs_gwmc "

                  exec(@createsql)
	          fetch next from  curs_gwmc into @colvalue
		  while(@@fetch_status=0)
			begin
			   if(isnull(@colvalue,'')<>'')
				begin
		                set @colinfofield=''
			
				set @updatevalue=''
				select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and dictvalue=@colvalue and  type=0
				if(isnull(@colinfofield,'')<>'')
					begin
					--select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=@standid and type=1
					set @createsql="declare curs_g cursor for select "+@colinfofield+" from "+@infoid+"  open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @updatevalue
		 			  close Curs_g
					  deallocate Curs_g
					set @createsql=""
					if(isnull(@updatevalue,'')<>'' )
					begin
						set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in (select za0100 from "+@jstable+" where "+right(@coltarget,6)+"='"+@colvalue+"')"

					 -- set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere++" where "+@coltarget+"='"+@colvalue+"') and "+@strCondition2
					  exec(@createsql)
					end
				end
			end
	        	fetch next from  curs_gwmc into @colvalue
			end

		  close Curs_gwmc
		  deallocate Curs_gwmc
		end
		else
		begin

	          set @createsql="declare curs_gwmc cursor for "+ @createsql+" where "+@strCondition1+"  group by "+@rowtarget+" open curs_gwmc "

                  exec(@createsql)

	          fetch next from  curs_gwmc into @rowvalue
		 
  		  --select top 1 @colinfofield=left(infofields,6) from gs_standitem where standid=@standid  and dictvalue=@rowvalue and type=0

		  while(@@fetch_status=0)
			begin
				set @updatevalue=''
				set @rowinfofield=''
				select top 1 @rowinfofield=left(infofields,6) from gs_standitem where standid=cast(@standid as varchar(10)) and dictvalue=@rowvalue and type=1
				if(isnull(@rowvalue,'')<>'')
				begin
				set @createsql="declare curs_g cursor for select za01aa  from "+@infoid+" where za0100='"+@rowvalue+"' open curs_g"

 		                  exec(@createsql)
	     			  fetch next from  curs_g into @updatevalue
	 			  close Curs_g
				  deallocate Curs_g
				if(isnull(@updatevalue,'')<>'')
				  begin
				    set @createsql=""
				    set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere++" where "+@rowtarget+"='"+@rowvalue+"') and "+@strCondition2

				    exec(@createsql)
				  end
				end
		        	fetch next from  curs_gwmc into @rowvalue
			end
		  close Curs_gwmc
		  deallocate Curs_gwmc

		end
		set @strsql="drop table "+ @jstable
		exec(@strsql)
          end
	else--复杂处理,只处理不超过两层的
	  begin
	    --select distinct layer,infoif from gs_standitem where standid=125 and type=1 
		--1、先生成行条件，判断是否为空，如果为空则一进行处理下一行
		--2、找出第一个单元格的值，如果为null，或字符型为空格，或数值型为0，不计算。
		--3、找出列条件与行条件共同构造条件
		--4、根据条件进行赋值
	      select @rowcount=count(distinct layer) from gs_standitem where standid=cast(@standid as varchar(10)) and type=1

	      if isnull(@rowcount,0)=0--没行
		begin
		  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid as varchar(10)) and type=0  
		      if @colcount=1--一列
			begin

				  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"
 		                  exec(@createsql)
	     			  fetch next from  curs_g into @colinfofield,@strsql
				  while(@@fetch_status=0)
					begin

						EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
						  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+"  open curs_gcol"
				        	          exec(@createsql)
			     			  fetch next from  curs_gcol into @updatevalue
 						  close Curs_gcol
						  deallocate Curs_gcol
						IF(isnull(@updatevalue,'')<>'')
						begin
							set @createsql=""
							set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
					 		exec(@createsql)
						end
						fetch next from  curs_g into @colinfofield,@strsql
					end

	 			  close Curs_g
				  deallocate Curs_g
			end
		      else--两列
			begin


				 set @i=0
				 set @strFirstcol=''
				  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"

				  exec(@strsql)
				  fetch next from  curs_firstCol into @strFirstcol
				  while(@@fetch_status=0)
				  begin
					  set @strsecondcol=''
					  set @colinfofield=''
					  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @colinfofield,@strsecondcol
					  while(@@fetch_status=0)
						begin
							if(isnull(@strFirstcol,'')='')
								set @strfirstcol='1=1'	
							if(isnull(@strsecondcol,'')='')
								set @strsecondcol='1=1'	
							set @strsql="("+@strfirstcol +") and ("+@strsecondcol+")"
							EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
							set @colinfofield=substring(@colinfofield,@i*7+1,6)
							set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+"  open curs_gcol"
 				        	        exec(@createsql)
				     			fetch next from  curs_gcol into @updatevalue
	 						close Curs_gcol
							deallocate Curs_gcol
							if isnull(@updatevalue,'')<>''
							begin
								set @createsql=""
								set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2

						 		exec(@createsql)
							end
							fetch next from  curs_g into @colinfofield,@strsecondcol
						end
		 			  close Curs_g
					  deallocate Curs_g
					  set @i=@i+1
					  fetch next from  curs_firstCol into @strFirstcol
				  end
	 			  close curs_firstCol
				  deallocate curs_firstCol
			end
		end
	      else if @rowcount=1--一行
	-- declare @strFirstcol varchar(2000)--第一列条件
	-- declare @strsecondcol varchar(2000)--第二列条件
	-- declare @strFirstrow varchar(2000)--第一行条件
	-- declare @strsecondrow varchar(2000)--第二行条件
 	-- declare @j int --计数
	-- declare @i int --计数

		begin
---------------------------------------------------------------------------------
		  set @j=1
		  set @strFirstrow=''
		  set @strsql="declare curs_firstrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstrow"
		  exec(@strsql)
		  fetch next from  curs_firstrow into @strFirstrow
		  while(@@fetch_status=0)
		  begin
			  set @rowcount=0

		          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output

			  set @createsql="declare curs_grow cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow"
	        	  exec(@createsql)
     			  fetch next from  curs_grow into @rowcount
			  close Curs_grow
			  deallocate Curs_grow
			  if @rowcount>0
			  begin
				  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid  as varchar(10)) and type=0
				  if @colcount=0 --只有一行没有列
				     begin
						set @createsql="declare curs_g cursor for select za01aa from "+@infoid+"  where "+@infoid+"id="+cast(@j*100 as varchar(100))+" open curs_g"
				        	exec(@createsql)
			     			fetch next from  curs_g into @updatevalue
 						close Curs_g
						deallocate Curs_g
						IF(isnull(@updatevalue,'')<>'')
						begin
							set @createsql=""
							set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
					 		exec(@createsql)
						end

				     end
				  else if @colcount=1--一行一列
				     begin
-------------------------------------------------------
					  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"
	 		                  exec(@createsql)
		     			  fetch next from  curs_g into @colinfofield,@strfirstcol
					  while(@@fetch_status=0)
						begin
							if(isnull(@strFirstcol,'')='')
								set @strfirstcol='1=1'	
							if(isnull(@strFirstrow,'')='')
								set @strFirstrow='1=1'	
							set @strsql="("+@strfirstcol +") and ("+@strFirstrow+")"
							
							EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
							  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast(@j*100 as varchar(100))+" open curs_gcol"
					        	          exec(@createsql)
				     			  fetch next from  curs_gcol into @updatevalue
	 						  close Curs_gcol
							  deallocate Curs_gcol
							IF(isnull(@updatevalue,'')<>'')
							begin
								set @createsql=""
								set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
						 		exec(@createsql)
							end
							fetch next from  curs_g into @colinfofield,@strfirstcol
						end
	
		 			  close Curs_g
					  deallocate Curs_g
	

--------------------------------------------------------
				     end
		                  else--一行两列
				     begin
----------------------------------------------------------
					 set @i=0
					 set @strFirstcol=''
					  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"
					  exec(@strsql)
					  fetch next from  curs_firstCol into @strFirstcol
					  while(@@fetch_status=0)
					  begin
						  set @strsecondcol=''
						  set @colinfofield=''
						  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
		 		                  exec(@createsql)
			     			  fetch next from  curs_g into @colinfofield,@strsecondcol
						  while(@@fetch_status=0)
							begin
								if(isnull(@strFirstcol,'')='')
									set @strfirstcol='1=1'	
								if(isnull(@strsecondcol,'')='')
									set @strsecondcol='1=1'	
								if(isnull(@strFirstrow,'')='')
									set @strFirstrow='1=1'	
	
								set @strsql="("+@strfirstcol +") and ("+@strsecondcol+") and ("+@strFirstrow+")"
								EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
								set @colinfofield=substring(@colinfofield,@i*7+1,6)
								set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast(@j*100 as varchar(100))+"  open curs_gcol"
	 				        	        exec(@createsql)
					     			fetch next from  curs_gcol into @updatevalue
		 						close Curs_gcol
								deallocate Curs_gcol
								if isnull(@updatevalue,'')<>''
								begin
									set @createsql=""
									set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
							 		exec(@createsql)
								end
								fetch next from  curs_g into @colinfofield,@strsecondcol
							end
			 			  close Curs_g
						  deallocate Curs_g
						  set @i=@i+1
						  fetch next from  curs_firstCol into @strFirstcol
					  end
		 			  close curs_firstCol
					  deallocate curs_firstCol
-----------------------------------------------------------
				     end
                          end
			set @j=@j+1
			fetch next from  curs_firstrow into @strFirstrow
		  end
 		  close curs_firstrow
		  deallocate curs_firstrow


---------------------------------------------------------------------------------
		end
	      else--两行
		begin
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

		  set @j=0
		  set @m=0
		  select @secondrowcount=count(*) from gs_standitem where standid=cast(@standid as varchar(10)) and layer=1 and type=1
		  set @strFirstrow=''
		  set @strsql="declare curs_firstrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstrow"
		 exec(@strsql)
		  fetch next from  curs_firstrow into @strFirstrow
		  while(@@fetch_status=0)
		  begin
			  set @rowcount=0
			  set @m=1
		          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output
			  set @createsql="declare curs_grow cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow"
	        	  exec(@createsql)
     			  fetch next from  curs_grow into @rowcount
			  close Curs_grow
			  deallocate Curs_grow

			  if @rowcount>0
			  begin
			  set @strsql="declare curs_secondrow cursor for select setsql from gs_standitem where layer=0 and type=1 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_secondrow"
			  exec(@strsql)
			  fetch next from  curs_secondrow into @strsecondrow
			  while(@@fetch_status=0)
			  begin
				  set @rowcount=0
				if(isnull(@strFirstrow,'')='')
					set @strfirstrow='1=1'	
				if(isnull(@strsecondrow,'')='')
					set @strsecondrow='1=1'	
				set @strsql="("+@strsecondrow +") and ("+@strFirstrow+")"

			          EXECUTE flxp_create_condition @strMainObject,@strFirstrow,@strwhere output
				  set @createsql="declare curs_grow1 cursor for select count(*) from "+@strMainObject+" where za0100 in ("+@strwhere+")  open curs_grow1"
		        	  exec(@createsql)
	     			  fetch next from  curs_grow1 into @rowcount
				  close Curs_grow1
				  deallocate Curs_grow1
				  if @rowcount>0
				  begin
						  select @colcount=count(distinct layer) from gs_standitem where standid=cast(@standid  as varchar(10)) and type=0
						  if @colcount=0 --只有行没有列
						     begin
								set @createsql="declare curs_g cursor for select za01aa from "+@infoid+"  where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+" open curs_g"
						        	exec(@createsql)
					     			fetch next from  curs_g into @updatevalue
		 						close Curs_g
								deallocate Curs_g
								IF(isnull(@updatevalue,'')<>'')
								begin
									set @createsql=""
									set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
							 		exec(@createsql)
								end
		
						     end
						  else if @colcount=1--一行一列
						     begin
		-------------------------------------------------------
							  set @createsql="declare curs_g cursor for select left(infofields,6),setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' order by itemid open curs_g"

			 		                  exec(@createsql)
				     			  fetch next from  curs_g into @colinfofield,@strfirstcol
							  while(@@fetch_status=0)
								begin
									if(isnull(@strFirstcol,'')='')
										set @strfirstcol='1=1'	
									if(isnull(@strFirstrow,'')='')
										set @strFirstrow='1=1'	
									set @strsql="("+@strfirstcol +")  and "+@strsql
									
									EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
									  set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+" open curs_gcol"
							        	          exec(@createsql)
						     			  fetch next from  curs_gcol into @updatevalue
			 						  close Curs_gcol
									  deallocate Curs_gcol
									IF(isnull(@updatevalue,'')<>'')
									begin
										set @createsql=""
										set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
								 		exec(@createsql)
									end
									fetch next from  curs_g into @colinfofield,@strfirstcol
								end
			
				 			  close Curs_g
							  deallocate Curs_g
			
		
		--------------------------------------------------------
						     end
				                  else--一行两列
						     begin
		----------------------------------------------------------
							 set @i=0
							 set @strFirstcol=''
							  set @strsql="declare curs_firstCol cursor for select setsql from gs_standitem where layer=0 and type=0 AND standid='"+cast(@standid as varchar(10))+"' order by itemid open curs_firstcol"
							  exec(@strsql)
							  fetch next from  curs_firstCol into @strFirstcol
							  while(@@fetch_status=0)
							  begin
								  set @strsecondcol=''
								  set @colinfofield=''
								  set @createsql="declare curs_g cursor for select infofields,setsql from gs_standitem where standid='"+cast(@standid as varchar(10))+"' and type='0' and layer=1 order by itemid open curs_g"
				 		                  exec(@createsql)
					     			  fetch next from  curs_g into @colinfofield,@strsecondcol
								  while(@@fetch_status=0)
									begin
										if(isnull(@strFirstcol,'')='')
											set @strfirstcol='1=1'	
										if(isnull(@strsecondcol,'')='')
											set @strsecondcol='1=1'	
										if(isnull(@strFirstrow,'')='')
											set @strFirstrow='1=1'	
			
										set @strsql="("+@strfirstcol +") and ("+@strsecondcol+") and "+@strsql
										EXECUTE flxp_create_condition @strMainObject,@strsql,@strwhere output
										set @colinfofield=substring(@colinfofield,@i*7+1,6)
										set @createsql="declare curs_gcol cursor for select "+@colinfofield+" from "+@infoid+" where "+@infoid+"id="+cast((@j*@secondrowcount+@m)*100 as varchar(100))+"  open curs_gcol"
			 				        	        exec(@createsql)
							     			fetch next from  curs_gcol into @updatevalue
				 						close Curs_gcol
										deallocate Curs_gcol
										if isnull(@updatevalue,'')<>''
										begin
											set @createsql=""
											set @createsql="update "+left(@resulttarget,4)+" set "+right(@resulttarget,6)+"='"+@updatevalue+"' where zc9993='1' and za0100 in ("+@strwhere+")   and "+@strCondition2
									 		exec(@createsql)
										end
										fetch next from  curs_g into @colinfofield,@strsecondcol
									end
					 			  close Curs_g
								  deallocate Curs_g
								  set @i=@i+1
								  fetch next from  curs_firstCol into @strFirstcol
							  end
				 			  close curs_firstCol
							  deallocate curs_firstCol
		-----------------------------------------------------------
						     end
						end
						set @m=@m+1
						fetch next from  curs_secondrow into @strsecondrow

		                          end
			 		  close curs_secondrow
					  deallocate curs_secondrow
					  end
					set @j=@j+1
					fetch next from  curs_firstrow into @strFirstrow
				  end
		 		  close curs_firstrow
				  deallocate curs_firstrow
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
		end    

	  end

abandon:

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

