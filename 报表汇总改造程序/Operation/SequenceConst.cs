using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using DMServer.DataMolde;
using DataAccess.Data;

namespace DataAccess.Data
{
    /// <summary>
    /// SequenceConst 的摘要说明。
    /// </summary>
    public class SequenceConst
    {
        #region 全局常量

        //定义常量表
        private const string EF01_TABLE = "EF01";
        private const string EF01_ZA0100 = "ZA0100";
        private const string EF01_EF01ID = "EF01ID";
        private const string EF01_ZA0101 = "ZA0101";
        private const string EF01_ZA9999 = "ZA9999";
        private const string EF01_ZC9995 = "ZC9995";
        //定义常量值
        private const string EB01_TABLE = "EB01";
        private const string EB01_ZA0100 = "ZA0100";
        private const string EB01_EB01ID = "EB01ID";
        private const string EB01_ZA0101 = "ZA0101";
        private const string EB01_EB0111 = "EB0111";
        private const string EB01_ZB0102 = "ZB0102";

        #endregion

        #region 全局变量

        private string userId;
        private string strsqlconst;
        private DM dataUnit;
        private GetSql getsql;

        #endregion

        public SequenceConst(string strUser)
        {
            userId = strUser;

            strsqlconst = " select EF01.ZA0100 AS CONSTCODE,EF01.EF01ID AS CONSTID," +
                "EF01.ZA0101 AS CONSTNAME,EB01.ZA0100 AS VALUSECODE,EB01.EB01ID AS VALUEID," +
                "EB01.ZA0101 AS USERID,EB01.ZB0102 AS VALUENAME " +
                " from EF01 left join EB01 on EF01.ZA0100 = EB01.EB0111 " +
                " AND EB01.ZA0101 = '" + userId + "' ";

            dataUnit = new DM();
            getsql = new GetSql();
            //
            // TODO: 在此处添加构造函数逻辑
            //
        }

        #region 定义常量表方法

        /// <summary>
        /// 定义常量表查询
        /// </summary>
        /// <returns></returns>
        public DataTable SelectEF01()
        {
            int iResult = 0;
            string strSql = "select * from " + EF01_TABLE;
            DataSet ds = dataUnit.FillData(strSql, EF01_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 取最大值
        /// </summary>
        /// <returns></returns>
        public int maxEF01(string strtable, string strfield)
        {
            int iResult = 0;
            string strSql = "select isnull(max(" + strfield + "),0) + 100 from " + strtable;
            DataSet ds = dataUnit.FillData(strSql, strtable, out iResult);
            if (ds != null)
            {
                return int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            return 100;
        }

        /// <summary>
        /// 取最大值
        /// </summary>
        /// <returns></returns>
        public int maxEB01(string strtable, string strfield)
        {
            int iResult = 0;
            string strSql = "select isnull(max(cast(" + strfield + " as int)),0) + 1 from " + strtable;
            DataSet ds = dataUnit.FillData(strSql, strtable, out iResult);
            if (ds != null)
            {
                return int.Parse(ds.Tables[0].Rows[0][0].ToString());
            }
            return 100;
        }

        /// <summary>
        /// 常量表查询
        /// </summary>
        /// <returns></returns>
        public DataTable SelectConst()
        {
            int iResult = 0;
            DataSet ds = dataUnit.FillData(strsqlconst, EB01_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 添加常量表
        /// </summary>
        /// <returns></returns>
        public int insertConstEF01(string strconstname, string strconstvaluename)
        {
            int iRes;
            string strInsertSql, strInsertConstValue;
            string strConstNo, strValue;
            SqlCommand insertCmd = new SqlCommand();
            strConstNo = getsql.GetRestrictionExpressValue(EF01_TABLE, EF01_ZA0100, getsql.getValues(EF01_TABLE, EF01_ZA0100));
            strInsertSql = " insert into " + EF01_TABLE +
                " (" + EF01_ZA0100 + "," + EF01_EF01ID + "," + EF01_ZA0101 +
                ") values('" + strConstNo
                + "'," + maxEF01(EF01_TABLE, EF01_EF01ID) + ",'" + strconstname + "') ";
            iRes = getsql.insertgsId(EF01_TABLE, EF01_ZA0100, strConstNo);
            //strValue = getsql.GetRestrictionExpressValue(EB01_TABLE,EB01_ZA0100,getsql.getValues(EB01_TABLE,EB01_ZA0100));
            strValue = maxEB01(EB01_TABLE, EB01_ZA0100).ToString();
            strInsertConstValue = " insert into " + EB01_TABLE +
                " (" + EB01_ZA0100 + "," + EB01_EB01ID + "," + EB01_ZA0101 + ","
                + EB01_EB0111 + "," + EB01_ZB0102 + ") values('" + strValue
                + "'," + maxEF01(EB01_TABLE, EB01_EB01ID) + ",'" + userId
                + "','" + strConstNo + "','" + strconstvaluename + "') ";
            iRes = getsql.insertgsId(EB01_TABLE, EB01_ZA0100, strValue);

            insertCmd.CommandText = strInsertSql + strInsertConstValue;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 判断名称是否重复
        /// </summary>
        /// <param name="strconstname"></param>
        /// <returns></returns>
        public DataTable checkEF01Name(string strconstname)
        {
            string strSql;
            strSql = " select * from " + EF01_TABLE + " where " + EF01_ZA0101 + " = '" + strconstname + "' ";
            return getsql.gsQuerySql(strSql, EF01_TABLE);
        }

        //修改
        public int updateConstEF01(string strcodeno, string strconstname, string strconstvaluename)
        {
            int iRes;
            string strUpdateSql, strUpdateConstValue;
            string strValue;
            SqlCommand updateCmd = new SqlCommand();
            strUpdateSql = " update " + EF01_TABLE + " set " + EF01_ZA0101 + " = '" + strconstname + "' " +
                " where " + EF01_ZA0100 + " = '" + strcodeno + "'";

            iRes = deleteValueEB01(strcodeno);

            //strValue = getsql.GetRestrictionExpressValue(EB01_TABLE,EB01_ZA0100,getsql.getValues(EB01_TABLE,EB01_ZA0100));
            strValue = maxEB01(EB01_TABLE, EB01_ZA0100).ToString();
            strUpdateConstValue = " insert into " + EB01_TABLE +
                " (" + EB01_ZA0100 + "," + EB01_EB01ID + "," + EB01_ZA0101 + ","
                + EB01_EB0111 + "," + EB01_ZB0102 + ") values('" + strValue
                + "'," + maxEF01(EB01_TABLE, EB01_EB01ID) + ",'" + userId
                + "','" + strcodeno + "','" + strconstvaluename + "') ";
            iRes = getsql.insertgsId(EB01_TABLE, EB01_ZA0100, strValue);

            updateCmd.CommandText = strUpdateSql + strUpdateConstValue;
            return dataUnit.ExecSql(updateCmd);
        }

        //删除常量值
        public int deleteValueEB01(string strcodeno)
        {
            string strDeleteSql;
            SqlCommand deleteCmd = new SqlCommand();
            strDeleteSql = " delete " + EB01_TABLE + " where " + EB01_ZA0101 +
                " = '" + this.userId + "' and " + EB01_EB0111 + " = '" + strcodeno + "' ";
            deleteCmd.CommandText = strDeleteSql;
            return dataUnit.ExecSql(deleteCmd);
        }

        public int deleteEF01(string strcodeno)
        {
            string strDeleteSql;
            SqlCommand deleteCmd = new SqlCommand();
            strDeleteSql = " delete " + EF01_TABLE + " where " + EF01_ZA0100 + " = '" + strcodeno + "' ";
            strDeleteSql += " delete " + EB01_TABLE + " where " + EB01_EB0111 + " = '" + strcodeno + "' ";
            deleteCmd.CommandText = strDeleteSql;
            return dataUnit.ExecSql(deleteCmd);
        }

        public DataTable selectEG01(string strcodeno)
        {
            int iResult = 0;
            DataSet ds = dataUnit.FillData(" select * from EG01 where ZA0100 = '" + strcodeno + "' ", "EG01", out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        #endregion

    }
}
