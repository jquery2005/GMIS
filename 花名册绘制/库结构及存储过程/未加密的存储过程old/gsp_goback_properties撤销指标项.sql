drop  PROCEDURE gsp_goback_properties 
CREATE PROCEDURE gsp_goback_properties 
	@table sysname,
	@properties varchar(1000)
 
AS
	declare @prperty varchar(50)
	declare @plen int

	while len(@properties) > 0
	begin
		set @plen = charindex(',',@properties,0)
		if @plen = 0
		begin
			set @prperty = @properties
			set @properties = ''
		end
		else
			set @prperty = left(@properties,@plen - 1)
		------------------------------------------------------------
		--使用字段 @prperty
		if exists(select name from syscolumns where (id = object_id(@table)) and (name = @prperty))
		begin--如果表中确实有该字段
			if exists(select * from sysindexes where name = 'UQ_' + @table + '_' + @prperty)
			begin--如果有唯一索引，则先删除依赖它的索引，这儿只过滤非主键的 UNIQUE 索引
				execute('drop index ' + @table + '.UQ_' + @table + '_' + @prperty)
			end
			if exists(select * from sysindexes where name = 'SIMPLE_' + @table + '_' + @prperty)
			begin--如果有简单索引，则先删除依赖它的索引，这儿只过滤非主键的 UNIQUE 索引
				execute('drop index ' + @table + '.SIMPLE_' + @table + '_' + @prperty)
			end
			--表中删除列
			execute('alter table ' + @table + ' drop column ' + @prperty)
			--gs_propertyflag 表中删除相应的纪录
			delete gs_propertyflag where flag like '%' +  @table + '.' + @prperty + '%'
		end
		--把对象的属性设置为草稿状态
		update gs_property set state = 0 where((infoid = @table) and (infofield = @prperty))
    delete from gs_objectassociate where propertyset like '%'+@prperty+'%'		
------------------------------------------------------------
		set @properties = substring(@properties,@plen + 1,len(@properties) - @plen)
	end



GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO





