using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using Microsoft.Win32;

namespace About
{
    public partial class About : Form
    {
        public About()
        {
            InitializeComponent();
        }

        private void btnOk_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void About_Load(object sender, EventArgs e)
        {
            System.Collections.IDictionary ii;
            ii = Environment.GetEnvironmentVariables();
            string[] ss;
            ss = Environment.GetLogicalDrives();

            label4.Text = ReadRememberUser();
            label5.Text = ReadRememberField();

            GMIS.CommonRightBusinessRule.CCommonInfo gCCommonInfo = new GMIS.CommonRightBusinessRule.CCommonInfo();
            string ss1, struser = ".", strserver = "gmisinfo";
            try
            {
                ss1 = gCCommonInfo.gsGetConfigPropertyValue("发布日期", "日期");
            }
            catch
            {
                ss1 = "";
            }
            label8.Text = ss1;

            try
            {
                if (System.IO.File.Exists(Application.StartupPath + @"\gmisinfo.txt"))
                {
                    System.IO.StreamReader sr = System.IO.File.OpenText(Application.StartupPath + @"\gmisinfo.txt");
                    string str = sr.ReadLine();
                    if (str == null) str = "";
                    if (str.Trim() != "" && str.Split(',').Length == 3)
                    {
                        struser = str.Split(',')[0];
                        strserver = str.Split(',')[1];
                    }
                    else
                    {
                        struser = ".";
                        strserver = "gmisinfo";
                    }
                    sr.Close();
                }
                else  //不存在文件
                {
                    struser = ".";
                    strserver = "gmisinfo";
                }
            }
            catch
            {
                struser = ".";
                strserver = "gmisinfo";
            }
            try
            {
                DataTable dt = new DataTable();
                string dbConnectStr = "server=" + struser + ";uid=gmis2002"
                    + ";pwd=gs2002;database=" + strserver + ";Connection Lifetime = 180";
                SqlConnection conn = new SqlConnection(dbConnectStr);
                SqlDataAdapter dsCommand = new SqlDataAdapter("select convert(varchar(10),verDate,21) from gs_ver ", conn);
                dsCommand.Fill(dt);
                ss1 = dt.Rows[0][0].ToString();
            }
            catch
            {
                ss1 = "";
            }

            label10.Text = ss1;

            this.TopMost = true;
        }

        /// <summary>
        /// 从注册表中读字符记忆型数据
        /// </summary>
        private string ReadRememberField()
        {
            object strRemember;
            try
            {
                RegistryKey LMRK = Registry.LocalMachine;
                RegistryKey SoftRK = LMRK.OpenSubKey("software", true);
                RegistryKey GmisRK = SoftRK.OpenSubKey("Microsoft").OpenSubKey("Windows NT").OpenSubKey("CurrentVersion");

                strRemember = GmisRK.GetValue("RegisteredOrganization");
                if (strRemember == null || strRemember.ToString() == "")
                {
                    GmisRK = SoftRK.OpenSubKey("Microsoft").OpenSubKey("Windows").OpenSubKey("CurrentVersion");

                    strRemember = GmisRK.GetValue("RegisteredOrganization");
                }

                return strRemember.ToString();
            }//try
            catch
            {
                return "";
            }
        }

        /// <summary>
        /// 从注册表中读字符记忆型数据
        /// </summary>
        private string ReadRememberUser()
        {
            object strRemember;
            try
            {
                RegistryKey LMRK = Registry.LocalMachine;
                RegistryKey SoftRK = LMRK.OpenSubKey("software", true);
                RegistryKey GmisRK = SoftRK.OpenSubKey("Microsoft").OpenSubKey("Windows NT").OpenSubKey("CurrentVersion");

                strRemember = GmisRK.GetValue("RegisteredOwner");
                if (strRemember == null || strRemember.ToString() == "")
                {
                    GmisRK = SoftRK.OpenSubKey("Microsoft").OpenSubKey("Windows").OpenSubKey("CurrentVersion");

                    strRemember = GmisRK.GetValue("RegisteredOwner");
                }
                return strRemember.ToString();
            }//try
            catch
            {
                return "";
            }
        }
    }
}
