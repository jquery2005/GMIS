using System;
using System.Collections;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;

//����2002.8.6
//������Ҫ��ɱ����ͳ�ƣ���Ҫ�Ĳ������£�
//input:��λ�ķ�Χ��
//1������ȫ�����������������ȫ�������������һ���ֵ��ò�ѯ���ֵĴ���ʽ��
//2�������С�����������ͳ�Ƶ���ʱ��
//3��������ʱ��ȷ��ÿ�е�����
//4���������ȡ���ѭ�����˽���ͳ��
//5�����ڵ�Ԫ��������ͳ�ƣ���ͳ�ƽṹֱ��д�����

namespace Report.stat
{
    /// <summary>
    /// Datastat ��ժҪ˵����
    /// </summary>
    public class Datastat
    {
        #region ȫ�ֱ���

        private StringCollection mTable = new StringCollection(); //����
        private StringCollection mField = new StringCollection(); //�ֶμ���
        private StringCollection mFunction = new StringCollection(); //��������
        private StringCollection mExpress = new StringCollection(); //���ʽ����
        private StringCollection mConst = new StringCollection(); //��������
        private StringCollection mAssicate = new StringCollection(); //��������

        #endregion

        #region ����

        private string m_B0110 = "";
        private string m_strTable = "";
        private string m_startTime = DateTime.Now.ToString();
        private string m_endTime = DateTime.Now.ToString();
        private string m_strMainObject = "AA01";
        private string m_FLD;
        private string m_TBL;
        private string m_ASS;
        private string m_Userid = "SA";

        //�ⲿ����
        //hjh 2005.10.14 �����ⲿ��������,����ͳ�Ʒ�Χ����
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

        //ZB0110�Ǵ���ĵ�λ���룬��ͳ�ƵĽṹд�뵽�õ�λ������
        //starttime:���ֿ�ʼʱ��
        //endTime:���ֽ���ʱ��
        #region ���캯������ʼ������

        public Datastat()
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_B0110 = "";
            m_strTable = "";
            m_startTime = DateTime.Now.ToString();
            m_endTime = DateTime.Now.ToString();
        }

        public Datastat(string ZB0110)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_B0110 = ZB0110;
            m_strTable = "";
            m_startTime = DateTime.Now.ToString();
            m_endTime = DateTime.Now.ToString();
        }

        public Datastat(string ZB0110, string startTime, string endTime)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_B0110 = ZB0110;
            m_strTable = "";
            m_startTime = startTime;
            m_endTime = endTime;
        }

        //�������strTable����ͳ��ʱ���ñ����ͳ�ƣ�����������ʱ��ֱ�Ӱ���4������
        public Datastat(string strTable, string ZB0110, string startTime, string endTime)
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            m_B0110 = ZB0110;
            m_strTable = strTable;
            m_startTime = startTime;
            m_endTime = endTime;
        }

        #endregion

        #region ����ͳ��

        public int StatResult(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat)
        {	//1:����ȫ�����������������������ݽ��й��ˣ�������Ϊ0�����ý�����һ����ͳ�ƣ�ֱ�ӽ����е����ݶ���ֵΪ0
            int intValue;
            //string strWholeCondition = "";
            //���ò�ѯ�������ֽ�ȫ��������ֵȡ��
            //do
            //
            //2:�����С�����������ͳ�Ƶ���ʱ��
            //21�����ֶΡ������ȵļ���
            //intValue=GetPara( m_TypeNo, m_SetTableNo, m_TableNo);
            //if(intValue>0) return intValue;
            GetPara(m_TypeNo, m_SetTableNo, m_TableNo);
            //22���ô洢���̣����б���ͳ��
            intValue = DealCEF(m_TypeNo, m_SetTableNo, m_TableNo, isStat, 1);
            if (intValue > 0)
            {
                return intValue;
            }

            return 0;
        }

        public int StatResult(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat, int isLikeZB0110)
        {	//1:����ȫ�����������������������ݽ��й��ˣ�������Ϊ0�����ý�����һ����ͳ�ƣ�ֱ�ӽ����е����ݶ���ֵΪ0
            int intValue;
            //string strWholeCondition = "";
            //���ò�ѯ�������ֽ�ȫ��������ֵȡ��
            //do
            //
            //2:�����С�����������ͳ�Ƶ���ʱ��
            //21�����ֶΡ������ȵļ���
            //intValue=GetPara( m_TypeNo, m_SetTableNo, m_TableNo);
            //if(intValue>0) return intValue;
            GetPara(m_TypeNo, m_SetTableNo, m_TableNo);
            //22���ô洢���̣����б���ͳ��
            intValue = DealCEF(m_TypeNo, m_SetTableNo, m_TableNo, isStat, isLikeZB0110);
            if (intValue > 0)
            {
                return intValue;
            }

            return 0;
        }

        public int StatResult(string BaseItem)
        {	//����һ�������������
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

        //����SQL����еĳ��������ʽ������,�������һ��SQL��䣬���м���ô洢���̣��ڴ洢����������SQL��䡣
        private int DealCEF(int m_TypeNo, int m_SetTableNo, int m_TableNo, bool isStat, int isLikeZB0110)
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
            //�����ֶ���
            string m_strASS = "";
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
            //�������ֶ�����һ���ַ���������AA,BB
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
            //���д洢���̴�����Ҫ���ñ��ʽ�ַ����������ַ����������ַ���������ǰ��SQL���������ֶ���������Ϊ������SQL���
            //���ô洢��������SQL���洢���̷�Ϊ�����֣�һ�Ǵ���statSQL��䣬������������,ͬʱ�����ﴫ��ȫ������
            //dealData createSQL = new dealData();
            dealData RptLoad = new dealData();
            string strBaseexpr = "";
            string strBaseitem = "";
            //�õ�ȫ������,ȫ������ͨ�����뵽�洢�����У����д���
            SqlDataReader objRCReader;
            objRCReader = RptLoad.getWhole_condition(m_TypeNo, m_SetTableNo, m_TableNo);
            while (objRCReader.Read())
            {
                m_strMainObject = objRCReader["mainobject"].ToString();
                strBaseexpr = objRCReader["Baseexpr"].ToString();
                strBaseitem = objRCReader["Baseitem"].ToString();
            }
            objRCReader.Close();
            //���ɿ�ִ�е�SQL���
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

                //hjh 2005.10.14 �����ⲿ��������,����ͳ�Ʒ�Χ����
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
            //�����ֶ���
            string m_strASS = "";
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
            //�������ֶ�����һ���ַ���������AA,BB
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

            //���д洢���̴�����Ҫ���ñ��ʽ�ַ����������ַ����������ַ���������ǰ��SQL���������ֶ���������Ϊ������SQL���
            //���ô洢��������SQL���洢���̷�Ϊ�����֣�һ�Ǵ���statSQL��䣬������������,ͬʱ�����ﴫ��ȫ������
            //dealData createSQL =new dealData();
            //���ɿ�ִ�е�SQL���
            m_TBL = m_strTBL;
            m_FLD = m_strFLD;
            m_ASS = m_strASS;
            return 0;
        }

        //--------------------------------------------------------------------------

        //����ı��ֶΡ����ʽ�������������ȵĴ���
        public void GetPara(int m_TypeNo, int m_SetTableNo, int m_TableNo)
        {
            string[] myValue;
            //��������
            string[] mySplit;
            string[] myAssicate;
            //������ָ���
            char[] a;
            //�������ڷָ���
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

            //��ȡ�ֶα��ʽ����Ϣ
            //objdataReader = getTF.getTableField(m_TypeNo, m_SetTableNo, m_TableNo);
            //�����Ǵ�������ֶ�
            //����������������������������������
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
            //��ȡ�ֶα��ʽ����Ϣ
            objdataReader = getTF.getTableField(m_TypeNo, m_SetTableNo, m_TableNo);
            while (objdataReader.Read())
            {
                //�������д����ֶ����е��ֶ�
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
                    //һ��ѭ���ֽⳣ�������ʽ----------------------------------------------
                    for (int i = myValue.Length - 1; i >= 0; i--)
                    {
                        //mysplit[4]:�洢����������Ϊ����ı��ʽ;
                        //mysplit[5]:�洢������ʽָ��;
                        //mysplit[7]:�洢������ʽ��ֵ�����г���,��������֮��ı��ʽ���޷���ֵ�ĺ���
                        //��ʶ������$,����#,���ʽ^
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
                                        //if(mySplit[7].ToString().Trim().Substring(1).ToString()!="��ֵ")
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
                                    if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst) && mySplit[7].ToString().Trim().Substring(1).ToString() != "")
                                    {
                                        mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                    }
                                    break;
                                default:
                                    break;
                            }
                        }
                        //����split[5]
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

                //�ֽ���ʽ�ͳ���---------------------------------------------
            }
            objdataReader.Close();
        }

        //--------------------

        //����ı��ֶΡ����ʽ�������������ȵĴ���
        public void GetPara(string BaseItem)
        {
            string[] myValue;
            //��������
            string[] mySplit;
            //string[] myAssicate;
            //������ָ���
            char[] a;
            //�������ڷָ���
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
                //һ��ѭ���ֽⳣ�������ʽ----------------------------------------------
                for (int i = myValue.Length - 1; i >= 0; i--)
                {
                    //mysplit[4]:�洢����������Ϊ����ı��ʽ;
                    //mysplit[5]:�洢������ʽָ��;
                    //mysplit[7]:�洢������ʽ��ֵ�����г���,��������֮��ı��ʽ���޷���ֵ�ĺ���
                    //��ʶ������$,����#,���ʽ^
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
                                    //if(mySplit[7].ToString().Trim().Substring(1).ToString()!="��ֵ")
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
                                if (!In(mySplit[7].ToString().Trim().Substring(1).ToString(), mConst) && mySplit[7].ToString().Trim().Substring(1).ToString() != "")
                                {
                                    mConst.Add(mySplit[7].ToString().Trim().Substring(1).ToString());
                                }
                                break;
                            default:
                                break;
                        }
                    }
                    //����split[5]
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

            //�ֽ���ʽ�ͳ���---------------------------------------------
        }

        //-------------------
        #endregion

        #region �������ݺ�λ��

        /// <summary>
        /// i_TypeNo ���� i_SetTableNo �ױ�� i_TableNo ����� 
        /// strUnit ��λ 
        /// strSequence ����������е�λ�� 
        /// strUnitCount ������嵥Ԫ��λ��
        /// </summary>
        /// <param name="i_TypeNo"></param>
        /// <param name="i_SetTableNo"></param>
        /// <param name="i_TableNo"></param>
        /// <param name="strUnit"></param>
        /// <param name="strSequence"></param>
        /// <param name="strUnitCount"></param>
        public SortedList gsoutinterface(int i_TypeNo, int i_SetTableNo, int i_TableNo, string strUnit)
        {
            //���ɱ���
            //��λ
            m_B0110 = strUnit;
            //������
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
            //�ж��������Ƿ��е�λ
            string strSQLtmp = "SELECT * FROM gs_property WHERE infoid= '" + m_strMainObject + "' AND infofield = 'ab0110' ";
            dt = getsql.gsQuerySql(strSQLtmp, "gs_property");
            if (dt == null || dt.Rows.Count == 0)
            {
                m_B0110 = "-1";
            }
            //���ɱ���
            StatResult(i_TypeNo, i_SetTableNo, i_TableNo, true);
            //ȡ�����е����е�ͳ�ƽ��
            dealData RptR_C = new dealData();
            SqlDataReader objRCReader;
            objRCReader = RptR_C.getRC_R(i_TypeNo, i_SetTableNo, i_TableNo);
            int row = 7;
            int col = 3;
            int col1 = 0;
            int rowLen = 5;
            int collen = 15;
            SortedList sortmp = new SortedList();
            //ȡ����λ��
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
            //���ϼ����ͱ����
            row = row + 2;
            col1 = col1 + 2;
            dealData addData = new dealData();
            SqlDataReader objAssReader;
            //��д��������
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
            //��Ԫ����
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
            //ȡ�����е����е�ͳ�ƽ��
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
            //ȡ����λ��
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
            //���ϼ����ͱ����
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

            //��Ԫ����
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
            //����
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

        #region ������������

        public string gssequenceItemCH(int iTypeno, int iSettableno, int iTableno)
        {
            string strtmp = "", strSql;
            int irowcount = 1, icolcount = 1;
            DataTable dttmp;
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();
            strtmp = getRptHead(iTypeno, iSettableno, iTableno);
            //strtmp  = "����:  " + this.Text + "\n";
            strSql = "select * from r203 where typeno = " + iTypeno + " and settableno = "
                + iSettableno + " and tableno = " + iTableno + " order by serialno,sequenceno ";
            dttmp = getsql.gsQuerySql(strSql, "r203");
            if (dttmp != null && dttmp.Rows.Count != 0)
            {
                for (int i = 0; i < dttmp.Rows.Count; i++)
                {
                    //ȫ������
                    if (dttmp.Rows[i]["serialno"].ToString() == "0")
                    {
                        strtmp += "\rȫ��������  \n";
                        strtmp += GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n\r";
                    }
                    //������
                    if (dttmp.Rows[i]["serialno"].ToString() == "1")
                    {
                        if (irowcount == 1)
                        {
                            strtmp += "\r�������� \n";
                        }
                        strtmp += irowcount + "��" + dttmp.Rows[i]["sequencename"].ToString() + "\n" + GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n";
                        strtmp += getSequenceType(dttmp.Rows[i]["dealstyle"].ToString(), dttmp.Rows[i]["dealItemCH"].ToString()) + "\r";
                        irowcount++;
                    }
                    //������
                    if (dttmp.Rows[i]["serialno"].ToString() == "2")
                    {
                        if (icolcount == 1)
                        {
                            strtmp += "\r�������� \n";
                        }
                        strtmp += icolcount + "��" + dttmp.Rows[i]["sequencename"].ToString() + "\n" + GetStrItemCh(dttmp.Rows[i]["chineseitem"].ToString(), dttmp.Rows[i]["baseExpr"].ToString()) + "\n";
                        strtmp += getSequenceType(dttmp.Rows[i]["dealstyle"].ToString(), dttmp.Rows[i]["dealItemCH"].ToString()) + "\r";
                        icolcount++;
                    }
                }
            }

            //��Ԫ����
            strSql = "select a.sequencename,a.serialno,a.chineseitem,a.baseExpr,b.startrow,b.startcol from r203 a,r201 b where a.typeno = "
                + iTypeno + " and a.settableno = " + iSettableno + " and a.tableno = " + iTableno
                + " and a.typeno = b.typeno  and a.settableno = b.settableno and a.tableno = b.tableno  and a.serialno = b.serialno and a.serialno>2 order by a.serialno,a.sequenceno ";
            dttmp = getsql.gsQuerySql(strSql, "r203");

            if (dttmp != null && dttmp.Rows.Count != 0)
            {
                for (int j = 0; j < dttmp.Rows.Count; j++)
                {
                    strtmp += "\r��Ԫ������ \n";
                    strtmp += "��" + dttmp.Rows[j]["startrow"].ToString() + "��" +
                        "��" + dttmp.Rows[j]["startcol"].ToString() + "�У�   " +
                        GetStrItemCh(dttmp.Rows[j]["chineseitem"].ToString(), dttmp.Rows[j]["baseExpr"].ToString()) + "\n\r";

                }
            }
            strtmp += "\n";
            return strtmp;
        }

        /// <summary>
        /// ���ɱ��ʽ����
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
        /// ���б�﷽ʽ
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
                return "���" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "2")
            {
                return "���ֵ" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "3")
            {
                return "��Сֵ" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "4")
            {
                return "ƽ��ֵ" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else if (strName == "5")
            {
                return "��λֵ" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
            else
            {
                return "ƽ������" + "   " + GetStrItemCh(strNameCH) + "\n";
            }
        }

        /// <summary>
        /// ���ɱ���ı���ͷ
        /// </summary>
        /// <returns></returns>
        private string getRptHead(int itypeno, int isettableno, int itableno)
        {
            string strSQL, strRptHead = "";
            DataAccess.Data.GetSql getsql = new DataAccess.Data.GetSql();

            DataTable dttemp1 = new DataTable();
            strSQL = "SELECT * FROM r000 where typeno = " + itypeno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r000");
            strRptHead += "��� ��  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            strSQL = "SELECT * FROM r100 where typeno = " + itypeno + " and settableno = " + isettableno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r100");
            strRptHead += "�ױ� ��  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            strSQL = "SELECT * FROM r200 where typeno = " + itypeno + " and settableno = " + isettableno + " and tableno = " + itableno;
            dttemp1 = getsql.gsQuerySql(strSQL, "r200");
            strRptHead += "���� ��  " + dttemp1.Rows[0]["name"].ToString() + "\n";

            return strRptHead;
        }

        /// <summary>
        /// �鿴У�鹫ʽ
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public string gscheckQuery(int itypeno, int isettableno, int itableno)
        {
            string strtmp = "";
            strtmp = getRptHead(itypeno, isettableno, itableno);
            strtmp += "\r���У�鹫ʽ ��\n";
            strtmp += getCheck("r241", itypeno, isettableno, itableno);//���
            strtmp += "\r������У�鹫ʽ ��\n";
            strtmp += getCheck("r242", itypeno, isettableno, itableno);//��
            strtmp += "\r������У�鹫ʽ ��\n";
            strtmp += getCheck("r243", itypeno, isettableno, itableno);//��
            strtmp += "\r���ڵ�ԪУ�鹫ʽ ��\n";
            strtmp += getCheck("r244", itypeno, isettableno, itableno);//��Ԫ
            strtmp += "\n";
            return strtmp;
        }

        /// <summary>
        /// �鿴��ʽ
        /// </summary>
        /// <param name="strtable"></param>
        /// <returns></returns>
        private string getCheck(string strtable, int itypeno, int isettableno, int itableno)
        {
            string strSQL, strRptCheck = "(��)";
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
        /// ��������
        /// str : ֵ
        /// strTable:����
        /// strField:�ֶ���
        /// strDict:������
        /// </summary>
        /// <returns></returns>
        public string gsSqlItem(string str, string strTable, string strField, string strDictId)
        {
            string strTmp = "";//��ʱ��
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
        /// ������������
        /// </summary>
        /// <returns></returns>
        public string gsSqlItemCH(string str, string str_TableName, string str_FieldName)
        {
            string strTmp = "";//��ʱ��
            if (str == "")
            {
                return strTmp;
            }
            strTmp = str_TableName + ". " + str_FieldName + ":����:" + str;
            return strTmp;
        }

        /// <summary>
        /// �����������ʽ
        /// </summary>
        /// <returns></returns>
        public string gsSqlSetSql(string str, string str_Table, string str_Field)
        {
            string strTmp = "";//��ʱ��
            if (str == "")
            {
                return strTmp;
            }
            strTmp = "[" + str_Table + "." + str_Field + "] ='" + str + "'";
            return strTmp;
        }

        #endregion

        #region ����DataTable�ı�

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
                            strtmp = "(��)";
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
                            strtmp = "(��)";
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
                {//����Ѿ������ַ�����δβ
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
