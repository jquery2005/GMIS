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
		--ʹ���ֶ� @prperty
		if exists(select name from syscolumns where (id = object_id(@table)) and (name = @prperty))
		begin--�������ȷʵ�и��ֶ�
			if exists(select * from sysindexes where name = 'UQ_' + @table + '_' + @prperty)
			begin--�����Ψһ����������ɾ�������������������ֻ���˷������� UNIQUE ����
				execute('drop index ' + @table + '.UQ_' + @table + '_' + @prperty)
			end
			if exists(select * from sysindexes where name = 'SIMPLE_' + @table + '_' + @prperty)
			begin--����м�����������ɾ�������������������ֻ���˷������� UNIQUE ����
				execute('drop index ' + @table + '.SIMPLE_' + @table + '_' + @prperty)
			end
			--����ɾ����
			execute('alter table ' + @table + ' drop column ' + @prperty)
			--gs_propertyflag ����ɾ����Ӧ�ļ�¼
			delete gs_propertyflag where flag like '%' +  @table + '.' + @prperty + '%'
		end
		--�Ѷ������������Ϊ�ݸ�״̬
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





