SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
ALTER     PROCEDURE flx_salary_ThreeYear

  AS


SET QUOTED_IDENTIFIER Off 
--create table wllsc(za0100 varchar(20),aa25id int ,aa2504 varchar(20),aa2507 varchar(20))
--##wllsc;所有大于三年
-- 先处理三年内有过级别变动的人员
--然后再处理三年优秀  
delete from wllsc
declare @za0100 varchar(20)
declare @aa25id int
declare @aa25idMin int
declare @strsql varchar(2000)




update aa25 set zc9995=""
update aa25 set zc9995='A' where za0100+cast(aa25id as varchar) in 
(select za0100+cast(aa25id as varchar)  from aa25
where za0100 in (select  aa251.za0100  from (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2'  and isnull(aa2507,'')<>'1' group by za0100) as aa251 left join  (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1' group by za0100) as aa252 on aa251.za0100=aa252.za0100 where aa251.num=aa252.num and aa251.num=5) and  isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1')
--处理已经利用的年份数据
update aa25 set aa2507='1',zc9995='B' where za0100 in (select za0100 from aa25  where isnull(zc9995,'')='A') and cast(year(aa2502) as varchar)+za0100 in (select cast(year(_d0003)-1 as varchar)+za0100 from aa58  where   isnull(ae5805,0)<isnull(_e5805,0) and isnull(_e5805,0)>0 and  za0100 in (select  aa251.za0100  from (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2'  and isnull(aa2507,'')<>'1' group by za0100) as aa251 left join  (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1' group by za0100) as aa252 on aa251.za0100=aa252.za0100 where aa251.num=aa252.num and aa251.num=5) and  aa2501='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1')

	set @strSQL="declare curs_gw cursor for select  za0100,aa25id from aa25 where isnull(zc9995,'')='B'  open curs_gw"
	exec(@strsql)
		fetch next from  curs_gw into @za0100,@aa25id

	while(@@fetch_status=0)
		begin
print @strSQL
print @za0100
			set @strSQL="declare curs_gw1 cursor for select  aa25id from aa25 where za0100='"+@za0100+"' and aa25id<="+cast(@aa25id as varchar)+" and isnull(aa2507,0)<>'1'  open curs_gw1"
print @strSQL
			exec(@strsql)
				fetch next from  curs_gw1 into @aa25idmin
			while(@@fetch_status=0)
				begin
					set @strSQL="update aa25 set aa2507='1' where za0100='"+@za0100+"' and aa25id="+cast(@aa25idmin as varchar)
print 	@strSQL
				exec(@strsql)
		  	fetch next from  curs_gw1 into @aa25idmin

				end
			close Curs_gw1
			deallocate Curs_gw1
				fetch next from  curs_gw into @za0100,@aa25id

		end
	close Curs_gw
	deallocate Curs_gw








update aa25 set zc9995=""
update aa25 set zc9995='A' where za0100+cast(aa25id as varchar) in 
(select za0100+cast(aa25id as varchar)  from aa25
where za0100 in (select  aa251.za0100  from (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2'  and isnull(aa2507,'')<>'1' group by za0100) as aa251 left join  (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1' group by za0100) as aa252 on aa251.za0100=aa252.za0100 where aa251.num=aa252.num and aa251.num>=3) and  isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1')
--处理已经利用的年份数据
update aa25 set aa2507='1',zc9995='B' where za0100 in (select za0100 from aa25  where zc9995='A') and cast(year(aa2502) as varchar)+za0100 in (select cast(year(_d0003)-1 as varchar)+za0100 from aa58  where   isnull(ae5805,0)<isnull(_e5805,0) and isnull(_e5805,0)>0 and  za0100 in (select  aa251.za0100  from (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2'  and isnull(aa2507,'')<>'1' group by za0100) as aa251 left join  (select za0100,count(*) as num from aa25 where isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1' group by za0100) as aa252 on aa251.za0100=aa252.za0100 where aa251.num=aa252.num and aa251.num>=3) and  isnull(aa2501,'')='2' and isnull(aa2504,'')<='2' and isnull(aa2507,'')<>'1')

	set @strSQL="declare curs_gw cursor for select  za0100,aa25id from aa25 where isnull(zc9995,'')='B'  open curs_gw"
	exec(@strsql)
		fetch next from  curs_gw into @za0100,@aa25id

	while(@@fetch_status=0)
		begin
print @strSQL
print @za0100
			set @strSQL="declare curs_gw1 cursor for select  aa25id from aa25 where za0100='"+@za0100+"' and aa25id<="+cast(@aa25id as varchar)+" and isnull(aa2507,0)<>'1'  open curs_gw1"
print @strSQL
			exec(@strsql)
				fetch next from  curs_gw1 into @aa25idmin
			while(@@fetch_status=0)
				begin
					set @strSQL="update aa25 set aa2507='1' where za0100='"+@za0100+"' and aa25id="+cast(@aa25idmin as varchar)
print 	@strSQL
				exec(@strsql)
		  	fetch next from  curs_gw1 into @aa25idmin

				end
			close Curs_gw1
			deallocate Curs_gw1
				fetch next from  curs_gw into @za0100,@aa25id

		end
	close Curs_gw
	deallocate Curs_gw

update aa25 set zc9995=''

update aa25 set zc9995='A' where za0100+cast(aa25id as varchar) in 
(select za0100+cast(aa25id as varchar)  from aa25
where za0100 in (select  aa251.za0100  from (select za0100,count(*) as num from aa25 where aa2501='2'  and isnull(aa2507,'')<>'1' group by za0100) as aa251 left join  (select za0100,count(*) as num from aa25 where aa2501='2' and aa2504<='2' and isnull(aa2507,'')<>'1' group by za0100) as aa252 on aa251.za0100=aa252.za0100 where aa251.num=aa252.num and aa251.num>=3) and  aa2501='2' and aa2504<='2' and isnull(aa2507,'')<>'1')

insert into wllsc (za0100,aa25id,aa2504,aa2507) select za0100,aa25id,aa2504,aa2507 from aa25  where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
update aa25 set zc9995='' where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
insert into wllsc (za0100,aa25id,aa2504,aa2507) select za0100,aa25id,aa2504,aa2507 from aa25 where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
update aa25 set zc9995='' where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
insert into wllsc (za0100,aa25id,aa2504,aa2507) select za0100,aa25id,aa2504,aa2507 from aa25 where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
update aa25 set zc9995='' where za0100+cast(aa25id as varchar) in (select za0100+cast(max(aa25id) as varchar) from aa25 where zc9995='A'  group by za0100 )
delete from wllsc where aa2504<>'1'
delete from wllsc where za0100 in (select za0100 from (select za0100,count(*) as aa from wllsc group by za0100) as ll where ll.aa<3)

SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS ON 
SET QUOTED_IDENTIFIER OFF 
SET ANSI_NULLS OFF 


--select * from aa25
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

