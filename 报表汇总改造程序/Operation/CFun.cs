using System;
using System.Collections;
using System.Collections.Specialized;

namespace DataAccess.Data
{
    /// <summary>
    /// CFun ��ժҪ˵����
    /// </summary>
    public class CFun
    {
        public CFun()
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            //
        }

        /// <summary>
        /// �жϱ��ʽ
        /// ���ع�ϵ����ֵ
        /// </summary>
        /// <param name="��ϵ��"></param>
        /// <param name="����ֵ"></param>
        /// <param name="����"></param>
        /// <param name="����Ĺ�ϵ��"></param>
        /// <returns></returns>
        public string caststr(string strT, string[] strP, string strType, string strFunType, out string str1, string strDictId)
        {
            string[] tmpstr = strType.Split(new char[] { ',' });
            bool isVS = false;
            if (tmpstr.Length > 1)
            {
                isVS = true;
                strType = tmpstr[0].ToString();
            }
            string[] Sstr = strP;

            string strout = "", strtmp = "";
            str1 = "";
            string strTypetmp;
            if (strFunType.Trim() != "")
            {
                strTypetmp = strFunType;
            }
            else
            {
                if (strType == "1" || strType == "11" || strType == "111")
                {
                    strTypetmp = "1";
                }
                else
                {
                    strTypetmp = strType;
                }
            }
            if (strP[0] == "#��ֵ" || strP[0].Trim() == "")
            {
                if (strT == "������" || strT == "������")
                {
                    if (strTypetmp == "1")
                    {
                        str1 = " is not null ";
                    }
                    else if (strTypetmp == "2" || strTypetmp == "19" || strTypetmp == "18")
                    {
                        str1 = " <> '' ";
                    }
                    else
                    {
                        str1 = " <> 0";
                    }
                }
                else
                {
                    if (strTypetmp == "1")
                    {
                        str1 = " is null ";
                    }
                    else if (strTypetmp == "2" || strTypetmp == "19" || strTypetmp == "18")
                    {
                        str1 = getstr(strT) + " '' ";
                    }
                    else
                    {
                        str1 = getstr(strT) + " 0 ";
                    }
                }
                return str1;
            }

            for (int i = 0; i < strP.Length; i++)
            {
                if (strTypetmp != "2" && strTypetmp != "1" && strTypetmp == "19" && strTypetmp == "18")
                {
                    if (strT == "����" || strT == "������")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'%" + strP[i] + "%'";
                        }
                        else
                        {
                            Sstr[i] = "'%" + strP[i] + "%'";
                        }
                    }
                    else if (strT == "�����")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'" + strP[i] + "%'";
                        }
                        else
                        {
                            Sstr[i] = "'" + strP[i] + "%'";
                        }
                    }
                    else if (strT == "�Ұ���")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'%" + strP[i] + "'";
                        }
                        else
                        {
                            Sstr[i] = "'%" + strP[i] + "'";
                        }
                    }
                    else
                    {
                        Sstr[i] = strP[i];
                    }
                }
                else
                {
                    if (strT == "����" || strT == "������")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'%" + strP[i] + "%'";
                        }
                        else
                        {
                            Sstr[i] = "'%" + strP[i] + "%'";
                        }
                    }
                    else if (strT == "�����")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'" + strP[i] + "%'";
                        }
                        else
                        {
                            Sstr[i] = "'" + strP[i] + "%'";
                        }
                    }
                    else if (strT == "�Ұ���")
                    {
                        if (strDictId != null && strDictId != "")
                        {
                            Sstr[i] = "'%" + strP[i] + "'";
                        }
                        else
                        {
                            Sstr[i] = "'%" + strP[i] + "'";
                        }
                    }
                    else
                    {
                        if (isVS)
                        {
                            Sstr[i] = strP[i];
                        }
                        else
                        {
                            //2004.5.18 �ſ��������  (1982.03)===>(1982.03.01)
                            if (strTypetmp == "1")
                            {
                                Sstr[i] = "'" + changeDate(strP[i]) + "'";
                            }
                            else if (strTypetmp == "3")
                            {
                                Sstr[i] = strP[i];
                            }
                            else
                            {
                                Sstr[i] = "'" + strP[i] + "'";
                            }
                        }
                    }
                }
            }
            for (int j = 0; j < Sstr.Length; j++)
            {
                strtmp += Sstr[j] + ",";
            }
            switch (strT)
            {
                case "����":
                    strout = "=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "=";
                    break;
                case "����":
                    strout = ">" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">";
                    break;
                case "С��":
                    strout = "<" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<";
                    break;
                case "������":
                    strout = "<>" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<>";
                    break;
                case "���ڵ���":
                    strout = ">=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">=";
                    break;
                case "С�ڵ���":
                    strout = "<=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<=";
                    break;
                case "����":
                    strout = "<" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<";
                    break;
                case "����":
                    strout = ">" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">";
                    break;
                case "���ڵ���":
                    strout = ">=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">=";
                    break;
                case "���ڵ���":
                    strout = "<=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<=";
                    break;
                case "��..֮��":
                    strout = "in (" + strtmp.Substring(0, strtmp.Length - 1) + ") ";
                    str1 = "in";
                    break;
                case "����..֮��":
                    strout = "not in (" + strtmp.Substring(0, strtmp.Length - 1) + ") ";
                    str1 = "not in";
                    break;
                case "����":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "�����":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "�Ұ���":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "������":
                    strout = "not like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "not like";
                    break;
                case "��..֮��":
                    if (Sstr.Length < 2)
                    {
                        str1 = "";
                        break;
                    }
                    strout = "between " + Sstr[0] + " and " + Sstr[1];
                    str1 = "between";
                    break;
                case "����..֮��":
                    if (Sstr.Length < 2)
                    {
                        str1 = "";
                        break;
                    }
                    strout = "not between " + Sstr[0] + " and " + Sstr[1];
                    str1 = "not between";
                    break;
                default:
                    strout = "";
                    str1 = "";
                    break;
            }
            return strout;
        }

        private string changeDate(string str)
        {
            //2004.5.18 -  ===>  .
            if (str.Substring(0, 1) == "$" || str.Substring(0, 1) == "#" || str.Substring(0, 1) == "^")
            {
                return str;
            }
            if (str.Length == 4)
            {
                return str + ".01.01";
            }
            else if (str.Length == 7)
            {
                return str + ".01";
            }
            else if (str.Length == 10)
            {
                return str;
            }
            else
            {
                return "";
            }
        }

        private string getstr(string strT)
        {
            switch (strT)
            {
                case "����":
                    return "=";
                    //break;
                case "����":
                    return ">";
                    //break;
                case "С��":
                    return "<";
                    //break;
                case "������":
                    return "<>";
                    //break;
                case "���ڵ���":
                    return ">=";
                    //break;
                case "С�ڵ���":
                    return "<=";
                    //break;
                case "��..֮��":
                    return "=";
                    //break;
                case "����..֮��":
                    return "<>";
                    //break;
                case "����":
                    return "=";
                    //break;
                case "������":
                    return "<>";
                    //break;
                case "��..֮��":
                    return "=";
                    //break;
                case "����..֮��":
                    return "<>";
                    //break;
                default:
                    return "";
                    //break;
            }
        }

        /// <summary>
        /// �жϳ���
        /// </summary>
        /// <param name="ֵ"></param>
        /// <param name="����"></param>
        /// <returns></returns>
        public bool CheckLen(string strP, int len)
        {
            if (strP.Length > len)
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// �ж���ֵ
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool CheckInt(string str)
        {
            try
            {
                double intl = double.Parse(str);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// �ж���
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool CheckDateY(string str)
        {
            if (str.Length != 4)
            {
                return false;
            }
            return CheckInt(str);
        }

        /// <summary>
        /// �ж�����
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool CheckDateYM(string str)
        {
            if (str.Length != 7)
            {
                return false;
            }

            if (!CheckDateY(str.Substring(0, 4)))
            {
                return false;
            }
            if (!CheckInt(str.Substring(5, 2)))
            {
                return false;
            }
            if (int.Parse(str.Substring(5, 2)) > 12)
            {
                return false;
            }
            if (str.Substring(4, 1) != "-")
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// �ж�������
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool CheckDateYMD(string str)
        {
            if (str.Length != 10)
            {
                return false;
            }
            if (!CheckDateYM(str.Substring(0, 7)))
            {
                return false;
            }
            if (!CheckInt(str.Substring(8, 2)))
            {
                return false;
            }
            if (int.Parse(str.Substring(8, 2)) > 31)
            {
                return false;
            }
            if (str.Substring(7, 1) != "-")
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// �������
        /// </summary>
        /// <param name="strP"></param>
        /// <param name="strT"></param>
        /// <returns></returns>
        public bool CheckType(string strP, string strT)
        {
            if (strP == "")
            {
                return true;
            }
            switch (strT)
            {
                case "0":
                    break;
                case "1":
                    return CheckDateY(strP);
                    //break;
                case "11":
                    return CheckDateYM(strP);
                    //break;
                case "111":
                    //return CheckDateYMD(strP);
                    return true;
                    //break;
                case "2":
                    break;
                case "3":
                    return CheckInt(strP);
                case "5":
                    //return CheckDateYMD(strP);
                    break;
                case "6":
                    break;
                case "7":
                    break;
                case "8":
                    break;
                case "10":
                    break;
                case "12":
                    break;
                case "13":
                    break;
            }
            return true;
        }

        public string DataType(string strT)
        {
            //string strtmp = "2";
            //9.25add
            string strtmp = strT;
            switch (strT)
            {
                case "0":
                    strtmp = "2";
                    break;
                case "1":
                    strtmp = "2";
                    break;
                case "2":
                    strtmp = "3";
                    break;
                //case "3":
                //    strtmp = "4";
                //    break;
                //case "4":
                //    strtmp = "5";
                //    break;
                case "3":
                    strtmp = "1";
                    break;
                case "4":
                    strtmp = "11";
                    break;
                case "5":
                    strtmp = "111";
                    break;
                case "6":
                    strtmp = "2";
                    break;
                case "7":
                    strtmp = "2";
                    break;
                case "8":
                    strtmp = "2";
                    break;
                case "9":
                    strtmp = "2";
                    break;
                case "10":
                    strtmp = "2";
                    break;
                case "11":
                    strtmp = "2";
                    break;
                case "12":
                    strtmp = "2";
                    break;
                case "13":
                    strtmp = "2";
                    break;
                case "14":
                    strtmp = "2";
                    break;
                case "15":
                    strtmp = "2";
                    break;
            }
            return strtmp;
        }

        /// <summary>
        /// �жϱ��ʽ
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool getTextStr(string str)
        {
            string str1 = null;
            for (int i = 0; i < str.Length; i++)
            {
                str1 = str.Substring(i, 1);
                if (CheckInt(str1) == false)
                {
                    if (CheckStr(str1) == false)
                    {
                        return false;
                    }
                }
            }
            return true;
        }

        /// <summary>
        /// �жϱ��ʽ
        /// ֻ����+��*��������
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public bool CheckStr(string str)
        {
            //if (str == "+")
            //{
            //    return true;
            //}
            //if (str == "*")
            //{
            //    return true;
            //}
            //if (str == "(")
            //{
            //    return true;
            //}
            //if (str == ")")
            //{
            //    return true;
            //}
            //return false;
            switch (str)
            {
                case "+":
                case "*":
                case "(":
                case ")":
                    return true;
                default:
                    return false;
            }
        }

        /// <summary>
        /// ����str1�ַ�֮ǰ�Ĵ�
        /// </summary>
        /// <param name="str"></param>
        /// <param name="str1"></param>
        /// <returns></returns>
        public string getStr(string str, string str1)
        {
            int intstr;
            intstr = str.IndexOf(str1);
            return str.Substring(0, intstr);
        }

        /// <summary>
        /// ��ִ�
        /// ���ַ�"~" �� ":" �֣����ڶ�ά������
        /// ���ض�ά����
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string[][] getStrItem(string str)
        {
            int i, intRow;

            string[][] stritem;
            string[] strss = str.Split('~');
            intRow = strss.Length;
            stritem = new string[intRow][];
            for (i = 0; i < strss.Length; i++)
            {
                stritem[i] = strss[i].Split(':');
            }
            return stritem;
        }

        /// <summary>
        /// ���������ʽ���
        /// ��ֵ+"~"+�ַ�
        /// ��Ҫ��������
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string getTextStrAdd(string str)
        {
            string str_temp;//��ʱȡһ��ֵ
            string str_sum = "";//�ϲ��ַ�����ֵ��"~"�ֿ�
            string str_addint = "";//ȡ��ֵ
            string str_addstr = "";//ȡ�ַ�
            for (int i = 0; i < str.Length; i++)
            {
                str_temp = str.Substring(i, 1);
                if (CheckInt(str_temp) == true)//�ж��Ƿ�Ϊ��ֵ
                {
                    if (str_addstr != "")
                    {
                        str_sum += str_addstr + "~";
                    }
                    str_addstr = "";
                    str_addint += str_temp;
                }
                else
                {
                    if (str_addint != "")
                    {
                        str_sum += str_addint + "~";
                    }
                    str_addint = "";
                    str_addstr += str_temp;
                }
            }
            if (str_addstr != "")
            {
                str_sum += str_addstr + "~";
            }
            if (str_addint != "")
            {
                str_sum += str_addint + "~";
            }

            return str_sum;
        }

        /// <summary>
        /// �ֽ��ϵ���ʽ
        /// </summary>
        /// <param name="str"></param>
        public int getStrItem(string str, out string[][] str_item)
        {
            int i, intRow;
            string[] strss;
            str_item = null;
            if (str == "" || str == null)
            {
                return 0;
            }
            strss = str.Split('~');
            intRow = strss.Length;
            str_item = new string[intRow][];
            for (i = 0; i < strss.Length; i++)
            {
                str_item[i] = strss[i].Split(':');
            }
            return intRow;
        }

        /// <summary>
        /// �ж������Ƿ���ȷ
        /// </summary>
        /// <param name="Value"></param>
        /// <returns></returns>
        public bool IsNumOrChar(String Value)
        {
            int i;
            char tempC;
            try
            {
                tempC = Value.Substring(0, 1).ToCharArray()[0];
                if (tempC >= '0' && tempC <= '9')
                {
                    return false;
                }
                //i = tempC.CompareTo('-');
                for (i = 0; i <= Value.Length - 1; i++)
                {
                    tempC = Value.Substring(i, 1).ToCharArray()[0];
                    if (tempC == '-' || tempC == '+' || tempC == '|' || tempC == '/' || tempC == '*' || tempC == '.' || tempC == '!' || tempC == '%' || tempC == '@' || tempC == '#' || tempC == '$' || tempC == '^' || tempC == '&' || tempC == '(' || tempC == ')' || tempC == '?' || tempC == '=')
                    {
                        return false;
                    }
                    if (tempC == '>' || tempC == '<' || tempC == '[' || tempC == ']' || tempC == '}' || tempC == '{' || tempC == '`' || tempC == '~' || tempC == ':' || tempC == ';' || tempC == '"' || tempC == ',')
                    {
                        return false;
                    }
                    //if (!(tempC >= '0' && tempC <= '9'))
                    //{
                    //    if (!((tempC >= 'A' && tempC <= 'Z') || (tempC >= 'a' && tempC <= 'z'))) //������ĸ
                    //    {
                    //        return false;
                    //    }
                    //}
                }
            }
            catch
            {
                return false;
            }
            return true;
        }

        /// <summary>
        /// ��������Ƿ�Ϸ�
        /// </summary>
        /// <param name="iYear"></param>
        /// <param name="iMonth"></param>
        /// <param name="iDay"></param>
        /// <returns></returns>
        public int checkDate(int iYear, int iMonth, int iDay)
        {
            int intYear, intMonth, intDay;
            if (iYear == 0)
            {
                intYear = DateTime.Now.Year;
            }
            else
            {
                intYear = iYear;
            }
            if (iMonth == 0)
            {
                intMonth = DateTime.Now.Month;
            }
            else
            {
                intMonth = iMonth;
            }
            if (iDay == 0)
            {
                intDay = DateTime.Now.Day;
            }
            else
            {
                intDay = iDay;
            }

            if (intYear > 2100 || intYear < 1900)
            {
                return 1;
            }
            if (intMonth > 12 || intMonth < 1)
            {
                return 2;
            }
            switch (intMonth)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    if (intDay > 31 || intDay < 1)
                    {
                        return 3;
                    }
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    if (intDay > 30 || intDay < 1)
                    {
                        return 3;
                    }
                    break;
                case 2:
                    return checkFeb(intYear, intMonth, intDay);
            }
            return 0;
        }

        private int checkFeb(int iYear, int iMonth, int iDay)
        {
            int iDiv = iYear % 4;
            if (iDiv == 0)
            {
                if (iDay > 29 || iDay < 1)
                {
                    return 3;
                }
            }
            else
            {
                if (iDay > 28 || iDay < 1)
                {
                    return 3;
                }
            }
            return 0;
        }
    }
}
