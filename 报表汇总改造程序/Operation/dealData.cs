using System;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using DMServer.Common;
using System.Xml;

namespace Report.stat
{
    /// <summary>
    /// Class1 的摘要说明。
    /// </summary>
    public class dealData
    {
        #region 银行报盘

        //反查
        public string BankQuery(int BankId, string condition, string subcondition)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_bank_Requery";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@bankid", SqlDbType.Int);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = BankId;
                objcommand.Parameters.Add(sMainObject);

                //传入表达式列表
                SqlParameter sSTRCondtion = new SqlParameter("@STRCondtion", SqlDbType.VarChar, 6000);
                sSTRCondtion.Direction = ParameterDirection.Input;
                sSTRCondtion.Value = condition;
                objcommand.Parameters.Add(sSTRCondtion);

                //传入表达式列表
                SqlParameter sSTRCondtion1 = new SqlParameter("@subconditon", SqlDbType.VarChar, 6000);
                sSTRCondtion1.Direction = ParameterDirection.Input;
                sSTRCondtion1.Value = subcondition;
                objcommand.Parameters.Add(sSTRCondtion1);

                //传出变量
                SqlParameter soutSQL = new SqlParameter("@strOut", SqlDbType.VarChar, 6000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                return (string)soutSQL.Value;
            }
            catch
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        #endregion

        //反查
        public string ReQuery(string MainObject, string TBL, string FLD, string ASS, string condition)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_Requery";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@strMainObject", SqlDbType.VarChar, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = MainObject;
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@TBL", SqlDbType.VarChar, 1000);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = TBL;
                objcommand.Parameters.Add(sTBL);

                //传入字段列表
                SqlParameter sFLD = new SqlParameter("@FLD", SqlDbType.VarChar, 2000);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = FLD;
                objcommand.Parameters.Add(sFLD);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@ASS", SqlDbType.VarChar, 1000);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = ASS;
                objcommand.Parameters.Add(sASS);

                //传入表达式列表
                SqlParameter sSTRCondtion = new SqlParameter("@STRCondtion", SqlDbType.VarChar, 6000);
                sSTRCondtion.Direction = ParameterDirection.Input;
                sSTRCondtion.Value = condition;
                objcommand.Parameters.Add(sSTRCondtion);

                //传出变量
                SqlParameter soutSQL = new SqlParameter("@strOut", SqlDbType.VarChar, 6000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                return (string)soutSQL.Value;
            }
            catch
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        //cc 20051010 反查 预警中调用原此方法时，当FLD为子集的字段时返还的条件有问题，改写存储过程，解决FLD为子集时的情况
        public string ReQueryForChildObject(string MainObject, string TBL, string FLD, string ASS, string condition)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_RequeryForChildObject";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@strMainObject", SqlDbType.VarChar, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = MainObject;
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@TBL", SqlDbType.VarChar, 1000);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = TBL;
                objcommand.Parameters.Add(sTBL);

                //传入字段列表
                SqlParameter sFLD = new SqlParameter("@FLD", SqlDbType.VarChar, 2000);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = FLD;
                objcommand.Parameters.Add(sFLD);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@ASS", SqlDbType.VarChar, 1000);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = ASS;
                objcommand.Parameters.Add(sASS);

                //传入表达式列表
                SqlParameter sSTRCondtion = new SqlParameter("@STRCondtion", SqlDbType.VarChar, 6000);
                sSTRCondtion.Direction = ParameterDirection.Input;
                sSTRCondtion.Value = condition;
                objcommand.Parameters.Add(sSTRCondtion);

                //传出变量
                SqlParameter soutSQL = new SqlParameter("@strOut", SqlDbType.VarChar, 6000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                return (string)soutSQL.Value;
            }
            catch
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        public SqlDataReader getRApp(int TypeNo, int SetTableNo, int TableNo, string Zb0110, string strTable, string starttime)
        {
            try
            {
                if (Zb0110 == "-1")
                {
                    Zb0110 = "0";
                }
                if (starttime != "")
                {
                    string strSQl;
                    if (starttime == "1")
                    {
                        strSQl = "select * from " + strTable + " where  zb0110='" + Zb0110 + "' and zc9993='" + starttime + "' order by rowid";
                    }
                    else
                    {
                        strSQl = "select * from " + strTable + " where  zb0110='" + Zb0110 + "' and starttime='" + starttime + "' order by rowid";
                    }
                    GC.Collect();
                    SqlConnection objConn = new SqlConnection(dbConnectString);
                    objConn.Open();
                    SqlDataReader objdataReader;
                    SqlCommand objCommand = new SqlCommand(strSQl);
                    objCommand.Connection = objConn;
                    objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                    //objdataReader = objCommand.ExecuteReader();
                    return objdataReader;
                }
                else
                {
                    return null;
                }
            }
            catch
            {
                return null;
            }
        }

        public SqlDataReader getRApp(int TypeNo, int SetTableNo, int TableNo, string Zb0110, string strTable, int rowid, string strselect, string strgroup)
        {
            try
            {
                if (Zb0110 == "-1")
                {
                    Zb0110 = "0";
                }
                string strSQl;

                strSQl = "select " + strselect + " from " + strTable
                    + " left join " + strgroup.Substring(0, 4) + " on zb0110 = za0100  where  zb0110 in (" + Zb0110 + ") and " + strTable + ".zc9993='1' and rowid = " + rowid + " group by " + strgroup;

                GC.Collect();
                SqlConnection objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand(strSQl);
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch
            {
                return null;
            }
        }

        public SqlDataReader getRC_R(int TypeNo, int SetTableNo, int TableNo)
        {
            SqlConnection objConn = null;
            SqlCommand objCommand = null;
            try
            {
                string Strsql;
                Strsql = "select  startrow,startcol,endrow,endcol,icount,serialtype from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno where   r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and r202.serialtype in ('1','2') order by r202.serialtype";
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                objCommand = new SqlCommand(Strsql);
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                //objCommand.Dispose();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
                objConn = null;
                objCommand = null;
                throw new Exception(e.Message);
            }
        }

        public DataTable getTable(string strsql)
        {
            GC.Collect();
            SqlConnection objConn = new SqlConnection(dbConnectString);
            objConn.Open();
            SqlDataAdapter dsCommand;
            DataSet dataSet = new DataSet();
            dsCommand = new SqlDataAdapter(strsql, objConn);
            dsCommand.Fill(dataSet, "ddd");
            return dataSet.Tables[0];
        }

        public SqlDataReader getOneCondition(int TypeNo, int SetTableNo, int TableNo, int sequenceNo, string serialtype)
        {
            SqlConnection objConn = null;
            SqlCommand objCommand = null;
            try
            {
                string strsql;
                if (sequenceNo == -1)
                {
                    strsql = "select baseexpr,baseitem,sequencetype,chineseitem from r202 left join r203 on r202.typeno=r203.typeno and r202.settableno=r203.settableno and r202.tableno=r203.tableno and r202.serialno=r203.serialno  where   r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and r202.serialtype = '" + serialtype + "'";
                }
                else
                {
                    strsql = "select baseexpr,baseitem,sequencetype,chineseitem from r202 left join r203 on r202.typeno=r203.typeno and r202.settableno=r203.settableno and r202.tableno=r203.tableno and r202.serialno=r203.serialno  where   r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and r202.serialtype = '" + serialtype + "' and sequenceno=" + sequenceNo;
                }
                GC.Collect();

                objConn = new SqlConnection(dbConnectString);
                objConn.Close();
                objConn.Open();
                SqlDataReader objdataReader;
                objCommand = new SqlCommand(strsql);
                objCommand.Connection = objConn;

                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
                objConn = null;
                throw new Exception(e.Message);
            }
        }

        //获取单元条件
        public SqlDataReader getUnitCondition(int TypeNo, int SetTableNo, int TableNo, string serialtype, int row, int col)
        {
            SqlConnection objConn = null;
            try
            {
                string strsql;
                //strsql = "select baseexpr,baseitem,chineseitem, startrow,startcol,endrow,endcol,icount,serialtype from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno  left join r203 on  r201.typeno=r203.typeno and r201.settableno=r203.settableno and r201.tableno=r203.tableno  and r201.serialno=r203.serialno   where   r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and r202.serialtype = '" + serialtype + "' and r201.startrow=" + row + " and r201.startcol=" + col;
                strsql = "select baseexpr,baseitem,chineseitem, startrow,startcol,endrow,endcol,icount,serialtype,sequenceType from r201 left join  r202 on r201.typeno=r202.typeno and r201.settableno=r202.settableno and r201.tableno=r202.tableno  and r201.serialno=r202.serialno  left join r203 on  r201.typeno=r203.typeno and r201.settableno=r203.settableno and r201.tableno=r203.tableno  and r201.serialno=r203.serialno   where   r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and  r201.startrow=" + row + " and r201.startcol=" + col;
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand(strsql);
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
                throw new Exception(e.Message);
            }
        }

        //获取单元数据
        public SqlDataReader getUnitResult(int TypeNo, int SetTableNo, int TableNo, string AB0110, string strtime)
        {
            SqlConnection objConn = null;
            try
            {
                string strsql;
                if (AB0110 == "-1")
                {
                    AB0110 = "0";
                }
                if (strtime != "1")
                {
                    strsql = "select  typeno,settableno,tableno,svalue,row,col,zc9993 from r230  where   typeno=" + TypeNo + " and SetTableNo=" + SetTableNo + " and tableno=" + TableNo + "  and zb0110 = '" + AB0110 + "' and starttime = '" + strtime + "' ";
                }
                else
                {
                    strsql = "select  typeno,settableno,tableno,svalue,row,col,zc9993 from r230  where   typeno=" + TypeNo + " and SetTableNo=" + SetTableNo + " and tableno=" + TableNo + "  and zb0110 = '" + AB0110 + "' and zc9993 = '1' ";
                }
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand(strsql);
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }

                throw new Exception(e.Message);
            }
        }

        //得到全表条件
        public SqlDataReader getWhole_condition(int TypeNo, int SetTableNo, int TableNo)
        {
            SqlConnection objConn = null;
            try
            {
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand("select top 1 r202.mainobject,baseexpr,baseitem from  r202 left join r203 on r203.typeno=r202.typeno and r203.settableno=r202.settableno and r203.tableno=r202.tableno  and r203.serialno=r202.serialno where    r202.typeno=" + TypeNo + " and r202.SetTableNo=" + SetTableNo + " and r202.tableno=" + TableNo + "  and r202.serialtype ='0'");
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
                throw new Exception(e.Message);
            }
        }

        //		--主对象
        //			  @strMainObject varchar(4),
        //		--单位编码
        //			  @ZB0110 varchar(20),
        //		--类别
        //			  @typeno int,
        //		--套表
        //			  @settableNo int,
        //		--表号
        //			  @tableno int,
        //		--表名列表
        //			  @strTBL varchar(100),
        //		--字段名列表
        //			  @strFLD varchar(500),
        //		--常量
        //			  @strCON varchar(500),
        //		--表达式
        //			  @strEXP varchar(500),
        //		--函数
        //			  @strFUN varchar(500),
        //		--数字开始时间
        //			  @starttime varchar(20),
        //		--数字结束时间
        //			  @endTime varchar(20),
        //		--全表条件
        //			  @WholeCondition varchar(2000),--全表条件应该是与单位或部门合并后的条件
        //												  --全表条件定义项,如果全表条件用到前五种表达式，则用到该变量
        //																			   @WholeConditionDEF varchar(2000),
        //		--关联字段
        //			  @objectAssicate varchar(2000)
        public int StatTBL(string strMainObject, string ZB0110, int typeno, int settableno, int tableNo, string strTBL, string strFLD, string strCON, string strEXP, string strFUN, string starttime, string endTime, string WholeCondition, string objectAssicate, string userId, int isLikeZB0110)
        {
            string strerror = "";

            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);

                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_stat";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sstrMainObject = new SqlParameter("@strMainObject", SqlDbType.VarChar, 4);
                sstrMainObject.Direction = ParameterDirection.Input;
                sstrMainObject.Value = strMainObject;
                objcommand.Parameters.Add(sstrMainObject);
                //传入单位编码
                SqlParameter sZB0110 = new SqlParameter("@ZB0110", SqlDbType.VarChar, 20);
                sZB0110.Direction = ParameterDirection.Input;
                sZB0110.Value = ZB0110;
                objcommand.Parameters.Add(sZB0110);

                //传入套表名
                SqlParameter stypeno = new SqlParameter("@typeno", SqlDbType.Int);
                stypeno.Direction = ParameterDirection.Input;
                stypeno.Value = typeno;
                objcommand.Parameters.Add(stypeno);

                //传入套表名
                SqlParameter ssetTableNo = new SqlParameter("@setTableNo", SqlDbType.Int);
                ssetTableNo.Direction = ParameterDirection.Input;
                ssetTableNo.Value = settableno;
                objcommand.Parameters.Add(ssetTableNo);

                //传入表名
                SqlParameter stableNo = new SqlParameter("@tableNo", SqlDbType.Int);
                stableNo.Direction = ParameterDirection.Input;
                stableNo.Value = tableNo;
                objcommand.Parameters.Add(stableNo);

                SqlParameter sstrTBL = new SqlParameter("@strTBL", SqlDbType.VarChar, 100);
                sstrTBL.Direction = ParameterDirection.Input;
                sstrTBL.Value = strTBL;
                objcommand.Parameters.Add(sstrTBL);

                SqlParameter sstrFLD = new SqlParameter("@strFLD", SqlDbType.VarChar, 500);
                sstrFLD.Direction = ParameterDirection.Input;
                sstrFLD.Value = strFLD;
                objcommand.Parameters.Add(sstrFLD);

                SqlParameter sstrCON = new SqlParameter("@strCON", SqlDbType.VarChar, 500);
                sstrCON.Direction = ParameterDirection.Input;
                sstrCON.Value = strCON;
                objcommand.Parameters.Add(sstrCON);

                SqlParameter sstrEXP = new SqlParameter("@strEXP", SqlDbType.VarChar, 500);
                sstrEXP.Direction = ParameterDirection.Input;
                sstrEXP.Value = strEXP;
                objcommand.Parameters.Add(sstrEXP);

                SqlParameter sstrFUN = new SqlParameter("@strFUN", SqlDbType.VarChar, 500);
                sstrFUN.Direction = ParameterDirection.Input;
                sstrFUN.Value = strFUN;
                objcommand.Parameters.Add(sstrFUN);

                SqlParameter sstarttime = new SqlParameter("@starttime", SqlDbType.VarChar, 20);
                sstarttime.Direction = ParameterDirection.Input;
                sstarttime.Value = starttime;
                objcommand.Parameters.Add(sstarttime);

                SqlParameter sendTime = new SqlParameter("@endTime", SqlDbType.VarChar, 20);
                sendTime.Direction = ParameterDirection.Input;
                sendTime.Value = endTime;
                objcommand.Parameters.Add(sendTime);

                SqlParameter sWholeCondition = new SqlParameter("@WholeCondition", SqlDbType.VarChar, 2000);
                sWholeCondition.Direction = ParameterDirection.Input;
                sWholeCondition.Value = WholeCondition;
                objcommand.Parameters.Add(sWholeCondition);

                SqlParameter sobjectAssicate = new SqlParameter("@objectAssicate", SqlDbType.VarChar, 2000);
                sobjectAssicate.Direction = ParameterDirection.Input;
                sobjectAssicate.Value = objectAssicate;
                objcommand.Parameters.Add(sobjectAssicate);
                //wl20020905-------------------------------------------------------------

                SqlParameter suserid = new SqlParameter("@userid", SqlDbType.VarChar, 20);
                suserid.Direction = ParameterDirection.Input;
                suserid.Value = userId;
                objcommand.Parameters.Add(suserid);
                //-------------------------------------------------------------
                //SqlParameter sWholeConditionDEF = new SqlParameter("@WholeConditionDEF", SqlDbType.VarChar, 2000);
                //sWholeConditionDEF.Direction = ParameterDirection.Input;
                //sWholeConditionDEF.Value = "";
                //objcommand.Parameters.Add(sWholeConditionDEF);
                SqlParameter susererr = new SqlParameter("@outSQL", SqlDbType.VarChar, 5000);
                susererr.Direction = ParameterDirection.Output;
                susererr.Value = strerror;
                objcommand.Parameters.Add(susererr);

                SqlParameter isLike = new SqlParameter("@isLikeZB0110", SqlDbType.Bit, 1);
                isLike.Direction = ParameterDirection.Input;
                isLike.Value = isLikeZB0110;
                objcommand.Parameters.Add(isLike);
                try
                {
                    rptWriteToFile("flxp_rpt_stat  ,|" + strMainObject + "|,|" + ZB0110 + "|,|" + typeno
                        + "|,|" + settableno + "|,|" + tableNo + "|,|" + strTBL + "|,|" + strFLD + "|,| "
                        + strCON + "|,|" + strEXP + "|,|" + strFUN + "|,|" + starttime + "|,|" + endTime
                        + "|,|" + WholeCondition + "|,|" + objectAssicate + "|,|" + userId);
                }
                catch
                { }

                try
                {
                    //mod by wx 20060417 (flxzh整合产品20061129)
                    objcommand.CommandTimeout = 36000;
                    //end wx
                    objcommand.ExecuteNonQuery();
                    strerror = susererr.Value.ToString();
                }
                catch
                {
                    strerror = susererr.Value.ToString();
                }
                objcommand.Connection.Close();
                return 0;
            }
            catch (Exception e)
            {
                return 0;
                //throw new Exception(e.Message );
            }
        }

        /// <summary>
        /// 将当前登录信息写到配置文件中
        /// </summary>
        /// <param name="CurHostName"></param>
        /// <param name="CurSqlServer"></param>
        /// <param name="CurAppLoginName"></param>
        private void rptWriteToFile(string strrpt)
        {
            System.IO.StreamWriter sw;
            string str;

            try
            {
                sw = new System.IO.StreamWriter(System.Windows.Forms.Application.StartupPath + @"\rpt.txt", false);
                str = strrpt;
                sw.WriteLine(str);
                sw.Close();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        //读出主关联的对象及其值
        public SqlDataReader getMainAssicate(string MainObject)
        {
            try
            {
                GC.Collect();
                SqlConnection objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand("select infoIDA,infoidb,propertySet  from gs_ObjectAssociate  where  infoidb like '%" + MainObject + "%'");
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public SqlDataReader getAssicate(string MainObject)
        {
            SqlConnection objConn = null;
            try
            {
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand("select propertySet  from gs_ObjectAssociate  where  infoida='" + MainObject + "'");
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }

                throw new Exception(e.Message);
            }
        }

        public SqlDataReader getTableField(int TypeNo, int SetTableNo, int TableNo)
        {
            SqlConnection objConn = null;
            try
            {
                GC.Collect();
                objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlDataReader objdataReader;
                SqlCommand objCommand = new SqlCommand("select baseitem,baseexpr,sequenceno,dealfieldname from R203 where typeno=" + TypeNo + " and SetTableNo=" + SetTableNo + " and tableno=" + TableNo);
                objCommand.Connection = objConn;
                objdataReader = objCommand.ExecuteReader(CommandBehavior.CloseConnection);
                //objdataReader = objCommand.ExecuteReader();
                return objdataReader;
            }
            catch (Exception e)
            {
                if (objConn != null && objConn.State == ConnectionState.Open)
                {
                    objConn.Close();
                }
                objConn = null;
                throw new Exception(e.Message);
            }
        }

        //生成表结构---------------------------------------------------------------------------
        public int CreateAppTBL(int typeno, int settableno, int tableNo)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);

                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_create_AppTable";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入类别名
                SqlParameter sTypeNo = new SqlParameter("@typeNo", SqlDbType.Int);
                sTypeNo.Direction = ParameterDirection.Input;
                sTypeNo.Value = typeno;
                objcommand.Parameters.Add(sTypeNo);

                //传入套表名
                SqlParameter ssetTableNo = new SqlParameter("@setTableNo", SqlDbType.Int);
                ssetTableNo.Direction = ParameterDirection.Input;
                ssetTableNo.Value = settableno;
                objcommand.Parameters.Add(ssetTableNo);

                //传入表名
                SqlParameter stableNo = new SqlParameter("@tableNo", SqlDbType.Int);
                stableNo.Direction = ParameterDirection.Input;
                stableNo.Value = tableNo;
                objcommand.Parameters.Add(stableNo);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                return 0;
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
                return 0;
            }
        }

        //sdkfsdfsadf
        string dbConnectString;
        //更新表中的相关信息
        public bool UpdateCondition(int serialNo, int sequenceNo, string TBL, string FLD, string CON, string EXP, string FUN, string SQL)
        {
            try
            {
                SqlConnection objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlCommand objcommand = new SqlCommand();
                string strSQL;
                objcommand.Connection = objConn;
                strSQL = " SET QUOTED_IDENTIFIER OFF  update gs_condition set TBL= " + (char)34 + TBL + (char)34 + " , FLB=" + (char)34 + FLD + (char)34 + " , EXP=" + (char)34 + EXP + (char)34 + " , FUN=" + (char)34 + FUN + (char)34 + " , CON=" + (char)34 + CON + (char)34 + ",setSql =" + (char)34 + SQL + (char)34 + " where serialNo=" + serialNo + " and sequenceNo=" + sequenceNo;
                objcommand.CommandText = strSQL;
                objcommand.ExecuteNonQuery();

                return true;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public string runQuery(string MainObject, string TBL, string FLD, string CON, string EXP, string FUN, string SQL, string outSQL)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
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

        //报表反查用（组成sql语句）为处理数字开始时间和截止时间
        public string runQuery(string MainObject, string TBL, string FLD, string CON, string EXP, string FUN, string SQL, string outSQL, int m_TypeNo, int m_SetTableNo, int m_TableNo, string sUserID)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
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

                //....
                //类别号
                SqlParameter stypeno = new SqlParameter("@typeno", SqlDbType.Int, 4);
                stypeno.Direction = ParameterDirection.Input;
                stypeno.Value = m_TypeNo;
                objcommand.Parameters.Add(stypeno);

                //套表号
                SqlParameter ssettableno = new SqlParameter("@settableno", SqlDbType.Int, 4);
                ssettableno.Direction = ParameterDirection.Input;
                ssettableno.Value = m_SetTableNo;
                objcommand.Parameters.Add(ssettableno);

                //报表号
                SqlParameter stableno = new SqlParameter("@tableno", SqlDbType.Int, 4);
                stableno.Direction = ParameterDirection.Input;
                stableno.Value = m_TableNo;
                objcommand.Parameters.Add(stableno);

                //用户
                SqlParameter suserid = new SqlParameter("@userid", SqlDbType.VarChar, 100);
                suserid.Direction = ParameterDirection.Input;
                suserid.Value = sUserID;
                objcommand.Parameters.Add(suserid);

                //.....
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

        //asdfkjaskdf

        public dealData()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //

            dbConnectString = "server=" + ConfigMy.ConnectInfo[0] + ";uid=" + ConfigMy.ConnectInfo[2]
                + ";pwd=" + ConfigMy.ConnectInfo[3] + ";database=" + ConfigMy.ConnectInfo[1] + ";Connection Lifetime = 180";
        }

        //--行检验公式处理，返回检验未通过的校验公式
        //CREATE   procedure dbo.gsp_innercheck
        //@typeno varchar(20),--类别
        //@settableno varchar(20),--套表
        //@rptno      varchar(20),--报表表号
        //@za0100 varchar(20),--单位编码
        //@starttime varchar(10),--统计时间
        //@revalue  varchar(8000)  OUT
        //只校验当前数据
        public string RptInnerCheck(string zb0110, int typeno, int settableno, int tableno)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "gsp_innercheck";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.VarChar, 20);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = typeno.ToString();
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.VarChar, 20);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = settableno.ToString();
                objcommand.Parameters.Add(sTBL);

                //传入字段列表
                SqlParameter sFLD = new SqlParameter("@rptno", SqlDbType.VarChar, 20);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = tableno.ToString();
                objcommand.Parameters.Add(sFLD);

                SqlParameter sFLD1 = new SqlParameter("@za0100", SqlDbType.VarChar, 20);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = zb0110;
                objcommand.Parameters.Add(sFLD1);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@starttime", SqlDbType.VarChar, 10);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = "";
                objcommand.Parameters.Add(sASS);
                
                //传出变量
                SqlParameter soutSQL = new SqlParameter("@revalue", SqlDbType.VarChar, 7000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                try
                {
                    objcommand.ExecuteNonQuery();
                    objcommand.Connection.Close();
                    return (string)soutSQL.Value;
                }
                catch
                {
                    return (string)soutSQL.Value;
                }
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        //--行检验公式处理，返回检验未通过的校验公式
        //CREATE   procedure dbo.gsp_innercheck
        //@typeno varchar(20),--类别
        //@settableno varchar(20),--套表
        //@rptno      varchar(20),--报表表号
        //@za0100 varchar(20),--单位编码
        //@starttime varchar(10),--统计时间
        //@revalue  varchar(8000)  OUT
        //只校验当前数据
        public string RptCheck(string zb0110, int typeno, int settableno)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "gsp_tablecheck";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.VarChar, 20);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = typeno.ToString();
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.VarChar, 20);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = settableno.ToString();
                objcommand.Parameters.Add(sTBL);

                SqlParameter sFLD1 = new SqlParameter("@za0100", SqlDbType.VarChar, 20);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = zb0110;
                objcommand.Parameters.Add(sFLD1);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@starttime", SqlDbType.VarChar, 10);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = "";
                objcommand.Parameters.Add(sASS);
                
                //传出变量
                SqlParameter soutSQL = new SqlParameter("@revalue", SqlDbType.VarChar, 7000);
                soutSQL.Direction = ParameterDirection.Output;
                soutSQL.Value = "";
                objcommand.Parameters.Add(soutSQL);
                try
                {
                    objcommand.ExecuteNonQuery();
                    objcommand.Connection.Close();
                    return (string)soutSQL.Value;
                }
                catch (Exception ee)
                {
                    return (string)soutSQL.Value;
                }
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        public string RptInnerFormula(string zb0110, int typeno, int settableno, int tableno)
        {
            try
            {
                if (zb0110 == null || zb0110 == "-1")
                {
                    zb0110 = "0";
                }
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "gsp_innerFormula";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.VarChar, 20);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = typeno.ToString();
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.VarChar, 20);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = settableno.ToString();
                objcommand.Parameters.Add(sTBL);

                //传入字段列表
                SqlParameter sFLD = new SqlParameter("@rptno", SqlDbType.VarChar, 20);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = tableno.ToString();
                objcommand.Parameters.Add(sFLD);

                SqlParameter sFLD1 = new SqlParameter("@za0100", SqlDbType.VarChar, 20);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = zb0110;
                objcommand.Parameters.Add(sFLD1);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@starttime", SqlDbType.VarChar, 10);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = "";
                objcommand.Parameters.Add(sASS);
                try
                {
                    objcommand.ExecuteNonQuery();
                    objcommand.Connection.Close();
                    return "";
                }
                catch
                {
                    return "";
                }
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        //--行检验公式处理，返回检验未通过的校验公式
        //CREATE   procedure dbo.gsp_innercheck
        //@typeno varchar(20),--类别
        //@settableno varchar(20),--套表
        //@rptno      varchar(20),--报表表号
        //@za0100 varchar(20),--单位编码
        //@starttime varchar(10),--统计时间
        //@revalue  varchar(8000)  OUT
        //只校验当前数据
        public string RptFormula(string zb0110, int typeno, int settableno)
        {
            try
            {
                if (zb0110 == null || zb0110 == "-1")
                {
                    zb0110 = "0";
                }
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "gsp_tableFormula";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //传入主对象
                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.VarChar, 20);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = typeno.ToString();
                objcommand.Parameters.Add(sMainObject);

                //传入表名列表
                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.VarChar, 20);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = settableno.ToString();
                objcommand.Parameters.Add(sTBL);

                SqlParameter sFLD1 = new SqlParameter("@za0100", SqlDbType.VarChar, 20);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = zb0110;
                objcommand.Parameters.Add(sFLD1);

                //传入关联字段
                SqlParameter sASS = new SqlParameter("@starttime", SqlDbType.VarChar, 10);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = "";
                objcommand.Parameters.Add(sASS);

                try
                {
                    objcommand.ExecuteNonQuery();
                    objcommand.Connection.Close();
                    return "";
                }
                catch
                {
                    return "";
                }
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
                return "";
            }
        }

        /// <summary>
        /// 拷贝套表
        /// </summary>
        /// <returns></returns>
        public void RptCopy(int iTypeNoA, int iSetTableNoA, int iTableNoA, int iTypeNoB, int iSetTableNoB, int iTableNoB)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_Copy";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf

                SqlParameter sMainObject = new SqlParameter("@typenoB", SqlDbType.Int, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = iTypeNoB;
                objcommand.Parameters.Add(sMainObject);

                SqlParameter sTBL = new SqlParameter("@settablenoB", SqlDbType.Int, 4);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = iSetTableNoB;
                objcommand.Parameters.Add(sTBL);

                SqlParameter sFLD = new SqlParameter("@tablenoB", SqlDbType.Int, 4);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = iTableNoB;
                objcommand.Parameters.Add(sFLD);

                SqlParameter sFLD1 = new SqlParameter("@typeNoA", SqlDbType.Int, 4);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = iTypeNoA;
                objcommand.Parameters.Add(sFLD1);

                SqlParameter sASS = new SqlParameter("@settablenoA", SqlDbType.Int, 4);
                sASS.Direction = ParameterDirection.Input;
                sASS.Value = iSetTableNoA;
                objcommand.Parameters.Add(sASS);

                SqlParameter soutSQL = new SqlParameter("@tablenoA", SqlDbType.Int, 4);
                soutSQL.Direction = ParameterDirection.Input;
                soutSQL.Value = iTableNoA;
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
            }
        }

        public bool UpdateTableName(int iTypeNo, int iSetTableNo, int iTableNo, string strname, string strMemo)
        {
            try
            {
                SqlConnection objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlCommand objcommand = new SqlCommand();
                string strSQL;
                objcommand.Connection = objConn;
                strSQL = " SET QUOTED_IDENTIFIER OFF  update r200 set name = '"
                    + strname + "',rptMemo = '" + strMemo + "'  where  typeno = " + iTypeNo + "  and  settableno = "
                    + iSetTableNo + "  and  tableno = " + iTableNo;
                objcommand.CommandText = strSQL;
                objcommand.ExecuteNonQuery();

                return true;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        //处理汇总统计报表中的序列
        //清空序列中的条件,定义汇总字段对应的序列号
        public bool UpdateGatherTable(int iTypeNo, int iSetTableNo, int iTableNo)
        {
            try
            {
                SqlConnection objConn = new SqlConnection(dbConnectString);
                objConn.Open();
                SqlCommand objcommand = new SqlCommand();
                string strSQL;
                objcommand.Connection = objConn;
                strSQL = " SET QUOTED_IDENTIFIER OFF  update r203 set baseexpr = '',baseitem = ''"
                    + ",setsql = '',chineseitem='',gathersequence = sequenceno  where  typeno = " + iTypeNo + "  and  settableno = "
                    + iSetTableNo + "  and  tableno = " + iTableNo;
                objcommand.CommandText = strSQL;
                objcommand.ExecuteNonQuery();

                return true;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 删除套表
        /// </summary>
        /// <returns></returns>
        public void RptDelete(int iTypeNo, int iSetTableNo, int iTableNo, string strzb0110, string strtime)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_delete";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf

                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.Int, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = iTypeNo;
                objcommand.Parameters.Add(sMainObject);

                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.Int, 4);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = iSetTableNo;
                objcommand.Parameters.Add(sTBL);

                SqlParameter sFLD = new SqlParameter("@tableno", SqlDbType.Int, 4);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = iTableNo;
                objcommand.Parameters.Add(sFLD);

                SqlParameter sFLD1 = new SqlParameter("@ZB0110", SqlDbType.VarChar, 20);
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = strzb0110;
                objcommand.Parameters.Add(sFLD1);

                SqlParameter soutSQL = new SqlParameter("@starttime", SqlDbType.VarChar, 20);
                soutSQL.Direction = ParameterDirection.Input;
                soutSQL.Value = strtime;
                objcommand.Parameters.Add(soutSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
            }
            catch (Exception e)
            {
                //throw new Exception(e.Message );
            }
        }

        /// <summary>
        /// 报表汇总
        /// --2005.5.10 fw 汇总的单位是当前统计单位--
        /// 在flxp_rpt_gather中在添加一个参数@statDep，用来传递当前统计单位
        /// </summary>
        /// <returns></returns>
        public void Rptgather(int iTypeNo, int iSetTableNo, int iTableNo, string strzb0110, string statDep)
        {
            try
            {
                statDep = "'" + statDep + "'";
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = new SqlConnection(dbConnectString);
                objcommand.Connection.Open();
                objcommand.CommandTimeout = 5000;
                objcommand.CommandText = "flxp_rpt_gather";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf

                SqlParameter sMainObject = new SqlParameter("@typeno", SqlDbType.Int, 4);
                sMainObject.Direction = ParameterDirection.Input;
                sMainObject.Value = iTypeNo;
                objcommand.Parameters.Add(sMainObject);

                SqlParameter sTBL = new SqlParameter("@settableno", SqlDbType.Int, 4);
                sTBL.Direction = ParameterDirection.Input;
                sTBL.Value = iSetTableNo;
                objcommand.Parameters.Add(sTBL);

                SqlParameter sFLD = new SqlParameter("@tableno", SqlDbType.Int, 4);
                sFLD.Direction = ParameterDirection.Input;
                sFLD.Value = iTableNo;
                objcommand.Parameters.Add(sFLD);

                //cc 20060227 统计单位过多时长度不够
                //SqlParameter sFLD1 = new SqlParameter("@ZB0110", SqlDbType.VarChar,100);
                SqlParameter sFLD1 = new SqlParameter("@ZB0110", SqlDbType.VarChar, 4000);
                //end cc
                sFLD1.Direction = ParameterDirection.Input;
                sFLD1.Value = strzb0110;
                objcommand.Parameters.Add(sFLD1);

                SqlParameter sFLD2 = new SqlParameter("@statDep", SqlDbType.VarChar, 100);
                sFLD2.Direction = ParameterDirection.Input;
                sFLD2.Value = statDep;
                objcommand.Parameters.Add(sFLD2);

                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// 计算公式处理过程
        /// </summary>
        /// <param name="TBL"></param>
        /// <param name="MainObj"></param>
        /// <returns></returns>
        public void myDealExpressions(String fomulaIds, String Conditions)
        {
            string[] dbConnectString = DMServer.Common.ConfigMy.ConnectInfo;
            string strConnectInfo = "server=" + dbConnectString[0] + ";uid=" + dbConnectString[2]
                + ";pwd=" + dbConnectString[3] + ";database=" + dbConnectString[1];

            SqlCommand tempSqlCommand = new SqlCommand();
            tempSqlCommand.Connection = new SqlConnection(strConnectInfo);
            tempSqlCommand.Connection.Open();
            tempSqlCommand.CommandText = "flxp_info_dealformula";
            tempSqlCommand.CommandType = CommandType.StoredProcedure;

            //实例化参数
            SqlParameter tempUserId = new SqlParameter("@formulaid", SqlDbType.VarChar, 5000);
            tempUserId.Direction = ParameterDirection.Input;
            tempUserId.Value = fomulaIds;
            tempSqlCommand.Parameters.Add(tempUserId);

            //实例化参数
            SqlParameter tempFuncId = new SqlParameter("@rycondtion", SqlDbType.VarChar, 2000);
            tempFuncId.Direction = ParameterDirection.Input;
            tempFuncId.Value = Conditions;
            tempSqlCommand.Parameters.Add(tempFuncId);

            SqlParameter tempFuncId1 = new SqlParameter("@wjdatatime", SqlDbType.DateTime, 100);
            tempFuncId1.Direction = ParameterDirection.Input;
            tempFuncId1.Value = "2006.07.01";
            tempSqlCommand.Parameters.Add(tempFuncId1);

            tempSqlCommand.ExecuteNonQuery();
            tempSqlCommand.Connection.Close();
        }

        /// <summary>
        /// 补发工资记录插入
        /// </summary>
        /// <param name="TBL"></param>
        /// <param name="MainObj"></param>
        /// <returns></returns>
        public void myInsReissuePay(string sSetNo, string sTypeNo, string usercondition, string modulecondition, string setCondition, string typecondition, string sDate)
        {
            string[] dbConnectString = DMServer.Common.ConfigMy.ConnectInfo;
            string strConnectInfo = "server=" + dbConnectString[0] + ";uid=" + dbConnectString[2]
                + ";pwd=" + dbConnectString[3] + ";database=" + dbConnectString[1];

            SqlCommand tempSqlCommand = new SqlCommand();
            tempSqlCommand.Connection = new SqlConnection(strConnectInfo);
            tempSqlCommand.Connection.Open();
            tempSqlCommand.CommandText = "flxp_info_GZBF";
            tempSqlCommand.CommandType = CommandType.StoredProcedure;

            //用户条件
            SqlParameter tempUserId = new SqlParameter("@usercondition", SqlDbType.VarChar, 500);
            tempUserId.Direction = ParameterDirection.Input;
            tempUserId.Value = usercondition;
            tempSqlCommand.Parameters.Add(tempUserId);

            //模块条件
            SqlParameter tempFuncId = new SqlParameter("@modulecondition", SqlDbType.VarChar, 500);
            tempFuncId.Direction = ParameterDirection.Input;
            tempFuncId.Value = modulecondition;
            tempSqlCommand.Parameters.Add(tempFuncId);

            //帐套条件
            SqlParameter tempsetCondition = new SqlParameter("@setCondition", SqlDbType.VarChar, 500);
            tempsetCondition.Direction = ParameterDirection.Input;
            tempsetCondition.Value = setCondition;
            tempSqlCommand.Parameters.Add(tempsetCondition);

            //业务条件
            SqlParameter temptypecondition = new SqlParameter("@typecondition", SqlDbType.VarChar, 500);
            temptypecondition.Direction = ParameterDirection.Input;
            temptypecondition.Value = typecondition;
            tempSqlCommand.Parameters.Add(temptypecondition);

            //时间
            SqlParameter tempsDate = new SqlParameter("@sDate", SqlDbType.DateTime);
            tempsDate.Direction = ParameterDirection.Input;
            tempsDate.Value = DateTime.Parse(sDate);
            tempSqlCommand.Parameters.Add(tempsDate);

            //帐套号
            SqlParameter tempsetno = new SqlParameter("@SetNo", SqlDbType.VarChar, 10);
            tempsetno.Direction = ParameterDirection.Input;
            tempsetno.Value = sSetNo;
            tempSqlCommand.Parameters.Add(tempsetno);

            //业务号
            SqlParameter temptypeno = new SqlParameter("@TypeNo", SqlDbType.VarChar, 10);
            temptypeno.Direction = ParameterDirection.Input;
            temptypeno.Value = sTypeNo;
            tempSqlCommand.Parameters.Add(temptypeno);

            tempSqlCommand.ExecuteNonQuery();
            tempSqlCommand.Connection.Close();
        }

        //替换blob类型的字段
        public string updateBlob(string strsql, object objblob)
        {
            /*
            try
            {
                OleDbCommand   objcommand =new OleDbCommand();
                objcommand.Connection=new OleDbConnection(dbConnectString+";provider=sqloledb;");
                objcommand.Connection.Open();
                objcommand.CommandText = strsql;
                objcommand.CommandType = CommandType.Text;  // use stored proc for perf
                //传入对象
                OleDbParameter sObject = new OleDbParameter();//("Object", OleDbType.Binary);
                sObject.Direction = ParameterDirection.Input;
                sObject.Value=objblob;
                objcommand.Parameters.Add(sObject);     

                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();
                return "1";
	
            }
            catch(System.Exception e)
            {
                //throw new Exception(e.Message );
                return"-1";
            }
            */

            //add by xsm 2005.09.21  在笔记本上调用此函数，发现oledb对mdac的版本检测有问题，改成sqlCommand

            strsql = strsql.Replace("?", "@FileValue");
            System.Data.SqlClient.SqlConnection conn;

            System.Data.SqlClient.SqlCommand dbCommand;  //数据操作命令

            conn = new SqlConnection(dbConnectString);
            dbCommand = new SqlCommand();
            dbCommand.CommandTimeout = 160;
            dbCommand.CommandText = strsql;
            SqlParameter maininfoid = new SqlParameter("@FileValue", SqlDbType.Image);//对于图片类型只能用image类型 ，当用Binary（1-8000）类型时
            maininfoid.Value = objblob;
            dbCommand.Parameters.Add(maininfoid);
            dbCommand.Connection = conn;
            try
            {
                conn.Open();
                dbCommand.ExecuteNonQuery();
                return "1";
            }
            catch (Exception ee)
            {
                return "-1";
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
