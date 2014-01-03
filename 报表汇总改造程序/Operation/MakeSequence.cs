using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using System.Collections;
using DMServer.DataMolde;

namespace DataAccess.Data
{
    /// <summary>
    /// MakeSequence 的摘要说明。
    /// </summary>
    public class MakeSequence
    {
        #region 全局变量

        private DM dataUnit = new DM();
        private ArrayList tempSequenceCol = new ArrayList(); //集合行序列条件
        private int int_ColCount; //行序列项个数
        private ArrayList tempSequenceRow = new ArrayList(); //集合列序列条件
        private int int_RowCount; //列序列项个数
        private int int_TypeNo;//类别编号
        private int int_SetTableNo;//套表编号
        private int int_TableNo;//表号
        private string str_SequenceFormat;//序列格式
        private string str_ObjectName;//主对象名

        #endregion

        #region 全局常量

        //序列条件表
        private const string SEQUENCETABLE = "R203";
        private const string SEQUENCE_TYPENO = "typeno";
        private const string SEQUENCE_SETTABLENO = "settableno";
        private const string SEQUENCE_TABLENO = "tableno";
        private const string SEQUENCE_SERIALNO = "serialno";
        private const string SEQUENCE_SEQUENCENAME = "sequencename";
        private const string SEQUENCE_SEQUENCENO = "sequenceno";
        private const string SEQUENCE_DEALFIELDNAME = "dealfieldname";
        private const string SEQUENCE_DEALSTYlE = "dealstyle";
        private const string SEQUENCE_STATOBJECT = "statobject";
        private const string SEQUENCE_SEQUENCETYPE = "sequencetype";
        private const string SEQUENCE_BASEEXPR = "baseexpr";
        private const string SEQUENCE_BASEITEM = "baseitem";
        private const string SEQUENCE_SETSQL = "setsql";
        private const string SEQUENCE_CHINESEITEM = "chineseitem";
        private const string SEQUENCE_SETFUNCTION = "setfunction";
        private const string SEQUENCE_STANDBYINT = "standbyint";
        private const string SEQUENCE_STANDBYVARCHAR = "standbyvarchar";
        private const string SEQUENCE_DEALEXPR = "dealExpr";
        private const string SEQUENCE_DEALITEMCH = "dealItemCH";
        //序列表
        private const string SETTABLENAME = "R202";
        private const string SETTABLE_TYPENO = "typeno";
        private const string SETTABLE_SETTABLENO = "settableno";
        private const string SETTABLE_TABLENO = "tableno";
        private const string SETTABLE_SERIALNO = "serialno";
        private const string SETTABLE_SERIALNAME = "serialname";
        private const string SETTABLE_SERIALTYPE = "serialtype";
        private const string SETTABLE_MAINOBJECT = "mainobject";
        private const string SETTABLE_COUNT = "icount";

        //序列关联表
        private const string R201TABLE = "R201";
        private const string R201_TYPENO = "TypeNo";
        private const string R201_SETTABLENO = "SetTableNo";
        private const string R201_TABLENO = "tableNo";
        private const string R201_SERIALNO = "serialNo";
        private const string R201_STARTROW = "startRow";
        private const string R201_STARTCOL = "startCol";
        private const string R201_ENDROW = "endRow";
        private const string R201_ENDCOL = "endCol";
        private const string R201_MAINOBJECT = "MainObject";

        //R200
        private const string R200TABLE = "R200";
        private const string R200_MAINOBJECT = "MainObject";

        //gs_objectassociate
        private const string OBJECTASSOCIATE = "gs_objectassociate";
        private const string OBJECT_INFOIDA = "InfoIdA";
        private const string OBJECT_INFOIDB = "InfoIdB";
        private const string OBJECT_ASSOCIATETYPE = "AssociateType"; // = "1"
        private const string OBJECT_FLAG = "Flag";
        private const string OBJECT_PROPERTYSET = "PropertySet";

        //gs_structure
        private const string STRUCTURETABLE = "gs_structure";
        private const string STRUCTURE_INFOID = "InfoId";
        //gs_property
        private const string PROPERTYTABLE = "gs_property";
        private const string PROPERTYINFOFIELD = "InfoField";
        private const string PROPERTYINFOID = "InfoId";

        //定义序列常量
        private const string EG01_TABLE = "EG01";
        private const string EG01_EG01ID = "EG01ID";
        private const string EG01_ZA0101 = "ZA0101";
        private const string EG01_ZA9999 = "ZA9999";
        private const string EG01_ZA9998 = "ZA9998";
        private const string EG01_ZC9995 = "ZC9995";
        private const string EG01_SETTBL = "SETTBL";
        private const string EG01_TABLNO = "TABLNO";
        private const string EG01_TYPENO = "TYPENO";
        private const string EG01_ZA0100 = "ZA0100";
        private const string EG01_USERID = "USERID";
        private const string EG01_STARTC = "STARTC";
        private const string EG01_STARTR = "STARTR";

        #endregion

        public MakeSequence()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        /// <summary>
        /// 查询统计对象
        /// </summary>
        /// <param name="strobjecttable"></param>
        /// <returns></returns>
        public DataTable selectObject(string strobjecttable)
        {
            int iResult = 0;
            string strSql = "select * from " + OBJECTASSOCIATE + " where "
                + OBJECT_INFOIDA + " = '" + strobjecttable + "' and " +
                OBJECT_ASSOCIATETYPE + " = '1' ";
            DataSet ds = dataUnit.FillData(strSql, OBJECTASSOCIATE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 查询主对象名称
        /// </summary>
        /// <param name="strobjecttable"></param>
        /// <returns></returns>
        public string selectObjectName(string strobjecttable)
        {
            int iResult = 0;
            try
            {
                string strSql = "select ShortDesc from " + STRUCTURETABLE + " where "
                    + STRUCTURE_INFOID + " ='" + strobjecttable + "' ";
                DataSet ds = dataUnit.FillData(strSql, STRUCTURETABLE, out iResult);
                if (ds != null)
                {
                    return ds.Tables[0].Rows[0][0].ToString();
                }
                return "";
            }
            catch
            {
                return "";
            }
        }

        /// <summary>
        /// 查询主对象字段名称
        /// </summary>
        /// <param name="strobjecttable"></param>
        /// <returns></returns>
        public DataTable selectTableFieldName(string strobjecttable, string strfield)
        {
            int iResult = 0;
            string strSql = "select * from " + PROPERTYTABLE + " where "
                + PROPERTYINFOID + " = '" + strobjecttable + "' and "
                + PROPERTYINFOFIELD + " in( '" + strfield + "') ";
            DataSet ds = dataUnit.FillData(strSql, PROPERTYTABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 保存序列时调用
        /// </summary>
        /// <param name="i_TypeNo">类别编号</param>
        /// <param name="i_SetTableNo">套表编号</param>
        /// <param name="i_TableNo">表号</param>
        /// <param name="arr_tmpcol">集合行序列条件</param>
        /// <param name="arr_tmprow">集合列序列条件</param>
        /// <param name="str_format">序列格式</param>
        /// <param name="str_object">主对象名</param>
        public void InsertSequence(int i_TypeNo, int i_SetTableNo, int i_TableNo, ArrayList arr_tmpcol, ArrayList arr_tmprow, string str_format, string str_object)
        {
            int_TypeNo = i_TypeNo;
            int_SetTableNo = i_SetTableNo;
            int_TableNo = i_TableNo;
            tempSequenceCol = arr_tmpcol;
            int_ColCount = arr_tmpcol.Count;
            tempSequenceRow = arr_tmprow;
            int_RowCount = arr_tmprow.Count;
            str_SequenceFormat = str_format;
            str_ObjectName = str_object;
        }

        /// <summary>
        /// 打开序列时用
        /// </summary>
        /// <param name="i_TypeNo">类别编号</param>
        /// <param name="i_SetTableNo">套表编号</param>
        /// <param name="i_TableNo">表号</param>
        public void OpenSequence(int i_TypeNo, int i_SetTableNo, int i_TableNo)
        {
            int_TypeNo = i_TypeNo;
            int_SetTableNo = i_SetTableNo;
            int_TableNo = i_TableNo;
        }

        /// <summary>
        /// 查询序列表
        /// </summary>
        /// <returns></returns>
        public DataTable selectSetTable()
        {
            int iResult = 0;
            string strSql = "select * from " + SETTABLENAME + " where "
                + SETTABLE_TYPENO + " = " + this.int_TypeNo + " and "
                + SETTABLE_SETTABLENO + " = " + this.int_SetTableNo + " and "
                + SETTABLE_TABLENO + " = " + this.int_TableNo;
            DataSet ds = dataUnit.FillData(strSql, SETTABLENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 查询序列条件
        /// </summary>
        /// <returns></returns>
        public DataTable selectSequenceTable()
        {
            int iResult = 0;
            string strSql = "select * from " + SEQUENCETABLE + " where "
                + SEQUENCE_TYPENO + " = " + this.int_TypeNo + " and "
                + SEQUENCE_SETTABLENO + " = " + this.int_SetTableNo + " and "
                + SEQUENCE_TABLENO + " = " + this.int_TableNo;
            DataSet ds = dataUnit.FillData(strSql, SEQUENCETABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 生成SQL串
        /// 保存序列
        /// </summary>
        /// <returns></returns>
        public int InsertSql()
        {
            SqlCommand insertCmd = new SqlCommand();
            string str_SqlR202 = "", str_SqlR203 = "", strBeginSql, strEndSql;
            //打开事务 关闭引号
            strBeginSql = " BEGIN TRANSACTION  SET QUOTED_IDENTIFIER OFF ";
            strBeginSql += " delete " + SETTABLENAME + " where " +
                SETTABLE_TYPENO + "=" + int_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + int_SetTableNo + " and " + SETTABLE_TABLENO + "=" + int_TableNo +
                " and " + SETTABLE_SERIALNO + " in(1,2) ";

            //提交事务
            strEndSql = " COMMIT TRANSACTION ";
            switch (str_SequenceFormat)
            {
                case "1": //一行一列
                    //插入行
                    str_SqlR202 = " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "1," + int_TableNo +
                        "," + (char)34 + "行序列" + (char)34 + "," + "1" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_RowCount + ")";
                    //插入列
                    str_SqlR202 += " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "2," + int_TableNo +
                        "," + (char)34 + "列序列" + (char)34 + "," + "2" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_ColCount + ")";
                    str_SqlR203 = InsertR203();
                    break;
                case "2": //一行
                    //插入行	
                    str_SqlR202 = " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "1," + int_TableNo +
                        "," + (char)34 + "行序列" + (char)34 + "," + "1" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_RowCount + ")";
                    str_SqlR203 = InsertR203();
                    break;
                case "3": //一列
                    //插入列
                    str_SqlR202 = " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "1," + int_TableNo +
                        "," + (char)34 + "列序列" + (char)34 + "," + "2" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_ColCount + ")";
                    str_SqlR203 = InsertR203();
                    break;
                case "4": //两行
                    //插入行1
                    str_SqlR202 = " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "1," + int_TableNo +
                        "," + (char)34 + "行序列" + (char)34 + "," + "1" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_RowCount + ")";
                    //插入行2
                    str_SqlR202 += " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "2," + int_TableNo +
                        "," + (char)34 + "行序列" + (char)34 + "," + "1" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_ColCount + ")";
                    str_SqlR203 = InsertR203();
                    break;
                case "5": //两列
                    //插入列1
                    str_SqlR202 = " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "1," + int_TableNo +
                        "," + (char)34 + "列序列" + (char)34 + "," + "2" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_RowCount + ")";
                    //插入列2
                    str_SqlR202 += " insert into " + SETTABLENAME
                        + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                        "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                        "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                        "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                        ")	values(" + int_TypeNo + "," + int_SetTableNo +
                        "," + "2," + int_TableNo +
                        "," + (char)34 + "列序列" + (char)34 + "," + "2" +
                        "," + (char)34 + str_ObjectName + (char)34 + "," + int_ColCount + ")";
                    str_SqlR203 = InsertR203();
                    break;
            }
            insertCmd.CommandText = strBeginSql + str_SqlR202 + str_SqlR203 + strEndSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 更改数据区
        /// </summary>
        /// <returns></returns>
        public int UpdateDataCondition()
        {
            string strUpdateSql;
            SqlCommand insertCmd = new SqlCommand();
            strUpdateSql = " update r200 set flag = '0' where " +
                SETTABLE_TYPENO + "=" + int_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + int_SetTableNo + " and " + SETTABLE_TABLENO + "=" + int_TableNo;
            insertCmd.CommandText = strUpdateSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 取主对象
        /// </summary>
        /// <returns></returns>
        public string selectR200ObjectName()
        {
            int iResult;
            SqlCommand insertCmd = new SqlCommand();
            string strSql = "select *  from " + R200TABLE +
                " where " + R201_TYPENO + "=" + int_TypeNo + " and " + R201_SETTABLENO +
                "=" + int_SetTableNo + " and " + R201_TABLENO + "=" + int_TableNo;
            DataSet ds = dataUnit.FillData(strSql, R200TABLE, out iResult);
            try
            {
                if (ds != null && ds.Tables[0].Rows.Count != 0)
                {
                    return ds.Tables[0].Rows[0]["MainObject"].ToString();
                }
                else
                {
                    return "";
                }
            }
            catch
            {
                return "";
            }
        }

        /// <summary>
        /// 更改条件序列
        /// </summary>
        /// <returns></returns>
        public int UpdateSequenceCondition()
        {
            string strUpdateSql;
            SqlCommand insertCmd = new SqlCommand();
            strUpdateSql = " update R200 set flag = '1' where " +
                SETTABLE_TYPENO + "=" + int_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + int_SetTableNo + " and " + SETTABLE_TABLENO + "=" + int_TableNo;
            insertCmd.CommandText = strUpdateSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 保存全表条件
        /// </summary>
        /// <returns></returns>
        public int InsertTableCondition(int i_TypeNo, int i_SetTableNo, int i_TableNo, string str_Object, ArrayList Arrtemp)
        {
            string strBeginSql, strEndSql, strSql, str_SqlR202, str_SqlR203;
            SqlCommand insertCmd = new SqlCommand();
            //打开事务
            strBeginSql = " BEGIN TRANSACTION  SET QUOTED_IDENTIFIER OFF ";

            strBeginSql += " delete " + R201TABLE + " where " +
                R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo +
                " and " + R201_SERIALNO + " = 0 ";

            strBeginSql += " delete " + SETTABLENAME + " where " +
                SETTABLE_TYPENO + "=" + i_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SETTABLE_TABLENO + "=" + i_TableNo +
                " and " + SETTABLE_SERIALNO + " = 0 ";

            strBeginSql += " delete " + SEQUENCETABLE + " where " +
                SEQUENCE_TYPENO + "=" + i_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + i_TableNo +
                " and " + SEQUENCE_SERIALNO + " = 0 ";

            //提交事务
            strEndSql = " COMMIT TRANSACTION ";
            strSql = " insert into " + R201TABLE +
                " (" + R201_TYPENO + "," + R201_SETTABLENO + ","
                + R201_TABLENO + "," + R201_SERIALNO + ","
                + R201_STARTROW + "," + R201_STARTCOL + ","
                + R201_ENDROW + "," + R201_ENDCOL + "," + R201_MAINOBJECT + ") values("
                + i_TypeNo + "," + i_SetTableNo + "," + i_TableNo
                + ",0,0,0,0,0,'" + str_Object + "') ";

            str_SqlR202 = " insert into " + SETTABLENAME
                + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                ")	values(" + i_TypeNo + "," + i_SetTableNo +
                "," + "0," + i_TableNo +
                "," + (char)34 + "全表条件" + (char)34 + "," + "0" +
                "," + (char)34 + str_Object + (char)34 + ",0)";

            str_SqlR203 = " insert into " + SEQUENCETABLE
                + " (" + SEQUENCE_TYPENO + "," + SEQUENCE_SETTABLENO +
                "," + SEQUENCE_TABLENO + "," + SEQUENCE_SERIALNO +
                "," + SEQUENCE_SEQUENCENAME + "," + SEQUENCE_SEQUENCENO +
                "," + SEQUENCE_BASEEXPR + "," + SEQUENCE_SETSQL +
                "," + SEQUENCE_BASEITEM + "," + SEQUENCE_CHINESEITEM +
                "," + SEQUENCE_SEQUENCETYPE + "," + SEQUENCE_DEALFIELDNAME +
                "," + SEQUENCE_DEALSTYlE + "," + SEQUENCE_STATOBJECT +
                "," + SEQUENCE_DEALEXPR + "," + SEQUENCE_DEALITEMCH +
                ")	values(" + i_TypeNo + "," + i_SetTableNo +
                "," + i_TableNo + "," + "0" +
                "," + (char)34 + ((SetSql)(Arrtemp[0])).strName.ToString() + (char)34 + "," + 0 +
                "," + (char)34 + ((SetSql)(Arrtemp[0])).strExpr + (char)34 + "," +
                (char)34 + ((SetSql)(Arrtemp[0])).strSetSql + (char)34 + "," +
                (char)34 + ((SetSql)(Arrtemp[0])).strItem.ToString() + (char)34 + "," +
                (char)34 + ((SetSql)(Arrtemp[0])).strItemCH.ToString() + (char)34 + "," +
                (char)34 + ((SetSql)(Arrtemp[0])).strSequenceType.ToString() + (char)34 + ",null,null,null,null,null) ";

            insertCmd.CommandText = strBeginSql + strSql + str_SqlR202 + str_SqlR203 + strEndSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 删除全表条件
        /// </summary>
        /// <returns></returns>
        public int DeleteTableCondition(int i_TypeNo, int i_SetTableNo, int i_TableNo)
        {
            string strBeginSql;
            SqlCommand insertCmd = new SqlCommand();

            strBeginSql = " delete " + R201TABLE + " where " +
                R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo +
                " and " + R201_SERIALNO + " = 0 ";

            strBeginSql += " delete " + SETTABLENAME + " where " +
                SETTABLE_TYPENO + "=" + i_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SETTABLE_TABLENO + "=" + i_TableNo +
                " and " + SETTABLE_SERIALNO + " = 0 ";

            strBeginSql += " delete " + SEQUENCETABLE + " where " +
                SEQUENCE_TYPENO + "=" + i_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + i_TableNo +
                " and " + SEQUENCE_SERIALNO + " = 0 ";


            insertCmd.CommandText = strBeginSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 保存单元条件
        /// </summary>
        /// <returns></returns>
        public int InsertUnitCondition(int i_TypeNo, int i_SetTableNo, int i_TableNo, string str_Object, ArrayList Arrtemp)
        {
            string strBeginSql, strEndSql, strSql = "", str_SqlR202 = "", str_SqlR203 = "";
            SqlCommand insertCmd = new SqlCommand();
            //打开事务
            strBeginSql = " BEGIN TRANSACTION  SET QUOTED_IDENTIFIER OFF ";
            //提交事务
            strEndSql = " COMMIT TRANSACTION ";
            //删除表中的单元条件
            strBeginSql += " delete " + R201TABLE + " where " +
                R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo +
                " and " + R201_SERIALNO + " >= 3 ";

            strBeginSql += " delete " + SETTABLENAME + " where " +
                SETTABLE_TYPENO + "=" + i_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SETTABLE_TABLENO + "=" + i_TableNo +
                " and " + SETTABLE_SERIALNO + " >= 3 ";

            strBeginSql += " delete " + SEQUENCETABLE + " where " +
                SEQUENCE_TYPENO + "=" + i_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + i_TableNo +
                " and " + SEQUENCE_SERIALNO + " >= 3 ";

            for (int i = 0; i < Arrtemp.Count; i++)
            {
                int j = i + 3;
                strSql += " insert into " + R201TABLE +
                    " (" + R201_TYPENO + "," + R201_SETTABLENO + ","
                    + R201_TABLENO + "," + R201_SERIALNO + ","
                    + R201_STARTROW + "," + R201_STARTCOL + ","
                    + R201_ENDROW + "," + R201_ENDCOL + "," + R201_MAINOBJECT + ") values("
                    + i_TypeNo + "," + i_SetTableNo + "," + i_TableNo
                    + "," + j + "," + ((SetSql)(Arrtemp[i])).iRow + "," + ((SetSql)(Arrtemp[i])).iCol + ","
                    + ((SetSql)(Arrtemp[i])).iRow + "," + ((SetSql)(Arrtemp[i])).iCol + ","
                    + (char)34 + str_Object + (char)34 + ") ";

                str_SqlR202 += " insert into " + SETTABLENAME
                    + " (" + SETTABLE_TYPENO + "," + SETTABLE_SETTABLENO +
                    "," + SETTABLE_SERIALNO + "," + SETTABLE_TABLENO +
                    "," + SETTABLE_SERIALNAME + "," + SETTABLE_SERIALTYPE +
                    "," + SETTABLE_MAINOBJECT + "," + SETTABLE_COUNT +
                    ")	values(" + i_TypeNo + "," + i_SetTableNo +
                    "," + j + "," + i_TableNo +
                    "," + (char)34 + "单元条件" + (char)34 + "," + "3" +
                    "," + (char)34 + str_Object + (char)34 + ",0)";

                str_SqlR203 += " insert into " + SEQUENCETABLE
                    + " (" + SEQUENCE_TYPENO + "," + SEQUENCE_SETTABLENO +
                    "," + SEQUENCE_TABLENO + "," + SEQUENCE_SERIALNO +
                    "," + SEQUENCE_SEQUENCENAME + "," + SEQUENCE_SEQUENCENO +
                    "," + SEQUENCE_BASEEXPR + "," + SEQUENCE_SETSQL +
                    "," + SEQUENCE_BASEITEM + "," + SEQUENCE_CHINESEITEM +
                    "," + SEQUENCE_SEQUENCETYPE + "," + SEQUENCE_DEALFIELDNAME +
                    "," + SEQUENCE_DEALSTYlE + "," + SEQUENCE_STATOBJECT +
                    "," + SEQUENCE_DEALEXPR + "," + SEQUENCE_DEALITEMCH +
                    ")	values(" + i_TypeNo + "," + i_SetTableNo +
                    "," + i_TableNo + "," + j +
                    "," + (char)34 + ((SetSql)(Arrtemp[i])).strName.ToString() + (char)34 + "," + 0 +
                    "," + (char)34 + ((SetSql)(Arrtemp[i])).strExpr + (char)34 + "," +
                    (char)34 + ((SetSql)(Arrtemp[i])).strSetSql + (char)34 + "," +
                    (char)34 + ((SetSql)(Arrtemp[i])).strItem.ToString() + (char)34 + "," +
                    (char)34 + ((SetSql)(Arrtemp[i])).strItemCH.ToString() + (char)34 + "," +
                    (char)34 + ((SetSql)(Arrtemp[i])).strSequenceType.ToString() + (char)34 + ",null,null,null,1,null) ";
            }

            insertCmd.CommandText = strBeginSql + strSql + str_SqlR202 + str_SqlR203 + strEndSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 删除单元条件
        /// </summary>
        /// <returns></returns>
        public int DeleteUnitCondition(int i_TypeNo, int i_SetTableNo, int i_TableNo)
        {
            string strBeginSql;
            SqlCommand insertCmd = new SqlCommand();
            //删除表中的单元条件
            strBeginSql = " delete " + R201TABLE + " where " +
                R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo +
                " and " + R201_SERIALNO + " >= 3 ";

            strBeginSql += " delete " + SETTABLENAME + " where " +
                SETTABLE_TYPENO + "=" + i_TypeNo + " and " + SETTABLE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SETTABLE_TABLENO + "=" + i_TableNo +
                " and " + SETTABLE_SERIALNO + " >= 3 ";

            strBeginSql += " delete " + SEQUENCETABLE + " where " +
                SEQUENCE_TYPENO + "=" + i_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + i_TableNo +
                " and " + SEQUENCE_SERIALNO + " >= 3 ";

            insertCmd.CommandText = strBeginSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 取序列条件表中最大值
        /// </summary>
        /// <returns></returns>
        private int GetMaxSequence(int i_TypeNo, int i_SetTableNo, int i_TableNo)
        {
            int iResult = 0;
            string strSql = "select max(" + SEQUENCE_SEQUENCENO + ") from " + SEQUENCETABLE +
                " where " + SEQUENCE_TYPENO + "=" + i_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + i_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + i_TableNo;
            DataSet ds = dataUnit.FillData(strSql, SEQUENCETABLE, out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                return int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            return 0;
        }

        /// <summary>
        /// 生成序列项的SQL串
        /// </summary>
        /// <returns></returns>
        private string InsertR203()
        {
            string strsql = "";
            string strdealname = "", strdealtype = "0", strstatobject = "";
            string strdealitemch = "", strdealexpr = "", strmainobject = "";
            //hjh 2004.12.21
            string strdealconditem, strdealconditemch, strdealcondexpr, strdealcondhis;
            //end hjh
            //hjh 2004.12.24
            string strdealcondsql = "";
            string strgathersequence = "";
            Report.stat.QueryDeal QD;
            //end hjh
            try
            {
                if (int_ColCount != 0)
                {
                    for (int i = 0; i < int_ColCount; i++)
                    {
                        //hjh 2004.12.21
                        if (((SetSql)(tempSequenceCol[i])).strdealconditem == null)
                        {
                            strdealconditem = "";
                        }
                        else
                        {
                            strdealconditem = ((SetSql)(tempSequenceCol[i])).strdealconditem.ToString();
                        }

                        if (((SetSql)(tempSequenceCol[i])).strdealconditemch == null)
                        {
                            strdealconditemch = "";
                        }
                        else
                        {
                            strdealconditemch = ((SetSql)(tempSequenceCol[i])).strdealconditemch.ToString();
                        }

                        if (((SetSql)(tempSequenceCol[i])).strdealcondexpr == null)
                        {
                            strdealcondexpr = "1";
                        }
                        else
                        {
                            strdealcondexpr = ((SetSql)(tempSequenceCol[i])).strdealcondexpr.ToString();
                        }

                        if (((SetSql)(tempSequenceCol[i])).strdealcondhis == null)
                        {
                            strdealcondhis = "0";
                        }
                        else
                        {
                            strdealcondhis = ((SetSql)(tempSequenceCol[i])).strdealcondhis.ToString();
                        }
                        //end hjh
                        if (((SetSql)(this.tempSequenceCol[i])).strdealItemCH == null)
                        {
                            strdealitemch = "";
                        }
                        else
                        {
                            strdealitemch = ((SetSql)(this.tempSequenceCol[i])).strdealItemCH.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strdealFieldName == null)
                        {
                            strdealname = "";
                        }
                        else
                        {
                            strdealname = ((SetSql)(this.tempSequenceCol[i])).strdealFieldName.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strdealstyle == null)
                        {
                            strdealtype = "0";
                        }
                        else
                        {
                            strdealtype = ((SetSql)(this.tempSequenceCol[i])).strdealstyle.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strstatObject == null)
                        {
                            strstatobject = "";
                        }
                        else
                        {
                            strstatobject = ((SetSql)(this.tempSequenceCol[i])).strstatObject.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strdealExpr == null)
                        {
                            strdealexpr = "1";
                        }
                        else
                        {
                            strdealexpr = ((SetSql)(this.tempSequenceCol[i])).strdealExpr.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strmainObject == null)
                        {
                            strmainobject = "";
                        }
                        else
                        {
                            strmainobject = ((SetSql)(this.tempSequenceCol[i])).strmainObject.ToString();
                        }

                        if (((SetSql)(this.tempSequenceCol[i])).strGatherSequence == null)
                        {
                            strgathersequence = "";
                        }
                        else
                        {
                            strgathersequence = ((SetSql)(this.tempSequenceCol[i])).strGatherSequence.ToString();
                        }

                        //hjh 2004.12.24
                        QD = new Report.stat.QueryDeal(0, 0, "AA01", strdealcondexpr, strdealconditem, "");
                        strdealcondsql = QD.CreatSQLCond();
                        if (strdealcondsql.Length < 5)
                        {
                            strdealcondsql = "";
                        }
                        //end hjh
                        //hjh 2004.12.21
                        strsql += " insert into " + SEQUENCETABLE
                            + " (" + SEQUENCE_TYPENO + "," + SEQUENCE_SETTABLENO +
                            "," + SEQUENCE_TABLENO + "," + SEQUENCE_SERIALNO +
                            "," + SEQUENCE_SEQUENCENAME + "," + SEQUENCE_SEQUENCENO +
                            "," + SEQUENCE_BASEEXPR + "," + SEQUENCE_SETSQL +
                            "," + SEQUENCE_BASEITEM + "," + SEQUENCE_CHINESEITEM +
                            "," + SEQUENCE_SEQUENCETYPE + "," + SEQUENCE_DEALFIELDNAME +
                            "," + SEQUENCE_DEALSTYlE + "," + SEQUENCE_STATOBJECT +
                            "," + SEQUENCE_DEALEXPR + "," + SEQUENCE_DEALITEMCH
                            + ",mainobject,dealconditem,dealconditemch,dealcondexpr,dealcondhis,dealcondsql,gathersequence" +
                            ")	values(" + int_TypeNo + "," + int_SetTableNo +
                            "," + int_TableNo + "," + "2" +
                            "," + (char)34 + ((SetSql)(this.tempSequenceCol[i])).strName.ToString() + (char)34 + "," + i +
                            "," + (char)34 + ((SetSql)(this.tempSequenceCol[i])).strExpr + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceCol[i])).strSetSql + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceCol[i])).strItem.ToString() + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceCol[i])).strItemCH.ToString() + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceCol[i])).strSequenceType.ToString() + (char)34 + "," +
                            (char)34 + strdealname + (char)34 + "," + (char)34 + strdealtype + (char)34 + "," +
                            (char)34 + strstatobject + (char)34 + "," + (char)34 + strdealexpr + (char)34 + "," +
                            (char)34 + strdealitemch + (char)34 + "," + (char)34 + strmainobject + (char)34 + "," +
                            (char)34 + strdealconditem + (char)34 + "," + (char)34 + strdealconditemch + (char)34
                            + ",'" + strdealcondexpr + "','" + strdealcondhis + "'," + (char)34 + strdealcondsql + (char)34
                            + ",'" + strgathersequence + "') ";
                    }
                }
                if (int_RowCount != 0)
                {
                    for (int j = 0; j < int_RowCount; j++)
                    {
                        //hjh 2004.12.21
                        if (((SetSql)(tempSequenceRow[j])).strdealconditem == null)
                        {
                            strdealconditem = "";
                        }
                        else
                        {
                            strdealconditem = ((SetSql)(tempSequenceRow[j])).strdealconditem.ToString();
                        }

                        if (((SetSql)(tempSequenceRow[j])).strdealconditemch == null)
                        {
                            strdealconditemch = "";
                        }
                        else
                        {
                            strdealconditemch = ((SetSql)(tempSequenceRow[j])).strdealconditemch.ToString();
                        }

                        if (((SetSql)(tempSequenceRow[j])).strdealcondexpr == null)
                        {
                            strdealcondexpr = "1";
                        }
                        else
                        {
                            strdealcondexpr = ((SetSql)(tempSequenceRow[j])).strdealcondexpr.ToString();
                        }

                        if (((SetSql)(tempSequenceRow[j])).strdealcondhis == null)
                        {
                            strdealcondhis = "0";
                        }
                        else
                        {
                            strdealcondhis = ((SetSql)(tempSequenceRow[j])).strdealcondhis.ToString();
                        }
                        //end hjh
                        if (((SetSql)(this.tempSequenceRow[j])).strdealItemCH == null)
                        {
                            strdealitemch = "";
                        }
                        else
                        {
                            strdealitemch = ((SetSql)(this.tempSequenceRow[j])).strdealItemCH.ToString();
                        }

                        if (((SetSql)(this.tempSequenceRow[j])).strdealFieldName == null)
                        {
                            strdealname = "";
                        }
                        else
                        {
                            strdealname = ((SetSql)(this.tempSequenceRow[j])).strdealFieldName.ToString();
                        }

                        if (((SetSql)(this.tempSequenceRow[j])).strdealstyle == null)
                        {
                            strdealtype = "0";
                        }
                        else
                        {
                            strdealtype = ((SetSql)(this.tempSequenceRow[j])).strdealstyle.ToString();
                        }

                        if (((SetSql)(this.tempSequenceRow[j])).strstatObject == null)
                        {
                            strstatobject = "";
                        }
                        else
                        {
                            strstatobject = ((SetSql)(this.tempSequenceRow[j])).strstatObject.ToString();
                        }

                        if (((SetSql)(this.tempSequenceRow[j])).strdealExpr == null)
                        {
                            strdealexpr = "";
                        }
                        else
                        {
                            strdealexpr = ((SetSql)(this.tempSequenceRow[j])).strdealExpr.ToString();
                        }
                        if (((SetSql)(this.tempSequenceRow[j])).strmainObject == null)
                        {
                            strmainobject = "";
                        }
                        else
                        {
                            strmainobject = ((SetSql)(this.tempSequenceRow[j])).strmainObject.ToString();
                        }

                        if (((SetSql)(this.tempSequenceRow[j])).strGatherSequence == null)
                        {
                            strgathersequence = "";
                        }
                        else
                        {
                            strgathersequence = ((SetSql)(this.tempSequenceRow[j])).strGatherSequence.ToString();
                        }

                        //hjh 2004.12.24
                        QD = new Report.stat.QueryDeal(0, 0, "AA01", strdealcondexpr, strdealconditem, "");
                        strdealcondsql = QD.CreatSQLCond();
                        if (strdealcondsql.Length < 5)
                        {
                            strdealcondsql = "";
                        }
                        //end hjh

                        //hjh 2004.12.21
                        strsql += " insert into " + SEQUENCETABLE
                            + " (" + SEQUENCE_TYPENO + "," + SEQUENCE_SETTABLENO +
                            "," + SEQUENCE_TABLENO + "," + SEQUENCE_SERIALNO +
                            "," + SEQUENCE_SEQUENCENAME + "," + SEQUENCE_SEQUENCENO +
                            "," + SEQUENCE_BASEEXPR + "," + SEQUENCE_SETSQL +
                            "," + SEQUENCE_BASEITEM + "," + SEQUENCE_CHINESEITEM +
                            "," + SEQUENCE_SEQUENCETYPE + "," + SEQUENCE_DEALFIELDNAME +
                            "," + SEQUENCE_DEALSTYlE + "," + SEQUENCE_STATOBJECT +
                            "," + SEQUENCE_DEALEXPR + "," + SEQUENCE_DEALITEMCH
                            + ",mainobject,dealconditem,dealconditemch,dealcondexpr,dealcondhis,dealcondsql,gathersequence" +
                            ")	values(" + int_TypeNo + "," + int_SetTableNo +
                            "," + int_TableNo + "," + "1" +
                            "," + (char)34 + ((SetSql)(this.tempSequenceRow[j])).strName.ToString() + (char)34 + "," + j +
                            "," + (char)34 + ((SetSql)(this.tempSequenceRow[j])).strExpr + (char)34 +
                            "," + (char)34 + ((SetSql)(this.tempSequenceRow[j])).strSetSql + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceRow[j])).strItem.ToString() + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceRow[j])).strItemCH.ToString() + (char)34 + "," +
                            (char)34 + ((SetSql)(this.tempSequenceRow[j])).strSequenceType.ToString() + (char)34 + "," +
                            (char)34 + strdealname + (char)34 + "," + (char)34 + strdealtype + (char)34 + "," +
                            (char)34 + strstatobject + (char)34 + "," + (char)34 + strdealexpr + (char)34 + "," +
                            (char)34 + strdealitemch + (char)34 + "," + (char)34 + strmainobject + (char)34 + "," +
                            (char)34 + strdealconditem + (char)34 + "," + (char)34 + strdealconditemch + (char)34
                            + ",'" + strdealcondexpr + "','" + strdealcondhis + "'," + (char)34 + strdealcondsql + (char)34
                            + ",'" + strgathersequence + "') ";
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception("GetRestrictionExpressValue: " + e.Message);
            }

            return strsql;
        }

        /// <summary>
        /// 取序列条件表
        /// </summary>
        /// <returns></returns>
        private DataTable GetSequence(string str)
        {
            int iResult = 0;
            string strSql = "select * from " + SEQUENCETABLE +
                " where " + SEQUENCE_TYPENO + "=" + int_TypeNo + " and " + SEQUENCE_SETTABLENO +
                "=" + int_SetTableNo + " and " + SEQUENCE_TABLENO + "=" + int_TableNo +
                " and " + SEQUENCE_SERIALNO + "=" + str;
            DataSet ds = dataUnit.FillData(strSql, SEQUENCETABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 序列关联表
        /// </summary>
        /// <param name="i_TypeNo"></param>
        /// <param name="i_SetTableNo"></param>
        /// <param name="i_TableNo"></param>
        /// <param name="Col"></param>
        /// <param name="Row"></param>
        /// <param name="Col2"></param>
        /// <param name="Row2"></param>
        /// <returns></returns>
        public int InsertR201(int i_TypeNo, int i_SetTableNo, int i_TableNo, string str_Object, int Row, int Col, int Row2, int Col2)
        {
            string strBeginSql, strEndSql, strSql;
            SqlCommand insertCmd = new SqlCommand();
            //打开事务
            strBeginSql = " BEGIN TRANSACTION  SET QUOTED_IDENTIFIER OFF ";
            strBeginSql += " delete " + R201TABLE + " where " +
                R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo +
                " and " + R201_SERIALNO + " in(1,2) ";

            //提交事务
            strEndSql = " COMMIT TRANSACTION ";
            strSql = " insert into " + R201TABLE +
                " (" + R201_TYPENO + "," + R201_SETTABLENO + ","
                + R201_TABLENO + "," + R201_SERIALNO + ","
                + R201_STARTROW + "," + R201_STARTCOL + ","
                + R201_ENDROW + "," + R201_ENDCOL + "," + R201_MAINOBJECT + ") values("
                + i_TypeNo + "," + i_SetTableNo + "," + i_TableNo
                + ",1," + Row + "," + Col + "," + Row2 + "," + Col + ",'" + str_Object + "') ";

            strSql += " insert into " + R201TABLE +
                " (" + R201_TYPENO + "," + R201_SETTABLENO + ","
                + R201_TABLENO + "," + R201_SERIALNO + ","
                + R201_STARTROW + "," + R201_STARTCOL + ","
                + R201_ENDROW + "," + R201_ENDCOL + "," + R201_MAINOBJECT + ") values("
                + i_TypeNo + "," + i_SetTableNo + "," + i_TableNo
                + ",2," + Row + "," + Col + "," + Row + "," + Col2 + ",'" + str_Object + "') ";
            insertCmd.CommandText = strBeginSql + strSql + strEndSql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 取序列在套表中的范围
        /// </summary>
        /// <param name="i_TypeNo"></param>
        /// <param name="i_SetTableNo"></param>
        /// <param name="i_TableNo"></param>
        /// <param name="Row"></param>
        /// <param name="Col"></param>
        /// <param name="Row2"></param>
        /// <param name="Col2"></param>
        public void SelectR201(int i_TypeNo, int i_SetTableNo, int i_TableNo, out int Row, out int Col, out int Row2, out int Col2)
        {
            int iResult;
            string strSql = "select *  from " + R201TABLE +
                " where " + R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo + " and " +
                R201_SERIALNO + " in (1,2) ";
            DataSet ds = dataUnit.FillData(strSql, R201TABLE, out iResult);
            try
            {
                if (ds != null && ds.Tables[0].Rows.Count != 0)
                {
                    Row = int.Parse(ds.Tables[0].Rows[0][R201_STARTROW].ToString());
                    Col = int.Parse(ds.Tables[0].Rows[0][R201_STARTCOL].ToString());
                    Row2 = int.Parse(ds.Tables[0].Rows[0][R201_ENDROW].ToString());
                    Col2 = int.Parse(ds.Tables[0].Rows[1][R201_ENDCOL].ToString());
                }
                else
                {
                    Row = 0;
                    Col = 0;
                    Row2 = 0;
                    Col2 = 0;
                }
            }
            catch
            {
                Row = 0;
                Col = 0;
                Row2 = 0;
                Col2 = 0;
            }
        }

        public DataTable selectR200(string strobject, int iTypeNo, int iSetTableNo)
        {
            int iResult = 0;
            string strSql = "select * from " + R200TABLE + " where "
                + R200_MAINOBJECT + " = '" + strobject + "' " +
                " and " + R201_TYPENO + "=" + iTypeNo + " and " + R201_SETTABLENO +
                "=" + iSetTableNo;

            DataSet ds = dataUnit.FillData(strSql, R200TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 取套表中的最大值
        /// </summary>
        /// <param name="strobject"></param>
        /// <param name="iTypeNo"></param>
        /// <param name="iSetTableNo"></param>
        /// <returns></returns>
        public int maxR200(int iTypeNo, int iSetTableNo)
        {
            int iResult = 0;
            string strSql = "select max(tableno)+1 from " + R200TABLE + " where "
                + R201_TYPENO + "=" + iTypeNo + " and " + R201_SETTABLENO +
                "=" + iSetTableNo;

            DataSet ds = dataUnit.FillData(strSql, R200TABLE, out iResult);
            if (ds != null)
            {
                return int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            return 0;
        }

        /// <summary>
        /// 取套表中的备注
        /// </summary>
        /// <param name="strobject"></param>
        /// <param name="iTypeNo"></param>
        /// <param name="iSetTableNo"></param>
        /// <returns></returns>
        public string memoR200(int iTypeNo, int iSetTableNo, int iReport)
        {
            int iResult = 0;
            string strSql = "select rptMemo from " + R200TABLE + " where "
                + R201_TYPENO + "=" + iTypeNo + " and " + R201_SETTABLENO +
                "=" + iSetTableNo + " and " + R201_TABLENO + "=" + iReport;

            DataSet ds = dataUnit.FillData(strSql, R200TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            return "";
        }

        /// <summary>
        /// 取套表中的操作库
        /// </summary>
        /// <param name="strobject"></param>
        /// <param name="iTypeNo"></param>
        /// <param name="iSetTableNo"></param>
        /// <returns></returns>
        public string objectR200(string strObject)
        {
            int iResult = 0;
            string strSql = "SELECT InfoId,ShortDesc FROM Gs_Structure WHERE SUBSTRING(InfoId,3,2)='01' AND Type IN('0','1') and InfoId = '" + strObject + "' ";
            DataSet ds = dataUnit.FillData(strSql, "Gs_Structure", out iResult);
            if (ds != null)
            {
                return ds.Tables[0].Rows[0][1].ToString();
            }
            return "";
        }

        /// <summary>
        /// 取序列在套表中的范围
        /// </summary>
        /// <param name="i_TypeNo"></param>
        /// <param name="i_SetTableNo"></param>
        /// <param name="i_TableNo"></param>
        public void SelectUnitR201(int i_TypeNo, int i_SetTableNo, int i_TableNo, int i_serialNo, out int iRow, out int iCol)
        {
            int iResult;
            string strSql = "select *  from " + R201TABLE +
                " where " + R201_TYPENO + "=" + i_TypeNo + " and " + R201_SETTABLENO +
                "=" + i_SetTableNo + " and " + R201_TABLENO + "=" + i_TableNo + " and " +
                R201_SERIALNO + " = " + i_serialNo;
            DataSet ds = dataUnit.FillData(strSql, R201TABLE, out iResult);
            try
            {
                if (ds != null && ds.Tables[0].Rows.Count != 0)
                {
                    iRow = int.Parse(ds.Tables[0].Rows[0][R201_STARTROW].ToString());
                    iCol = int.Parse(ds.Tables[0].Rows[0][R201_STARTCOL].ToString());
                }
                else
                {
                    iRow = 0;
                    iCol = 0;
                }
            }
            catch
            {
                iRow = 0;
                iCol = 0;
            }
        }

        #region 定义序列常量方法

        /// <summary>
        /// 定义序列常量查询
        /// </summary>
        /// <returns></returns>
        public DataTable SelectEG01(int itypeno, int isettbl, int itableno)
        {
            int iResult = 0;
            string strSql = "select * from " + EG01_TABLE +
                " where " + EG01_TYPENO + " = " + itypeno +
                " and   " + EG01_SETTBL + " = " + isettbl +
                " and   " + EG01_TABLNO + " = " + itableno;
            DataSet ds = dataUnit.FillData(strSql, EG01_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 添加常量序列
        /// </summary>
        /// <returns></returns>
        public int insertConstEG01(int itypeno, int isettbl, int itableno, ArrayList arrayConst)
        {
            string strsql = " delete " + EG01_TABLE +
                " where " + EG01_TYPENO + " = " + itypeno
                + " and " + EG01_SETTBL + " = " + isettbl
                + " and " + EG01_TABLNO + " = " + itableno;
            SqlCommand insertCmd = new SqlCommand();
            for (int j = 0; j < arrayConst.Count; j++)
            {
                strsql += "  insert into " + EG01_TABLE
                    + " (" + EG01_TYPENO + "," + EG01_SETTBL +
                    "," + EG01_TABLNO + "," + EG01_EG01ID +
                    "," + EG01_ZA0101 + "," + EG01_ZA0100 +
                    "," + EG01_USERID + "," + EG01_STARTC +
                    "," + EG01_STARTR +
                    ")	values(" + itypeno + "," + isettbl +
                    "," + itableno + "," + maxtableno(EG01_TABLE, EG01_EG01ID) +
                    ",'" + ((SetSql)(arrayConst[j])).strItem.ToString() +
                    "','" + ((SetSql)(arrayConst[j])).strExpr.ToString() +
                    "','" + ((SetSql)(arrayConst[j])).strItemCH.ToString() +
                    "'," + ((SetSql)(arrayConst[j])).iCol.ToString() +
                    "," + ((SetSql)(arrayConst[j])).iRow.ToString() + ") ";
            }

            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 删除常量序列
        /// </summary>
        /// <returns></returns>
        public int deleteConstEG01(int itypeno, int isettbl, int itableno)
        {
            string strsql = " delete " + EG01_TABLE +
                " where " + EG01_TYPENO + " = " + itypeno
                + " and " + EG01_SETTBL + " = " + isettbl
                + " and " + EG01_TABLNO + " = " + itableno;
            SqlCommand deleteCmd = new SqlCommand();
            deleteCmd.CommandText = strsql;
            return dataUnit.ExecSql(deleteCmd);
        }

        /// <summary>
        /// 取最大值
        /// </summary>
        /// <returns></returns>
        public int maxtableno(string strtable, string strfield)
        {
            int iResult = 0;
            string strSql = "select isnull(max(" + strfield + "),0) + 100 from " + strtable;
            DataSet ds = dataUnit.FillData(strSql, strtable, out iResult);
            if (ds != null)
            {
                return int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            return 100;
        }

        #endregion

        #region hjh 2004.12.22

        /// <summary>
        /// 删除登记表
        /// </summary>
        /// <returns></returns>
        public int deletecardEH01(int itypeno, int isettbl, int itableno)
        {
            string strsql = " delete eh01" +
                " where typeno = " + itypeno
                + " and settbl = " + isettbl
                + " and tablno = " + itableno;
            SqlCommand deleteCmd = new SqlCommand();
            deleteCmd.CommandText = strsql;
            return dataUnit.ExecSql(deleteCmd);
        }

        public void savecardEH01(DataTable dt)
        {
            string strsql = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                try
                {
                    strsql = "insert into eh01(TypeNo,Settbl,TablNo,StartR,StartC,EH0130,EH0105,EH0135,EH0110,EH0120) values("
                        + dt.Rows[i]["TypeNo"].ToString() + "," + dt.Rows[i]["Settbl"].ToString() + ","
                        + dt.Rows[i]["TablNo"].ToString() + "," + dt.Rows[i]["StartR"].ToString() + ","
                        + dt.Rows[i]["StartC"].ToString() + ",'" + dt.Rows[i]["EH0130"].ToString() + "','"
                        + dt.Rows[i]["EH0105"].ToString() + "','" + dt.Rows[i]["EH0135"].ToString() + "','"
                        + dt.Rows[i]["EH0110"].ToString() + "','" + dt.Rows[i]["EH0120"].ToString() + "') ";

                    SqlCommand insertCmd = new SqlCommand();
                    insertCmd.CommandText = strsql;
                    dataUnit.ExecSql(insertCmd);
                }
                catch
                { }
            }
        }

        /// <summary>
        /// 取出统计登记表信息
        /// </summary>
        /// <returns></returns>
        public DataTable SelectEH01(int itypeno, int isettbl, int itableno)
        {
            int iResult = 0;
            string strSql = "select * from eh01" +
                " where typeno = " + itypeno +
                " and   settbl = " + isettbl +
                " and   tablno = " + itableno;
            DataSet ds = dataUnit.FillData(strSql, "EH01", out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 显示数据2004.12.23 hjh  
        /// </summary>
        /// <param name="pkey">主键编码</param>
        /// <returns>错误信息，空为无错误</returns>
        public string gsGetDataRptCard(string strEH0105, string strEH0130, string strEH0110, string strEH0120, string pkey)
        {
            //EH0105 项目，EH0130 表名 ，EH0110 表达式，EH0120 函数
            int iResult = 0;
            string strsql = "";
            DataSet ds;
            if (pkey == null || pkey == "0")
            {
                try
                {
                    strsql = "select top 1 za0100 from " + strEH0130 + " order by za0100";
                    ds = dataUnit.FillData(strsql, strEH0130, out iResult);
                    pkey = ds.Tables[0].Rows[0][0].ToString();
                }
                catch
                {
                    return "";
                }
            }
            string[] strItem = strEH0105.Split('|');
            if (strEH0110 == "")
            {
                for (int i = 0; i < strItem.Length; i++)
                {
                    strEH0110 += "+[" + i.ToString() + "]";
                }
                strEH0110 = strEH0110.Substring(1);
            }

            string[] strtmp;
            if (strItem.Length > 0)
            {
                for (int i = 0; i < strItem.Length; i++)
                {
                    strtmp = strItem[i].Split(':');
                    if (strtmp[2] != "")
                    {
                        //strsql = "dbo.get_dictidname('BE'," + strtmp[1] + ")"; 2005.1.22 ?默认BE?
                        if (strEH0120 != "" && strEH0120.Substring(0, 4).ToUpper() == "代码子串")
                        {
                            strsql = strtmp[1];
                        }
                        else
                        {
                            strsql = "dbo.get_dictidname('BE'," + strtmp[1] + ")";
                        }
                    }
                    else
                    {
                        strsql = strtmp[1];
                    }
                    strEH0110 = strEH0110.Replace("[" + i.ToString() + "]", strsql);
                }
                strsql = "SET QUOTED_IDENTIFIER off select " + strEH0110 + " from "
                    + strEH0130 + " where za0100 = '" + pkey + "' ";
                ds = dataUnit.FillData(strsql, strEH0130, out iResult);
                if (ds != null)
                {
                    string returnValue = ""; //2005.6.4 fw
                    try
                    {
                        returnValue = ds.Tables[0].Rows[0][0].ToString();
                    }
                    catch
                    { }
                    //如果有函数,特殊处理 2005.1.22 FW 
                    if (strEH0120 != "")
                    {
                        if (strEH0120.Substring(0, 2).ToUpper() == "子串" || strEH0120.Substring(0, 4).ToUpper() == "代码子串")
                        {
                            string strvalue = returnValue;
                            string[] paramval = strEH0120.Split(',');
                            int i1, i2;
                            i1 = int.Parse(paramval[1]) - 1;
                            i2 = int.Parse(paramval[2].Replace(")", ""));
                            //补够指定长度的字符，以防字串函数出错
                            strvalue = strvalue.PadRight(i1 + i2 + 1, '¤');
                            returnValue = strvalue.Substring(i1, i2).Replace("¤", "");
                        }
                    }
                    //end
                    return returnValue;
                }
                return "";
            }
            return "";
        }

        #endregion end hjh

    }

    /// <summary>
    /// 结构存放条件信息
    /// </summary>
    public struct SetSql
    {
        public int iRow;   //行
        public int iCol;   //列
        public string strName;//名称
        public string strSetSql;//SQL语句
        public string strItem; //条件
        public string strItemCH;//条件描述
        public string strExpr;//条件表达式

        public string strdealExpr; //处理表达式
        public string strdealstyle;//处理方式
        public string strdealFieldName;//处理字段名
        public string strdealItemCH;//处理描述

        //hjh 2004.12.21
        public string strdealconditem;//表达式条件项
        public string strdealconditemch;//表达式条件描述
        public string strdealcondexpr;//表达式条件表达式
        public string strdealcondhis;//处理历史记录
        //end hjh

        public string strSequenceType;//序列类型
        public string strstatObject;//统计对象
        public string strmainObject;//主对象

        public string strGatherSequence;//汇总设置行列公式
    }
}
