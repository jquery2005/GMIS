using System;
using System.Collections;
using System.Collections.Specialized;

//王亮2002.7.31
//该类主要完成的是在查询中生成SQL语句功能，并且能够反回一个结果集的功能，主要的步骤如下：
//input:mainobect主对象,baseexpr关系式,baseitem分项式,condition外部条件
//1、找出所有表，对于相关联的表取出其关联字段
//2、取出所有字段
//3、校验表达式
//4、生成SQL语句
//5、替换所有常量
//6、处理所有函数
//7、处理所有的表达式
//8、生成最后的表达式

namespace Report.stat
{
    /// <summary>
    /// QueryDeal 的摘要说明。
    /// </summary>
    public class QueryDeal
    {
        #region 全局变量

        private StringCollection mTable = new StringCollection(); //表集合
        private StringCollection mField = new StringCollection(); //字段集合
        private StringCollection mFunction = new StringCollection(); //函数集合
        private StringCollection mExpress = new StringCollection(); //表达式集合
        private StringCollection mConst = new StringCollection(); //常量集合
        private string strGetSql;

        #endregion

        #region 属性

        private string m_strMainObject = "";
        private string m_strBaseexpr = "";
        private string m_BaseItem = "";
        private string m_strCondition = "";
        private string strSQl;
        private string outstrSQL = "";
        private int m_serialNo = -1;
        private int m_sequenceNo = -1;
        private string strCON = "";
        private string strEXP = "";
        private string strFUN = "";
        private string strTBL = "";
        private string strFLD = "";
        private string m_strDealFieldname = "";

        public string TBL
        {
            get { return strTBL; }
        }

        public string FLD
        {
            get { return strFLD; }
        }

        public string CON
        {
            get { return strCON; }
        }

        public string EXP
        {
            get { return strEXP; }
        }

        public string FUN
        {
            get { return strFUN; }
        }

        #endregion

        #region 构造函数，初始化属性

        public QueryDeal(string strMainObject, string strBaseexpr, string BaseItem, string strCondition, string strDealFieldname)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_strMainObject = strMainObject;
            m_strBaseexpr = strBaseexpr;
            m_BaseItem = BaseItem;
            m_strCondition = strCondition;
            m_strDealFieldname = strDealFieldname;
        }

        public QueryDeal(string strMainObject, string strBaseexpr, string BaseItem, string strCondition)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_strMainObject = strMainObject;
            m_strBaseexpr = strBaseexpr;
            m_BaseItem = BaseItem;
            m_strCondition = strCondition;
        }

        public QueryDeal(int serialNo, int sequenceNo, string strMainObject, string strBaseexpr, string BaseItem, string strCondition)
        {
            //
            // TODO: 在此处添加构造函数逻辑
            m_strMainObject = strMainObject;
            m_strBaseexpr = strBaseexpr;
            m_BaseItem = BaseItem;
            m_strCondition = strCondition;
            m_serialNo = serialNo;
            m_sequenceNo = sequenceNo;
        }

        #endregion

        public string QueryResult()
        {
            //校验表达式参数合法性
            //int starttime;
            //int endtime;
            //starttime = DateTime.Now.Second;
            int intValue;
            intValue = checkPara();
            if (intValue > 0)
            {
                return "";
            }
            //找出所有的表名，初步生成SQL条件式
            //修改CreatSQLCond返回值是string
            //intValue = CreatSQLCond();
            string strValue = CreatSQLCond();
            if (strValue == "")
            {
                return "";
            }
            //替换所有常量
            intValue = DealCEF(m_serialNo, m_sequenceNo);
            if (intValue > 0)
            {
                return "";
            }
            //endtime = DateTime.Now.Second;
            if (strGetSql != "" && strGetSql != null)
            {
                strGetSql = strGetSql.Replace("@#$", " ");
                strGetSql = strGetSql.Replace("{L}", " 1=1 ");
            }
            return strGetSql;
        }

        public string QueryResult(int m_TypeNo, int m_SetTableNo, int m_TableNo, string sUserID)
        {
            //校验表达式参数合法性
            //int starttime;
            //int endtime;
            //starttime = DateTime.Now.Second;
            int intValue;
            intValue = checkPara();
            if (intValue > 0)
            {
                return "";
            }
            //找出所有的表名，初步生成SQL条件式
            //修改CreatSQLCond返回值是string
            //intValue = CreatSQLCond();
            string strValue = CreatSQLCond();
            if (strValue == "")
            {
                return "";
            }
            //替换所有常量
            intValue = DealCEF(m_serialNo, m_sequenceNo, m_TypeNo, m_SetTableNo, m_TableNo, sUserID);
            if (intValue > 0)
            {
                return "";
            }
            //endtime = DateTime.Now.Second; 
            if (strGetSql != "" && strGetSql != null)
            {
                strGetSql = strGetSql.Replace("@#$", " ");
                strGetSql = strGetSql.Replace("{L}", " 1=1 ");
            }
            return strGetSql;
        }

        //校验表达式参数合法性
        private int checkPara()
        {
            //主对象为空
            if (m_strMainObject == "")
            {
                return 11;
            }
            //表式式为空
            if (m_strBaseexpr == "")
            {
                return 12;
            }
            //表达式项为空
            if (m_BaseItem == "")
            {
                return 13;
            }
            //正确返回
            return 0;
        }

        private bool In(string strCheck, StringCollection OP)
        {
            return (OP.Contains(strCheck));
        }

        //报表反查用（组成sql语句）为处理数字开始时间和截止时间
        public int DealCEF(int serialNo, int sequenceNo, int m_TypeNo, int m_SetTableNo, int m_TableNo, string sUserID)
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
            //进行存储过程处理需要调用表达式字符串、函数字符串、常量字符串、处理前的SQL、表名、字段名，返回为处理后的SQL语句
            //调用存储过程生成SQL
            dealData createSQL = new dealData();
            if (m_serialNo == -1 && m_sequenceNo == -1)
            {
                strGetSql = createSQL.runQuery(m_strMainObject, m_strTBL, m_strFLD, m_strCON, m_strEXP, m_strFUN, strSQl, outstrSQL, m_TypeNo, m_SetTableNo, m_TableNo, sUserID);
            }
            else
            {
                createSQL.UpdateCondition(m_serialNo, m_sequenceNo, m_strTBL, m_strFLD, m_strCON, m_strEXP, m_strFUN, strSQl);
            }
            return 0;
        }

        //处理SQL语句中的常量、表达式、函数,最后生成一个SQL语句，这中间调用存储过程，在存储过程中生成SQL语句。
        public int DealCEF(int serialNo, int sequenceNo)
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
            //进行存储过程处理需要调用表达式字符串、函数字符串、常量字符串、处理前的SQL、表名、字段名，返回为处理后的SQL语句
            //调用存储过程生成SQL
            dealData createSQL = new dealData();
            if (m_serialNo == -1 && m_sequenceNo == -1)
            {
                strGetSql = createSQL.runQuery(m_strMainObject, m_strTBL, m_strFLD, m_strCON, m_strEXP, m_strFUN, strSQl, outstrSQL);
            }
            else
            {
                createSQL.UpdateCondition(m_serialNo, m_sequenceNo, m_strTBL, m_strFLD, m_strCON, m_strEXP, m_strFUN, strSQl);
            }
            return 0;
        }

        //汉字描述
        public string CreatSQLdisplay(string setSQLCH)
        {
            //m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
            //定义生成的SQL表达式
            //条件项
            string[] myValue;
            string strResult;
            //条件各项
            string[] mySplit;
            //条件项分隔符
            char[] a;
            //条件项内分隔符
            char[] b;
            a = "~".ToCharArray();
            b = ":".ToCharArray();
            //strSQl = "";
            //分解处理
            myValue = setSQLCH.ToString().Split(a);
            ////检验表达式是否正确,
            //EvaluateExpress Excheck = new EvaluateExpress(m_strBaseexpr, myValue.Length, 1);
            //if (Excheck.GetExpressValue() >= 30000)
            //{
            //    return 31;
            //}

            strResult = m_strBaseexpr;
            //将形如1+2的内容替换成1{+}2
            strResult = strResult.Replace("*", "{*}");
            strResult = strResult.Replace("+", "{+}");

            ////将形如1+2表达式替换成{1}+{2}
            //for (int i = myValue.Length; i >= 1; i--)
            //{
            //    strResult = strResult.Replace(i.ToString(), "{" + i.ToString() + "}");
            //}

            //for (int i = myValue.Length - 1; i >= 0; i--)
            //{
            //    strResult = strResult.Replace("{" + (i + 1).ToString() + "}", myValue[i].ToString());
            //}

            //将形如1+2表达式替换成{1}+{2}
            string strLeft = "";
            string strRight = "";
            for (int i = myValue.Length; i >= 1; i--)
            {
                if (i.ToString().Length >= 3)
                {
                    strResult = strResult.Replace(i.ToString(), "{" + i.ToString() + "}");
                }
                else if (i.ToString().Length == 2)
                {
                    switch (i.ToString().Substring(0, 1))
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
                    switch (i.ToString().Substring(1, 1))
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

                    strResult = strResult.Replace(i.ToString(), "{" + strLeft + strRight + "}");
                }
                else
                {
                    switch (i.ToString())
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
                    strResult = strResult.Replace(i.ToString(), "{" + strRight + "}");
                }
            }

            for (int i = myValue.Length - 1; i >= 0; i--)
            {
                if (myValue[i].ToString() == "")
                {
                    continue;
                }
                mySplit = myValue;
                if ((i + 1).ToString().Length >= 3)
                {
                    strResult = strResult.Replace("{" + (i + 1).ToString() + "}", mySplit[i].ToString());
                }
                else if ((i + 1).ToString().Length == 2)
                {
                    switch ((i + 1).ToString().Substring(0, 1))
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
                    switch ((i + 1).ToString().Substring(1, 1))
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

                    strResult = strResult.Replace("{" + strLeft + strRight + "}", mySplit[i].ToString());
                }
                else
                {
                    switch ((i + 1).ToString())
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
                    strResult = strResult.Replace("{" + strRight + "}", mySplit[i].ToString());
                }
            }
            strResult = strResult.Replace("{*}", " [并且] ");
            strResult = strResult.Replace("{+}", " [或者] ");
            strResult = strResult.Replace(":", "");
            strResult = strResult.Replace("{L}", "");
            return strResult;
        }

        //取出表、字段、常量/函数/表达式
        //修改返回值类型：原是INT改为STRING
        public string CreatSQLCond()
        {
            //m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
            //定义生成的SQL表达式
            //条件项
            string[] myValue;
            //条件各项
            string[] mySplit;
            //条件项分隔符
            char[] a;
            //条件项内分隔符
            char[] b;
            a = "~".ToCharArray();
            b = ":".ToCharArray();
            strSQl = "";
            //分解处理
            myValue = m_BaseItem.ToString().Split(a);
            ////检验表达式是否正确,
            //EvaluateExpress Excheck = new EvaluateExpress(m_strBaseexpr, myValue.Length, 1);
            //if (Excheck.GetExpressValue() >= 30000)
            //{
            //    return 31;
            //}

            strSQl = m_strBaseexpr;
            //将形如1+2的内容替换成1{+}2
            strSQl = strSQl.Replace("*", "{*}");
            strSQl = strSQl.Replace("+", "{+}");

            //将形如1+2表达式替换成{1}+{2}
            string strLeft = "";
            string strRight = "";
            for (int i = myValue.Length; i >= 1; i--)
            {
                if (i.ToString().Length >= 3)
                {
                    strSQl = strSQl.Replace(i.ToString(), "{" + i.ToString() + "}");
                }
                else if (i.ToString().Length == 2)
                {
                    switch (i.ToString().Substring(0, 1))
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
                    switch (i.ToString().Substring(1, 1))
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

                    strSQl = strSQl.Replace(i.ToString(), "{" + strLeft + strRight + "}");
                }
                else
                {
                    switch (i.ToString())
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
                    strSQl = strSQl.Replace(i.ToString(), "{" + strRight + "}");
                }
            }

            for (int i = myValue.Length - 1; i >= 0; i--)
            {
                //mysplit[4]:存储函数、类型为运算的表达式;
                //mysplit[5]:存储的是左式指标;
                //mysplit[7]:存储的是右式的值，其中常量,除运算型之外的表达式，无返回值的函数
                //标识：常量$,函数#,表达式^
                if (myValue[i].ToString() == "")
                {
                    continue;
                }
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
                                //if (mySplit[7].ToString().Trim().Substring(1).ToString() != "空值")
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
                            if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst))
                            {
                                mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        default:
                            break;
                    }
                }
                //处理split[5]
                string[] tmpstr = mySplit[5].ToString().Split(new Char[] { ',' });
                for (int kk = 0; kk < tmpstr.Length; kk++)
                {
                    string temp;
                    if (tmpstr[kk].ToString().Trim() != ".")
                    {
                        temp = tmpstr[kk].ToString().Trim().Substring(0, 4).ToString();
                        if (temp != "")
                        {
                            if (tmpstr[kk].ToString().Trim().Substring(0, 4).ToString() != m_strMainObject)
                            {
                                if (!In(tmpstr[kk].ToString().Trim().Substring(0, 4).ToString(), mTable))
                                {
                                    mTable.Add(tmpstr[kk].ToString().Trim().Substring(0, 4).ToString());
                                }
                            }
                            if (!In(tmpstr[kk].ToString().Trim().Substring(0).ToString(), mField))
                            {
                                mField.Add(tmpstr[kk].ToString().Trim().Substring(0).ToString());
                            }
                        }
                    }
                }
                //---------------------------------------------------------------------

                if ((i + 1).ToString().Length >= 3)
                {
                    //if (mySplit[4].ToString() != "")
                    //{
                    //    if (mySplit[7].ToString() == "#空值")
                    //    {
                    //        strSQl = strSQl.Replace("{" + (i + 1).ToString() + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString());
                    //    }
                    //    else
                    //    {
                    //        strSQl = strSQl.Replace("{" + (i + 1).ToString() + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString() + " " + mySplit[7].ToString());
                    //    }
                    //}
                    //else
                    strSQl = strSQl.Replace("{" + (i + 1).ToString() + "}", mySplit[0].ToString());
                }
                else if ((i + 1).ToString().Length == 2)
                {
                    switch ((i + 1).ToString().Substring(0, 1))
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
                    switch ((i + 1).ToString().Substring(1, 1))
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

                    //strSQl = strSQl.Replace(i.ToString(), "{" + strLeft + (i + 1).ToString().Substring(1, 1) + "}");
                    //if (mySplit[4].ToString() != "")
                    //{
                    //    if (mySplit[7].ToString() == "#空值")
                    //    {
                    //        strSQl = strSQl.Replace("{" + strLeft + strRight + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString());
                    //    }
                    //    else
                    //    {
                    //        strSQl = strSQl.Replace("{" + strLeft + strRight + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString() + " " + mySplit[7].ToString());
                    //    }
                    //}
                    //else
                        strSQl = strSQl.Replace("{" + strLeft + strRight + "}", mySplit[0].ToString());
                }
                else
                {
                    switch ((i + 1).ToString())
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
                    //strSQl = strSQl.Replace(i.ToString(), "{" + strRight + "}");
                    //if (mySplit[4].ToString() != "")
                    //{
                    //    if (mySplit[7].ToString() == "#空值")
                    //    {
                    //        strSQl = strSQl.Replace("{" + strRight + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString());
                    //    }
                    //    else
                    //    {
                    //        strSQl = strSQl.Replace("{" + strRight + "}", "[" + mySplit[4].ToString() + "] " + mySplit[6].ToString() + " " + mySplit[7].ToString());
                    //    }
                    //}
                    //else
                        strSQl = strSQl.Replace("{" + strRight + "}", mySplit[0].ToString());
                }

                //--------------------------------------------------------------------
            }

            //处理表达式字段
            string[] myAssicate;
            char[] d;
            d = "[".ToCharArray();
            if (m_strDealFieldname != "")
            {
                myAssicate = m_strDealFieldname.Split(d);
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
            }

            strSQl = strSQl.Replace("{*}", " and ");
            strSQl = strSQl.Replace("{+}", " or ");
            return strSQl;
        }
    }
}

//using System;
//using System.Collections;
//using System.Collections.Specialized ;
//
////王亮2002.7.31
////该类主要完成的是在查询中生成SQL语句功能，并且能够反回一个结果集的功能，主要的步骤如下：
////input:mainobect主对象,baseexpr关系式,baseitem分项式,condition外部条件
////1、找出所有表，对于相关联的表取出其关联字段
////2、取出所有字段
////3、校验表达式
////4、生成SQL语句
////5、替换所有常量
////6、处理所有函数
////7、处理所有的表达式
////8、生成最后的表达式
// 
//namespace Report.stat
//{
//	/// <summary>
//	/// QueryDeal 的摘要说明。
//	/// </summary>
//	public class QueryDeal
//	{
//		#region 全局变量
//		private StringCollection mTable=new StringCollection(); //表集合
//		private StringCollection mField=new StringCollection(); //字段集合
//		private StringCollection mFunction=new StringCollection(); //函数集合
//		private StringCollection mExpress=new StringCollection(); //表达式集合
//		private StringCollection mConst=new StringCollection(); //常量集合
//		private string strGetSql;
//		#endregion
//		#region 属性
//		private string m_strMainObject="";
//		private string m_strBaseexpr="";
//		private string m_BaseItem="";
//		private string m_strCondition="";
//		private string strSQl;
//		private string outstrSQL="";
//		private int m_serialNo=-1;
//		private int m_sequenceNo=-1;
//		#endregion
//		#region 构造函数，初始化属性
//		public QueryDeal(string strMainObject,string strBaseexpr,string BaseItem,string strCondition)
//		{
//			//
//			// TODO: 在此处添加构造函数逻辑
//			m_strMainObject=strMainObject;
//			m_strBaseexpr=strBaseexpr;
//			m_BaseItem=BaseItem;
//			m_strCondition=strCondition;
//
//			//
//		}
//		public QueryDeal(int serialNo,int sequenceNo,string strMainObject,string strBaseexpr,string BaseItem,string strCondition)
//		{
//			//
//			// TODO: 在此处添加构造函数逻辑
//			m_strMainObject=strMainObject;
//			m_strBaseexpr=strBaseexpr;
//			m_BaseItem=BaseItem;
//			m_strCondition=strCondition;
//			m_serialNo=serialNo;
//			m_sequenceNo=sequenceNo;
//
//			//
//		}
//		#endregion
//
//		public string QueryResult()
//		{
//			//校验表达式参数合法性
//			//			int starttime;
//			//			int endtime;
//			//			starttime=DateTime.Now.Second;
//			int intValue;
//			intValue=checkPara();
//			if(intValue>0)  return "";
//			//找出所有的表名，初步生成SQL条件式
//			//修改CreatSQLCond返回值是string
//			//intValue=CreatSQLCond();
//			string strValue = CreatSQLCond();
//			if(strValue == "") return "";
//			//替换所有常量
//			intValue=DealCEF(m_serialNo,m_sequenceNo);
//			if(intValue>0) return "";
//			//			endtime=DateTime.Now.Second; 
//			if(strGetSql !="" && strGetSql !=null)
//			{
//				strGetSql = strGetSql.Replace("' + CHAR(39) + '", "'");
//				//strGetSql = strGetSql.Replace("CHAR(39) + '", "'");
//				//strGetSql = strGetSql.Replace("@#$", " ");
//			}
//			return strGetSql;
//
//		}
//		//校验表达式参数合法性
//		private int checkPara()
//		{
//			//主对象为空
//			if(m_strMainObject=="")
//				return 11;
//			//表式式为空
//			if(m_strBaseexpr=="")
//				return 12;
//			//表达式项为空
//			if(m_BaseItem=="")
//				return 13;
//			//正确返回
//			return 0;
//
//		}
//
//		private bool In(string strCheck,StringCollection OP)
//		{
//			return(OP.Contains(strCheck)); 
//		}
//		//处理SQL语句中的常量、表达式、函数,最后生成一个SQL语句，这中间调用存储过程，在存储过程中生成SQL语句。
//		public int DealCEF(int serialNo,int sequenceNo)
//		{
//			//常量
//			string m_strCON="";
//			//表达式
//			string m_strEXP="";
//			//函数
//			string m_strFUN="";
//			//表名　
//			string m_strTBL="";
//			//字段名
//			string m_strFLD="";
//			char[] a;
//			//条件项内分隔符
//			a="(".ToCharArray();
//			string[] strTempwl;
//
//			//将常量生成一个字符串，形如'AA','BB'
//			for(int i=0;i<=mConst.Count-1;i++ )
//				if(m_strCON=="")
//					m_strCON=m_strCON+"'"+mConst[i].ToString() +"'";
//				else
//					m_strCON=m_strCON+",'"+mConst[i].ToString() +"'";
//			//将函数生成一个字符串，形如'AA','BB'
//			for(int i=0;i<=mFunction.Count-1;i++ )
//				if(m_strFUN=="")
//				{
//					strTempwl=mFunction[i].ToString().Split(a); 
//					m_strFUN=m_strFUN+"'"+strTempwl[0].ToString() +"'";
//				}
//				else
//					m_strFUN=m_strFUN+",'"+mFunction[i].ToString() +"'";
//			//将表达式生成一个字符串，形如'AA','BB'
//			for(int i=0;i<=mExpress.Count-1;i++ )
//				if(m_strEXP=="")
//					m_strEXP=m_strEXP+"'"+mExpress[i].ToString() +"'";
//				else
//					m_strEXP=m_strEXP+",'"+mExpress[i].ToString() +"'";
//			//将表名生成一个字符串，形如AA,BB
//			for(int i=0;i<=mTable.Count-1;i++ )
//				if(m_strTBL=="")
//					m_strTBL=mTable[i].ToString() ;
//				else
//					m_strTBL=m_strTBL+","+mTable[i].ToString() ;
//			//将字段名生成一个字符串，形如AA,BB
//			for(int i=0;i<=mField.Count-1;i++ )
//				if(m_strFLD=="")
//					m_strFLD=mField[i].ToString() ;
//				else
//					m_strFLD=m_strFLD+","+mField[i].ToString();
//			//进行存储过程处理需要调用表达式字符串、函数字符串、常量字符串、处理前的SQL、表名、字段名，返回为处理后的SQL语句
//			//调用存储过程生成SQL
//			dealData createSQL =new dealData();  
//			if(m_serialNo==-1 && m_sequenceNo==-1)
//				strGetSql = createSQL.runQuery(m_strMainObject,m_strTBL,m_strFLD,m_strCON,m_strEXP,m_strFUN,strSQl,outstrSQL);
//			else
//				createSQL.UpdateCondition(m_serialNo,m_sequenceNo,m_strTBL,m_strFLD,m_strCON,m_strEXP,m_strFUN,strSQl);
//			return 0;
//
//		}
//
//
//		//取出表、字段、常量/函数/表达式
//		//修改返回值类型：原是INT改为STRING
//		public string CreatSQLCond()
//		{
//			//m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
//			//定义生成的SQL表达式
//			//条件项
//			string[] myValue;
//			//条件各项
//			string[] mySplit;
//			//条件项分隔符
//			char[] a;
//			//条件项内分隔符
//			char[] b;
//			a="~".ToCharArray();
//			b=":".ToCharArray();
//			strSQl="";
//			//分解处理
//			myValue=m_BaseItem.ToString().Split(a);
////			//检验表达式是否正确,
////			EvaluateExpress Excheck=new EvaluateExpress(m_strBaseexpr,myValue.Length ,1);
////			if(Excheck.GetExpressValue()>=30000)
////				return 31;
//		
//			strSQl=m_strBaseexpr;
//			//将形如1+2的内容替换成1{+}2
//			strSQl=strSQl.Replace("*" ,"{*}");
//			strSQl=strSQl.Replace("+" ,"{+}");
//
//			//将形如1+2表达式替换成{1}+{2}
//			for(int i=myValue.Length;i>=1;i-- )
//			{
//				strSQl=strSQl.Replace(i.ToString() ,"{"+i.ToString()+"}");
//			}
//
//			for(int i=myValue.Length-1;i>=0;i-- )
//			{
//				//mysplit[4]:存储函数、类型为运算的表达式;
//				//mysplit[5]:存储的是左式指标;
//				//mysplit[7]:存储的是右式的值，其中常量,除运算型之外的表达式，无返回值的函数
//				//标识：常量$,函数#,表达式^
//				mySplit=myValue[i].ToString().Split(b);
//				//处理split[4]
//				if(mySplit[4].ToString().Trim()!="" && mySplit[4].ToString().Trim()!=".")
//					switch (mySplit[4].ToString().Trim().Substring(0,1).ToString()) 
//					{
//						case "#"://函数
//							if(!In(mySplit[4].ToString().Trim().Substring(1).ToString(),mFunction))
//								mFunction.Add(mySplit[4].ToString().Trim().Substring(1).ToString()); 
//							break;
//						case "^"://表达式
//							if(!In(mySplit[4].ToString().Trim().Substring(1).ToString(),mExpress))
//								mExpress.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
//							break;
//						default:
//							break;
//					}
//				//处理split[7]
//				if(mySplit[7].ToString().Trim()!="" && mySplit[7].ToString().Trim()!=".")
//					switch (mySplit[7].ToString().Trim().Substring(0,1).ToString()) 
//					{
//						case "#"://函数
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mFunction))
//								if(mySplit[7].ToString().Trim().Substring(1).ToString()!="空值")
//									mFunction.Add(mySplit[7].ToString().Trim().Substring(1).ToString()); 
//							break;
//						case "^"://表达式
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mExpress))
//								mExpress.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
//							break;
//						case "$"://常量
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mConst))
//								mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
//							break;
//
//						default:
//							break;
//
//					}
//				//处理split[5]
//				string temp;
//				if( mySplit[5].ToString().Trim()!=".")
//				{
//					temp=mySplit[5].ToString().Trim().Substring(0,4).ToString();
//					if(temp!="")
//					{
//						if(mySplit[5].ToString().Trim().Substring(0,4).ToString()!=m_strMainObject )
//							if( !In(mySplit[5].ToString().Trim().Substring(0,4).ToString(),mTable)  )
//								mTable.Add(mySplit[5].ToString().Trim().Substring(0,4).ToString()); 
//						if(!In(mySplit[5].ToString().Trim().Substring(0).ToString(),mField))
//							mField.Add(mySplit[5].ToString().Trim().Substring(0).ToString());
//					}
//				}
//				strSQl=strSQl.Replace("{"+(i+1).ToString()+"}",mySplit[0].ToString());
//
//
//			}
//			strSQl=strSQl.Replace("{*}" ," and ");
//			strSQl=strSQl.Replace("{+}" ," or ");
//			strSQl=strSQl.Replace("' + CHAR(39) + '", "'");
//			return strSQl;
//
//		}
//
//	}
//}
