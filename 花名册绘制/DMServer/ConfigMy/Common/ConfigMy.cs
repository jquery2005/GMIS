using System;
using System.Configuration;

namespace DMServer.Common
{
    /// <summary>
    /// ConfigMy 的摘要说明。
    /// </summary>
    public class ConfigMy
    {
        /// <summary>
        /// 数据库连接字符串
        /// </summary>
        private string dbConnectString;
        private static string[] mConnectInfo;

        public static string strUserID;

        /// <summary>
        /// 构造函数，在这里得到dbConnectString的值
        /// </summary>
        //public ConfigMy(string[] s)
        //{
        //    this.Init(s[0], s[2], s[3], s[1]);
        //    this.mConnectInfo = s;
        //}

        //public bool Init(string pServerName, string pUserId, string pPassword, string pDatabase)
        //{
        //    dbConnectString = "Server=" + pServerName + ";"
        //        + "UId=" + pUserId + ";"
        //        + "Pwd=" + pPassword + ";"
        //        + "Database=" + pDatabase + ";";

        //    return true;
        //}

        public string ConnectString
        {
            get { return dbConnectString; }
        }

        public static string[] ConnectInfo
        {
            get { return mConnectInfo; }
        }

        public static string GetString(string str)
        {
            AppSettingsReader config = new AppSettingsReader();
            return (string)(config.GetValue(str, typeof(string)));
        }
    }
}
