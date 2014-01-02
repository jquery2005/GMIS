#define DEBUG

using System;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Collections;
using System.Collections.Specialized;
using System.Windows.Forms;
using System.Diagnostics;

namespace GMIS.CommonRightDataAccess
{
    /// <summary>
    /// Class1 的摘要说明。
    /// </summary>
    public class CDataOperator
    {
        #region 全局变量定义

        /*
        OleDbConnection conn;  //数据库连接  
        OleDbDataAdapter dbAdpter;  //数据适配器
        OleDbCommand dbCommand;  //数据操作命令
        OleDbCommandBuilder dbCommandBuilder; //提供自动生成表单的命令方法
        CSqlBuilder mSqlBuilder = new CSqlBuilder();
		*/
        CSqlBuilder mSqlBuilder = new CSqlBuilder();
        string mConnectInfo; //数据库连接字符串
        //System.Data.SqlClient.SqlConnection mConn;

        #endregion

        /* 构造函数 */
        public CDataOperator(string[] ConnectInfo)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            try
            {
                string strConnect;
                strConnect = "Data Source=" + ConnectInfo[0] + ";Initial Catalog=" + ConnectInfo[1] + "; User ID=" + ConnectInfo[2] + ";Password=" + ConnectInfo[3];
                mConnectInfo = strConnect;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 执行Sql语句
        /// </summary>
        /// <param name="StrSql"></param>
        public bool ExecuteSql(string StrSql)
        {
            System.Data.SqlClient.SqlConnection conn;
            System.Data.SqlClient.SqlCommand dbCommand;

            conn = new SqlConnection(mConnectInfo);

            dbCommand = new SqlCommand();
            dbCommand.Connection = conn;
            dbCommand.CommandTimeout = 36000;

            try
            {
                conn.Open(); //建立数据库连接
                dbCommand.CommandText = "set quoted_identifier off";
                dbCommand.ExecuteNonQuery();

                dbCommand.CommandText = StrSql;
                dbCommand.ExecuteNonQuery();
                return true;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        } //ExecuteSql

        /// <summary>
        /// 返回数据表
        /// </summary>
        /// <param name="StrSql"></param>
        /// <returns></returns>
        public DataTable GetDataTable(string StrSql)
        {
            System.Data.SqlClient.SqlConnection conn;
            System.Data.SqlClient.SqlDataAdapter dbAdpter;  //数据适配器
            System.Data.SqlClient.SqlCommand dbCommand;  //数据操作命令

            conn = new SqlConnection(mConnectInfo);
            dbCommand = new SqlCommand();
            dbCommand.Connection = conn;
            dbCommand.CommandText = StrSql;
            dbCommand.CommandTimeout = 36000;
            dbAdpter = new SqlDataAdapter(dbCommand);
            DataTable dt = new DataTable(); ;

            try
            {
                conn.Open(); //建立数据库连接
                dbAdpter.Fill(dt);
                return dt; //返回结果集表
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }//GetDataTable

        /// <summary>
        /// 添加一条记录
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="FieldValueList"></param>
        /// <returns></returns>
        public bool AddOneRec(string TableName, SortedList FieldValueList, SortedList LocatList)
        {
            SqlConnection conn; //数据库连接
            SqlDataAdapter dbAdpter;  //数据适配器
            SqlCommand dbCommand;  //数据操作命令
            SqlCommandBuilder dbCommandBuilder; //提供自动生成表单的命令方法
            SqlTransaction MyTransaction = null;  //事务定义

            string WhereSql;
            string LocateStr;

            WhereSql = this.GetWhereSql(LocatList);

            conn = new SqlConnection(mConnectInfo);
            dbCommand = new SqlCommand();
            dbCommand.Connection = conn;

            DataTable dt = new DataTable();
            string FieldName;
            object FieldValue;

            try
            {
                conn.Open(); //建立数据库连接

                MyTransaction = conn.BeginTransaction(); //开始事务
                dbCommand.Transaction = MyTransaction;

                //1.设置原来的所有记录为历史记录ZC9993='0'
                if (FieldValueList.ContainsKey("ZC9993"))  //主集没有ZC9993
                {
                    LocateStr = "Update " + TableName + " set ZC9993='0' " + WhereSql;
                    dbCommand.CommandText = LocateStr;
                    dbCommand.ExecuteNonQuery();
#if DEBUG
                    Debug.WriteLine("将原来记录设置为历史记录");
#endif
                }

                //2.添加的记录的标志位ZC9993='1'
                LocateStr = "select * from " + TableName + WhereSql;
                dbCommand.CommandText = LocateStr;
                dbAdpter = new SqlDataAdapter(dbCommand);
                dbCommandBuilder = new SqlCommandBuilder(dbAdpter);

                dbAdpter.Fill(dt);

#if DEBUG
                Debug.WriteLine("AddOneRec 开始赋值");
#endif

                //赋新值

                DataRow dr = dt.NewRow();

                for (int i = 0; i <= FieldValueList.Count - 1; i++)
                {
                    FieldName = FieldValueList.GetKey(i).ToString();
                    FieldValue = FieldValueList.GetByIndex(i);
                    if (FieldValue == null) FieldValue = Convert.DBNull;
                    dr[FieldName] = FieldValue;
#if DEBUG
                    Debug.WriteLine(FieldName + " = " + FieldValue.ToString());
#endif
                }

                //新记录的标志位为1
                if (FieldValueList.ContainsKey("ZC9993"))
                {
                    dr["ZC9993"] = "1";
                }

#if DEBUG
                Debug.WriteLine("AddOneRec 赋值结束");
#endif

                //添加一条记录
                dt.Rows.Add(dr);

                dbAdpter.Update(dt);

                MyTransaction.Commit();  //提交事务

                return true;
            }
            catch (System.Data.SqlClient.SqlException ee)
            {
                MyTransaction.Rollback(); //事务回滚 
                throw new Exception("AddOneRec:" + ee.Message);
            }
            finally
            {
                conn.Close();
            }
        } //AddOneRec

        /// <summary>
        /// 插入一条记录
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="FieldValueList"></param>
        /// <param name="LocatList"></param>
        /// <param name="BeforeID"></param>
        /// <returns></returns>
        public bool InsertOneRec(string TableName, SortedList FieldValueList, SortedList LocatList, long BeforeID, out bool ModifyOtherID)
        {
            SqlConnection conn; //数据库连接
            SqlDataAdapter dbAdpter;  //数据适配器
            SqlCommand dbCommand;  //数据操作命令
            SqlCommandBuilder dbCommandBuilder; //提供自动生成表单的命令方法
            SqlTransaction MyTransaction = null;  //事务定义

            string WhereSql;
            string LocateStr;
            long CurID = 0;
            string tempIDName;
            tempIDName = TableName.ToUpper() + "ID";

            WhereSql = this.GetWhereSql(LocatList);

            conn = new SqlConnection(mConnectInfo);
            dbCommand = new SqlCommand();
            dbCommand.Connection = conn;

            DataTable dt = new DataTable();
            ModifyOtherID = false;

            try
            {
                conn.Open(); //建立数据库连接

                MyTransaction = conn.BeginTransaction(); //开始事务
                dbCommand.Transaction = MyTransaction;

                //1.设置原来的所有记录为历史记录ZC9993='00'
                LocateStr = "Update " + TableName + " set ZC9993='00' " + WhereSql;
                dbCommand.CommandText = LocateStr;
                dbCommand.ExecuteNonQuery();

                //2.若插入的ID大于当前的ID,则将当前及其后的ID加100
                CurID = Convert.ToInt64(FieldValueList[tempIDName]);
                if (CurID >= BeforeID)
                {
                    LocateStr = "Update " + TableName + " set " + tempIDName + "=" + tempIDName + " + 100 " + WhereSql + " and " + tempIDName + ">=" + BeforeID;
                    dbCommand.CommandText = LocateStr;
                    dbCommand.ExecuteNonQuery();

                    ModifyOtherID = true; //修改其他ID标志位
                }

                //3.添加的记录的标志位ZC9993='10'
                LocateStr = "select * from " + TableName + WhereSql;
                dbCommand.CommandText = LocateStr;
                dbAdpter = new SqlDataAdapter(dbCommand);
                dbCommandBuilder = new SqlCommandBuilder(dbAdpter);

                dbAdpter.Fill(dt);

                string FieldName;
                object FieldValue;

                //赋新值
                DataRow dr = dt.NewRow();

                for (int i = 0; i <= FieldValueList.Count - 1; i++)
                {
                    FieldName = FieldValueList.GetKey(i).ToString();
                    FieldValue = FieldValueList.GetByIndex(i);
                    dr[FieldName] = FieldValue;
                }

                //新记录的标志位为10
                if (FieldValueList.ContainsKey("ZC9993"))
                {
                    dr["ZC9993"] = "10";
                }

                //添加一条记录
                dt.Rows.Add(dr);

                dbAdpter.Update(dt);

                //提交事务
                MyTransaction.Commit();

                return true;
            }
            catch (System.Data.SqlClient.SqlException ee)
            {
                MyTransaction.Rollback(); //事务回滚 
                ModifyOtherID = false;
                throw new Exception("InsertRecInMainSet:" + ee.Message);
            }
            finally
            {
                conn.Close();
            }
        } //InsertOneRec

        /// <summary>
        /// 修改一条记录
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="FieldValueList"></param>
        /// <returns></returns>
        public bool ModifyOneRec(string TableName, SortedList FieldValueList, SortedList PrimaryKeyList)
        {
            System.Data.SqlClient.SqlConnection conn;
            System.Data.SqlClient.SqlDataAdapter dbAdpter;  //数据适配器
            System.Data.SqlClient.SqlCommand dbCommand;  //数据操作命令
            System.Data.SqlClient.SqlCommandBuilder dbCommandBuilder; //提供自动生成表单的命令方法

            string WhereSql;

            WhereSql = this.GetWhereSql(PrimaryKeyList);

            conn = new SqlConnection(mConnectInfo);
            dbCommand = new SqlCommand();
            dbCommand.CommandText = "select * from " + TableName + WhereSql;
            dbCommand.Connection = conn;

            dbAdpter = new SqlDataAdapter(dbCommand);

            dbCommandBuilder = new SqlCommandBuilder(dbAdpter);

            DataTable dt = new DataTable(); ;

            try
            {
                conn.Open(); //建立数据库连接
                dbAdpter.Fill(dt);

                string FieldName;
                object FieldValue;

                //赋新值
                DataRow dr;
                for (int k = 0; k <= dt.Rows.Count - 1; k++)
                {
                    dr = dt.Rows[k];
                    for (int i = 0; i <= FieldValueList.Count - 1; i++)
                    {
                        FieldName = FieldValueList.GetKey(i).ToString();
                        FieldValue = FieldValueList.GetByIndex(i);
                        if (FieldValue == null) FieldValue = Convert.DBNull;
                        dr[FieldName] = FieldValue;
                        System.Diagnostics.Debug.WriteLine(FieldName + "=" + FieldValue);
                    }
                }

                dbAdpter.Update(dt);
                return true;
            }
            catch (System.Data.SqlClient.SqlException ee)
            {
                throw new Exception("ModifyOneRec:" + ee.Message);
            }
            finally
            {
                conn.Close();
            }
        }//ModifyOneRec

        /// <summary>
        /// 删除一条的记录
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="LocatList"></param>
        /// <returns></returns>
        public void DeleteOneRec(string InfoId, SortedList LocateList)
        {
            string strDel = "";

            try
            {
                //对子集采用事务处
                strDel = this.mSqlBuilder.GetDeleteSql(InfoId, LocateList);
                this.ExecuteSql(strDel);
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                throw new Exception("DeleteOneRec: " + e.Message);
            }
        }

        /// <summary>
        /// 获取指定条件的记录的语句
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetFilterSql(string InfoId, SortedList LocateList)
        {
            string tempSql;
            string WhereSql;
            try
            {
                WhereSql = GetWhereSql(LocateList);
                tempSql = "select *  from " + InfoId + WhereSql;
                return tempSql;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 获取删除的Sql语句 
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetDeleteSql(string InfoId, SortedList LocateList)
        {
            string tempSql;
            string WhereSql;

            WhereSql = GetWhereSql(LocateList);
            tempSql = "delete from " + InfoId + WhereSql;
            return tempSql;
        }

        /// <summary>
        /// 获取定位的Sql语句
        /// </summary>
        /// <returns></returns>
        public string GetWhereSql(SortedList LocateList)
        {
            string tempWhereSql;

            try
            {
                if (LocateList.GetByIndex(0) == null)
                {
                    return "";
                }
                else
                {
                    tempWhereSql = " where ";
                    for (int i = 0; i <= LocateList.Count - 1; i++)
                    {
                        string ValueSql;

                        ValueSql = GetSqlByValueType(LocateList.GetByIndex(i));
                        tempWhereSql = tempWhereSql + LocateList.GetKey(i) + "=" + ValueSql + " and ";
                    }

                    tempWhereSql = tempWhereSql.Substring(0, tempWhereSql.Length - 4);
                    return tempWhereSql;
                }
            }
            catch
            {
                return "";
            }
        }//GetWhereSql

        /// <summary>
        /// 根据数据类型获取值的Sql
        /// </summary>
        /// <param name="Value"></param>
        /// <returns></returns>
        private string GetSqlByValueType(object Value)
        {
            string ValueType;
            string ValueStr;

            try
            {
                ValueType = Value.GetType().FullName.Split(new char[] { '.' })[1]; ;

                switch (ValueType)
                {
                    case "STRING":
                        ValueStr = "'" + Value + "'";
                        break;
                    case "INT16":
                        ValueStr = Value.ToString();
                        break;
                    default:
                        ValueStr = "'" + Value + "'";
                        break;
                }

                return ValueStr;
            }
            catch (Exception e)
            {
                MessageBox.Show(e.StackTrace + e.Message);
                return "";
            }
        }

        /// <summary>
        /// 批量插入表中的所有数据
        /// </summary>
        /// <param name="TableName"></param>
        /// <param name="FieldValueList"></param>
        /// <param name="PrimaryKeyList"></param>
        /// <returns></returns>
        public void UpdateRightDataTable(string TableName, DataTable MyDataTable, string UserCode)
        {
            System.Data.SqlClient.SqlConnection conn;
            System.Data.SqlClient.SqlDataAdapter dbAdpter;  //数据适配器
            System.Data.SqlClient.SqlCommand dbCommand;  //数据操作命令
            System.Data.SqlClient.SqlCommand dbCommand2;  //数据操作命令
            System.Data.SqlClient.SqlCommandBuilder dbCommandBuilder; //提供自动生成表单的命令方法
            //System.Data.SqlClient.SqlTransaction tempTran;
            DataRow dr;
            SortedList tempForkeyList = new SortedList();

            conn = new SqlConnection(mConnectInfo);
            conn.Open();

            //开始事务
            //tempTran = conn.BeginTransaction();

            dbCommand = new SqlCommand();
            //dbCommand.Transaction =tempTran;
            dbCommand.CommandText = "select * from " + TableName + " where za0100 is null";
            dbCommand.Connection = conn;

            dbCommand2 = new SqlCommand();
            //dbCommand2.Transaction = tempTran;
            dbCommand2.CommandText = "Delete from " + TableName + " where ZA0100='" + UserCode + "'";
            dbCommand2.Connection = conn;
            dbCommand2.ExecuteNonQuery();

            dbAdpter = new SqlDataAdapter(dbCommand);
            dbCommandBuilder = new SqlCommandBuilder(dbAdpter);
            //dbAdpter.Fill(tempDT);

            SortedList tempFieldValueList = new SortedList();
            SortedList tempLocateList = new SortedList();

            tempForkeyList.Add("ZA0100", UserCode);

            //设置每行的ID值
            for (int i = 0; i <= MyDataTable.Rows.Count - 1; i++)
            {
                MyDataTable.Rows[i][TableName + "ID"] = this.GetChildSetAddId(TableName, tempForkeyList);
                dr = MyDataTable.Rows[i];
                tempFieldValueList.Clear();
                tempLocateList.Clear();
                tempLocateList.Add("ZA0100", "1");
                for (int j = 0; j <= MyDataTable.Columns.Count - 1; j++)
                {
                    tempFieldValueList.Add(MyDataTable.Columns[j].ColumnName, dr[j]);
                }
                this.AddOneRec(TableName, tempFieldValueList, tempLocateList);
            }

            //dbAdpter.Update(MyDataTable);

            //提交事务
            //tempTran.Commit();
        }//UpdataDataTable

        /// <summary>
        /// 获取子集添加的ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="ForeignKeyList">外键值</param>
        /// <returns></returns>
        private long GetChildSetAddId(string InfoId, SortedList ForeignKeyList)
        {
            string tempStr;
            DataTable dt;
            long nId;

            try
            {
                tempStr = this.mSqlBuilder.GetChildSetAddID(InfoId, ForeignKeyList);
                dt = GetDataTable(tempStr);
                nId = Convert.ToInt64(dt.Rows[0][0]);
                return nId;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 事务处理
        /// </summary>
        /// <param name="SqlList"></param>
        /// <returns></returns>
        public bool DoBatchWork(SortedList SqlList)
        {
            System.Data.SqlClient.SqlConnection conn;
            System.Data.SqlClient.SqlCommand dbCommand;
            System.Data.SqlClient.SqlTransaction tempTransaction = null;
            int i;
            string tempSql;

            conn = new SqlConnection(mConnectInfo);

            dbCommand = new SqlCommand();
            dbCommand.Connection = conn;

            try
            {
                conn.Open(); //建立数据库连接
                tempTransaction = conn.BeginTransaction();

                for (i = 0; i <= SqlList.Count - 1; i++)
                {
                    tempSql = SqlList.GetByIndex(i).ToString();
                    dbCommand.Transaction = tempTransaction;
                    dbCommand.CommandText = tempSql;
                    dbCommand.ExecuteNonQuery();
                }

                //提交事务
                tempTransaction.Commit();
                return true;
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                tempTransaction.Rollback();
                throw new Exception(e.Message);
            }
            finally
            {
                conn.Close();
            }
        }

        #region 条件定义处理

        /// <summary>
        ///更新表中的相关信息 
        /// </summary>
        /// <param name="serialNo"></param>
        /// <param name="sequenceNo"></param>
        /// <param name="TBL"></param>
        /// <param name="FLD"></param>
        /// <param name="CON"></param>
        /// <param name="EXP"></param>
        /// <param name="FUN"></param>
        /// <param name="SQL"></param>
        /// <returns></returns>
        public bool UpdateCondition(int serialNo, int sequenceNo, string TBL, string FLD, string CON, string EXP, string FUN, string SQL)
        {
            try
            {
                string strSQL;

                strSQL = " SET QUOTED_IDENTIFIER OFF  update gs_condition set TBL= " + (char)34 + TBL + (char)34 + " , FLB=" + (char)34 + FLD + (char)34 + " , EXP=" + (char)34 + EXP + (char)34 + " , FUN=" + (char)34 + FUN + (char)34 + " , CON=" + (char)34 + CON + (char)34 + ",setSql =" + (char)34 + SQL + (char)34 + " where serialNo=" + serialNo + " and sequenceNo=" + sequenceNo;
                this.ExecuteSql(strSQL);

                return true;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="MainObject"></param>
        /// <param name="TBL"></param>
        /// <param name="FLD"></param>
        /// <param name="CON"></param>
        /// <param name="EXP"></param>
        /// <param name="FUN"></param>
        /// <param name="SQL"></param>
        /// <param name="outSQL"></param>
        /// <returns></returns>
        public string runQuery(string MainObject, string TBL, string FLD, string CON, string EXP, string FUN, string SQL, string outSQL)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(mConnectInfo);

                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_SQLcondition";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@strMainObject", SqlDbType.VarChar, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = MainObject;
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@strTBL", SqlDbType.VarChar, 100);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = TBL;
                objcommand.Parameters.Add(sTBL);

                //传入字段列表
                SqlParameter sFLD = new SqlParameter("@strFLD", SqlDbType.VarChar, 500);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = FLD;
                objcommand.Parameters.Add(sFLD);

                //传入常量列表
                SqlParameter sCON = new SqlParameter("@strCON", SqlDbType.VarChar, 500);
                sCON.Direction = ParameterDirection.Input;
                sCON.Value = CON;
                objcommand.Parameters.Add(sCON);

                //传入表达式列表
                SqlParameter sEXP = new SqlParameter("@strEXP", SqlDbType.VarChar, 500);
                sEXP.Direction = ParameterDirection.Input;
                sEXP.Value = EXP;
                objcommand.Parameters.Add(sEXP);

                //传入函数列表
                SqlParameter sFUN = new SqlParameter("@strFUN", SqlDbType.VarChar, 500);
                sFUN.Direction = ParameterDirection.Input;
                sFUN.Value = FUN;
                objcommand.Parameters.Add(sFUN);
                //传入SQL
                SqlParameter sSQL = new SqlParameter("@strSQL", SqlDbType.VarChar, 2000);
                sSQL.Direction = ParameterDirection.Input;
                sSQL.Value = SQL;
                objcommand.Parameters.Add(sSQL);
                //传出变量
                SqlParameter soutSQL = new SqlParameter("@stroutSQL", SqlDbType.VarChar, 5000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                outSQL = (string)soutSQL.Value;
                return outSQL;
            }
            catch
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        #endregion

    } //class
}  //namespace
