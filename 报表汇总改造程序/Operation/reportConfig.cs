using System;

namespace Report.stat
{
    /// <summary>
    /// Class1 的摘要说明。
    /// </summary>
    public class ILC
    {
        #region《常量》

        //对象表字段
        public const string rpt_Serial = "R202";
        public const string rpt_SerialItem = "R203";
        public const string TYPENO = "typeno";
        public const string SETTABLENO = "settableno";
        public const string TABLENO = "tableno";
        public const string SERIALNO = "setialno";
        public const string SERIALNAME = "serialname";
        public const string SERIALTYPE = "serialtype";
        public const string MAINOBECT = "mainobject";
        public const string COUNT = "count";
        public const string SEQUENCENAME = "sequencename";
        public const string SEQUENCENO = "sequenceno";
        public const string DEALFIELDNAME = "dealfieldname";
        public const string DEALSTYLE = "dealstyle";
        public const string BASEEXPR = "baseexpr";
        public const string BASEITEM = "baseitem";
        public const string SQL = "sql";
        public const string CHINESEITEM = "chineseitem";
        public const string FUNCTION = "function";
        //新加常量
        public const string PROPERTYSET = "propertySet";

        #endregion

        public ILC()
        {
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        public static string PConneciton;
    }
}
