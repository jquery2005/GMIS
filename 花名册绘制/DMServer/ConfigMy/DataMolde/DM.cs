using System;
using System.Data;
using System.Data.SqlClient;

using DMServer.Common;

namespace DMServer.DataMolde
{
    /// <summary>
    /// DM 的摘要说明。
    /// </summary>
    public class DM
    {
        private SqlConnection conn;
        private SqlDataAdapter dsCommand;

        /// <summary>
        /// 数据库连接失败
        /// </summary>
        public const int CONNECTDB_FAIL = 0;

        /// <summary>
        /// Sql执行成功
        /// </summary>
        public const int EXECSQL_SUCCESS = 1;

        /// <summary>
        /// Sql执行失败
        /// </summary>
        public const int EXECSQL_FAIL = -1;

        /// <summary>
        /// 构造函数，从配置中获得数据库连接字符串初始化conn
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
        /// 根据strSql获得数据集
        /// </summary>
        /// <param name="strSql">sql语句</param>
        /// <param name="strTable">得到的表名</param>
        /// <param name="iResult">1：成功，0：数据库连接不上，-1：select数据失败</param>
        /// <returns></returns>
        public DataSet FillData(string strSql, string strTable, out int iResult)
        {
            int iState = CONNECTDB_FAIL;
            DataSet dataSet = new DataSet();
            try
            {
                //如果iResult的值没有被下面的语句改变，就说明数据库连接不上
                conn.Open();
                //如果iResult的值没有被下面的语句改变，就说明select数据失败
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
        /// 执行SqlCommand并返回执行结果,1：成功，0：数据库连接不上，-1：执行sql语句失败
        /// </summary>
        /// <param name="sqlCommand"></param>
        /// <returns>1：成功，0：数据库连接不上，-1：执行sql语句失败</returns>
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
