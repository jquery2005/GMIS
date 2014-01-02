using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.InteropServices;
namespace GMIS.CommonRightBusinessRule
{
    public class StandardEncryptDog
    {
        public const uint RY_SUCCESS = 0x00000000;              // 操作成功

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Find(string strVendorID, ref int iCount);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Read(uint handle, int offset, byte[] pOutbuf, int len);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Write(uint handle, int offset, string pInbuf, int len);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Open(ref uint hHandle, int iIndex);


        public static uint iRes = 0;
        public static uint hHandle = 0;
        public static string strtemp = "";
        //版本号（标准版）
        public static string SDProductName = "Philisense_GMISINFO_Standard_3.5_2012-10-01";
        //版本号（专业版）
        //public static string SDProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-01";
        public static bool JiaMiDog()
        {



            int iCount = 0;
            byte[] bDataBuf = new byte[64];

            //string sVendorID = "3BBCCB6D";
            string sVendorID = "13920512";
            //string ProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-010";

            //按VendorID查找Rockey3，VendorID为8个字节的字符串。
            //找到该VendorID的Rockey3的个数返回到iCount中。
            iRes = StandardEncryptDog.RY3_Find(sVendorID, ref iCount);


            if (iRes == StandardEncryptDog.RY_SUCCESS)
            {

                iRes = StandardEncryptDog.RY3_Open(ref hHandle, 1);
                if (iRes == StandardEncryptDog.RY_SUCCESS)
                {
                    //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);

                    iRes = StandardEncryptDog.RY3_Read(hHandle, 0, bDataBuf, SDProductName.Length);
                    if (iRes == StandardEncryptDog.RY_SUCCESS)
                    {
                        //strtemp = System.Text.Encoding.Default.GetString(bDataBuf);
                        strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, SDProductName.Length);
                        if (strtemp == SDProductName)
                        {
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, SDProductName.Length);
                            //MessageBox.Show(this, "加密狗读取成功!", "提示");
                            return true;
                        }
                        else
                        {
                            return false;
                        }
                    }
                    else
                    {
                        //Console.WriteLine("RY3_Read Error:" + iRes);
                        //MessageBox.Show("加密狗读取失败!");
                        //Cursor = Cursors.Arrow;
                        return false;
                    }
                }
                else
                {
                    // Console.WriteLine("RY3_Open Error:" + iRes);
                    //MessageBox.Show("加密狗打开失败!");
                    //this.Cursor = Cursors.Arrow;

                    return false;
                }
            }
            else
            {
                //Console.WriteLine("RY3_Find Error:" + iRes);
                ////Console.WriteLine();
                ////GetHex(iRes);
                //MessageBox.Show("加密狗不存在!");
                //this.Cursor = Cursors.Arrow;

                return false;
            }
        }

        /// <summary>
        /// 判断加密狗是否存在（王科技2012-10-30）
        /// </summary>
        /// <param name="JMG"></param>
        /// <returns></returns>
        public static bool JiaMiDog(out bool JMG)
        {
            int iCount = 0;
            byte[] bDataBuf = new byte[64];

            string sVendorID = "13920512";
            //string ProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-010";

            //按VendorID查找Rockey3，VendorID为8个字节的字符串。
            //找到该VendorID的Rockey3的个数返回到iCount中。
            iRes = StandardEncryptDog.RY3_Find(sVendorID, ref iCount);


            if (iRes == StandardEncryptDog.RY_SUCCESS)
            {

                iRes = StandardEncryptDog.RY3_Open(ref hHandle, 1);
                if (iRes == StandardEncryptDog.RY_SUCCESS)
                {
                    //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);

                    iRes = StandardEncryptDog.RY3_Read(hHandle, 0, bDataBuf, SDProductName.Length);
                    if (iRes == StandardEncryptDog.RY_SUCCESS)
                    {
                        //strtemp = System.Text.Encoding.Default.GetString(bDataBuf);
                        strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, SDProductName.Length);
                        if (strtemp == SDProductName)
                        {
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, SDProductName.Length);
                            //MessageBox.Show(this, "加密狗读取成功!", "提示");
                            JMG = true;
                            //return JMG;
                        }
                        else
                        {
                            JMG = false;
                            //return JMG;
                        }
                    }
                    else
                    {
                        //Console.WriteLine("RY3_Read Error:" + iRes);
                        //MessageBox.Show("加密狗读取失败!");
                        //Cursor = Cursors.Arrow;
                        JMG = false;
                        //return JMG;
                    }
                }
                else
                {
                    // Console.WriteLine("RY3_Open Error:" + iRes);
                    //MessageBox.Show("加密狗打开失败!");
                    //this.Cursor = Cursors.Arrow;
                    JMG = false;
                    //return JMG;
                }

            }
            else
            {
                //Console.WriteLine("RY3_Find Error:" + iRes);
                ////Console.WriteLine();
                ////GetHex(iRes);
                //MessageBox.Show("加密狗不存在!");
                //this.Cursor = Cursors.Arrow;
                JMG = false;
                //return JMG;
            }
            return JMG;
        }
    }
}

