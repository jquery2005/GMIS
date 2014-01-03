using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

//王亮2002.8.6
//该类主要完成报表的统计，主要的步骤如下：
//input:单位的范围。
//1、根据全表条件，机构构造出全表过滤条件，这一部分调用查询部分的处理方式。
//2、根据行、列序列生成统计的临时表
//3、根据临时表确定每列的数据
//4、按列优先、行循环过滤进行统计
//5、对于单元条件进行统计，将统计结构直接写入表中

namespace Report.stat
{
    /// <summary>
    /// Datastat 的摘要说明。
    /// </summary>
    public class Datastat
    {
        #region 全局变量

        private StringCollection mTable = new StringCollection(); //表集合
        private StringCollection mField = new StringCollection(); //字段集合
        private StringCollection mFunction = new StringCollection(); //函数集合
        private StringCollection mExpress = new StringCollection(); //表达式集合
        private StringCollection mConst = new StringCollection(); //常量集合
        private StringCollection mAssicate = new StringCollection(); //关联表集合

        #endregion

        #region 属性

        private string m_B0110 = "";
        private string m_strTable = "";
        private string m_startTime = DateTime.Now.ToString();
        private string m_endTime = DateTime.Now.ToString();
        private string m_strMainObject = "AA01";
        private string m_FLD;
        private string m_TBL;
        private string m_ASS;
        private string m_Userid = "SA";

        //外部条件
        //hjh 2005.10.14 加入外部传入条件,过滤统计范围功能
        public string gsstrwhere = "1=1";
        //end hjh
        private string m_Item, m_Expr;
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

        public string Userid
        {
            set { m_Userid = value; }
        }

        public string FLD
        {
            get { return m_FLD; }
        }

        public string TBL
        {
            get { return m_TBL; }
        }

        public string ASS
        {
            get { return m_ASS; }
        }

        #endregion

        //ZB0110是传入的单位编码，将统计的结构写入到该单位编码中
        //starttime:数字开始时间
        //endTime:数字结束时间
        #region 构造函数，初始化属性

        public Datastat()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_B0110 = "";
            m_strTable = "";
            m_startTime = DateTime.Now.ToString();
            m_endTime = DateTime.Now.ToString();
        }

        public Datastat(string ZB0110)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_B0110 = ZB0110;
            m_strTable = "";
            m_startTime = DateTime.Now.ToString();
            m_endTime = DateTime.Now.ToString();
        }

        public Datastat(string ZB0110, string startTime, string endTime)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_B0110 = ZB0110;
            m_strTable = "";
            m_startTime = startTime;
            m_endTime = endTime;
        }

        //如果传入strTable，则统计时按该表进行统计，不再生成临时表，直接按第4部进行
        public Datastat(string strTable, string ZB0110, string startTime, string endTime)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_B0110 = ZB0110;
            m_strTable = strTable;
            m_startTime = startTime;
            m_endTime = endTime;
        }

        #endregion

        #region 报表统计

        public int StatResult(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat)
        {	//1:生成全表条件，该条件用来对数据进行过滤，如果结果为0，则不用进行下一步的统计，直接将所有的内容都赋值为0
            int intValue;
            //string strWholeCondition = "";
            //调用查询条件部分将全表条件的值取出
            //do
            //
            //2:根据行、列条件生成统计的临时表
            //21生成字段、常量等的集合
            //intValue=GetPara( m_TypeNo, m_SetTableNo, m_TableNo);
            //if(intValue>0) return intValue;
            GetPara(m_TypeNo, m_SetTableNo, m_TableNo);
            //22调用存储过程，进行报表统计
            intValue = DealCEF(m_TypeNo, m_SetTableNo, m_TableNo, isStat, 1);
            if (intValue > 0)
            {
                return intValue;
            }

            return 0;
        }

        public int StatResult(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat, int isLikeZB0110)
        {	//1:生成全表条件，该条件用来对数据进行过滤，如果结果为0，则不用进行下一步的统计，直接将所有的内容都赋值为0
            int intValue;
            //string strWholeCondition = "";
            //调用查询条件部分将全表条件的值取出
            //do
            //
            //2:根据行、列条件生成统计的临时表
            //21生成字段、常量等的集合
            //intValue=GetPara( m_TypeNo, m_SetTableNo, m_TableNo);
            //if(intValue>0) return intValue;
            GetPara(m_TypeNo, m_SetTableNo, m_TableNo);
            //22调用存储过程，进行报表统计
            intValue = DealCEF(m_TypeNo, m_SetTableNo, m_TableNo, isStat, isLikeZB0110);
            if (intValue > 0)
            {
                return intValue;
            }

            return 0;
        }

        public int StatResult(string BaseItem)
        {	//构造一个条件相关属性
            GetPara(BaseItem);
            int intValue = DealCEF();
            if (intValue > 0)
            {
                return intValue;
            }
            return 0;
        }

        private bool In(string strCheck, StringCollection OP)
        {
            return (OP.Contains(strCheck));
        }

        //处理SQL语句中的常量、表达式、函数,最后生成一个SQL语句，这中间调用存储过程，在存储过程中生成SQL语句。
        private int DealCEF(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat, int isLikeZB0110)
        {
            //常量
            string m_strCON = "";
            //表达式
            string m_strEXP = "";
            //函数
            string m_strFUN = "";
            //表名　
            string m_strTBL = "";
            //字段名
            string m_strFLD = "";
            //关联字段名
            string m_strASS = "";
            char[] a;
            //条件项内分隔符
            a = "(".ToCharArray();
            string[] strTempwl;

            //将常量生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mConst.Count - 1; i++)
            {
                if (m_strCON == "")
                {
                    m_strCON = m_strCON + "'" + mConst[i].ToString() + "'";
                }
                else
                {
                    m_strCON = m_strCON + ",'" + mConst[i].ToString() + "'";
                }
            }
            //将函数生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mFunction.Count - 1; i++)
            {
                if (m_strFUN == "")
                {
                    strTempwl = mFunction[i].ToString().Split(a);
                    m_strFUN = m_strFUN + "'" + strTempwl[0].ToString() + "'";
                }
                else
                {
                    strTempwl = mFunction[i].ToString().Split(a);
                    m_strFUN = m_strFUN + ",'" + strTempwl[0].ToString() + "'";
                }
            }
            //将表达式生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mExpress.Count - 1; i++)
            {
                if (m_strEXP == "")
                {
                    m_strEXP = m_strEXP + "'" + mExpress[i].ToString() + "'";
                }
                else
                {
                    m_strEXP = m_strEXP + ",'" + mExpress[i].ToString() + "'";
                }
            }
            //将表名生成一个字符串，形如AA,BB
            for (int i = 0; i <= mTable.Count - 1; i++)
            {
                if (m_strTBL == "")
                {
                    m_strTBL = mTable[i].ToString();
                }
                else
                {
                    m_strTBL = m_strTBL + "," + mTable[i].ToString();
                }
            }
            //将字段名生成一个字符串，形如AA,BB
            for (int i = 0; i <= mField.Count - 1; i++)
            {
                if (m_strFLD == "")
                {
                    m_strFLD = mField[i].ToString();
                }
                else
                {
                    m_strFLD = m_strFLD + "," + mField[i].ToString();
                }
            }
            //将关联字段生成一个字符串，形如AA,BB
            for (int i = 0; i <= mAssicate.Count - 1; i++)
            {
                if (m_strASS == "")
                {
                    m_strASS = mAssicate[i].ToString();
                }
                else
                {
                    m_strASS = m_strASS + "," + mAssicate[i].ToString();
                }
            }
            //进行存储过程处理需要调用表达式字符串、函数字符串、常量字符串、处理前的SQL、表名、字段名，返回为处理后的SQL语句
            //调用存储过程生成SQL，存储过程分为两部分，一是处理statSQL语句，二是生成数据,同时在这里传递全表条件
            //dealData createSQL = new dealData();
            dealData RptLoad = new dealData();
            string strBaseexpr = "";
            string strBaseitem = "";
            //得到全表条件,全表条件通过传入到存储过程中，进行处理
            SqlDataReader objRCReader;
            objRCReader = RptLoad.getWhole_condition(m_TypeNo, m_SetTableNo, m_TableNo);
            while (objRCReader.Read())
            {
                m_strMainObject = objRCReader["mainobject"].ToString();
                strBaseexpr = objRCReader["Baseexpr"].ToString();
                strBaseitem = objRCReader["Baseitem"].ToString();
            }
            objRCReader.Close();
            //生成可执行的SQL语句
            m_TBL = m_strTBL;
            m_FLD = m_strFLD;
            m_ASS = m_strASS;
            reQuery re = new reQuery();
            if (isStat)
            {
                int icount1 = 0, icount2 = 0;
                if (strBaseitem != "")
                {
                    icount1 = strBaseitem.Split('~').Length;
                }
                if (m_Item != null && this.m_Item != "")
                {
                    icount2 = m_Item.Split('~').Length;
                }
                if (icount1 == 0)
                {
                    if (icount2 == 0)
                    {
                        strBaseitem = "";
                        strBaseexpr = "";
                    }
                    else
                    {
                        strBaseitem = m_Item;
                        strBaseexpr = m_Expr;
                    }
                }
                else
                {
                    if (icount2 == 0)
                    {
                        strBaseitem = strBaseitem;
                        strBaseexpr = strBaseexpr;
                    }
                    else
                    {
                        strBaseexpr = re.gs_Comexpress(icount1, icount2, strBaseexpr, m_Expr);
                        strBaseitem = strBaseitem + "  ~" + m_Item;
                    }
                }

                QueryDeal dealCondition = new QueryDeal(m_strMainObject, strBaseexpr, strBaseitem, "");
                //string strCondition=dealCondition.QueryResult();
                string strCondition = dealCondition.QueryResult(m_TypeNo, m_SetTableNo, m_TableNo, DMServer.Common.ConfigMy.strUserID);

                //hjh 2005.10.14 加入外部传入条件,过滤统计范围功能
                if (strCondition != "")
                {
                    strCondition += " and " + this.gsstrwhere;
                }
                else
                {
                    strCondition = "select za0100 from " + m_strMainObject + " where " + gsstrwhere;
                }
                RptLoad.StatTBL(m_strMainObject, m_B0110, m_TypeNo, m_SetTableNo, m_TableNo, m_strTBL, m_strFLD, m_strCON, m_strEXP, m_strFUN, "", "", strCondition, m_strASS, m_Userid, isLikeZB0110);
            }
            return 0;
        }

        //--------------------------------------------------------------------------
        private int DealCEF()
        {
            //常量
            string m_strCON = "";
            //表达式
            string m_strEXP = "";
            //函数
            string m_strFUN = "";
            //表名　
            string m_strTBL = "";
            //字段名
            string m_strFLD = "";
            //关联字段名
            string m_strASS = "";
            char[] a;
            //条件项内分隔符
            a = "(".ToCharArray();
            string[] strTempwl;

            //将常量生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mConst.Count - 1; i++)
            {
                if (m_strCON == "")
                {
                    m_strCON = m_strCON + "'" + mConst[i].ToString() + "'";
                }
                else
                {
                    m_strCON = m_strCON + ",'" + mConst[i].ToString() + "'";
                }
            }
            //将函数生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mFunction.Count - 1; i++)
            {
                if (m_strFUN == "")
                {
                    strTempwl = mFunction[i].ToString().Split(a);
                    m_strFUN = m_strFUN + "'" + strTempwl[0].ToString() + "'";
                }
                else
                {
                    strTempwl = mFunction[i].ToString().Split(a);
                    m_strFUN = m_strFUN + ",'" + strTempwl[0].ToString() + "'";
                }
            }
            //将表达式生成一个字符串，形如'AA','BB'
            for (int i = 0; i <= mExpress.Count - 1; i++)
            {
                if (m_strEXP == "")
                {
                    m_strEXP = m_strEXP + "'" + mExpress[i].ToString() + "'";
                }
                else
                {
                    m_strEXP = m_strEXP + ",'" + mExpress[i].ToString() + "'";
                }
            }
            //将表名生成一个字符串，形如AA,BB
            for (int i = 0; i <= mTable.Count - 1; i++)
            {
                if (m_strTBL == "")
                {
                    m_strTBL = mTable[i].ToString();
                }
                else
                {
                    m_strTBL = m_strTBL + "," + mTable[i].ToString();
                }
            }
            //将字段名生成一个字符串，形如AA,BB
            for (int i = 0; i <= mField.Count - 1; i++)
            {
                if (m_strFLD == "")
                {
                    m_strFLD = mField[i].ToString();
                }
                else
                {
                    m_strFLD = m_strFLD + "," + mField[i].ToString();
                }
            }
            //将关联字段生成一个字符串，形如AA,BB
            for (int i = 0; i <= mAssicate.Count - 1; i++)
            {
                if (m_strASS == "")
                {
                    m_strASS = mAssicate[i].ToString();
                }
                else
                {
                    m_strASS = m_strASS + "," + mAssicate[i].ToString();
                }
            }

            //进行存储过程处理需要调用表达式字符串、函数字符串、常量字符串、处理前的SQL、表名、字段名，返回为处理后的SQL语句
            //调用存储过程生成SQL，存储过程分为两部分，一是处理statSQL语句，二是生成数据,同时在这里传递全表条件
            //dealData createSQL =new dealData();
            //生成可执行的SQL语句
            m_TBL = m_strTBL;
            m_FLD = m_strFLD;
            m_ASS = m_strASS;
            return 0;
        }

        //--------------------------------------------------------------------------

        //报表的表、字段、表达式、常量、函数等的处理
        public void GetPara(int m_TypeNo, int m_SetTableNo, int m_TableNo)
        {
            string[] myValue;
            //条件各项
            string[] mySplit;
            string[] myAssicate;
            //条件项分隔符
            char[] a;
            //条件项内分隔符
            char[] b;
            char[] c;
            char[] d;
            d = "[".ToCharArray();
            c = ",".ToCharArray();
            a = "~".ToCharArray();
            b = ":".ToCharArray();
            //strSQl = "";
            SqlDataReader objAssReader;
            SqlDataReader objdataReader;
            dealData getTF = new dealData();

            //读取字段表达式的信息
            //objdataReader = getTF.getTableField(m_TypeNo, m_SetTableNo, m_TableNo);
            //下面是处理相关字段
            //－－－－－－－－－－－－－－－－－
            objAssReader = getTF.getAssicate(m_strMainObject);
            //if (!In(m_strMainObject + ".ZA0100", mAssicate))
            //{
            //    mAssicate.Add(m_strMainObject + ".ZA0100");
            //}
            while (objAssReader.Read())
            {
                myAssicate = objAssReader[ILC.PROPERTYSET].ToString().Split(c);
                for (int i = 0; i <= myAssicate.Length - 1; i++)
                {
                    if (!In(m_strMainObject + "." + myAssicate[i].ToString().Trim(), mAssicate) && myAssicate[i].ToString().Trim() != "")
                    {
                        mAssicate.Add(m_strMainObject + "." + myAssicate[i].ToString().Trim());
                    }
                }
            }
            objAssReader.Close();
            //------------------------------------
            //读取字段表达式的信息
            objdataReader = getTF.getTableField(m_TypeNo, m_SetTableNo, m_TableNo);
            while (objdataReader.Read())
            {
                //处理报表中处理字段名中的字段
                myAssicate = objdataReader[ILC.DEALFIELDNAME].ToString().Split(d);
                for (int i = 1; i <= myAssicate.Length - 1; i++)
                {
                    if (myAssicate[i].ToString().Trim() != "" && !In(myAssicate[i].ToString().Substring(0, 11).Trim(), mField))
                    {
                        mField.Add(myAssicate[i].ToString().Substring(0, 11).Trim());
                    }
                    if (myAssicate[i].ToString().Trim() != "" && !In(myAssicate[i].ToString().Substring(0, 4).Trim(), mTable) && myAssicate[i].ToString().Substring(0, 4).Trim() != m_strMainObject)
                    {
                        mTable.Add(myAssicate[i].ToString().Substring(0, 4).Trim());
                    }
                }

                //mTable
                //---------------------------------------------------------------
                myValue = objdataReader[ILC.BASEITEM].ToString().Split(a);
                if (objdataReader[ILC.BASEITEM].ToString() != "")
                {
                    //一个循环分解常量、表达式----------------------------------------------
                    for (int i = myValue.Length - 1; i >= 0; i--)
                    {
                        //mysplit[4]:存储函数、类型为运算的表达式;
                        //mysplit[5]:存储的是左式指标;
                        //mysplit[7]:存储的是右式的值，其中常量,除运算型之外的表达式，无返回值的函数
                        //标识：常量$,函数#,表达式^
                        mySplit = myValue[i].ToString().Split(b);
                        //处理split[4]
                        if (mySplit[4].ToString().Trim() != "" && mySplit[4].ToString().Trim() != ".")
                        {
                            switch (mySplit[4].ToString().Trim().Substring(0, 1).ToString())
                            {
                                case "#"://函数
                                    if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mFunction))
                                    {
                                        mFunction.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                case "^"://表达式
                                    if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mExpress))
                                    {
                                        mExpress.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                        //处理split[7]
                        if (mySplit[7].ToString().Trim() != "" && mySplit[7].ToString().Trim() != ".")
                        {
                            switch (mySplit[7].ToString().Trim().Substring(0, 1).ToString())
                            {
                                case "#"://函数
                                    if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mFunction))
                                    {
                                        //if(mySplit[7].ToString().Trim().Substring(1).ToString()!="空值")
                                        mFunction.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                case "^"://表达式
                                    if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mExpress))
                                    {
                                        mExpress.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                case "$"://常量
                                    if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst) && mySplit[7].ToString().Trim().Substring(1).ToString() != "")
                                    {
                                        mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                        //处理split[5]
                        string temp;
                        if (mySplit[5].ToString().Trim() != ".")
                        {
                            //hjh 2004.12.29
                            if (mySplit[5].ToString().Length > 14)
                            {
                                break;
                            }
                            //end hjh
                            temp = mySplit[5].ToString().Trim().Substring(0, 4).ToString();
                            if (temp != "")
                            {
                                if (mySplit[5].ToString().Trim().Substring(0, 4).ToString() != m_strMainObject)
                                {
                                    if (!In(mySplit[5].ToString().Trim().Substring(0, 4).ToString(), mTable) && mySplit[5].ToString().Trim().Substring(0, 4).ToString() != "")
                                    {
                                        mTable.Add(mySplit[5].ToString().Trim().Substring(0, 4).ToString());
                                    }
                                }
                                if (!In(mySplit[5].ToString().Trim().Substring(0).ToString(), mField) && !In(mySplit[5].ToString().Trim().Substring(0).ToString(), mAssicate) && m_strMainObject + ".ZA0100" != mySplit[5].ToString().Trim().Substring(0).ToString() && mySplit[5].ToString().Trim().Substring(0).ToString() != "")
                                {
                                    mField.Add(mySplit[5].ToString().Trim().Substring(0).ToString());
                                }
                            }
                        }
                    }
                }

                //分解表达式和常量---------------------------------------------
            }
            objdataReader.Close();
        }

        //--------------------

        //报表的表、字段、表达式、常量、函数等的处理
        public void GetPara(string BaseItem)
        {
            string[] myValue;
            //条件各项
            string[] mySplit;
            //string[] myAssicate;
            //条件项分隔符
            char[] a;
            //条件项内分隔符
            char[] b;
            char[] c;
            char[] d;
            d = "[".ToCharArray();
            c = ",".ToCharArray();
            a = "~".ToCharArray();
            b = ":".ToCharArray();

            //-----------------------------
            string[] myAssicate;
            SqlDataReader objAssReader;
            dealData getTF = new dealData();
            objAssReader = getTF.getAssicate(m_strMainObject);
            //if (!In(m_strMainObject + ".ZA0100", mAssicate))
            //{
            //    mAssicate.Add(m_strMainObject + ".ZA0100");
            //}
            while (objAssReader.Read())
            {
                myAssicate = objAssReader[ILC.PROPERTYSET].ToString().Split(c);
                for (int i = 0; i <= myAssicate.Length - 1; i++)
                {
                    if (!In(m_strMainObject + "." + myAssicate[i].ToString().Trim(), mAssicate) && myAssicate[i].ToString().Trim() != "")
                    {
                        mAssicate.Add(m_strMainObject + "." + myAssicate[i].ToString().Trim());
                    }
                }
            }
            //------------------------------------

            //--------------------------

            myValue = BaseItem.Split(a);
            if (BaseItem != "")
            {
                //一个循环分解常量、表达式----------------------------------------------
                for (int i = myValue.Length - 1; i >= 0; i--)
                {
                    //mysplit[4]:存储函数、类型为运算的表达式;
                    //mysplit[5]:存储的是左式指标;
                    //mysplit[7]:存储的是右式的值，其中常量,除运算型之外的表达式，无返回值的函数
                    //标识：常量$,函数#,表达式^
                    mySplit = myValue[i].ToString().Split(b);
                    //处理split[4]
                    if (mySplit[4].ToString().Trim() != "" && mySplit[4].ToString().Trim() != ".")
                    {
                        switch (mySplit[4].ToString().Trim().Substring(0, 1).ToString())
                        {
                            case "#"://函数
                                if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mFunction))
                                {
                                    mFunction.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            case "^"://表达式
                                if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mExpress))
                                {
                                    mExpress.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            default:
                                break;
                        }
                    }
                    //处理split[7]
                    if (mySplit[7].ToString().Trim() != "" && mySplit[7].ToString().Trim() != ".")
                    {
                        switch (mySplit[7].ToString().Trim().Substring(0, 1).ToString())
                        {
                            case "#"://函数
                                if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mFunction))
                                {
                                    //if(mySplit[7].ToString().Trim().Substring(1).ToString()!="空值")
                                    mFunction.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            case "^"://表达式
                                if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mExpress))
                                {
                                    mExpress.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            case "$"://常量
                                if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst) && mySplit[7].ToString().Trim().Substring(1).ToString() != "")
                                {
                                    mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            default:
                                break;
                        }
                    }
                    //处理split[5]
                    string temp;
                    if (mySplit[5].ToString().Trim() != ".")
                    {
                        temp = mySplit[5].ToString().Trim().Substring(0, 4).ToString();
                        if (temp != "")
                        {
                            if (mySplit[5].ToString().Trim().Substring(0, 4).ToString() != m_strMainObject)
                            {
                                if (!In(mySplit[5].ToString().Trim().Substring(0, 4).ToString(), mTable) && mySplit[5].ToString().Trim().Substring(0, 4).ToString() != "")
                                {
                                    mTable.Add(mySplit[5].ToString().Trim().Substring(0, 4).ToString());
                                }
                            }
                            if (!In(mySplit[5].ToString().Trim().Substring(0).ToString(), mField) && !In(mySplit[5].ToString().Trim().Substring(0).ToString(), mAssicate) && m_strMainObject + ".ZA0100" != mySplit[5].ToString().Trim().Substring(0).ToString() && mySplit[5].ToString().Trim().Substring(0).ToString() != "")
                            {
                                mField.Add(mySplit[5].ToString().Trim().Substring(0).ToString());
                            }
                        }
                    }
                }
            }

            //分解表达式和常量---------------------------------------------
        }

        //-------------------
        #endregion

        #region 报表数据和位置

        /// <summary>
        /// i_TypeNo 类别号 i_SetTableNo 套表号 i_TableNo 报表号 
        /// strUnit 单位 
        /// strSequence 输出定义序列的位置 
        /// strUnitCount 输出定义单元的位置
        /// </summary>
        /// <param name="i_TypeNo"></param>
        /// <param name="i_SetTableNo"></param>
        /// <param name="i_TableNo"></param>
        /// <param name="strUnit"></param>
        /// <param name="strSequence"></param>
        /// <param name="strUnitCount"></param>
        public SortedList gsoutinterface(int i_TypeNo, int i_SetTableNo, int i_TableNo, string strUnit)
        {
            //生成报表
            //单位
            m_B0110 = strUnit;
            //主对象
            string strtmp = " select MainObject from r200 where typeno = " + i_TypeNo + " and settableno = " + i_SetTableNo + " and tableno = " + i_TableNo;
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
            if (m_strMainObject == "")
            {
                m_strMainObject = "AA01";
            }
            //判断主对象是否有单位
            string strSQLtmp = "SELECT * FROM gs_property WHERE infoid= '" + m_strMainObject + "' AND infofield = 'ab0110' ";
            dt = getsql.gsQuerySql(strSQLtmp, "gs_property");
            if (dt == null || dt.Rows.Count == 0)
            {
                m_B0110 = "-1";
            }
            //生成报表
            StatResult(i_TypeNo, i_SetTableNo, i_TableNo, true);
            //取出行列单序列的统计结果
            dealData RptR_C = new dealData();
            SqlDataReader objRCReader;
            objRCReader = RptR_C.getRC_R(i_TypeNo, i_SetTableNo, i_TableNo);
            int row = 7;
            int col = 3;
            int col1 = 0;
            int rowLen = 5;
            int collen = 15;
            SortedList sortmp = new SortedList();
            //取序列位置
            while (objRCReader.Read())
            {
                if (objRCReader["serialtype"].ToString() == "1")
                {
                    row = (int)objRCReader["startrow"];
                    rowLen = (int)objRCReader["icount"];
                }
                else
                {
                    col1 = (int)objRCReader["startcol"];
                    collen = (int)objRCReader["icount"];
                }
            }
            if (collen == 0)
            {
                collen = 1;
            }
            if (rowLen == 0)
            {
                rowLen = 1;
            }
            objRCReader = null;
            //加上甲栏和编号栏
            row = row + 2;
            col1 = col1 + 2;
            dealData addData = new dealData();
            SqlDataReader objAssReader;
            //填写序列数据
            objAssReader = addData.getRApp(i_TypeNo, i_SetTableNo, i_TableNo, m_B0110, "T" + i_TypeNo.ToString() + "_" + i_SetTableNo.ToString() + "_" + i_TableNo.ToString(), "1");
            if (objAssReader != null)
            {
                while (objAssReader.Read())
                {
                    col = col1;
                    for (int i = col; i <= collen + col - 1; i++)
                    {
                        sortmp.Add(row + "_" + i, objAssReader["C" + (i - col + 1).ToString()]);
                    }
                    row = row + 1;
                }
            }
            objAssReader = null;
            //单元数据
            dealData RptUnit = new dealData();
            SqlDataReader objUnitReader;

            objUnitReader = RptUnit.getUnitResult(i_TypeNo, i_SetTableNo, i_TableNo, m_B0110, "1");

            while (objUnitReader.Read())
            {
                sortmp.Add(objUnitReader["row"].ToString() + "_" + objUnitReader["col"].ToString(), objUnitReader["svalue"]);
            }
            return sortmp;
        }

        public void gsoutinterface(int i_TypeNo, int i_SetTableNo, int i_TableNo, out string strSequence, out string strUnitCount)
        {
            //取出行列单序列的统计结果
            dealData RptR_C = new dealData();
            SqlDataReader objRCReader;
            objRCReader = RptR_C.getRC_R(i_TypeNo, i_SetTableNo, i_TableNo);
            int row = 7;
            //int col = 3;
            int col1 = 0;
            int rowLen = 5;
            int collen = 15;
            strSequence = "";
            strUnitCount = "";
            //取序列位置
            while (objRCReader.Read())
            {
                if (objRCReader["serialtype"].ToString() == "1")
                {
                    row = (int)objRCReader["startrow"];
                    rowLen = (int)objRCReader["icount"];
                }
                else
                {
                    col1 = (int)objRCReader["startcol"];
                    collen = (int)objRCReader["icount"];
                }
            }
            if (collen == 0)
            {
                collen = 1;
            }
            if (rowLen == 0)
            {
                rowLen = 1;
            }
            objRCReader = null;
            //加上甲栏和编号栏
            row = row + 2;
            col1 = col1 + 2;
            for (int i = row; i < row + rowLen; i++)
            {
                for (int j = col1; j < col1 + collen; j++)
                {
                    strSequence += i + "," + j + ";";
                }
            }
            if (strSequence.Length > 1)
            {
                strSequence = strSequence.Substring(0, strSequence.Length - 1);
            }

            //单元数据
            DataAccess.Data.GetSql RptUnit = new DataAccess.Data.GetSql();
            string strSql = " select * from r201 where serialno > 2 and typeno =" + i_TypeNo + " and settableno = " + i_SetTableNo + " and tableno = " + i_TableNo;
            DataTable dt = RptUnit.gsQuerySql(strSql, "R201");
            if (dt != null && dt.Rows.Count != 0)
            {
                for (int k = 0; k < dt.Rows.Count; k++)
                {
                    if (dt.Rows[k]["startrow"].ToString() == "0" || dt.Rows[k]["startcol"].ToString() == "0")
                    {
                        continue;
                    }
                    else
                    {
                        strUnitCount += dt.Rows[k]["startrow"].ToString() + "," + dt.Rows[k]["startcol"].ToString() + ";";
                    }
                }
            }
            //常量
            strSql = " select * from eg01 where typeno =" + i_TypeNo + " and settbl = " + i_SetTableNo + " and tablno = " + i_TableNo;
            dt = RptUnit.gsQuerySql(strSql, "eg01");
            if (dt != null && dt.Rows.Count != 0)
            {
                for (int l = 0; l < dt.Rows.Count; l++)
                {
                    if (dt.Rows[l]["startr"].ToString() == "0" || dt.Rows[l]["startc"].ToString() == "0")
                    {
                        continue;
                    }
                    else
                    {
                        strUnitCount += dt.Rows[l]["startr"].ToString() + "," + dt.Rows[l]["startc"].ToString() + ";";
                    }
                }
            }
            if (strUnitCount.Length > 1)
            {
                strUnitCount = strUnitCount.Substring(0, strUnitCount.Length - 1);
            }
        }

        #endregion

        #region 报表条件描述

        public string gssequenceItemCH(int iTypeno, int iSettableno, int iTableno)
        {
            string strtmp = "", strSql;
            int irowcount = 1, icolcount = 1;
            DataTable dttmp;
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
            strtmp = getRptHead(iTypeno, iSettableno, iTableno);
            //strtmp  = "报表:  " + this.Text + "\n";
            strSql = "select * from r203 where typeno = " + iTypeno + " and settableno = "
                + iSettableno + " and tableno = " + iTableno + " order by serialno,sequenceno ";
            dttmp = getsql.gsQuerySql(strSql, "r203");
            if (dttmp != null && dttmp.Rows.Count != 0)
            {
                for (int i = 0; i < dttmp.Rows.Count; i++)
                {
                    //全表条件
                    if (dttmp.Rows[i]["serialno"].ToString() == "0")
                    {
                        strtmp += "\r全表条件：  \n";
                        strtmp += GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n\r";
                    }
                    //行条件
                    if (dttmp.Rows[i]["serialno"].ToString() == "1")
                    {
                        if (irowcount == 1)
                        {
                            strtmp += "\r行条件： \n";
                        }
                        strtmp += irowcount + "：" + dttmp.Rows[i]["sequencename"].ToString() + "\n" + GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n";
                        strtmp += getSequenceType(dttmp.Rows[i]["dealstyle"].ToString(), dttmp.Rows[i]["dealItemCH"].ToString()) + "\r";
                        irowcount++;
                    }
                    //列条件
                    if (dttmp.Rows[i]["serialno"].ToString() == "2")
                    {
                        if (icolcount == 1)
                        {
                            strtmp += "\r列条件： \n";
                        }
                        strtmp += icolcount + "：" + dttmp.Rows[i]["sequencename"].ToString() + "\n" + GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n";
                        strtmp += getSequenceType(dttmp.Rows[i]["dealstyle"].ToString(), dttmp.Rows[i]["dealItemCH"].ToString()) + "\r";
                        icolcount++;
                    }
                }
            }

            //单元条件
            strSql = "select a.sequencename,a.serialno,a.chineseitem,a.baseExpr,b.startrow,b.startcol from r203 a,r201 b where a.typeno = "
                + iTypeno + " and a.settableno = " + iSettableno + " and a.tableno = " + iTableno
                + " and a.typeno = b.typeno  and a.settableno = b.settableno and a.tableno = b.tableno  and a.serialno = b.serialno and a.serialno>2 order by a.serialno,a.sequenceno ";
            dttmp = getsql.gsQuerySql(strSql, "r203");

            if (dttmp != null && dttmp.Rows.Count != 0)
            {
                for (int j = 0; j < dttmp.Rows.Count; j++)
                {
                    strtmp += "\r单元条件： \n";
                    strtmp += "第" + dttmp.Rows[j]["startrow"].ToString() + "行" +
                        "第" + dttmp.Rows[j]["startcol"].ToString() + "列：   " +
                        GetStrItemCh(dttmp.Rows[j]["chineseitem"].ToString(), dttmp.Rows[j]["baseExpr"].ToString()) + "\n\r";

                }
            }
            strtmp += "\n";
            return strtmp;
        }

        /// <summary>
        /// 生成表达式描述
        /// </summary>
        /// <param name="str"></param>
        private string GetStrItemCh(string strItemCh, string strExpr)
        {
            QueryDeal QD = new QueryDeal("", strExpr, strItemCh, "");
            return QD.CreatSQLdisplay(strItemCh);
        }

        private string GetStrItemCh(string str)
        {
            string[] strItemCh, strtmp;
            string str_ItemCh = "";
            try
            {
                strItemCh = str.Split('~');
                for (int i = 0; i < strItemCh.Length; i++)
                {
                    if (strItemCh[i] != "")
                    {
                        strtmp = strItemCh[i].Split(':');
                        str_ItemCh += strtmp[0].ToString() + "   ";
                    }
                }
            }
            catch
            {
                return "";
            }
            return str_ItemCh;
        }

        /// <summary>
        /// 序列表达方式
        /// </summary>
        /// <param name="strName"></param>
        /// <param name="strNameCH"></param>
        /// <returns></returns>
        private string getSequenceType(string strName, string strNameCH)
        {
            if (strName == "" || strName == "0")
            {
                return "";
            }
            else if (strName == "1")
            {
                return "求和" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "2")
            {
                return "最大值" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "3")
            {
                return "最小值" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "4")
            {
                return "平均值" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "5")
            {
                return "中位值" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else
            {
                return "平均人数" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
        }

        /// <summary>
        /// 生成报表的标题头
        /// </summary>
        /// <returns></returns>
        private string getRptHead(int itypeno, int isettableno, int itableno)
        {
            string strSQL, strRptHead = "";
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();

            DataTable dttemp1 = new DataTable();
            strSQL = "SELECT * FROM r000 where typeno = " + itypeno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r000");
            strRptHead += "类别 ：  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            strSQL = "SELECT * FROM r100 where typeno = " + itypeno + " and settableno = " + isettableno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r100");
            strRptHead += "套表 ：  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            strSQL = "SELECT * FROM r200 where typeno = " + itypeno + " and settableno = " + isettableno + " and tableno = " + itableno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r200");
            strRptHead += "报表 ：  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            return strRptHead;
        }

        /// <summary>
        /// 查看校验公式
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public string gscheckQuery(int itypeno, int isettableno, int itableno)
        {
            string strtmp = "";
            strtmp = getRptHead(itypeno, isettableno, itableno);
            strtmp += "\r表间校验公式 ：\n";
            strtmp += getCheck("r241", itypeno, isettableno, itableno);//表间
            strtmp += "\r表内行校验公式 ：\n";
            strtmp += getCheck("r242", itypeno, isettableno, itableno);//行
            strtmp += "\r表内列校验公式 ：\n";
            strtmp += getCheck("r243", itypeno, isettableno, itableno);//列
            strtmp += "\r表内单元校验公式 ：\n";
            strtmp += getCheck("r244", itypeno, isettableno, itableno);//单元
            strtmp += "\n";
            return strtmp;
        }

        /// <summary>
        /// 查看公式
        /// </summary>
        /// <param name="strtable"></param>
        /// <returns></returns>
        private string getCheck(string strtable, int itypeno, int isettableno, int itableno)
        {
            string strSQL, strRptCheck = "(空)";
            DataTable dttemp1 = new DataTable();
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
            strSQL = "SELECT * FROM " + strtable + " where typeno = " + itypeno +
                " and settableno = " + isettableno + " and tableNo = " + itableno;
            dttemp1 = getsql.gsQuerySql(strSQL, strtable);
            if (dttemp1 != null && dttemp1.Rows.Count != 0)
            {
                strRptCheck = "";
                for (int i = 0; i < dttemp1.Rows.Count; i++)
                {
                    strRptCheck += i + 1 + "  " + dttemp1.Rows[i]["lExpr"].ToString() + " " +
                        dttemp1.Rows[i]["opsign"].ToString() + " " + dttemp1.Rows[i]["rExpr"].ToString() + "\n";
                }
            }

            return strRptCheck;
        }

        /// <summary>
        /// 生成条件
        /// str : 值
        /// strTable:表名
        /// strField:字段名
        /// strDict:代码名
        /// </summary>
        /// <returns></returns>
        public string gsSqlItem(string str, string strTable, string strField, string strDictId)
        {
            string strTmp = "";//临时串
            if (str == "")
            {
                return strTmp;
            }
            strTmp = "[" + strTable + "." + strField + "] ='" + str
                + "' :2:20:" + strDictId + "::"
                + strTable + "." + strField + ":=:" + str + ":";
            return strTmp;
        }

        /// <summary>
        /// 生成条件描述
        /// </summary>
        /// <returns></returns>
        public string gsSqlItemCH(string str, string str_TableName, string str_FieldName)
        {
            string strTmp = "";//临时串
            if (str == "")
            {
                return strTmp;
            }
            strTmp = str_TableName + ". " + str_FieldName + ":等于:" + str;
            return strTmp;
        }

        /// <summary>
        /// 生成条件表达式
        /// </summary>
        /// <returns></returns>
        public string gsSqlSetSql(string str, string str_Table, string str_Field)
        {
            string strTmp = "";//临时串
            if (str == "")
            {
                return strTmp;
            }
            strTmp = "[" + str_Table + "." + str_Field + "] ='" + str + "'";
            return strTmp;
        }

        #endregion

        #region 生成DataTable文本

        public string gsDataTable(DataTable dttmp)
        {
            object[] objtmp = null;
            string sText = "", strtmp = "";
            if (dttmp == null || dttmp.Rows.Count == 0)
            {
                return "";
            }

            for (int k = 0; k < dttmp.Columns.Count; k++)
            {
                sText += StringByLength(dttmp.Columns[k].Caption, 40);
            }
            sText += "\n";
            for (int i = 0; i < dttmp.Rows.Count; i++)
            {
                System.Windows.Forms.Application.DoEvents();
                objtmp = dttmp.Rows[i].ItemArray;
                if (objtmp != null && objtmp.Length != 0)
                {
                    for (int j = 0; j < objtmp.Length; j++)
                    {
                        strtmp = objtmp[j].ToString();
                        if (strtmp.Trim() == "")
                        {
                            strtmp = "(空)";
                        }
                        sText += StringByLength(strtmp, 40);
                    }
                    sText += "\n";
                }
                System.Windows.Forms.Application.DoEvents();
                System.Windows.Forms.Application.DoEvents();
                System.Windows.Forms.Application.DoEvents();
            }
            return sText;
        }

        public string gsDataTable2(DataTable dttmp, out System.Text.StringBuilder outExcle)
        {
            object[] objtmp = null;
            string strtmp = "";
            outExcle = new System.Text.StringBuilder();
            if (dttmp == null || dttmp.Rows.Count == 0)
            {
                return "";
            }
            System.Text.StringBuilder strBuild = new System.Text.StringBuilder();
            for (int k = 0; k < dttmp.Columns.Count; k++)
            {
                strBuild.Append(StringByLength(dttmp.Columns[k].Caption, 40));
                outExcle.Append(dttmp.Columns[k].Caption + (char)9);
            }
            strBuild.Append("\n");
            outExcle.Append((char)10);
            for (int i = 0; i < dttmp.Rows.Count; i++)
            {
                System.Windows.Forms.Application.DoEvents();
                objtmp = dttmp.Rows[i].ItemArray;
                if (objtmp != null && objtmp.Length != 0)
                {
                    for (int j = 0; j < objtmp.Length; j++)
                    {
                        strtmp = objtmp[j].ToString();
                        if (strtmp.Trim() == "")
                        {
                            strtmp = "(空)";
                        }
                        strBuild.Append(StringByLength(strtmp, 40));
                        outExcle.Append(strtmp + (char)9);
                    }
                    strBuild.Append("\n");
                    outExcle.Append((char)10);
                }
                System.Windows.Forms.Application.DoEvents();
                System.Windows.Forms.Application.DoEvents();
                System.Windows.Forms.Application.DoEvents();
            }
            return strBuild.ToString();
        }

        private string addtab(string str)
        {
            if (str.Length <= 2)
            {
                return str + "\t\t\t\t\t\t";
            }
            else if (str.Length <= 4)
            {
                return str + "\t\t\t\t\t";
            }
            else if (str.Length <= 6)
            {
                return str + "\t\t\t\t";
            }
            else if (str.Length <= 8)
            {
                return str + "\t\t\t";
            }
            else if (str.Length <= 10)
            {
                return str + "\t\t";
            }
            else if (str.Length >= 12)
            {
                return str.Substring(0, 10) + "\t\t";
            }
            return str + "\t";
        }

        private string StringByLength(string strText, int intLength)
        {
            string strResult = "";
            int intTextLength = strText.Length;
            for (int i = 0; i < intLength; i++)
            {
                if (i >= intTextLength)
                {//如果已经到达字符串的未尾
                    strResult += " ";
                }
                else
                {
                    strResult += strText.ToCharArray()[i];
                    if (strText.ToCharArray()[i] > 255)
                    {
                        intLength--;
                    }
                }
            }
            return strResult;
        }

        #endregion

    }
}
