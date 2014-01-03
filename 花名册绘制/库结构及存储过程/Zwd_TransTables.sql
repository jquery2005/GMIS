SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS OFF 
GO







/***************************************************************************************** 20020928
1-����������
	1-����������ؼ������ؼ��ֵ���ʱ������ WHERE ���ֹ��ˣ�����˳������ 2-1
	2-������
		1-������У��ӱ�ĵ�ǰ��¼[ZC9993=1]���Լ��������⴦��ı��ʽֱ�� UPDATE ����
		2-�ӱ����ʷ��¼���õڶ�����ʱ����
			1-����ʱ������ȡ���˴�ʩ���������û�й��������Ļ�
			2-ȡ�ü�ֵ[ZA0100]�����ֵ/��Сֵ��������ʷ�������������⣩��UPDATE ����[��ʷ��¼]����
			3-ɾ����ֵ���ߴ���
			4-ѭ������ - 2~3
		3-������ʽ���⴦��
	3-ѭ������ÿ�� - 2
2-��������
	1-������С���飬�Լ��������⴦��ļ���ʽ���Խ�����ʱ��
	2-�ڵ�ǰ��ʱ������еڶ�����С���飬������������ñ�
	3-ѭ������ÿ������ - 2
	4-����ƽ���������ۼơ��ۼ�ƽ��
**************************************************************************************************/
alter PROCEDURE Zwd_TransTables
	(
		@InfoId			varchar(4),					-- ����
		@MainObject		varchar(4),					-- ������
		@Object			varchar(4),					-- ��������
		@strFrom		varchar(8000)			OUTPUT,		-- SQL .. FROM
		@strWhere		varchar(8000)			OUTPUT,		-- SQL .. WHERE
		@AddExLink		int		=	0	OUTPUT,		-- �Ƿ����Ӷ�������
		@Child			int		=	0			-- �Ƿ�����ӱ�
	)
AS											-- ���� 0-ʧ�� 1-�ɹ�
	SET QUOTED_IDENTIFIER OFF
	
	
	declare @strSQL			varchar(8000)
	declare @strFields		varchar(8000)
	declare @strField		varchar(8000)

	
--execute Zwd_ErrorMessage @Object, "Zwd_TransTables"


	set @AddExLink = 0

	if(@MainObject = @Object)
		RETURN 0

	if(substring(@InfoId,3,2) = "01" or (substring(@InfoId,3,2) <> "01" and @Child = 1))
	begin
		-- �ñ�δ���Ǽ�
		if(charindex(","+@Object+",", ","+@strFrom+",") = 0 and charindex(" JOIN "+@Object+" ON ", " JOIN "+@strFrom+" ON ") = 0)
		begin
	
--execute Zwd_ErrorMessage "��ʼ������", "Zwd_TransTables"
	
			-- �򿪹�����ȥ�����ֶ�	
			set @strSQL = "SELECT PropertySet FROM Gs_ObjectAssociate WHERE InfoIdA='" + @MainObject + "' AND InfoIdB LIKE '" + @Object + "%'"
			set @strSQL = "declare CR_Associate cursor for " + @strSQL + " open CR_Associate"
			exec(@strSQL)
			fetch CR_Associate into @strFields
			close CR_Associate
			deallocate CR_Associate
			
--
			execute Zwd_PopFirstWord @strFields output, @strField output, ","

			set @strSQL = @MainObject + "." + @strField + "=" + @Object + ".ZA0100"
--
			-- modify by zhangwd 2004-04-09
			--execute Zwd_AddFrom @strFrom output, " JOIN ", @Object, @strSQL, @strWhere output
			execute Zwd_AddFrom @strFrom output, " LEFT JOIN ", @Object, @strSQL, @strWhere output
			-- end modify


			if(upper(@strField) <> "ZA0100")
				set @AddExLink = 1
		end
	end


--execute Zwd_ErrorMessage @strFrom, "Zwd_TransTables"


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- ����
	RETURN 1





GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO
