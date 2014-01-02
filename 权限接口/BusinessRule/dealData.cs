using System;
using System.Data;
using System.Data.SqlClient;  
using DMServer.Common;

namespace Report.stat
{
	/// <summary>
	/// Class1 ��ժҪ˵����
	/// </summary>
	public class dealData
	{
		//sdkfsdfsadf
		string dbConnectString;
		//���±��е������Ϣ
		public bool UpdateCondition(int serialNo,int sequenceNo,string TBL,string FLD,string CON,string EXP,string FUN,string SQL)
		{
			try
			{
				SqlConnection objConn=new SqlConnection(dbConnectString);
				objConn.Open();
				SqlCommand objcommand=new SqlCommand();
				string strSQL;
				objcommand.Connection = objConn;
				strSQL = " SET QUOTED_IDENTIFIER OFF  update gs_condition set TBL= " + (char)34 + TBL + (char)34 + " , FLB="+(char)34+FLD+(char)34+" , EXP="+(char)34+EXP+(char)34+" , FUN="+(char)34+FUN+(char)34+" , CON="+(char)34+CON+(char)34+",setSql ="+(char)34+SQL+(char)34+" where serialNo="+serialNo+" and sequenceNo="+sequenceNo;
				objcommand.CommandText = strSQL;
				objcommand.ExecuteNonQuery();
				
				return true;

			}
			catch(Exception e)
			{
				//throw new Exception(e.Message );
				return false;
			}
		}

		public string runQuery(string MainObject,string TBL,string FLD,string CON,string EXP,string FUN,string SQL,string outSQL)
		{

			try
			{

				SqlCommand   objcommand =new SqlCommand();
				objcommand.Connection=new SqlConnection(dbConnectString);

				objcommand.Connection.Open();
				objcommand.CommandText = "flxp_rpt_SQLcondition";
				objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
				//����������
				SqlParameter sMainObject = new SqlParameter("@strMainObject", SqlDbType.VarChar,4);
				sMainObject.Direction = ParameterDirection.Input;
				sMainObject.Value=MainObject;
				objcommand.Parameters.Add(sMainObject);     

				//
				//��������б�
				SqlParameter sTBL = new SqlParameter("@strTBL", SqlDbType.VarChar,100);
				sTBL.Direction = ParameterDirection.Input;
				sTBL.Value=TBL;
				objcommand.Parameters.Add(sTBL);     

				//
				//�����ֶ��б�
				SqlParameter sFLD = new SqlParameter("@strFLD", SqlDbType.VarChar,500);
				sFLD.Direction = ParameterDirection.Input;
				sFLD.Value=FLD;
				objcommand.Parameters.Add(sFLD);     
				//
				//���볣���б�
				SqlParameter sCON = new SqlParameter("@strCON", SqlDbType.VarChar,500);
				sCON.Direction = ParameterDirection.Input;
				sCON.Value=CON;
				objcommand.Parameters.Add(sCON);     
				//
				//������ʽ�б�
				SqlParameter sEXP = new SqlParameter("@strEXP", SqlDbType.VarChar,500);
				sEXP.Direction = ParameterDirection.Input;
				sEXP.Value=EXP;
				objcommand.Parameters.Add(sEXP);     
				//
				//���뺯���б�
				SqlParameter sFUN = new SqlParameter("@strFUN", SqlDbType.VarChar,500);
				sFUN.Direction = ParameterDirection.Input;
				sFUN.Value=FUN;
				objcommand.Parameters.Add(sFUN);     
				//����SQL
				SqlParameter sSQL = new SqlParameter("@strSQL", SqlDbType.VarChar,2000);
				sSQL.Direction = ParameterDirection.Input;
				sSQL.Value=SQL;
				objcommand.Parameters.Add(sSQL);     
				//��������
				SqlParameter soutSQL = new SqlParameter("@stroutSQL", SqlDbType.VarChar,5000);
				soutSQL.Direction = ParameterDirection.Output;
				soutSQL.Value="";
				objcommand.Parameters.Add(soutSQL);
				objcommand.ExecuteNonQuery();
				objcommand.Connection.Close();
				outSQL=(string)soutSQL.Value;
				return outSQL;

			}
			catch
			{
				//throw new Exception(e.Message );
				return"";
			}
		}
		//asdfkjaskdf

		public dealData()
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
			ConfigMy config = new ConfigMy();
			dbConnectString = config.ConnectString;
		}
	}
}


