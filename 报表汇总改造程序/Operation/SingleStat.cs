using System;
using System.Data;
using System.Data.SqlClient;  
using DMServer.DataMolde;

namespace Operation
{
	/// <summary>
	/// Class1 的摘要说明。
	/// </summary>
	public class SingleStat
	{
		private string m_Tablename;
		private string m_Dictid;
		private string m_Condition;
		private DM dataUnit;

		public SingleStat(string Tablename,string Dictid,string Conditon)
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
			m_Tablename=Tablename;
			m_Dictid=Dictid;

			m_Condition=Conditon;
            if (m_Condition == "")
            {
                m_Condition = "1=1";
            }
			dataUnit = new DM();
		}

		public  DataTable gsCreateSQL()
		{
            //select isnull((select description from gs_dictitem where dictid='ax' and dictvalue=aa01.aa0107),'空') as aa0107 ,count(*) from aa01  where ae0122='111' group by aa0107
            //select isnull((select za0101 from ab01 where za0100=aa01.ab0110),'空') as ab0110 ,count(*) from aa01 group by ab0110

            //string dbConnectString = "server=" + ConfigMy.ConnectInfo[0] + ";uid=" + ConfigMy.ConnectInfo[2]
            //    + ";pwd=;database=" + ConfigMy.ConnectInfo[1];
			int iResult = 0;
			string strSQl;
			try
			{
                if (m_Dictid.Length == 2)
                {
                    strSQl = "select isnull(dbo.get_DictIdName('" + m_Dictid + "'," + m_Tablename + "),'空') as " + m_Tablename.Substring(5, 6) + ",count(*) from " + m_Tablename.Substring(0, 4) + " where " + m_Condition + " group by " + m_Tablename.Substring(5, 6);
                }
                else
                {
                    strSQl = "select isnull((select za0101 from " + m_Dictid.Substring(0, 4) + " where za0100=" + m_Tablename + "),'空') as " + m_Tablename.Substring(5, 6) + ",count(*) from " + m_Tablename.Substring(0, 4) + " where " + m_Condition + " group by " + m_Tablename.Substring(5, 6);
                }

				DataSet ds = dataUnit.FillData(strSQl,m_Tablename.Substring(0,4),out iResult);
				if(ds !=null)
				{
					return ds.Tables[0];
				}
				return null;
			}
			catch
			{
				return null;
			}
		}
	}
}
