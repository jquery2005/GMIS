using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.InteropServices;

namespace GMIS.CommonRightBusinessRule
{
    public class ProfessionalEncryptDog: MyBase
    {
        public const uint RY_SUCCESS = 0x00000000;              // 操作成功
        public const uint RY3_NETLOCK_SUCCESS = 0xF000001C;     //返回成功，表示已经连接到了指定模块
        public const uint RY3_NETLOCK_MAXCON = 0xF000001A;     //连接数已满，表示将要连接的模块当前连接数已经等与它允许的最大连接数
        public const uint RY3_NETLOCK_CONNECTED = 0xF000001D;     //已经建立了连接，当前进程已经建立了与指定模块的连接

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_Find(string strVendorID, ref int iCount);

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_Read(uint handle, int offset, byte[] pOutbuf, int len);

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_Write(uint handle, int offset, string pInbuf, int len);

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_Open(ref uint hHandle, int iIndex);

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_GetFreeSize(uint handle, ref int pSize);

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_OpenNetMod(ref uint handle, uint mod_num);		//打开网络锁模块

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_CloseNetMod(uint handle, uint mod_num);	//得到网络锁模块,并关闭

        [DllImport("NetRockey3Client.dll")]
        public static extern uint RY3_Close(uint handle, bool IsReset);
        //[DllImport("NetRockey3Client.dll")]
        //public static extern uint RY3_GetHardID(uint handle, char* pbuf);   //获取硬件序列号(输出16字节的字符串)

        public static uint iRes = 0;
        public static uint hHandle = 0;
        public static string strtemp = "";

        public static string PFProductName = "Philisense_GMISINFO_Standard_3.5_2012-10-01";
        //版本号（专业版）
        //public static string PFProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-01";
        public static bool JiaMiDog()
        {



            int iCount = 0;
            byte[] bDataBuf = new byte[128];

            string sVendorID = "13920512";

            //按VendorID查找Rockey3，VendorID为8个字节的字符串。
            //找到该VendorID的Rockey3的个数返回到iCount中。
            iRes = ProfessionalEncryptDog.RY3_Find(sVendorID, ref iCount);


            if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
            {

                iRes = ProfessionalEncryptDog.RY3_Open(ref hHandle, 1);
                if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                {
                    //uint model = ProfessionalEncryptDog.RY3_CloseNetMod(hHandle, 1);
                    //iRes = ProfessionalEncryptDog.RY3_OpenNetMod(ref hHandle, 1);
                    //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);
                    
                   //if (iRes == 0xF000001C) //if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                    {
                        iRes = ProfessionalEncryptDog.RY3_Read(hHandle, 0, bDataBuf, PFProductName.Length);
                        if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                        //if (iRes == 0xF0000025)
                        {
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf);
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
                            if (strtemp == PFProductName)
                            {
                                strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
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
                    //else
                    //{
                    //    return false;
                    //}
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
        /// 判断加密狗是否存在【登陆后  共享】（王科技2012-10-30）
        /// </summary>
        /// <param name="JMG"></param>
        /// <returns></returns>
        public static bool JiaMiDog(out bool JMG)
        {
            int iCount = 0;
            byte[] bDataBuf = new byte[64];

            string sVendorID = "13920512";
            int iSize = 20;
            //string ProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-010";

            //按VendorID查找Rockey3，VendorID为8个字节的字符串。
            //找到该VendorID的Rockey3的个数返回到iCount中。

            

            iRes = ProfessionalEncryptDog.RY3_Find(sVendorID, ref iCount);


            if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
            {
              
                iRes = ProfessionalEncryptDog.RY3_Open(ref hHandle, 1);
                if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                {
                    iRes = ProfessionalEncryptDog.RY3_OpenNetMod(ref hHandle, 0);
                    //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);
                    if (iRes == RY3_NETLOCK_SUCCESS || iRes == RY3_NETLOCK_CONNECTED)//
                    {
                        //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);
                        //iRes = ProfessionalEncryptDog.RY3_GetFreeSize(hHandle, ref iSize);
                        iRes = ProfessionalEncryptDog.RY3_Read(hHandle, 0, bDataBuf, PFProductName.Length);
                        if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                        {
                            //strtemp = System.Text.Encoding.Default.GetString(bDataBuf);
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
                            if (strtemp == PFProductName)
                            {
                                strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
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
                        JMG = false;
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

        /// <summary>
        /// 判断加密狗是否存在【登录时 私有】（王科技2012-10-30）
        /// </summary>
        /// <param name="JMG"></param>
        /// <returns></returns>
        public static bool JiaMiDogNow(out bool JMG)
        {
            int iCount = 0;
            byte[] bDataBuf = new byte[64];

            string sVendorID = "13920512";
            int iSize = 20;
            //string ProductName = "Philisense_GMISINFO_Professional_3.5_2012-10-010";

            //按VendorID查找Rockey3，VendorID为8个字节的字符串。
            //找到该VendorID的Rockey3的个数返回到iCount中。



            iRes = ProfessionalEncryptDog.RY3_Find(sVendorID, ref iCount);


            if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
            {

                iRes = ProfessionalEncryptDog.RY3_Open(ref hHandle, 1);
                if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                {
                    iRes = ProfessionalEncryptDog.RY3_OpenNetMod(ref hHandle, 0);
                    //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);
                    if (iRes == RY3_NETLOCK_SUCCESS)
                    {
                        //Console.WriteLine("\nRY3_Find Success, iCount:" + iCount);
                        //iRes = ProfessionalEncryptDog.RY3_GetFreeSize(hHandle, ref iSize);
                        iRes = ProfessionalEncryptDog.RY3_Read(hHandle, 0, bDataBuf, PFProductName.Length);
                        if (iRes == ProfessionalEncryptDog.RY_SUCCESS)
                        {
                            //strtemp = System.Text.Encoding.Default.GetString(bDataBuf);
                            strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
                            if (strtemp == PFProductName)
                            {
                                strtemp = System.Text.Encoding.Default.GetString(bDataBuf).Substring(0, PFProductName.Length);
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
                        JMG = false;
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

        public static void ColseService()
        {
            //ProfessionalEncryptDog.RY3_CloseNetMod(hHandle, 0);
            ProfessionalEncryptDog.RY3_Close(hHandle, true);
        }
    }
}
