--drop PROCEDURE flxp_rpt_rptdealQuery 
CREATE  PROCEDURE flxp_rpt_rptdealQuery 
    @strwhereSQL varchar(8000) output
 with encryption 
AS
declare @za0101 varchar(1000)
declare @value varchar(1000)
--declare @ed0114 varchar(100)

		declare @strsql varchar(1000)
SET QUOTED_IDENTIFIER OFF 
		set @strSQL="declare curs_gwmc cursor for select za0101,ed0110 from ed01 where za0101<>'数字开始时间' and  za0101<>'数字截止时间'   and za0101<>'同期数字截止时间'  and  za0101<>'同期数字开始时间'    and ed0111 in ('0','1','2')  open curs_gwmc"
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
