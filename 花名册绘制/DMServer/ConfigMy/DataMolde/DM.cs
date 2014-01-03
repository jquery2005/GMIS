using System;
using System.Data;
using System.Data.SqlClient;

using DMServer.Common;

namespace DMServer.DataMolde
{
    /// <summary>
    /// DM ��ժҪ˵����
    /// </summary>
    public class DM
    {
        private SqlConnection conn;
        private SqlDataAdapter dsCommand;

        /// <summary>
        /// ���ݿ�����ʧ��
        /// </summary>
        public const int CONNECTDB_FAIL = 0;

        /// <summary>
        /// Sqlִ�гɹ�
        /// </summary>
        public const int EXECSQL_SUCCESS = 1;

        /// <summary>
        /// Sqlִ��ʧ��
        /// </summary>
        public const int EXECSQL_FAIL = -1;

        /// <summary>
        /// ���캯�����������л�����ݿ������ַ�����ʼ��conn
        /// </summary>
        //public DM(string[] s)
        //{
        //    ConfigMy config = new ConfigMy(s);
        //    string dbConnectString = config.ConnectString;
        //    conn = new SqlConnection(dbConnectString);
        //}

        public DM()
        {
            string[] connectInfo = ConfigMy.ConnectInfo;
            this.conn = new SqlConnection("server=" + connectInfo[0] + ";uid=" + connectInfo[2] + ";pwd=" + connectInfo[3] + ";database=" + connectInfo[1] + ";Connection Lifetime = 180");
        }

        public SqlConnection Conn
        {
            get { return conn; }
        }

        /// <summary>
        /// ����strSql������ݼ�
        /// </summary>
        /// <param name="strSql">sql���</param>
        /// <param name="strTable">�õ��ı���</param>
        /// <param name="iResult">1���ɹ���0�����ݿ����Ӳ��ϣ�-1��select����ʧ��</param>
        /// <returns></returns>
        public DataSet FillData(string strSql, string strTable, out int iResult)
        {
            int iState = CONNECTDB_FAIL;
            DataSet dataSet = new DataSet();
            try
            {
                //���iResult��ֵû�б���������ı䣬��˵�����ݿ����Ӳ���
                conn.Open();
                //���iResult��ֵû�б���������ı䣬��˵��select����ʧ��
                iState = EXECSQL_FAIL;
                dsCommand = new SqlDataAdapter(strSql, conn);
                dsCommand.Fill(dataSet, strTable);
            }
            catch (System.Exception ex)
            {
                Console.WriteLine(ex.Message);
                dataSet = null;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            if (dataSet != null)
            {
                iResult = EXECSQL_SUCCESS;
                return dataSet;
            }
            else
            {
                iResult = iState;
                return null;
            }
        }

        /// <summary>
        /// ִ��SqlCommand������ִ�н��,1���ɹ���0�����ݿ����Ӳ��ϣ�-1��ִ��sql���ʧ��
        /// </summary>
        /// <param name="sqlCommand"></param>
        /// <returns>1���ɹ���0�����ݿ����Ӳ��ϣ�-1��ִ��sql���ʧ��</returns>
        public int ExecSql(SqlCommand sqlCommand)
        {
            int iResult = CONNECTDB_FAIL;
            try
            {
                conn.Open();
                sqlCommand.Connection = conn;
                SqlTransaction myTrans = conn.BeginTransaction();
                sqlCommand.Transaction = myTrans;
                iResult = EXECSQL_FAIL;
                iResult = sqlCommand.ExecuteNonQuery();
                myTrans.Commit();
                if (iResult >= 1)
                {
                    iResult = EXECSQL_SUCCESS;
                }
                else
                {
                    myTrans.Rollback();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
            return iResult;
        }
    }
}
