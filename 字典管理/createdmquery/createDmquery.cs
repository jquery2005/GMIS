using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualBasic;

namespace createdmquery
{
    public class createDmquery
    {
        public static string HzToSpell(string strHz)
        {
            string str2 = "";
            int num3 = Strings.Len(strHz);
            if (num3 == 0)
            {
                return "";
            }
            int num4 = num3;
            for (int i = 1; i <= num4; i++)
            {
                int num2 = (0xffff + Strings.Asc(Strings.Mid(strHz, i))) + 1;
                if ((num2 >= 0xb0a1) & (num2 < 0xb0c5))
                {
                    str2 = str2 + "A";
                }
                if ((num2 >= 0xb0c5) & (num2 < 0xb2c1))
                {
                    str2 = str2 + "B";
                }
                if ((num2 >= 0xb2c1) & (num2 < 0xb4ee))
                {
                    str2 = str2 + "C";
                }
                if ((num2 >= 0xb4ee) & (num2 < 0xb6ea))
                {
                    str2 = str2 + "D";
                }
                if ((num2 >= 0xb6ea) & (num2 < 0xb7a2))
                {
                    str2 = str2 + "E";
                }
                if ((num2 >= 0xb7a2) & (num2 < 0xb8c1))
                {
                    str2 = str2 + "F";
                }
                if ((num2 >= 0xb8c1) & (num2 < 0xb9fe))
                {
                    str2 = str2 + "G";
                }
                if ((num2 >= 0xb9fe) & (num2 < 0xbbf7))
                {
                    str2 = str2 + "H";
                }
                if ((num2 >= 0xbbf7) & (num2 < 0xbfa6))
                {
                    str2 = str2 + "J";
                }
                if ((num2 >= 0xbfa6) & (num2 < 0xc0ac))
                {
                    str2 = str2 + "K";
                }
                if ((num2 >= 0xc0ac) & (num2 < 0xc2e8))
                {
                    str2 = str2 + "L";
                }
                if ((num2 >= 0xc2e8) & (num2 < 0xc4c3))
                {
                    str2 = str2 + "M";
                }
                if ((num2 >= 0xc4c3) & (num2 < 0xc5b6))
                {
                    str2 = str2 + "N";
                }
                if ((num2 >= 0xc5b6) & (num2 < 0xc5be))
                {
                    str2 = str2 + "O";
                }
                if ((num2 >= 0xc5be) & (num2 < 0xc6da))
                {
                    str2 = str2 + "P";
                }
                if ((num2 >= 0xc6da) & (num2 < 0xc8bb))
                {
                    str2 = str2 + "Q";
                }
                if ((num2 >= 0xc8bb) & (num2 < 0xc8f6))
                {
                    str2 = str2 + "R";
                }
                if ((num2 >= 0xc8f6) & (num2 < 0xcbfa))
                {
                    str2 = str2 + "S";
                }
                if ((num2 >= 0xcbfa) & (num2 < 0xcdda))
                {
                    str2 = str2 + "T";
                }
                if ((num2 >= 0xcdda) & (num2 < 0xcef4))
                {
                    str2 = str2 + "W";
                }
                if ((num2 >= 0xcef4) & (num2 < 0xd1b9))
                {
                    str2 = str2 + "X";
                }
                if ((num2 >= 0xd1b9) & (num2 < 0xd4d1))
                {
                    str2 = str2 + "Y";
                }
                if ((num2 >= 0xd4d1) & (num2 < 0xd7fa))
                {
                    str2 = str2 + "Z";
                }
                if (((Strings.Asc(Strings.Mid(strHz, i)) >= 0x61) & (Strings.Asc(Strings.Mid(strHz, i)) <= 0x7a)) | ((Strings.Asc(Strings.Mid(strHz, i)) >= 0x41) & (Strings.Asc(Strings.Mid(strHz, i)) <= 90)))
                {
                    str2 = str2 + Strings.Mid(strHz, i, 1);
                }
            }
            return str2;
        }
    }
}
