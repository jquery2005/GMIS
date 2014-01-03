using System;
using System.Data;
using System.Data.SqlClient;

namespace Report.stat
{
    /// <summary>
    /// reQuery 的摘要说明。
    /// </summary>
    public class reQuery
    {
        private int m_TypeNo = 1;
        private int m_SetTableNo = 1;
        private int m_TableNo = 1;
        private int m_row = 1;
        private int m_col = 1;
        private string m_AB0110 = "";
        private string m_WholeCondition = "";
        private string m_strMainObject = "AA01";
        private string m_strFLD = "";
        //外部条件
        private string m_Item, m_Expr;
        private int m_isLikeZB0110 = 1;

        public int isLikeZB0110
        {
            get { return m_isLikeZB0110; }
            set { m_isLikeZB0110 = value; }
        }

        public string mItem
        {
            set { m_Item = value; }
        }

        public string mExpr
        {
            set { m_Expr = value; }
        }

        public string MainObject
        {
            set { m_strMainObject = value; }
        }

        public string FLD
        {
            get { return m_strFLD; }
        }

        public reQuery(int TypeNo, int SetTableNo, int TableNo, int row, int col, string AB0110, string WholeCondition)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
            m_TypeNo = TypeNo;
            m_SetTableNo = SetTableNo;
            m_TableNo = TableNo;
            m_row = row;
            m_col = col;
            m_AB0110 = AB0110;
            m_WholeCondition = WholeCondition;
        }

        public reQuery()//它与GetSQl(string RowItem,string ColExpr,string RowItem,string RowExpr)共同使用
        {
            //m_TypeNo = 1;
            //m_SetTableNo = 1;
            //m_TableNo = 1;
            //m_row = 1;
            //m_col = 1;
            //m_AB0110 = "";
            //m_WholeCondition = "";
        }

        public string GetSQl(string ColItem, string ColExpr, string RowItem, string RowExpr, string dealFieldname, out string reCondition)//生成合并后的SQL语句
        {
            int getcount1 = 0;
            int getcount2 = 0;
            string ResultItem = "";//最后的结果的描述
            string ResultExpr = "";//最后的结果的表达式
            if (ColItem == "")
            {
                ColExpr = "";
            }
            if (RowItem == "")
            {
                RowExpr = "";
            }
            string[] strTempwl;
            char[] a;
            try
            {
                a = "~".ToCharArray();

                if (RowItem != "")
                {
                    strTempwl = RowItem.ToString().Split(a);
                    getcount1 = strTempwl.Length;
                }
                if (ColItem != "")
                {
                    strTempwl = ColItem.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                }
                if (ColItem == "")
                {
                    ColExpr = "";
                }
                if (RowItem == "")
                {
                    RowExpr = "";
                }
                ResultExpr = gs_Comexpress(getcount1, getcount2, RowExpr, ColExpr);
                if (RowItem == "")
                {
                    ResultItem = ColItem;
                }
                else if (ColItem == "")
                {
                    ResultItem = RowItem;
                }
                else
                {
                    ResultItem = RowItem + "~" + ColItem;
                }
                getcount1 = getcount2 + getcount1;
                //--------------------------------------------
                Datastat RptLoad = new Datastat();
                RptLoad.MainObject = m_strMainObject;
                RptLoad.StatResult(ResultItem);
                string strTBL;
                string strFLD;
                string strASS;
                strTBL = RptLoad.TBL;
                strFLD = RptLoad.FLD;
                strASS = RptLoad.ASS;
                //-------------------------------------------------------------
                QueryDeal dealCondition = new QueryDeal(m_strMainObject, ResultExpr, ResultItem, "", dealFieldname);
                string strCondition = dealCondition.QueryResult();
                //return strCondition;

                dealData dealRequery = new dealData();
                reCondition = dealRequery.ReQuery(m_strMainObject, strTBL, strFLD, strASS, strCondition);
                return strCondition;
            }
            catch (Exception ee)
            {
                reCondition = "";
                return ee.Message;
            }
        }

        public string GetSQl()//生成合并后的SQL语句
        {
            try
            {
                dealData RptR_C = new dealData();
                SqlDataReader objRCReader;
                dealData Rpt4 = new dealData();
                SqlDataReader objRPT4Reader;
                objRCReader = RptR_C.getRC_R(m_TypeNo, m_SetTableNo, m_TableNo);
                Sequence First = new Sequence(-1, -1, 1, 1, "#");
                Sequence Second = new Sequence(-1, -1, 1, 1, "#");
                Sequence Result = new Sequence(-1, -1, 1, 1, "#");
                string RowExpr = "";//行条件的表达式
                string ColExpr = "";//列条件的表达式
                string RowItem = "";//行条件的项
                string ColItem = "";//列条件的项
                string RowChineseItem = "";//行的中文描述关系
                string ColChineseItem = "";//列的中文描述关系
                string ResultItem = "";//最后的结果的描述
                string ResultExpr = "";//最后的结果的表达式
                string ResultChinese = "";//结果的汉字描述
                int sequenceRow = -1;
                int sequenceCol = -1;
                int getcount1 = 0;
                int getcount2 = 0;
                string[] strTempwl;
                char[] a;
                a = "~".ToCharArray();

                int i = 1;
                if (m_strMainObject == "")
                {
                    string strtmp = " select MainObject from r200 where typeno = " + m_TypeNo + " and settableno = " + m_SetTableNo + " and tableno = " + m_TableNo;
                    DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
                    DataTable dt = getsql.gsQuerySql(strtmp, "R200");
                    if (dt == null || dt.Rows.Count == 0)
                    {
                        m_strMainObject = "AA01";
                    }
                    else
                    {
                        m_strMainObject = dt.Rows[0]["MainObject"].ToString();
                    }
                }
                //处理行列条件
                while (objRCReader.Read())
                {
                    if (i == 1)
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            First.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            First.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            First.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    else
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            Second.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            Second.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            Second.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    i++;
                }
                objRCReader.Close();
                objRCReader = null;

                bool blnTemp;
                blnTemp = true;
                if (Second.STARTROW != -1 && First.STARTROW != -1)
                {
                    blnTemp = true;
                }
                else if (Second.STARTROW == -1 && First.STARTROW != -1)
                {
                    Result = First;
                    blnTemp = false;
                }
                else if (First.STARTROW == -1 && Second.STARTROW != -1)
                {
                    Result = Second;
                    blnTemp = false;
                }
                else
                {
                    sequenceRow = -1;
                    sequenceCol = -1;
                }
                //return "";
                if (blnTemp == false)//一行或一列
                {
                    //Result.STARTROW = First.STARTROW;
                    //Result.ENDROW = First.ENDROW;
                    //Result.STARTCOL = First.STARTCOL;
                    //Result.ENDCOL = First.ENDCOL;
                    //Result.SEQUENCETYPE = First.SEQUENCETYPE;
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (Result.SEQUENCETYPE == "1")
                    {
                        if (sequenceCol != 0)
                        {
                            sequenceCol = -1;
                        }
                    }
                    else
                    {
                        if (sequenceRow != 0)
                        {
                            sequenceRow = -1;
                        }
                    }
                }
                else if (First.STARTROW == Second.STARTROW && First.STARTCOL == Second.STARTCOL)//二维序列
                {
                    Result.STARTROW = First.STARTROW;
                    if (First.SEQUENCETYPE == "1")
                    {
                        Result.ENDROW = First.ENDROW;
                    }
                    else
                    {
                        Result.ENDROW = Second.ENDROW;
                    }
                    Result.STARTCOL = First.STARTCOL;
                    if (First.SEQUENCETYPE == "2")
                    {
                        Result.ENDCOL = First.ENDCOL;
                    }
                    else
                    {
                        Result.ENDCOL = Second.ENDCOL;
                    }
                    Result.SEQUENCETYPE = "1&2";
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (m_row > Result.ENDROW || m_col > Result.ENDCOL)
                    {
                        sequenceRow = -1;
                        sequenceCol = -1;
                    }
                }
                else//两行暂没有处理
                {
                    Result.SEQUENCETYPE = "1|2";
                }
                //找出据在的序列的位置

                //if (First.SEQUENCETYPE == "1" && m_row - First.STARTROW >= 0 && m_row <= First.ENDROW)
                //{
                //    sequenceRow = m_row - First.STARTROW;
                //}
                //if (First.SEQUENCETYPE == "2" && m_col - First.STARTCOL >= 0 && m_col <= First.ENDCOL)
                //{
                //    sequenceCol = m_col - First.STARTCOL;
                //}
                //if (Second.SEQUENCETYPE == "1" && m_row - Second.STARTROW >= 0 && m_row <= Second.ENDROW)
                //{
                //    sequenceRow = m_row - Second.STARTROW;
                //}
                //if (Second.SEQUENCETYPE == "2" && m_col - Second.STARTCOL >= 0 && m_col <= Second.ENDCOL)
                //{
                //    sequenceCol = m_col - Second.STARTCOL;
                //}
                if (sequenceRow > -1 && sequenceCol > -1)//行列序列
                {
                    if (sequenceRow > -1)
                    {
                        dealData Rpt1 = new dealData();
                        SqlDataReader objRPT1Reader;
                        objRPT1Reader = Rpt1.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceRow, "1");
                        while (objRPT1Reader.Read())
                        {
                            if (objRPT1Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                RowExpr = objRPT1Reader["baseexpr"].ToString();
                                RowItem = objRPT1Reader["baseitem"].ToString();
                                RowChineseItem = objRPT1Reader["chineseitem"].ToString();
                            }
                        }
                        objRPT1Reader.Close();
                        //-----------------------------------------
                        dealData Rpt2 = new dealData();
                        SqlDataReader objRPT2Reader;
                        objRPT2Reader = Rpt2.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceCol, "2");
                        while (objRPT2Reader.Read())
                        {
                            if (objRPT2Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                ColExpr = objRPT2Reader["baseexpr"].ToString();
                                ColItem = objRPT2Reader["baseitem"].ToString();
                                ColChineseItem = objRPT2Reader["chineseitem"].ToString();
                            }
                        }
                        objRPT2Reader.Close();
                        //条件项内分隔符
                        if (RowItem != "")
                        {
                            strTempwl = RowItem.ToString().Split(a);
                            getcount1 = strTempwl.Length;
                        }
                        if (ColItem != "")
                        {
                            strTempwl = ColItem.ToString().Split(a);
                            getcount2 = strTempwl.Length;
                        }
                        //string ResultItem = "";//最后的结果的描述
                        //string ResultExpr = "";//最后的结果的表达式
                        //string ResultChinese = "";//结果的汉字描述

                        if (getcount1 == 0 && getcount2 == 0)
                        {//加入单元条件
                            //getUnitCondition
                            objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "2", m_row, m_col);
                            while (objRPT4Reader.Read())
                            {
                                if (objRPT4Reader["sequenceType"].ToString() == "4")
                                {
                                    return "";
                                }
                                else
                                {
                                    ColExpr = objRPT4Reader["baseexpr"].ToString();
                                    ColItem = objRPT4Reader["baseitem"].ToString();
                                    ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                                }
                            }
                            objRPT4Reader.Close();
                            if (ColExpr != "")
                            {
                                ResultItem = ColItem;
                                ResultExpr = ColExpr;
                                ResultChinese = ColChineseItem;
                            }
                            //else
                            //{
                            //    return "";
                            //}
                        }
                        else if (getcount1 == 0 && getcount2 != 0)
                        {
                            ResultItem = ColItem;
                            ResultExpr = ColExpr;
                            ResultChinese = ColChineseItem;
                        }
                        else if (getcount1 != 0 && getcount2 == 0)
                        {
                            ResultItem = RowItem;
                            ResultExpr = RowExpr;
                            ResultChinese = RowChineseItem;
                        }
                        else
                        {
                            if (ColItem == "")
                            {
                                ColExpr = "";
                            }
                            if (RowItem == "")
                            {
                                RowExpr = "";
                            }

                            ResultExpr = gs_Comexpress(getcount1, getcount2, RowExpr, ColExpr);
                            ResultItem = RowItem + "~" + ColItem;
                            ResultChinese = RowChineseItem + "~" + ColChineseItem;
                        }
                        getcount1 = getcount2 + getcount1;
                    }
                }
                else
                {//单元条件
                    objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "3", m_row, m_col);
                    while (objRPT4Reader.Read())
                    {
                        ColExpr = objRPT4Reader["baseexpr"].ToString();
                        ColItem = objRPT4Reader["baseitem"].ToString();
                        ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                    }
                    objRPT4Reader.Close();
                    if (ColExpr != "")
                    {
                        ResultItem = ColItem;
                        ResultExpr = ColExpr;
                        ResultChinese = ColChineseItem;
                        strTempwl = ResultItem.ToString().Split(a);
                        getcount1 = strTempwl.Length;
                    }
                    else
                    {
                        return "";
                    }
                }

                //处理全表条件

                dealData Rpt3 = new dealData();
                SqlDataReader objRPT3Reader;
                objRPT3Reader = Rpt3.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, -1, "0");
                while (objRPT3Reader.Read())
                {
                    if (objRPT3Reader["sequenceType"].ToString() == "4")
                    {
                        return "";
                    }
                    else
                    {
                        ColExpr = objRPT3Reader["baseexpr"].ToString();
                        ColItem = objRPT3Reader["baseitem"].ToString();
                        ColChineseItem = objRPT3Reader["chineseitem"].ToString();
                    }
                }
                objRPT3Reader.Close();
                if (ColItem != "")
                {
                    if (ColItem == "")
                    {
                        ColExpr = "";
                    }
                    if (ResultItem == "")
                    {
                        ResultExpr = "";
                    }

                    strTempwl = ColItem.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, ColExpr);
                    if (ResultItem != "")
                    {
                        ResultItem = ResultItem + "~" + ColItem;
                    }
                    else
                    {
                        ResultItem = ColItem;
                    }
                    if (ResultChinese != "")
                    {
                        ResultChinese = ResultChinese + "~" + ColChineseItem;
                    }
                    else
                    {
                        ResultChinese = ColChineseItem;
                    }
                    getcount1 = getcount1 + getcount2;
                }
                //处理外部条件
                if (m_Item != null && this.m_Item != "")
                {
                    strTempwl = m_Item.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, m_Expr);
                    ResultItem = ResultItem + "~" + m_Item;
                    //ResultChinese = ResultChinese + "~" + ColChineseItem;
                    //getcount1 = getcount1 + getcount2;
                }
                //if(ResultItem!="")
                //{
                QueryDeal dealCondition = new QueryDeal(m_strMainObject, ResultExpr, ResultItem, "");
                string strCondition = dealCondition.QueryResult();
                if (strCondition != "" && m_AB0110 != "-1")
                {
                    if (m_AB0110 != "" && m_AB0110 != "0")
                    {
                        if (m_strMainObject.ToUpper() != "AB01")
                        {
                            strCondition = strCondition + " and " + m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                        }
                        else
                        {
                            strCondition = strCondition + " and " + m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                        }
                    }
                    else
                    {
                        if (m_AB0110 != "" && m_AB0110 != "0")
                        {
                            if (m_strMainObject.ToUpper() != "AB01")
                            {
                                strCondition = m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                            }
                            else
                            {
                                strCondition = m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                            }
                        }
                    }
                }
                m_strFLD = dealCondition.FLD;
                Datastat RptLoad = new Datastat();
                RptLoad.MainObject = m_strMainObject;
                RptLoad.StatResult(m_TypeNo, m_SetTableNo, m_TableNo, false);
                string strTBL;
                string strFLD;
                string strASS;
                strTBL = RptLoad.TBL;
                strFLD = RptLoad.FLD;
                strASS = RptLoad.ASS;
                dealData dealRequery = new dealData();
                if (strCondition == "")
                {
                    strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' ";
                }
                strCondition = dealRequery.ReQuery(m_strMainObject, strTBL, strFLD, strASS, strCondition);
                return strCondition;

                //处理单元条件
                //sequenceRow
            }
            catch (Exception ee)
            {
                return "";
                //return "getsql " + ee.Message;
            }
        }

        public string GetSQl(out string strWhere)//生成合并后的SQL语句
        {
            strWhere = "";
            try
            {
                dealData RptR_C = new dealData();
                SqlDataReader objRCReader;
                dealData Rpt4 = new dealData();
                SqlDataReader objRPT4Reader;
                objRCReader = RptR_C.getRC_R(m_TypeNo, m_SetTableNo, m_TableNo);
                Sequence First = new Sequence(-1, -1, 1, 1, "#");
                Sequence Second = new Sequence(-1, -1, 1, 1, "#");
                Sequence Result = new Sequence(-1, -1, 1, 1, "#");
                string RowExpr = "";//行条件的表达式
                string ColExpr = "";//列条件的表达式
                string RowItem = "";//行条件的项
                string ColItem = "";//列条件的项
                string RowChineseItem = "";//行的中文描述关系
                string ColChineseItem = "";//列的中文描述关系
                string ResultItem = "";//最后的结果的描述
                string ResultExpr = "";//最后的结果的表达式
                string ResultChinese = "";//结果的汉字描述
                int sequenceRow = -1;
                int sequenceCol = -1;
                int getcount1 = 0;
                int getcount2 = 0;
                string[] strTempwl;
                char[] a;
                a = "~".ToCharArray();

                int i = 1;
                if (m_strMainObject == "")
                {
                    string strtmp = " select MainObject from r200 where typeno = " + m_TypeNo + " and settableno = " + m_SetTableNo + " and tableno = " + m_TableNo;
                    DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
                    DataTable dt = getsql.gsQuerySql(strtmp, "R200");
                    if (dt == null || dt.Rows.Count == 0)
                    {
                        m_strMainObject = "AA01";
                    }
                    else
                    {
                        m_strMainObject = dt.Rows[0]["MainObject"].ToString();
                    }
                }
                //处理行列条件
                while (objRCReader.Read())
                {
                    if (i == 1)
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            First.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            First.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            First.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    else
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            Second.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            Second.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            Second.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    i++;
                }
                objRCReader.Close();
                objRCReader = null;

                bool blnTemp;
                blnTemp = true;
                if (Second.STARTROW != -1 && First.STARTROW != -1)
                {
                    blnTemp = true;
                }
                else if (Second.STARTROW == -1 && First.STARTROW != -1)
                {
                    Result = First;
                    blnTemp = false;
                }
                else if (First.STARTROW == -1 && Second.STARTROW != -1)
                {
                    Result = Second;
                    blnTemp = false;
                }
                else
                {
                    sequenceRow = -1;
                    sequenceCol = -1;
                }
                //return "";
                if (blnTemp == false)//一行或一列
                {
                    //Result.STARTROW = First.STARTROW;
                    //Result.ENDROW = First.ENDROW;
                    //Result.STARTCOL = First.STARTCOL;
                    //Result.ENDCOL = First.ENDCOL;
                    //Result.SEQUENCETYPE = First.SEQUENCETYPE;
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (Result.SEQUENCETYPE == "1")
                    {
                        if (sequenceCol != 0)
                        {
                            sequenceCol = -1;
                        }
                    }
                    else
                    {
                        if (sequenceRow != 0)
                        {
                            sequenceRow = -1;
                        }
                    }
                }
                else if (First.STARTROW == Second.STARTROW && First.STARTCOL == Second.STARTCOL)//二维序列
                {
                    Result.STARTROW = First.STARTROW;
                    if (First.SEQUENCETYPE == "1")
                    {
                        Result.ENDROW = First.ENDROW;
                    }
                    else
                    {
                        Result.ENDROW = Second.ENDROW;
                    }
                    Result.STARTCOL = First.STARTCOL;
                    if (First.SEQUENCETYPE == "2")
                    {
                        Result.ENDCOL = First.ENDCOL;
                    }
                    else
                    {
                        Result.ENDCOL = Second.ENDCOL;
                    }
                    Result.SEQUENCETYPE = "1&2";
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (m_row > Result.ENDROW || m_col > Result.ENDCOL)
                    {
                        sequenceRow = -1;
                        sequenceCol = -1;
                    }
                }
                else//两行暂没有处理
                {
                    Result.SEQUENCETYPE = "1|2";
                }
                //找出据在的序列的位置

                //if (First.SEQUENCETYPE == "1" && m_row - First.STARTROW >= 0 && m_row <= First.ENDROW)
                //{
                //    sequenceRow = m_row - First.STARTROW;
                //}
                //if (First.SEQUENCETYPE == "2" && m_col - First.STARTCOL >= 0 && m_col <= First.ENDCOL)
                //{
                //    sequenceCol = m_col - First.STARTCOL;
                //}
                //if (Second.SEQUENCETYPE == "1" && m_row - Second.STARTROW >= 0 && m_row <= Second.ENDROW)
                //{
                //    sequenceRow = m_row - Second.STARTROW;
                //}
                //if (Second.SEQUENCETYPE == "2" && m_col - Second.STARTCOL >= 0 && m_col <= Second.ENDCOL)
                //{
                //    sequenceCol = m_col - Second.STARTCOL;
                //}
                bool nullSequenceRow = false;
                bool nullSequenceCol = false;
                if (sequenceRow > -1 && sequenceCol > -1)//行列序列
                {
                    if (sequenceRow > -1)
                    {
                        dealData Rpt1 = new dealData();
                        SqlDataReader objRPT1Reader;
                        objRPT1Reader = Rpt1.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceRow, "1");
                        while (objRPT1Reader.Read())
                        {
                            if (objRPT1Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                RowExpr = objRPT1Reader["baseexpr"].ToString();
                                RowItem = objRPT1Reader["baseitem"].ToString();
                                RowChineseItem = objRPT1Reader["chineseitem"].ToString();
                                if (RowItem == null || RowItem == "")
                                {
                                    nullSequenceRow = true;
                                }
                            }
                        }
                        objRPT1Reader.Close();
                        //-----------------------------------------
                        dealData Rpt2 = new dealData();
                        SqlDataReader objRPT2Reader;
                        objRPT2Reader = Rpt2.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceCol, "2");
                        while (objRPT2Reader.Read())
                        {
                            if (objRPT2Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                ColExpr = objRPT2Reader["baseexpr"].ToString();
                                ColItem = objRPT2Reader["baseitem"].ToString();
                                ColChineseItem = objRPT2Reader["chineseitem"].ToString();
                                if (ColItem == null || ColItem == "")
                                {
                                    nullSequenceCol = true;
                                }
                            }
                        }
                        objRPT2Reader.Close();
                        //条件项内分隔符
                        if (RowItem != "")
                        {
                            strTempwl = RowItem.ToString().Split(a);
                            getcount1 = strTempwl.Length;
                        }
                        if (ColItem != "")
                        {
                            strTempwl = ColItem.ToString().Split(a);
                            getcount2 = strTempwl.Length;
                        }
                        //string ResultItem = "";//最后的结果的描述
                        //string ResultExpr = "";//最后的结果的表达式
                        //string ResultChinese = "";//结果的汉字描述

                        if (getcount1 == 0 && getcount2 == 0 && nullSequenceRow == false && nullSequenceCol == false)
                        {//加入单元条件
                            //getUnitCondition
                            objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "2", m_row, m_col);
                            while (objRPT4Reader.Read())
                            {
                                if (objRPT4Reader["sequenceType"].ToString() == "4")
                                {
                                    return "";
                                }
                                else
                                {
                                    ColExpr = objRPT4Reader["baseexpr"].ToString();
                                    ColItem = objRPT4Reader["baseitem"].ToString();
                                    ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                                }
                            }
                            objRPT4Reader.Close();
                            if (ColExpr != "")
                            {
                                ResultItem = ColItem;
                                ResultExpr = ColExpr;
                                ResultChinese = ColChineseItem;
                            }
                            else
                            {
                                return "";
                            }
                        }
                        else if (getcount1 == 0 && getcount2 != 0)
                        {
                            ResultItem = ColItem;
                            ResultExpr = ColExpr;
                            ResultChinese = ColChineseItem;
                        }
                        else if (getcount1 != 0 && getcount2 == 0)
                        {
                            ResultItem = RowItem;
                            ResultExpr = RowExpr;
                            ResultChinese = RowChineseItem;
                        }
                        else
                        {
                            if (ColItem == "")
                            {
                                ColExpr = "";
                            }
                            if (RowItem == "")
                            {
                                RowExpr = "";
                            }

                            ResultExpr = gs_Comexpress(getcount1, getcount2, RowExpr, ColExpr);
                            ResultItem = RowItem + "~" + ColItem;
                            ResultChinese = RowChineseItem + "~" + ColChineseItem;
                        }
                        getcount1 = getcount2 + getcount1;
                    }
                }
                else
                {//单元条件
                    objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "3", m_row, m_col);
                    while (objRPT4Reader.Read())
                    {
                        ColExpr = objRPT4Reader["baseexpr"].ToString();
                        ColItem = objRPT4Reader["baseitem"].ToString();
                        ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                    }
                    objRPT4Reader.Close();
                    if (ColExpr != "")
                    {
                        ResultItem = ColItem;
                        ResultExpr = ColExpr;
                        ResultChinese = ColChineseItem;
                        strTempwl = ResultItem.ToString().Split(a);
                        getcount1 = strTempwl.Length;
                    }
                    else
                    {
                        return "";
                    }
                }

                //处理全表条件

                dealData Rpt3 = new dealData();
                SqlDataReader objRPT3Reader;
                objRPT3Reader = Rpt3.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, -1, "0");
                while (objRPT3Reader.Read())
                {
                    if (objRPT3Reader["sequenceType"].ToString() == "4")
                    {
                        return "";
                    }
                    else
                    {
                        ColExpr = objRPT3Reader["baseexpr"].ToString();
                        ColItem = objRPT3Reader["baseitem"].ToString();
                        ColChineseItem = objRPT3Reader["chineseitem"].ToString();
                    }
                }
                objRPT3Reader.Close();
                if (ColItem != "")
                {
                    if (ColItem == "")
                    {
                        ColExpr = "";
                    }
                    if (ResultItem == "")
                    {
                        ResultExpr = "";
                    }

                    strTempwl = ColItem.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, ColExpr);
                    if (ResultItem != "" && ResultItem != "~")
                    {
                        ResultItem = ResultItem + "~" + ColItem;
                    }
                    else
                    {
                        ResultItem = ColItem;
                    }
                    if (ResultChinese != "" && ResultChinese != "~")
                    {
                        ResultChinese = ResultChinese + "~" + ColChineseItem;
                    }
                    else
                    {
                        ResultChinese = ColChineseItem;
                    }
                    getcount1 = getcount1 + getcount2;
                }
                //处理外部条件
                if (m_Item != null && this.m_Item != "")
                {
                    strTempwl = m_Item.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, m_Expr);
                    ResultItem = ResultItem + "~" + m_Item;
                    //ResultChinese = ResultChinese + "~" + ColChineseItem;
                    //getcount1 = getcount1 + getcount2;
                }
                //if(ResultItem!="")
                //{
                QueryDeal dealCondition = new QueryDeal(m_strMainObject, ResultExpr, ResultItem, "");
                string strCondition = dealCondition.QueryResult();
                if (strCondition != "" && m_AB0110 != "-1")
                {
                    if (m_AB0110 != "" && m_AB0110 != "0")
                    {
                        if (m_strMainObject.ToUpper() != "AB01")
                        {
                            strCondition = strCondition + " and " + m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                        }
                        else
                        {
                            strCondition = strCondition + " and " + m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                        }
                    }
                    else
                    {
                        if (m_AB0110 != "" && m_AB0110 != "0")
                        {
                            if (m_strMainObject.ToUpper() != "AB01")
                            {
                                strCondition = m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                            }
                            else
                            {
                                strCondition = m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                            }
                        }
                    }
                }
                m_strFLD = dealCondition.FLD;
                Datastat RptLoad = new Datastat();
                RptLoad.MainObject = m_strMainObject;
                RptLoad.StatResult(m_TypeNo, m_SetTableNo, m_TableNo, false);
                string strTBL;
                string strFLD;
                string strASS;
                strTBL = RptLoad.TBL;
                strFLD = RptLoad.FLD;
                strASS = RptLoad.ASS;
                dealData dealRequery = new dealData();
                if (strCondition == "")
                {
                    if (m_AB0110 != "-1" && m_AB0110 != "0" && m_AB0110 != "")
                    {
                        if (m_strMainObject.ToUpper() != "AB01")
                        {
                            strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' and " + m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                        }
                        else
                        {
                            strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' and " + m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                        }
                    }
                    else
                    {
                        strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' ";
                    }
                }
                strWhere = strCondition;
                strCondition = dealRequery.ReQuery(m_strMainObject, strTBL, strFLD, strASS, strCondition);
                return strCondition;

                //处理单元条件
                //sequenceRow
            }
            catch (Exception ee)
            {
                return "";
                //return "getsql " + ee.Message;
            }
        }//两个表达式进行合并

        //报表反查用（组成sql语句）为处理数字开始时间和截止时间
        public string GetSQl(bool bl, out string strWhere)//生成合并后的SQL语句
        {
            strWhere = "";
            try
            {
                dealData RptR_C = new dealData();
                SqlDataReader objRCReader;
                dealData Rpt4 = new dealData();
                SqlDataReader objRPT4Reader;
                objRCReader = RptR_C.getRC_R(m_TypeNo, m_SetTableNo, m_TableNo);
                Sequence First = new Sequence(-1, -1, 1, 1, "#");
                Sequence Second = new Sequence(-1, -1, 1, 1, "#");
                Sequence Result = new Sequence(-1, -1, 1, 1, "#");
                string RowExpr = "";//行条件的表达式
                string ColExpr = "";//列条件的表达式
                string RowItem = "";//行条件的项
                string ColItem = "";//列条件的项
                string RowChineseItem = "";//行的中文描述关系
                string ColChineseItem = "";//列的中文描述关系
                string ResultItem = "";//最后的结果的描述
                string ResultExpr = "";//最后的结果的表达式
                string ResultChinese = "";//结果的汉字描述
                int sequenceRow = -1;
                int sequenceCol = -1;
                int getcount1 = 0;
                int getcount2 = 0;
                string[] strTempwl;
                char[] a;
                a = "~".ToCharArray();

                int i = 1;
                if (m_strMainObject == "")
                {
                    string strtmp = " select MainObject from r200 where typeno = " + m_TypeNo + " and settableno = " + m_SetTableNo + " and tableno = " + m_TableNo;
                    DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
                    DataTable dt = getsql.gsQuerySql(strtmp, "R200");
                    if (dt == null || dt.Rows.Count == 0)
                    {
                        m_strMainObject = "AA01";
                    }
                    else
                    {
                        m_strMainObject = dt.Rows[0]["MainObject"].ToString();
                    }
                }
                //处理行列条件
                while (objRCReader.Read())
                {
                    if (i == 1)
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            First.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            First.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            First.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            First.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    else
                    {
                        if ((int)(objRCReader["icount"]) != 0)
                        {
                            Second.STARTROW = (int)(objRCReader["startrow"]) + 2;
                            Second.ENDROW = (int)(objRCReader["startrow"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.STARTCOL = (int)(objRCReader["startcol"]) + 2;
                            Second.ENDCOL = (int)(objRCReader["startcol"]) + 2 + (int)(objRCReader["icount"]) - 1;
                            Second.SEQUENCETYPE = objRCReader["serialtype"].ToString();
                        }
                    }
                    i++;
                }
                objRCReader.Close();
                objRCReader = null;

                bool blnTemp;
                blnTemp = true;
                if (Second.STARTROW != -1 && First.STARTROW != -1)
                {
                    blnTemp = true;
                }
                else if (Second.STARTROW == -1 && First.STARTROW != -1)
                {
                    Result = First;
                    blnTemp = false;
                }
                else if (First.STARTROW == -1 && Second.STARTROW != -1)
                {
                    Result = Second;
                    blnTemp = false;
                }
                else
                {
                    sequenceRow = -1;
                    sequenceCol = -1;
                }
                //return "";
                if (blnTemp == false)//一行或一列
                {
                    //Result.STARTROW = First.STARTROW;
                    //Result.ENDROW = First.ENDROW;
                    //Result.STARTCOL = First.STARTCOL;
                    //Result.ENDCOL = First.ENDCOL;
                    //Result.SEQUENCETYPE = First.SEQUENCETYPE;
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (Result.SEQUENCETYPE == "1")
                    {
                        if (sequenceCol != 0)
                        {
                            sequenceCol = -1;
                        }
                    }
                    else
                    {
                        if (sequenceRow != 0)
                        {
                            sequenceRow = -1;
                        }
                    }
                }
                else if (First.STARTROW == Second.STARTROW && First.STARTCOL == Second.STARTCOL)//二维序列
                {
                    Result.STARTROW = First.STARTROW;
                    if (First.SEQUENCETYPE == "1")
                    {
                        Result.ENDROW = First.ENDROW;
                    }
                    else
                    {
                        Result.ENDROW = Second.ENDROW;
                    }
                    Result.STARTCOL = First.STARTCOL;
                    if (First.SEQUENCETYPE == "2")
                    {
                        Result.ENDCOL = First.ENDCOL;
                    }
                    else
                    {
                        Result.ENDCOL = Second.ENDCOL;
                    }
                    Result.SEQUENCETYPE = "1&2";
                    sequenceRow = m_row - Result.STARTROW;
                    sequenceCol = m_col - Result.STARTCOL;
                    if (m_row > Result.ENDROW || m_col > Result.ENDCOL)
                    {
                        sequenceRow = -1;
                        sequenceCol = -1;
                    }
                }
                else//两行暂没有处理
                {
                    Result.SEQUENCETYPE = "1|2";
                }
                //找出据在的序列的位置

                //if (First.SEQUENCETYPE == "1" && m_row - First.STARTROW >= 0 && m_row <= First.ENDROW)
                //{
                //    sequenceRow = m_row - First.STARTROW;
                //}
                //if (First.SEQUENCETYPE == "2" && m_col - First.STARTCOL >= 0 && m_col <= First.ENDCOL)
                //{
                //    sequenceCol = m_col - First.STARTCOL;
                //}
                //if (Second.SEQUENCETYPE == "1" && m_row - Second.STARTROW >= 0 && m_row <= Second.ENDROW)
                //{
                //    sequenceRow = m_row - Second.STARTROW;
                //}
                //if (Second.SEQUENCETYPE == "2" && m_col - Second.STARTCOL >= 0 && m_col <= Second.ENDCOL)
                //{
                //    sequenceCol = m_col - Second.STARTCOL;
                //}
                bool nullSequenceRow = false;
                bool nullSequenceCol = false;
                if (sequenceRow > -1 && sequenceCol > -1)//行列序列
                {
                    if (sequenceRow > -1)
                    {
                        dealData Rpt1 = new dealData();
                        SqlDataReader objRPT1Reader;
                        objRPT1Reader = Rpt1.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceRow, "1");
                        while (objRPT1Reader.Read())
                        {
                            if (objRPT1Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                RowExpr = objRPT1Reader["baseexpr"].ToString();
                                RowItem = objRPT1Reader["baseitem"].ToString();
                                RowChineseItem = objRPT1Reader["chineseitem"].ToString();
                                if (RowItem == null || RowItem == "")
                                {
                                    nullSequenceRow = true;
                                }
                            }
                        }
                        objRPT1Reader.Close();
                        //-----------------------------------------
                        dealData Rpt2 = new dealData();
                        SqlDataReader objRPT2Reader;
                        objRPT2Reader = Rpt2.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, sequenceCol, "2");
                        while (objRPT2Reader.Read())
                        {
                            if (objRPT2Reader["sequenceType"].ToString() == "4")
                            {
                                return "";
                            }
                            else
                            {
                                ColExpr = objRPT2Reader["baseexpr"].ToString();
                                ColItem = objRPT2Reader["baseitem"].ToString();
                                ColChineseItem = objRPT2Reader["chineseitem"].ToString();
                                if (ColItem == null || ColItem == "")
                                {
                                    nullSequenceCol = true;
                                }
                            }
                        }
                        objRPT2Reader.Close();
                        //条件项内分隔符
                        if (RowItem != "")
                        {
                            strTempwl = RowItem.ToString().Split(a);
                            getcount1 = strTempwl.Length;
                        }
                        if (ColItem != "")
                        {
                            strTempwl = ColItem.ToString().Split(a);
                            getcount2 = strTempwl.Length;
                        }
                        //string ResultItem = "";//最后的结果的描述
                        //string ResultExpr = "";//最后的结果的表达式
                        //string ResultChinese = "";//结果的汉字描述

                        if (getcount1 == 0 && getcount2 == 0 && nullSequenceRow == false && nullSequenceCol == false)
                        {//加入单元条件
                            //getUnitCondition
                            objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "2", m_row, m_col);
                            while (objRPT4Reader.Read())
                            {
                                if (objRPT4Reader["sequenceType"].ToString() == "4")
                                {
                                    return "";
                                }
                                else
                                {
                                    ColExpr = objRPT4Reader["baseexpr"].ToString();
                                    ColItem = objRPT4Reader["baseitem"].ToString();
                                    ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                                }
                            }
                            objRPT4Reader.Close();
                            if (ColExpr != "")
                            {
                                ResultItem = ColItem;
                                ResultExpr = ColExpr;
                                ResultChinese = ColChineseItem;
                            }
                            else
                            {
                                return "";
                            }
                        }
                        else if (getcount1 == 0 && getcount2 != 0)
                        {
                            ResultItem = ColItem;
                            ResultExpr = ColExpr;
                            ResultChinese = ColChineseItem;
                        }
                        else if (getcount1 != 0 && getcount2 == 0)
                        {
                            ResultItem = RowItem;
                            ResultExpr = RowExpr;
                            ResultChinese = RowChineseItem;
                        }
                        else
                        {
                            if (ColItem == "")
                            {
                                ColExpr = "";
                            }
                            if (RowItem == "")
                            {
                                RowExpr = "";
                            }

                            ResultExpr = gs_Comexpress(getcount1, getcount2, RowExpr, ColExpr);
                            ResultItem = RowItem + "~" + ColItem;
                            ResultChinese = RowChineseItem + "~" + ColChineseItem;
                        }
                        getcount1 = getcount2 + getcount1;
                    }
                }
                else
                {//单元条件
                    objRPT4Reader = Rpt4.getUnitCondition(m_TypeNo, m_SetTableNo, m_TableNo, "3", m_row, m_col);
                    while (objRPT4Reader.Read())
                    {
                        ColExpr = objRPT4Reader["baseexpr"].ToString();
                        ColItem = objRPT4Reader["baseitem"].ToString();
                        ColChineseItem = objRPT4Reader["chineseitem"].ToString();
                    }
                    objRPT4Reader.Close();
                    if (ColExpr != "")
                    {
                        ResultItem = ColItem;
                        ResultExpr = ColExpr;
                        ResultChinese = ColChineseItem;
                        strTempwl = ResultItem.ToString().Split(a);
                        getcount1 = strTempwl.Length;
                    }
                    else
                    {
                        return "";
                    }
                }

                //处理全表条件

                dealData Rpt3 = new dealData();
                SqlDataReader objRPT3Reader;
                objRPT3Reader = Rpt3.getOneCondition(m_TypeNo, m_SetTableNo, m_TableNo, -1, "0");
                while (objRPT3Reader.Read())
                {
                    if (objRPT3Reader["sequenceType"].ToString() == "4")
                    {
                        return "";
                    }
                    else
                    {
                        ColExpr = objRPT3Reader["baseexpr"].ToString();
                        ColItem = objRPT3Reader["baseitem"].ToString();
                        ColChineseItem = objRPT3Reader["chineseitem"].ToString();

                        //2005.1.25 fw +入全表条件
                        if (ColItem != "")
                        {
                            if (ColItem == "")
                            {
                                ColExpr = "";
                            }
                            if (ResultItem == "")
                            {
                                ResultExpr = "";
                            }

                            strTempwl = ColItem.ToString().Split(a);
                            getcount2 = strTempwl.Length;
                            ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, ColExpr);
                            if (ResultItem != "" && ResultItem != "~")
                            {
                                ResultItem = ResultItem + "~" + ColItem;
                            }
                            else
                            {
                                ResultItem = ColItem;
                            }
                            if (ResultChinese != "" && ResultChinese != "~")
                            {
                                ResultChinese = ResultChinese + "~" + ColChineseItem;
                            }
                            else
                            {
                                ResultChinese = ColChineseItem;
                            }
                            getcount1 = getcount1 + getcount2;
                        }
                    }
                }
                objRPT3Reader.Close();
                // hjh 2004.12.30 列条件多加入了一遍
                //if (ColItem != "")
                //{
                //    if (ColItem == "")
                //    {
                //        ColExpr = "";
                //    }
                //    if (ResultItem == "")
                //    {
                //        ResultExpr = "";
                //    }

                //    strTempwl = ColItem.ToString().Split(a);
                //    getcount2 = strTempwl.Length;
                //    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, ColExpr);
                //    if (ResultItem != "" && ResultItem != "~")
                //    {
                //        ResultItem = ResultItem + "~" + ColItem;
                //    }
                //    else
                //    {
                //        ResultItem = ColItem;
                //    }
                //    if (ResultChinese != "" && ResultChinese != "~")
                //    {
                //        ResultChinese = ResultChinese + "~" + ColChineseItem;
                //    }
                //    else
                //    {
                //        ResultChinese = ColChineseItem;
                //    }
                //    getcount1 = getcount1 + getcount2;
                //}
                //end hjh
                //处理外部条件
                if (m_Item != null && this.m_Item != "")
                {
                    strTempwl = m_Item.ToString().Split(a);
                    getcount2 = strTempwl.Length;
                    ResultExpr = gs_Comexpress(getcount1, getcount2, ResultExpr, m_Expr);
                    ResultItem = ResultItem + "~" + m_Item;
                    //ResultChinese = ResultChinese + "~" + ColChineseItem;
                    //getcount1 = getcount1 + getcount2;
                }
                //if(ResultItem!="")
                //{
                QueryDeal dealCondition = new QueryDeal(m_strMainObject, ResultExpr, ResultItem, "");
                string strCondition = dealCondition.QueryResult(m_TypeNo, m_SetTableNo, m_TableNo, DMServer.Common.ConfigMy.strUserID);

                //2005.4.15 FW 按照机构层次组合 关联机构的SQL语句
                string relationStr = "";
                if (m_AB0110 != "" && m_AB0110 != "0")
                {
                    string sql = "";
                    sql = "select infofield from gs_deplayer";
                    DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
                    DataTable myDT = getsql.gsQuerySql(sql, "gs_deplayer");
                    if (myDT != null && myDT.Rows.Count > 0)
                    {
                        for (int k = 0; k < myDT.Rows.Count; k++)
                        {
                            if (isLikeZB0110 != 1)
                            {
                                relationStr += "or " + m_strMainObject + "." + myDT.Rows[k][0].ToString() + " ='" + m_AB0110 + "' ";
                            }
                            else
                            {
                                relationStr += "or " + m_strMainObject + "." + myDT.Rows[k][0].ToString() + " like '" + m_AB0110 + "%' ";
                            }
                        }

                        relationStr = relationStr.Substring(2, relationStr.Length - 2);
                    }
                }

                //2005.4.15 结束
                if (strCondition != "" && m_AB0110 != "-1")
                {
                    if (m_AB0110 != "" && m_AB0110 != "0")
                    {
                        if (m_strMainObject.ToUpper() != "AB01")
                        {
                            strCondition = strCondition + " and (" + relationStr + ")";
                        }
                        else
                        {
                            strCondition = strCondition + " and " + m_strMainObject + ".za0100 = '" + m_AB0110 + "'";
                        }
                    }
                    else
                    {
                        if (m_AB0110 != "" && m_AB0110 != "0")
                        {
                            if (m_strMainObject.ToUpper() != "AB01")
                            {
                                //strCondition=m_strMainObject+".ab0110 like '"+m_AB0110+"%'";2005.4.15
                                strCondition = "(" + relationStr + ")";
                            }
                            else
                            {
                                strCondition = m_strMainObject + ".za0100 = '" + m_AB0110 + "'";
                            }
                        }
                    }
                }
                m_strFLD = dealCondition.FLD;
                Datastat RptLoad = new Datastat();
                RptLoad.MainObject = m_strMainObject;
                RptLoad.StatResult(m_TypeNo, m_SetTableNo, m_TableNo, false);
                string strTBL;
                string strFLD;
                string strASS;
                strTBL = RptLoad.TBL;
                strFLD = RptLoad.FLD;
                strASS = RptLoad.ASS;
                dealData dealRequery = new dealData();
                if (strCondition == "")
                {
                    if (m_AB0110 != "-1" && m_AB0110 != "0" && m_AB0110 != "")
                    {
                        if (m_strMainObject.ToUpper() != "AB01")
                        {
                            strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' and " + m_strMainObject + ".ab0110 like '" + m_AB0110 + "%'";
                        }
                        else
                        {
                            strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' and " + m_strMainObject + ".ab0110 = '" + m_AB0110 + "'";
                        }
                    }
                    else
                    {
                        strCondition = "select " + m_strMainObject + ".ZA0100 from " + m_strMainObject + " where " + m_strMainObject + ".ZC9993 = '1' ";
                    }
                }
                strWhere = strCondition;
                strCondition = dealRequery.ReQuery(m_strMainObject, strTBL, strFLD, strASS, strCondition);
                return strCondition;

                //处理单元条件
                //sequenceRow
            }
            catch (Exception ee)
            {
                return "";
                //return "getsql " + ee.Message;
            }
        }
        
        //两个表达式进行合并
        public string gs_Comexpress(int Count1, int count2, string express1, string express2)
        {
            if (express1 == "")
            {
                Count1 = 0;
            }
            if (express2 == "")
            {
                count2 = 0;
            }
            string strresult = "";
            strresult = express2;
            strresult = strresult.Replace("*", "{*}").ToString();
            strresult = strresult.Replace("+", "{+}").ToString();
            strresult = strresult.Replace("+", "{+}").ToString();
            string strLeft = "";
            string strRight = "";

            for (int i = count2; i >= 1; i--)
            {
                if ((Count1 + i).ToString().Length >= 3)
                {
                    strresult = strresult.Replace(i.ToString(), "{" + (Count1 + i).ToString() + "}");
                }
                else if ((Count1 + i).ToString().Length > 1 && (Count1 + i).ToString().Length <= 2)
                {
                    switch ((Count1 + i).ToString().Substring(0, 1))
                    {
                        case "0": strLeft = "A"; break;
                        case "1": strLeft = "B"; break;
                        case "2": strLeft = "C"; break;
                        case "3": strLeft = "D"; break;
                        case "4": strLeft = "E"; break;
                        case "5": strLeft = "F"; break;
                        case "6": strLeft = "G"; break;
                        case "7": strLeft = "H"; break;
                        case "8": strLeft = "I"; break;
                        case "9": strLeft = "J"; break;
                    }
                    switch ((Count1 + i).ToString().Substring(1, 1))
                    {
                        case "0": strRight = "U"; break;
                        case "1": strRight = "V"; break;
                        case "2": strRight = "W"; break;
                        case "3": strRight = "X"; break;
                        case "4": strRight = "Y"; break;
                        case "5": strRight = "Z"; break;
                        case "6": strRight = "@"; break;
                        case "7": strRight = "#"; break;
                        case "8": strRight = "$"; break;
                        case "9": strRight = "%"; break;
                    }

                    strresult = strresult.Replace(i.ToString(), "{" + strLeft + strRight + "}");
                }
                else
                {
                    switch ((Count1 + i).ToString())
                    {
                        case "0": strRight = "K"; break;
                        case "1": strRight = "L"; break;
                        case "2": strRight = "M"; break;
                        case "3": strRight = "N"; break;
                        case "4": strRight = "O"; break;
                        case "5": strRight = "P"; break;
                        case "6": strRight = "Q"; break;
                        case "7": strRight = "R"; break;
                        case "8": strRight = "S"; break;
                        case "9": strRight = "T"; break;
                    }
                    strresult = strresult.Replace(i.ToString(), "{" + strRight + "}");
                }
            }
            for (int i = count2; i >= 1; i--)
            {
                if ((Count1 + i).ToString().Length >= 3)
                {
                    strresult = strresult.Replace("{" + (i + Count1).ToString() + "}", "{" + (Count1 + i).ToString() + "}");
                }
                else if ((Count1 + i).ToString().Length > 1 && (Count1 + i).ToString().Length <= 2)
                {
                    switch ((Count1 + i).ToString().Substring(0, 1))
                    {
                        case "0": strLeft = "A"; break;
                        case "1": strLeft = "B"; break;
                        case "2": strLeft = "C"; break;
                        case "3": strLeft = "D"; break;
                        case "4": strLeft = "E"; break;
                        case "5": strLeft = "F"; break;
                        case "6": strLeft = "G"; break;
                        case "7": strLeft = "H"; break;
                        case "8": strLeft = "I"; break;
                        case "9": strLeft = "J"; break;
                    }
                    switch ((Count1 + i).ToString().Substring(1, 1))
                    {
                        case "0": strRight = "U"; break;
                        case "1": strRight = "V"; break;
                        case "2": strRight = "W"; break;
                        case "3": strRight = "X"; break;
                        case "4": strRight = "Y"; break;
                        case "5": strRight = "Z"; break;
                        case "6": strRight = "@"; break;
                        case "7": strRight = "#"; break;
                        case "8": strRight = "$"; break;
                        case "9": strRight = "%"; break;
                    }

                    strresult = strresult.Replace("{" + strLeft + strRight + "}", "{" + (Count1 + i).ToString() + "}");
                }
                else
                {
                    switch ((Count1 + i).ToString())
                    {
                        case "0": strRight = "K"; break;
                        case "1": strRight = "L"; break;
                        case "2": strRight = "M"; break;
                        case "3": strRight = "N"; break;
                        case "4": strRight = "O"; break;
                        case "5": strRight = "P"; break;
                        case "6": strRight = "Q"; break;
                        case "7": strRight = "R"; break;
                        case "8": strRight = "S"; break;
                        case "9": strRight = "T"; break;
                    }
                    strresult = strresult.Replace("{" + strRight + "}", "{" + (Count1 + i).ToString() + "}");
                }
            }
            strresult = strresult.Replace("{*}", "*").ToString();
            strresult = strresult.Replace("{+}", "+").ToString();
            strresult = strresult.Replace("{", "");
            strresult = strresult.Replace("}", "");
            if (express1 != "" && strresult != "")
            {
                strresult = "(" + express1 + ")*(" + strresult + ")";
            }
            else if (express1 == "")
            {
                strresult = strresult;
            }
            else
            {
                strresult = express1;
            }
            return strresult;
        }

        //两个表达式进行合并(方式为或者＋关系)
        private string gs_Comexpress1(int Count1, int count2, string express1, string express2)
        {
            if (express1 == "")
            {
                Count1 = 0;
            }
            if (express2 == "")
            {
                count2 = 0;
            }
            string strresult = "";
            strresult = express2;
            strresult = strresult.Replace("*", "{*}").ToString();
            strresult = strresult.Replace("+", "{+}").ToString();
            strresult = strresult.Replace("+", "{+}").ToString();
            string strLeft = "";
            string strRight = "";

            for (int i = count2; i >= 1; i--)
            {
                if ((Count1 + i).ToString().Length >= 3)
                {
                    strresult = strresult.Replace(i.ToString(), "{" + (Count1 + i).ToString() + "}");
                }
                else if ((Count1 + i).ToString().Length > 1 && (Count1 + i).ToString().Length <= 2)
                {
                    switch ((Count1 + i).ToString().Substring(0, 1))
                    {
                        case "0": strLeft = "A"; break;
                        case "1": strLeft = "B"; break;
                        case "2": strLeft = "C"; break;
                        case "3": strLeft = "D"; break;
                        case "4": strLeft = "E"; break;
                        case "5": strLeft = "F"; break;
                        case "6": strLeft = "G"; break;
                        case "7": strLeft = "H"; break;
                        case "8": strLeft = "I"; break;
                        case "9": strLeft = "J"; break;
                    }
                    switch ((Count1 + i).ToString().Substring(1, 1))
                    {
                        case "0": strRight = "U"; break;
                        case "1": strRight = "V"; break;
                        case "2": strRight = "W"; break;
                        case "3": strRight = "X"; break;
                        case "4": strRight = "Y"; break;
                        case "5": strRight = "Z"; break;
                        case "6": strRight = "@"; break;
                        case "7": strRight = "#"; break;
                        case "8": strRight = "$"; break;
                        case "9": strRight = "%"; break;
                    }

                    strresult = strresult.Replace(i.ToString(), "{" + strLeft + strRight + "}");
                }
                else
                {
                    switch ((Count1 + i).ToString())
                    {
                        case "0": strRight = "K"; break;
                        case "1": strRight = "L"; break;
                        case "2": strRight = "M"; break;
                        case "3": strRight = "N"; break;
                        case "4": strRight = "O"; break;
                        case "5": strRight = "P"; break;
                        case "6": strRight = "Q"; break;
                        case "7": strRight = "R"; break;
                        case "8": strRight = "S"; break;
                        case "9": strRight = "T"; break;
                    }
                    strresult = strresult.Replace(i.ToString(), "{" + strRight + "}");
                }
            }
            for (int i = count2; i >= 1; i--)
            {
                if ((Count1 + i).ToString().Length >= 3)
                {
                    strresult = strresult.Replace("{" + (i + Count1).ToString() + "}", "{" + (Count1 + i).ToString() + "}");
                }
                else if ((Count1 + i).ToString().Length > 1 && (Count1 + i).ToString().Length <= 2)
                {
                    switch ((Count1 + i).ToString().Substring(0, 1))
                    {
                        case "0": strLeft = "A"; break;
                        case "1": strLeft = "B"; break;
                        case "2": strLeft = "C"; break;
                        case "3": strLeft = "D"; break;
                        case "4": strLeft = "E"; break;
                        case "5": strLeft = "F"; break;
                        case "6": strLeft = "G"; break;
                        case "7": strLeft = "H"; break;
                        case "8": strLeft = "I"; break;
                        case "9": strLeft = "J"; break;
                    }
                    switch ((Count1 + i).ToString().Substring(1, 1))
                    {
                        case "0": strRight = "U"; break;
                        case "1": strRight = "V"; break;
                        case "2": strRight = "W"; break;
                        case "3": strRight = "X"; break;
                        case "4": strRight = "Y"; break;
                        case "5": strRight = "Z"; break;
                        case "6": strRight = "@"; break;
                        case "7": strRight = "#"; break;
                        case "8": strRight = "$"; break;
                        case "9": strRight = "%"; break;
                    }

                    strresult = strresult.Replace("{" + strLeft + strRight + "}", "{" + (Count1 + i).ToString() + "}");
                }
                else
                {
                    switch ((Count1 + i).ToString())
                    {
                        case "0": strRight = "K"; break;
                        case "1": strRight = "L"; break;
                        case "2": strRight = "M"; break;
                        case "3": strRight = "N"; break;
                        case "4": strRight = "O"; break;
                        case "5": strRight = "P"; break;
                        case "6": strRight = "Q"; break;
                        case "7": strRight = "R"; break;
                        case "8": strRight = "S"; break;
                        case "9": strRight = "T"; break;
                    }
                    strresult = strresult.Replace("{" + strRight + "}", "{" + (Count1 + i).ToString() + "}");
                }
            }
            strresult = strresult.Replace("{*}", "*").ToString();
            strresult = strresult.Replace("{+}", "+").ToString();
            strresult = strresult.Replace("{", "");
            strresult = strresult.Replace("}", "");
            if (express1 != "" && strresult != "")
            {
                strresult = "(" + express1 + ")+(" + strresult + ")";
            }
            else if (express1 == "")
            {
                strresult = strresult;
            }
            else
            {
                strresult = express1;
            }
            return strresult;
        }

        //将字符串里的数字取出
        public string gs_tonumber(string express)
        {
            string strresult = "";
            string[] strtmp = new string[] { "" };
            strresult = express;
            strresult = strresult.Replace("*", ",").ToString();
            strresult = strresult.Replace("+", ",").ToString();
            strresult = strresult.Replace("-", ",").ToString();
            strresult = strresult.Replace("/", ",").ToString();

            //处理..
            int itmp = strresult.IndexOf("..");
            if (itmp > 0)
            {
                string strresult1 = strresult.Replace("..", "#");
                strtmp = strresult1.Split('#');
                for (int i = 0; i < strtmp.Length; i++)
                {
                    int inumb = 0;
                    int inume = 0;

                    //开始数
                    string[] strnumb = strtmp[i].Split(',');
                    if (strnumb.Length >= 2)
                    {
                        inumb = int.Parse(strnumb[strnumb.Length - 1]);
                    }
                    else
                    {
                        inumb = int.Parse(strnumb[0]);
                    }
                    //结尾数
                    string[] strnume = strtmp[i + 1].Split(',');
                    if (strnume.Length > 2)
                    {
                        inume = int.Parse(strnume[strnume.Length - 1]);
                    }
                    else
                    {
                        inume = int.Parse(strnume[0]);
                    }
                    //合并
                    string ss = "";
                    for (int j = inumb + 1; j < inume; j++)
                    {
                        ss += "," + j.ToString();
                    }
                    strtmp[i] += ss + ",";

                    i++;
                }
            }
            if (strtmp.Length > 1)
            {
                strresult = "";
                for (int c = 0; c < strtmp.Length; c++)
                {
                    strresult += strtmp[c];
                }
            }

            return strresult;
        }

        /// <summary>
        /// 取用户的有权限模块条件
        /// </summary>
        /// <param name="ModuleCode"></param>
        /// <param name="Object"></param>
        /// <param name="BaseExpr"></param>
        /// <param name="BaseItem"></param>
        public void gsGetModuleCondition(string UserId, string MainObject, out string BaseExpr, out string BaseItem)
        {
            string strExpr = "", strItem = "", strExpr1 = "", strItem1 = "";
            int icount1 = 0, icount2 = 0;
            BaseExpr = "";
            BaseItem = "";
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
            string str = " select xd0117,xd0118,xe0201,xe0202 from xd01 left join xe02 on xd01.za0100 = xe02.zc9996 and xe02.za0100  in  (select xf0101 from xf01 where za0101 = '"
                + UserId + "') where xd01.za0100 in (select zc9996 from xe02 where za0100  in (select xf0101 from xf01 where za0101 = '"
                + UserId + "' )) and xd0110 = '" + MainObject + "' ";
            DataTable dt = getsql.gsQuerySql(str, "xd01");

            if (dt == null || dt.Rows.Count == 0)
            {
                return;
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                strExpr = dt.Rows[i]["XD0117"].ToString();
                strItem = dt.Rows[i]["XD0118"].ToString();
                strExpr1 = dt.Rows[i]["xe0201"].ToString();
                strItem1 = dt.Rows[i]["xe0202"].ToString();
                //合并模块用户条件（*）
                if (strItem != "")
                {
                    icount1 = strItem.Split('~').Length;
                }
                if (strItem1 != "")
                {
                    icount2 = strItem1.Split('~').Length;
                }
                if (icount1 == 0)
                {
                    if (icount2 == 0)
                    {
                        BaseExpr = "";
                        BaseItem = "";
                        return;
                    }
                    else
                    {
                        strItem = strItem1;
                        strExpr = strExpr1;
                    }
                }
                else
                {
                    if (icount2 != 0)
                    {
                        strExpr = gs_Comexpress(icount1, icount2, strExpr, strExpr1);
                        if (strItem == "")
                        {
                            strItem = strItem1;
                        }
                        else if (strItem1 == "")
                        {
                            strItem = strItem;
                        }
                        else
                        {
                            strItem = strItem + "  ~" + strItem1;
                        }
                    }
                }
                //累加条件
                if (strItem == "")
                {
                    BaseExpr = "";
                    BaseItem = "";
                    return;
                }
                if (BaseItem != "")
                {
                    icount1 = BaseItem.Split('~').Length;
                }
                if (strItem != "")
                {
                    icount2 = strItem.Split('~').Length;
                }
                if (icount1 == 0)
                {
                    if (icount2 == 0)
                    {
                        BaseExpr = "";
                        BaseItem = "";
                        return;
                    }
                    else
                    {
                        BaseExpr = strExpr;
                        BaseItem = strItem;
                    }
                }
                else
                {
                    if (icount2 == 0)
                    {
                        BaseExpr = "";
                        BaseItem = "";
                        return;
                    }
                    else
                    {
                        BaseExpr = gs_Comexpress1(icount1, icount2, BaseExpr, strExpr);
                        if (BaseItem == "")
                        {
                            BaseItem = strItem;
                        }
                        else if (strItem == "")
                        {
                            BaseItem = BaseItem;
                        }
                        else
                        {
                            BaseItem = BaseItem + "  ~" + strItem;
                        }
                    }
                }
            }
        }
    }

    public struct Sequence
    {
        private int startRow;
        private int startCol;
        private int endRow;
        private int endCol;
        private string sequenceType;

        public Sequence(int StartRow, int EndRow, int StartCol, int EndCol, string type)
        {
            this.startRow = StartRow;
            this.endRow = EndRow;
            this.startCol = StartCol;
            this.endCol = EndCol;
            this.sequenceType = type;
        }

        public int STARTROW
        {
            get { return startRow; }
            set { startRow = value; }
        }

        public int ENDROW
        {
            get { return endRow; }
            set { endRow = value; }
        }

        public int STARTCOL
        {
            get { return startCol; }
            set { startCol = value; }
        }

        public int ENDCOL
        {
            get { return endCol; }
            set { endCol = value; }
        }

        public string SEQUENCETYPE
        {
            get { return sequenceType; }
            set { sequenceType = value; }
        }
    }
}
