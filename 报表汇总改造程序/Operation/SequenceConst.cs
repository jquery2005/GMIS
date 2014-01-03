using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using DMServer.DataMolde;
using DataAccess.Data;

namespace DataAccess.Data
{
    /// <summary>
    /// SequenceConst ��ժҪ˵����
    /// </summary>
    public class SequenceConst
    {
        #region ȫ�ֳ���

        //���峣����
        private const string EF01_TABLE = "EF01";
        private const string EF01_ZA0100 = "ZA0100";
        private const string EF01_EF01ID = "EF01ID";
        private const string EF01_ZA0101 = "ZA0101";
        private const string EF01_ZA9999 = "ZA9999";
        private const string EF01_ZC9995 = "ZC9995";
        //���峣��ֵ
        private const string EB01_TABLE = "EB01";
        private const string EB01_ZA0100 = "ZA0100";
        private const string EB01_EB01ID = "EB01ID";
        private const string EB01_ZA0101 = "ZA0101";
        private const string EB01_EB0111 = "EB0111";
        private const string EB01_ZB0102 = "ZB0102";

        #endregion

        #region ȫ�ֱ���

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
            // TODO: �ڴ˴���ӹ��캯���߼�
            //
        }

        #region ���峣������

        /// <summary>
        /// ���峣�����ѯ
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
        /// ȡ���ֵ
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
        /// ȡ���ֵ
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
        /// �������ѯ
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
        /// ��ӳ�����
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
        /// �ж������Ƿ��ظ�
        /// </summary>
        /// <param name="strconstname"></param>
        /// <returns></returns>
        public DataTable checkEF01Name(string strconstname)
        {
            string strSql;
            strSql = " select * from " + EF01_TABLE + " where " + EF01_ZA0101 + " = '" + strconstname + "' ";
            return getsql.gsQuerySql(strSql, EF01_TABLE);
        }

        //�޸�
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

        //ɾ������ֵ
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
