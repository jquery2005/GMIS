using System;
using System.Collections;
using System.Collections.Specialized;

//����2002.7.31
//������Ҫ��ɵ����ڲ�ѯ������SQL��书�ܣ������ܹ�����һ��������Ĺ��ܣ���Ҫ�Ĳ������£�
//input:mainobect������,baseexpr��ϵʽ,baseitem����ʽ,condition�ⲿ����
//1���ҳ����б�����������ı�ȡ��������ֶ�
//2��ȡ�������ֶ�
//3��У����ʽ
//4������SQL���
//5���滻���г���
//6���������к���
//7���������еı��ʽ
//8���������ı��ʽ

namespace Report.stat
{
    /// <summary>
    /// QueryDeal ��ժҪ˵����
    /// </summary>
    public class QueryDeal
    {
        #region ȫ�ֱ���

        private StringCollection mTable = new StringCollection(); //����
        private StringCollection mField = new StringCollection(); //�ֶμ���
        private StringCollection mFunction = new StringCollection(); //��������
        private StringCollection mExpress = new StringCollection(); //���ʽ����
        private StringCollection mConst = new StringCollection(); //��������
        private string strGetSql;

        #endregion

        #region ����

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

        #region ���캯������ʼ������

        public QueryDeal(string strMainObject, string strBaseexpr, string BaseItem, string strCondition, string strDealFieldname)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_strMainObject = strMainObject;
            m_strBaseexpr = strBaseexpr;
            m_BaseItem = BaseItem;
            m_strCondition = strCondition;
            m_strDealFieldname = strDealFieldname;
        }

        public QueryDeal(string strMainObject, string strBaseexpr, string BaseItem, string strCondition)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_strMainObject = strMainObject;
            m_strBaseexpr = strBaseexpr;
            m_BaseItem = BaseItem;
            m_strCondition = strCondition;
        }

        public QueryDeal(int serialNo, int sequenceNo, string strMainObject, string strBaseexpr, string BaseItem, string strCondition)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
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
            //У����ʽ�����Ϸ���
            //int starttime;
            //int endtime;
            //starttime = DateTime.Now.Second;
            int intValue;
            intValue = checkPara();
            if (intValue > 0)
            {
                return "";
            }
            //�ҳ����еı�������������SQL����ʽ
            //�޸�CreatSQLCond����ֵ��string
            //intValue = CreatSQLCond();
            string strValue = CreatSQLCond();
            if (strValue == "")
            {
                return "";
            }
            //�滻���г���
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
            //У����ʽ�����Ϸ���
            //int starttime;
            //int endtime;
            //starttime = DateTime.Now.Second;
            int intValue;
            intValue = checkPara();
            if (intValue > 0)
            {
                return "";
            }
            //�ҳ����еı�������������SQL����ʽ
            //�޸�CreatSQLCond����ֵ��string
            //intValue = CreatSQLCond();
            string strValue = CreatSQLCond();
            if (strValue == "")
            {
                return "";
            }
            //�滻���г���
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

        //У����ʽ�����Ϸ���
        private int checkPara()
        {
            //������Ϊ��
            if (m_strMainObject == "")
            {
                return 11;
            }
            //��ʽʽΪ��
            if (m_strBaseexpr == "")
            {
                return 12;
            }
            //���ʽ��Ϊ��
            if (m_BaseItem == "")
            {
                return 13;
            }
            //��ȷ����
            return 0;
        }

        private bool In(string strCheck, StringCollection OP)
        {
            return (OP.Contains(strCheck));
        }

        //�������ã����sql��䣩Ϊ�������ֿ�ʼʱ��ͽ�ֹʱ��
        public int DealCEF(int serialNo, int sequenceNo, int m_TypeNo, int m_SetTableNo, int m_TableNo, string sUserID)
        {
            //����
            string m_strCON = "";
            //���ʽ
            string m_strEXP = "";
            //����
            string m_strFUN = "";
            //������
            string m_strTBL = "";
            //�ֶ���
            string m_strFLD = "";
            char[] a;
            //�������ڷָ���
            a = "(".ToCharArray();
            string[] strTempwl;

            //����������һ���ַ���������'AA','BB'
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
            //����������һ���ַ���������'AA','BB'
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

            //�����ʽ����һ���ַ���������'AA','BB'
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
            //����������һ���ַ���������AA,BB
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
            //���ֶ�������һ���ַ���������AA,BB
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
            //���д洢���̴�����Ҫ���ñ��ʽ�ַ����������ַ����������ַ���������ǰ��SQL���������ֶ���������Ϊ������SQL���
            //���ô洢��������SQL
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

        //����SQL����еĳ��������ʽ������,�������һ��SQL��䣬���м���ô洢���̣��ڴ洢����������SQL��䡣
        public int DealCEF(int serialNo, int sequenceNo)
        {
            //����
            string m_strCON = "";
            //���ʽ
            string m_strEXP = "";
            //����
            string m_strFUN = "";
            //������
            string m_strTBL = "";
            //�ֶ���
            string m_strFLD = "";
            char[] a;
            //�������ڷָ���
            a = "(".ToCharArray();
            string[] strTempwl;

            //����������һ���ַ���������'AA','BB'
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
            //����������һ���ַ���������'AA','BB'
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

            //�����ʽ����һ���ַ���������'AA','BB'
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
            //����������һ���ַ���������AA,BB
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
            //���ֶ�������һ���ַ���������AA,BB
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
            //���д洢���̴�����Ҫ���ñ��ʽ�ַ����������ַ����������ַ���������ǰ��SQL���������ֶ���������Ϊ������SQL���
            //���ô洢��������SQL
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

        //��������
        public string CreatSQLdisplay(string setSQLCH)
        {
            //m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
            //�������ɵ�SQL���ʽ
            //������
            string[] myValue;
            string strResult;
            //��������
            string[] mySplit;
            //������ָ���
            char[] a;
            //�������ڷָ���
            char[] b;
            a = "~".ToCharArray();
            b = ":".ToCharArray();
            //strSQl = "";
            //�ֽ⴦��
            myValue = setSQLCH.ToString().Split(a);
            ////������ʽ�Ƿ���ȷ,
            //EvaluateExpress Excheck = new EvaluateExpress(m_strBaseexpr, myValue.Length, 1);
            //if (Excheck.GetExpressValue() >= 30000)
            //{
            //    return 31;
            //}

            strResult = m_strBaseexpr;
            //������1+2�������滻��1{+}2
            strResult = strResult.Replace("*", "{*}");
            strResult = strResult.Replace("+", "{+}");

            ////������1+2���ʽ�滻��{1}+{2}
            //for (int i = myValue.Length; i >= 1; i--)
            //{
            //    strResult = strResult.Replace(i.ToString(), "{" + i.ToString() + "}");
            //}

            //for (int i = myValue.Length - 1; i >= 0; i--)
            //{
            //    strResult = strResult.Replace("{" + (i + 1).ToString() + "}", myValue[i].ToString());
            //}

            //������1+2���ʽ�滻��{1}+{2}
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
            strResult = strResult.Replace("{*}", " [����] ");
            strResult = strResult.Replace("{+}", " [����] ");
            strResult = strResult.Replace(":", "");
            strResult = strResult.Replace("{L}", "");
            return strResult;
        }

        //ȡ�����ֶΡ�����/����/���ʽ
        //�޸ķ���ֵ���ͣ�ԭ��INT��ΪSTRING
        public string CreatSQLCond()
        {
            //m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
            //�������ɵ�SQL���ʽ
            //������
            string[] myValue;
            //��������
            string[] mySplit;
            //������ָ���
            char[] a;
            //�������ڷָ���
            char[] b;
            a = "~".ToCharArray();
            b = ":".ToCharArray();
            strSQl = "";
            //�ֽ⴦��
            myValue = m_BaseItem.ToString().Split(a);
            ////������ʽ�Ƿ���ȷ,
            //EvaluateExpress Excheck = new EvaluateExpress(m_strBaseexpr, myValue.Length, 1);
            //if (Excheck.GetExpressValue() >= 30000)
            //{
            //    return 31;
            //}

            strSQl = m_strBaseexpr;
            //������1+2�������滻��1{+}2
            strSQl = strSQl.Replace("*", "{*}");
            strSQl = strSQl.Replace("+", "{+}");

            //������1+2���ʽ�滻��{1}+{2}
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
                //mysplit[4]:�洢����������Ϊ����ı��ʽ;
                //mysplit[5]:�洢������ʽָ��;
                //mysplit[7]:�洢������ʽ��ֵ�����г���,��������֮��ı��ʽ���޷���ֵ�ĺ���
                //��ʶ������$,����#,���ʽ^
                if (myValue[i].ToString() == "")
                {
                    continue;
                }
                mySplit = myValue[i].ToString().Split(b);
                //����split[4]
                if (mySplit[4].ToString().Trim() != "" && mySplit[4].ToString().Trim() != ".")
                {
                    switch (mySplit[4].ToString().Trim().Substring(0, 1).ToString())
                    {
                        case "#"://����
                            if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mFunction))
                            {
                                mFunction.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        case "^"://���ʽ
                            if (!In(mySplit[4].ToString().Trim().Substring(1).ToString(), mExpress))
                            {
                                mExpress.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        default:
                            break;
                    }
                }
                //����split[7]
                if (mySplit[7].ToString().Trim() != "" && mySplit[7].ToString().Trim() != ".")
                {
                    switch (mySplit[7].ToString().Trim().Substring(0, 1).ToString())
                    {
                        case "#"://����
                            if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mFunction))
                            {
                                //if (mySplit[7].ToString().Trim().Substring(1).ToString() != "��ֵ")
                                mFunction.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        case "^"://���ʽ
                            if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mExpress))
                            {
                                mExpress.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        case "$"://����
                            if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst))
                            {
                                mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                            }
                            break;
                        default:
                            break;
                    }
                }
                //����split[5]
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
                    //    if (mySplit[7].ToString() == "#��ֵ")
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
                    //    if (mySplit[7].ToString() == "#��ֵ")
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
                    //    if (mySplit[7].ToString() == "#��ֵ")
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

            //������ʽ�ֶ�
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
////����2002.7.31
////������Ҫ��ɵ����ڲ�ѯ������SQL��书�ܣ������ܹ�����һ��������Ĺ��ܣ���Ҫ�Ĳ������£�
////input:mainobect������,baseexpr��ϵʽ,baseitem����ʽ,condition�ⲿ����
////1���ҳ����б�����������ı�ȡ��������ֶ�
////2��ȡ�������ֶ�
////3��У����ʽ
////4������SQL���
////5���滻���г���
////6���������к���
////7���������еı��ʽ
////8���������ı��ʽ
// 
//namespace Report.stat
//{
//	/// <summary>
//	/// QueryDeal ��ժҪ˵����
//	/// </summary>
//	public class QueryDeal
//	{
//		#region ȫ�ֱ���
//		private StringCollection mTable=new StringCollection(); //����
//		private StringCollection mField=new StringCollection(); //�ֶμ���
//		private StringCollection mFunction=new StringCollection(); //��������
//		private StringCollection mExpress=new StringCollection(); //���ʽ����
//		private StringCollection mConst=new StringCollection(); //��������
//		private string strGetSql;
//		#endregion
//		#region ����
//		private string m_strMainObject="";
//		private string m_strBaseexpr="";
//		private string m_BaseItem="";
//		private string m_strCondition="";
//		private string strSQl;
//		private string outstrSQL="";
//		private int m_serialNo=-1;
//		private int m_sequenceNo=-1;
//		#endregion
//		#region ���캯������ʼ������
//		public QueryDeal(string strMainObject,string strBaseexpr,string BaseItem,string strCondition)
//		{
//			//
//			// TODO: �ڴ˴���ӹ��캯���߼�
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
//			// TODO: �ڴ˴���ӹ��캯���߼�
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
//			//У����ʽ�����Ϸ���
//			//			int starttime;
//			//			int endtime;
//			//			starttime=DateTime.Now.Second;
//			int intValue;
//			intValue=checkPara();
//			if(intValue>0)  return "";
//			//�ҳ����еı�������������SQL����ʽ
//			//�޸�CreatSQLCond����ֵ��string
//			//intValue=CreatSQLCond();
//			string strValue = CreatSQLCond();
//			if(strValue == "") return "";
//			//�滻���г���
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
//		//У����ʽ�����Ϸ���
//		private int checkPara()
//		{
//			//������Ϊ��
//			if(m_strMainObject=="")
//				return 11;
//			//��ʽʽΪ��
//			if(m_strBaseexpr=="")
//				return 12;
//			//���ʽ��Ϊ��
//			if(m_BaseItem=="")
//				return 13;
//			//��ȷ����
//			return 0;
//
//		}
//
//		private bool In(string strCheck,StringCollection OP)
//		{
//			return(OP.Contains(strCheck)); 
//		}
//		//����SQL����еĳ��������ʽ������,�������һ��SQL��䣬���м���ô洢���̣��ڴ洢����������SQL��䡣
//		public int DealCEF(int serialNo,int sequenceNo)
//		{
//			//����
//			string m_strCON="";
//			//���ʽ
//			string m_strEXP="";
//			//����
//			string m_strFUN="";
//			//������
//			string m_strTBL="";
//			//�ֶ���
//			string m_strFLD="";
//			char[] a;
//			//�������ڷָ���
//			a="(".ToCharArray();
//			string[] strTempwl;
//
//			//����������һ���ַ���������'AA','BB'
//			for(int i=0;i<=mConst.Count-1;i++ )
//				if(m_strCON=="")
//					m_strCON=m_strCON+"'"+mConst[i].ToString() +"'";
//				else
//					m_strCON=m_strCON+",'"+mConst[i].ToString() +"'";
//			//����������һ���ַ���������'AA','BB'
//			for(int i=0;i<=mFunction.Count-1;i++ )
//				if(m_strFUN=="")
//				{
//					strTempwl=mFunction[i].ToString().Split(a); 
//					m_strFUN=m_strFUN+"'"+strTempwl[0].ToString() +"'";
//				}
//				else
//					m_strFUN=m_strFUN+",'"+mFunction[i].ToString() +"'";
//			//�����ʽ����һ���ַ���������'AA','BB'
//			for(int i=0;i<=mExpress.Count-1;i++ )
//				if(m_strEXP=="")
//					m_strEXP=m_strEXP+"'"+mExpress[i].ToString() +"'";
//				else
//					m_strEXP=m_strEXP+",'"+mExpress[i].ToString() +"'";
//			//����������һ���ַ���������AA,BB
//			for(int i=0;i<=mTable.Count-1;i++ )
//				if(m_strTBL=="")
//					m_strTBL=mTable[i].ToString() ;
//				else
//					m_strTBL=m_strTBL+","+mTable[i].ToString() ;
//			//���ֶ�������һ���ַ���������AA,BB
//			for(int i=0;i<=mField.Count-1;i++ )
//				if(m_strFLD=="")
//					m_strFLD=mField[i].ToString() ;
//				else
//					m_strFLD=m_strFLD+","+mField[i].ToString();
//			//���д洢���̴�����Ҫ���ñ��ʽ�ַ����������ַ����������ַ���������ǰ��SQL���������ֶ���������Ϊ������SQL���
//			//���ô洢��������SQL
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
//		//ȡ�����ֶΡ�����/����/���ʽ
//		//�޸ķ���ֵ���ͣ�ԭ��INT��ΪSTRING
//		public string CreatSQLCond()
//		{
//			//m_BaseItem="[AA01.AA0114] ='130103' :12:100:MA01.ZA0101::AA01.AA0114:=:130103: ~[AA02.AC0201] =123:2:8:::AA02.AC0201:=:123:"
//			//�������ɵ�SQL���ʽ
//			//������
//			string[] myValue;
//			//��������
//			string[] mySplit;
//			//������ָ���
//			char[] a;
//			//�������ڷָ���
//			char[] b;
//			a="~".ToCharArray();
//			b=":".ToCharArray();
//			strSQl="";
//			//�ֽ⴦��
//			myValue=m_BaseItem.ToString().Split(a);
////			//������ʽ�Ƿ���ȷ,
////			EvaluateExpress Excheck=new EvaluateExpress(m_strBaseexpr,myValue.Length ,1);
////			if(Excheck.GetExpressValue()>=30000)
////				return 31;
//		
//			strSQl=m_strBaseexpr;
//			//������1+2�������滻��1{+}2
//			strSQl=strSQl.Replace("*" ,"{*}");
//			strSQl=strSQl.Replace("+" ,"{+}");
//
//			//������1+2���ʽ�滻��{1}+{2}
//			for(int i=myValue.Length;i>=1;i-- )
//			{
//				strSQl=strSQl.Replace(i.ToString() ,"{"+i.ToString()+"}");
//			}
//
//			for(int i=myValue.Length-1;i>=0;i-- )
//			{
//				//mysplit[4]:�洢����������Ϊ����ı��ʽ;
//				//mysplit[5]:�洢������ʽָ��;
//				//mysplit[7]:�洢������ʽ��ֵ�����г���,��������֮��ı��ʽ���޷���ֵ�ĺ���
//				//��ʶ������$,����#,���ʽ^
//				mySplit=myValue[i].ToString().Split(b);
//				//����split[4]
//				if(mySplit[4].ToString().Trim()!="" && mySplit[4].ToString().Trim()!=".")
//					switch (mySplit[4].ToString().Trim().Substring(0,1).ToString()) 
//					{
//						case "#"://����
//							if(!In(mySplit[4].ToString().Trim().Substring(1).ToString(),mFunction))
//								mFunction.Add(mySplit[4].ToString().Trim().Substring(1).ToString()); 
//							break;
//						case "^"://���ʽ
//							if(!In(mySplit[4].ToString().Trim().Substring(1).ToString(),mExpress))
//								mExpress.Add(mySplit[4].ToString().Trim().Substring(1).ToString());
//							break;
//						default:
//							break;
//					}
//				//����split[7]
//				if(mySplit[7].ToString().Trim()!="" && mySplit[7].ToString().Trim()!=".")
//					switch (mySplit[7].ToString().Trim().Substring(0,1).ToString()) 
//					{
//						case "#"://����
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mFunction))
//								if(mySplit[7].ToString().Trim().Substring(1).ToString()!="��ֵ")
//									mFunction.Add(mySplit[7].ToString().Trim().Substring(1).ToString()); 
//							break;
//						case "^"://���ʽ
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mExpress))
//								mExpress.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
//							break;
//						case "$"://����
//							if(!In(mySplit[7].ToString().Trim().Substring(1).ToString(),mConst))
//								mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
//							break;
//
//						default:
//							break;
//
//					}
//				//����split[5]
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
