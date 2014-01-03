using System;
using System.Collections;
using System.Collections.Specialized;

namespace DataAccess.Data
{
    /// <summary>
    /// CFun 的摘要说明。
    /// </summary>
    public class CFun
    {
        public CFun()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        /// <summary>
        /// 判断表达式
        /// 返回关系符和值
        /// </summary>
        /// <param name="关系符"></param>
        /// <param name="数组值"></param>
        /// <param name="类型"></param>
        /// <param name="输出的关系符"></param>
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
            if (strP[0] == "#空值" || strP[0].Trim() == "")
            {
                if (strT == "不等于" || strT == "不包含")
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
                    if (strT == "包含" || strT == "不包含")
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
                    else if (strT == "左包含")
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
                    else if (strT == "右包含")
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
                    if (strT == "包含" || strT == "不包含")
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
                    else if (strT == "左包含")
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
                    else if (strT == "右包含")
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
                            //2004.5.18 放开这个代码  (1982.03)===>(1982.03.01)
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
                case "等于":
                    strout = "=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "=";
                    break;
                case "大于":
                    strout = ">" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">";
                    break;
                case "小于":
                    strout = "<" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<";
                    break;
                case "不等于":
                    strout = "<>" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<>";
                    break;
                case "大于等于":
                    strout = ">=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">=";
                    break;
                case "小于等于":
                    strout = "<=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<=";
                    break;
                case "高于":
                    strout = "<" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<";
                    break;
                case "低于":
                    strout = ">" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">";
                    break;
                case "低于等于":
                    strout = ">=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = ">=";
                    break;
                case "高于等于":
                    strout = "<=" + strtmp.Substring(0, strtmp.Length - 1);
                    str1 = "<=";
                    break;
                case "在..之中":
                    strout = "in (" + strtmp.Substring(0, strtmp.Length - 1) + ") ";
                    str1 = "in";
                    break;
                case "不在..之中":
                    strout = "not in (" + strtmp.Substring(0, strtmp.Length - 1) + ") ";
                    str1 = "not in";
                    break;
                case "包含":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "左包含":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "右包含":
                    strout = "like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "like";
                    break;
                case "不包含":
                    strout = "not like " + strtmp.Substring(0, strtmp.Length - 1) + " ";
                    str1 = "not like";
                    break;
                case "在..之间":
                    if (Sstr.Length < 2)
                    {
                        str1 = "";
                        break;
                    }
                    strout = "between " + Sstr[0] + " and " + Sstr[1];
                    str1 = "between";
                    break;
                case "不在..之间":
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
                case "等于":
                    return "=";
                    //break;
                case "大于":
                    return ">";
                    //break;
                case "小于":
                    return "<";
                    //break;
                case "不等于":
                    return "<>";
                    //break;
                case "大于等于":
                    return ">=";
                    //break;
                case "小于等于":
                    return "<=";
                    //break;
                case "在..之中":
                    return "=";
                    //break;
                case "不在..之中":
                    return "<>";
                    //break;
                case "包含":
                    return "=";
                    //break;
                case "不包含":
                    return "<>";
                    //break;
                case "在..之间":
                    return "=";
                    //break;
                case "不在..之间":
                    return "<>";
                    //break;
                default:
                    return "";
                    //break;
            }
        }

        /// <summary>
        /// 判断长度
        /// </summary>
        /// <param name="值"></param>
        /// <param name="长度"></param>
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
        /// 判断数值
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
        /// 判断年
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
        /// 判断年月
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
        /// 判断年月日
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
        /// 检查类型
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
        /// 判断表达式
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
        /// 判断表达式
        /// 只允许含+、*、（、）
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
        /// 返回str1字符之前的串
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
        /// 拆分串
        /// 按字符"~" 和 ":" 分，放在二维数组中
        /// 返回二维数组
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
        /// 将条件表达式拆分
        /// 数值+"~"+字符
        /// 主要用于描述
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public string getTextStrAdd(string str)
        {
            string str_temp;//临时取一个值
            string str_sum = "";//合并字符、数值用"~"分开
            string str_addint = "";//取数值
            string str_addstr = "";//取字符
            for (int i = 0; i < str.Length; i++)
            {
                str_temp = str.Substring(i, 1);
                if (CheckInt(str_temp) == true)//判断是否为数值
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
        /// 分解关系表达式
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
        /// 判断名称是否正确
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
                    //    if (!((tempC >= 'A' && tempC <= 'Z') || (tempC >= 'a' && tempC <= 'z'))) //不是字母
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
        /// 检查日期是否合法
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
