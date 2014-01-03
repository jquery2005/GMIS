/***************************************************************************************** 20030626
	为指定表中指定ZA0100的记录设置当前记录
**************************************************************************************************/
CREATE PROCEDURE gsp_SetCurrentRecord
	(
		@InfoId			varchar(4),			-- 对象
		@id                                  varchar(20)
	)
AS
	SET QUOTED_IDENTIFIER OFF

	
	-- 执行的返回结果
	declare @Result			int

	declare @strSQL		varchar(8000)
	declare @strFrom		varchar(8000)
	declare @strWhere		varchar(8000)

	
	set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=0 WHERE ZA0100='"+@id+"'"
	exec(@strSQL)


	set @strFrom = "(SELECT ZA0100,MAX(" + @InfoId + "Id) AS F1 FROM " + @InfoId + " WHERE ZA0100='"+@id+"' GROUP BY ZA0100) AS T1"
	set @strWhere = "T1.ZA0100=" + @InfoId + ".ZA0100 AND T1.F1=" + @InfoId + "." + @InfoId + "Id"


	set @strSQL = "UPDATE " + @InfoId + " SET ZC9993=1" + " FROM " + @strFrom + " WHERE " + @strWhere
	exec(@strSQL)


	SET QUOTED_IDENTIFIER ON
/*	
*/	
	-- 结束
	RETURN 1

OnError:
	RETURN 0
GO
