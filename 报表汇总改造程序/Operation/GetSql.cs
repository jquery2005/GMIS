using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;
using DMServer.DataMolde;

namespace DataAccess.Data
{
    /// <summary>
    /// GetSql ��ժҪ˵����
    /// ����SQL���
    /// </summary>
    public class GetSql
    {
        private DM dataUnit;

        #region ȫ�ֳ���

        private const string PROPERTY_TABLE = "GS_PROPERTY";

        private const string PRO_INFOID = "InfoId";
        private const string PRO_INFOFIELD = "InfoField";
        private const string PRO_DESCRIPTION = "Description";
        private const string PRO_DATATYPE = "DataType";
        private const string PRO_PROPERTYSET = "PropertySet";
        private const string PRO_RESTRICTIONEXPLAN = "RestrictionExplain";
        private const string PRO_RESTRICTION = "Restriction";

        private const string GS_TABLE_OBJECT = "gs_objectassociate";
        private const string GS_FIELD_INFOIDA = "InfoIdA";
        private const string GS_FIELD_INFOIDB = "InfoIdB";

        private const string STRUCTURE_TABLE = "GS_STRUCTURE";

        private const string STR_INFOID = "InfoId";
        private const string STR_TYPE = "Type";
        private const string STR_DESCRIPTION = "Description";
        private const string STR_SHORTDESC = "ShortDesc";
        private const string STR_PARENTID = "ParentId";
        private const string STR_PARENTID1 = "ParentId1";
        private const string STR_STATE = "State";

        private const string STRTYPE = "0,1,8"; //2005.1.12 fw ����Ψһ������ 8
        private const string ORDERNAME = "OrderNo";
        private const string DATATYPE = "'9','11','14','15'";
        private const string DATATYPE1 = "'2','3','4','5'";
        private const string PROPERTYSET = "1";
        private const string INFOFIELD = "01";

        private const string TABLENAME = "gs_condition";

        private const string TABLEFIELD1 = "serialNo";
        private const string TABLEFIELD2 = "sequenceNo";
        private const string TABLEFIELD3 = "sequenceName";
        private const string TABLEFIELD9 = "mainobject";
        private const string TABLEFIELD5 = "baseExpr";
        private const string TABLEFIELD6 = "baseItem";
        private const string TABLEFIELD7 = "setSql";
        private const string TABLEFIELD8 = "chineseItem";

        private const int FIELDP1 = 1;
        private const int FIELDP2 = 1;
        private const string FIELDP3 = null;
        private const string FIELDP7 = null;
        private const string FIELDP8 = null;

        private const string TABLETREENAME = "gs_condtype";
        private const string TABLETREEFIELD1 = "serialNo";
        private const string TABLETREEFIELD2 = "Description";
        private const string TABLETREEFIELD3 = "parentId";
        private const string TABLETREEFIELD4 = "IsExistChild";
        private const string TABLETREEFIELD5 = "mainObject";

        private const int INTCHILD = 0;

        private const string TABLEFUNNAME = "ED01";
        private const string TABLEFUNFIELD1 = "ZA0101";
        private const string TABLEFUNFIELD2 = "ED0110";
        private const string TABLEFUNFIELD3 = "ED0111";
        private const string TABLEFUNFIELD4 = "ED0112";
        private const string TABLEFUNFIELD5 = "ED0113";

        private const string TABLECONSTNAME = "EC01";

        private const string TABLE_GSDICTITEM = "gs_dictitem";
        private const string FIELD_DICTID = "dictid";
        private const string DICTID = "07";

        private const string TABLE_EE01 = "ee01";
        private const string FIELD_ZA0100 = "ZA0100";
        private const string FIELD_EE01ID = "EE01ID";
        private const string FIELD_ZA9999 = "ZA9999";
        private const string FIELD_ZC9995 = "ZC9995";
        private const string FIELD_EE0115 = "EE0115";
        private const string FIELD_EE0116 = "EE0116";
        private const string FIELD_EE0110 = "EE0110";
        private const string FIELD_EE0112 = "EE0112";
        private const string FIELD_EE0113 = "EE0113";
        private const string FIELD_EE0114 = "EE0114";
        private const string FIELD_ZA0101 = "ZA0101";
        /*
        ���ʽ��EE01
        ZA0100 ����
        EE01ID ���
        ZA9999 ��ѯ��
        ZC9995 ��ע
        EE0115 ���� ��ע1��
        EE0116 ���ʽ��1+2*3/4��
        EE0110 �ֶι�ϵ
        ��AA01.AA0101:����:0~AA01.AA0102:����::2~AA01.AA0101:����:0��
        EE0112 ���ؽ��(��������ֵ��)
        EE0113 ������
        EE0114 SQL���
        */

        #endregion

        private string tableno;
        private string strno;

        public GetSql()
        {
            dataUnit = new DM();
            tableno = null;
            strno = null;
        }

        /// <summary>
        /// ��ȡserialNo��ֵ
        /// </summary>
        public string TableNo
        {
            get { return tableno; }
            set { tableno = value; }
        }

        /// <summary>
        /// ��ѯ�����ϵ��
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectGSType(string str)
        {
            string strWhere = GS_FIELD_INFOIDA + " = '" + str + "' ";
            return SelectGS(strWhere);
        }

        /// <summary>
        /// ��ѯ���õı�
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectByType(string str)
        {
            string strWhere = STR_INFOID + " in (" + str + ") and "
                + STR_TYPE + " in (" + STRTYPE + ")  and "
                + STR_STATE + " ='1' ";
            return Select(strWhere);
        }

        /// <summary>
        /// ��ѯ�����µ����ñ�
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectPARType(string str)
        {
            string strWhere = STR_PARENTID1 + " in (" + str + ")  AND  " + STR_STATE + " ='1'";
            return Select(strWhere);
        }

        /// <summary>
        /// ��ѯ������
        /// </summary>
        /// <returns></returns>
        public DataTable SelectByType1(string strcmbObject)
        {
            string strWhere;
            if (strcmbObject != "")
            {
                strWhere = STR_INFOID + " = '" + strcmbObject + "' AND " + STR_STATE + " ='1' ";
            }
            else
            {
                strWhere = STR_TYPE + " in (" + STRTYPE + ")  AND  "
                    + STR_INFOID + " LIKE '%" + INFOFIELD + "'  AND  " + STR_STATE + " ='1' ";
            }
            return Select(strWhere);
        }

        /// <summary>
        /// ��ѯ���е��ֶ�
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByPro(string strType)
        {
            string strWhere = PRO_INFOID + "='" + strType + "' AND " + PRO_DATATYPE +
                //" not in (" + DATATYPE + ")  and  " + PRO_INFOFIELD +" not like ('" + INFOFIELD + "')  order by " + ORDERNAME;
                " not in (" + DATATYPE + ")  and  " + PRO_PROPERTYSET + " !='" + PROPERTYSET + "' and  " + STR_STATE + " = '1' ";
            //+ "'  order by " + ORDERNAME;
            return SelectPRO(strWhere);
        }

        public DataTable SelectByPro(string strType, string bz)
        {
            string strWhere = PRO_INFOID + "='" + strType + "' AND " + PRO_DATATYPE +
                //" not in (" + DATATYPE + ")  and  " + PRO_INFOFIELD +" not like ('" + INFOFIELD + "')  order by " + ORDERNAME;
                " not in (" + DATATYPE + ")  and  " + PRO_PROPERTYSET + " !='" + PROPERTYSET
                + "'  and dictid !='' and " + STR_STATE + " = '1' ";
            //+ "'  order by " + ORDERNAME;
            return SelectPRO(strWhere);
        }

        /// <summary>
        /// ��ѯ���е��ֶ�
        /// ������2��3��4��5
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByPro1(string strType)
        {
            string strWhere = PRO_INFOID + "='" + strType + "' AND " + PRO_DATATYPE +
                " in (" + DATATYPE1 + ")  and  " + PRO_PROPERTYSET + " !='" + PROPERTYSET + "' ";
            //order by " + ORDERNAME;
            return SelectPRO(strWhere);
        }

        /// <summary>
        /// ���ѯ
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable Select(string strWhere)
        {
            int iResult = 0;
            string strSql = "select * from " + STRUCTURE_TABLE + " where "
                + strWhere;
            DataSet ds = dataUnit.FillData(strSql, STRUCTURE_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// �����ϵ��ѯ
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectGS(string strWhere)
        {
            int iResult = 0;
            string strSql = "select distinct " + GS_FIELD_INFOIDB + " from " + GS_TABLE_OBJECT + " where "
                + strWhere;
            DataSet ds = dataUnit.FillData(strSql, GS_TABLE_OBJECT, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ��ϵ���ʽ����
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectItem(string strWhere, string strObjectTable)
        {
            int iResult = 0;
            string strSql = "";
            if (strObjectTable != "")
            {
                strSql = "select * from " + TABLETREENAME + " where " + TABLETREEFIELD3 + strWhere +
                    " and " + TABLETREEFIELD5 + " ='" + strObjectTable + "' ";
            }
            else
            {
                strSql = "select * from " + TABLETREENAME + " where " + TABLETREEFIELD3 + strWhere;
            }
            DataSet ds = dataUnit.FillData(strSql, TABLETREENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ��ϵ���ʽ��
        /// </summary>
        /// <param name="strWhere"></param>
        /// <param name="strObjectTable">������</param>
        /// <returns></returns>
        public DataTable SelectCondition(string strWhere, string strObjectTable)
        {
            int iResult = 0;
            string strSql;
            if (strObjectTable != "")
            {
                strSql = "select * from "
                    + TABLENAME + " where " + TABLEFIELD1 + " = " + strWhere + " and "
                    + TABLEFIELD9 + " ='" + strObjectTable + "' ";
            }
            else
            {
                strSql = "select * from " + TABLENAME + " where " + TABLEFIELD1 + " = " + strWhere + "";
            }
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ��ϵ���ʽ��
        /// </summary>
        /// <param name="strWhere"></param>
        /// <param name="strObjectTable">������</param>
        /// <returns></returns>
        public DataTable SelectCondition(int strSerialNo, int strSequenceNo)
        {
            int iResult = 0;
            string strSql;
            strSql = "select * from "
                + TABLENAME + " where " + TABLEFIELD1 + " = " + strSerialNo + " and "
                + TABLEFIELD2 + " ='" + strSequenceNo + "' ";
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ���е��ֶ�
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectPRO(string strWhere)
        {
            int iResult = 0;
            string strSql = "select * from " + PROPERTY_TABLE + " where "
                + strWhere + " order by orderno ";
            DataSet ds = dataUnit.FillData(strSql, PROPERTY_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// �����ϵ���ʽ��
        /// </summary>
        /// <param name="strExpr"></param>
        /// <param name="strItem"></param>
        /// <param name="strchinese"></param>
        /// <param name="strserialName"></param>
        /// <param name="strusertable"></param>
        /// <returns></returns>
        public int InsertRptCond(string strExpr, string strItem, string strchinese, string strserialName, string strusertable)
        {
            string strNO;
            bool bl_table;
            //bl_table = this.CheckValue(TABLENAME, TABLEFIELD3, strserialName);
            //if (!bl_table)
            //{
            //    return -1;
            //}
            strNO = GetserialNo();
            if ((strNO == "") || (strNO == null))
            {
                strNO = "0";
            }
            SqlCommand insertCmd = new SqlCommand();
            insertCmd.CommandText = " SET QUOTED_IDENTIFIER OFF insert into " + TABLENAME
                + " (" + TABLEFIELD1 + "," + TABLEFIELD2 + "," + TABLEFIELD3 +
                "," + TABLEFIELD5 + "," + TABLEFIELD6 + "," +
                TABLEFIELD7 + "," + TABLEFIELD8 + "," + TABLEFIELD9 +
                    ")	values(" + this.TableNo + "," + strNO + "+1," + (char)34 + strserialName + (char)34 +
                 "," + (char)34 + strExpr + (char)34 + "," + (char)34 + strItem + (char)34 +
                 "," + (char)34 + FIELDP7 + (char)34 + "," + (char)34 + strchinese + (char)34 +
                "," + (char)34 + strusertable + (char)34 + ")";
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// �滻��ϵ���ʽ��
        /// </summary>
        /// <param name="strExpr"></param>
        /// <param name="strItem"></param>
        /// <param name="strchinese"></param>
        /// <param name="strserialName"></param>
        /// <param name="strNo"></param>
        /// <param name="strusertable"></param>
        /// <returns></returns>
        public int UpdateRptCond(string strExpr, string strItem, string strchinese, string strserialName, string strNo, string strusertable)
        {
            SqlCommand updateCmd = new SqlCommand();
            updateCmd.CommandText = " SET QUOTED_IDENTIFIER OFF update " + TABLENAME
                + " set " + TABLEFIELD3 + " = " + (char)34 + strserialName + (char)34 + ", "
                + TABLEFIELD5 + " = " + (char)34 + strExpr + (char)34 + ", " + TABLEFIELD6 + " = " + (char)34
                + strItem + (char)34 + ", " + TABLEFIELD8 + " = " + (char)34 + strchinese + (char)34 + ", " + TABLEFIELD9 + " = " + (char)34 + strusertable + (char)34 + "  WHERE  "
                + TABLEFIELD1 + " = " + this.TableNo + " AND " + TABLEFIELD2 + " = " + strNo;
            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// ɾ����ϵ���ʽ��
        /// </summary>
        /// <param name="str"></param>
        /// <param name="str1"></param>
        /// <returns></returns>
        public int DeleteRptCond(string str, string str1)
        {
            SqlCommand deleteCmd = new SqlCommand();
            deleteCmd.CommandText = "delete from " + TABLENAME
                + " where " + TABLEFIELD1 + " = " + str + " and " + TABLEFIELD2 + " = " + str1;
            return dataUnit.ExecSql(deleteCmd);
        }

        /// <summary>
        /// �����ϵ���ʽ����
        /// </summary>
        /// <param name="strserialNo"></param>
        /// <param name="strDescription"></param>
        /// <returns></returns>
        public int InsertCondition(string strObjectTable, string strDescription)
        {
            SqlCommand insertCmd = new SqlCommand();
            string strsql;
            strsql = " SET QUOTED_IDENTIFIER OFF insert into " + TABLETREENAME
                + " (" + TABLETREEFIELD1 + "," + TABLETREEFIELD2 +
                   "," + TABLETREEFIELD3 + "," + TABLETREEFIELD4 +
                   "," + TABLETREEFIELD5 +
                ")	values(" + CondTypeNo() + "+1," + (char)34 + strDescription + (char)34 +
                        "," + this.TableNo + "," + INTCHILD +
                        "," + (char)34 + strObjectTable + (char)34 + ")";

            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// �޸Ĺ�ϵ���ʽ����
        /// </summary>
        /// <param name="strserialNo"></param>
        /// <param name="strDescription"></param>
        /// <returns></returns>
        public int UpdateCondition(string sTag, string sText)
        {
            SqlCommand insertCmd = new SqlCommand();
            string strsql;
            strsql = " update " + TABLETREENAME + " set " + TABLETREEFIELD2 + " = '"
                + sText + "'  where " + TABLETREEFIELD1 + " = " + sTag;
            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// ȡ���������е�������
        /// </summary>
        /// <returns></returns>
        public string CondTypeNo(string strNode)
        {
            int iResult;
            DataTable dt = new DataTable();
            string strSql = "select " + TABLETREEFIELD5 + " from " + TABLETREENAME + " where "
                + TABLETREEFIELD1 + " = " + strNode;
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "";
                }
            }
            return "";
        }

        /// <summary>
        /// ȡ���������е����
        /// </summary>
        /// <returns></returns>
        public string CondTypeNo()
        {
            int iResult;
            DataTable dt = new DataTable();
            string strSql = "select isnull(max(" + TABLETREEFIELD1 + "),100) from " + TABLETREENAME;
            //+ " where " + TABLETREEFIELD3 + " = " + this.TableNo ;
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "100";
                }
            }
            return "100";
        }

        /// <summary>
        /// ȡ��ϵ���ʽ�����е����
        /// </summary>
        /// <returns></returns>
        public string GetserialNo()
        {
            int iResult;
            DataTable dt = new DataTable();
            string strSql = "select max(" + TABLEFIELD2 + ") from " + TABLENAME + " where "
                + TABLEFIELD1 + " = " + this.TableNo;
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    if (dt.Rows[0][0].ToString() != null && dt.Rows[0][0].ToString() != "")
                    {
                        return dt.Rows[0][0].ToString();
                    }
                    else
                    {
                        return "0";
                    }
                }
                else
                {
                    return "0";
                }
            }
            return "0";
        }

        /// <summary>
        /// ɾ����ϵ���ʽ����
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public int DeleteCondition(string str)
        {
            SqlCommand deleteCmd = new SqlCommand();
            string strsql = "";
            strno = str;
            getParentId(str);
            strsql = " delete from " + TABLETREENAME
                + " where " + TABLETREEFIELD1 + " in (" + strno + ") ";
            deleteCmd.CommandText = strsql;

            return dataUnit.ExecSql(deleteCmd);
        }

        /// <summary>
        /// �ݹ�ȡ�����µ��ӱ�
        /// </summary>
        /// <param name="str"></param>
        private void getParentId(string str)
        {
            string strwhere = "";

            DataTable dt1 = SelectItem(" in (" + str + ") ", "");
            if ((dt1 != null) && (dt1.Rows.Count != 0))
            {
                for (int i = 0; i < dt1.Rows.Count; i++)
                {
                    if (strwhere == "")
                    {
                        strwhere = dt1.Rows[i][TABLETREEFIELD1].ToString();
                    }
                    else
                    {
                        strwhere = strwhere + "," + dt1.Rows[i][TABLETREEFIELD1].ToString();
                    }
                }
                strno += "," + strwhere;
                //getParentId(strwhere);
            }
        }

        /// <summary>
        /// ȡ������
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByFun(string strType)
        {
            int iResult = 0;
            string strSql = "select * from " + TABLEFUNNAME + " where "
                + TABLEFUNFIELD3 + " ='" + strType + "' ";
            DataSet ds = dataUnit.FillData(strSql, TABLEFUNNAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ȡ������
        /// </summary>
        /// <returns></returns>
        public DataTable SelectByConst()
        {
            int iResult = 0;
            string strSql = "select * from " + TABLECONSTNAME;
            DataSet ds = dataUnit.FillData(strSql, TABLECONSTNAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ�ֵ��
        /// dictId = '07'
        /// </summary>
        /// <returns></returns>
        public DataTable SelectByGsdictitem()
        {
            int iResult = 0;
            string strSql = "select * from " + TABLE_GSDICTITEM + " where " +
                FIELD_DICTID + " = '" + DICTID + "' ";

            DataSet ds = dataUnit.FillData(strSql, TABLE_GSDICTITEM, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯ���ʽ����
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectByEE01(string str, string strobject, string strLR)
        {
            string strWhere;
            if (str == "")
            {
                if (strobject != "")
                {
                    strWhere = " where " + FIELD_EE0113 + " ='" + strobject + "' and " +
                        FIELD_EE0115 + " IN (" + strLR + ") ";
                    return SelectEE01(strWhere);
                }
                return SelectEE01(" ");
            }
            strWhere = " where " + FIELD_ZA0100 + " ='" + str + "' ";
            return SelectEE01(strWhere);
        }

        /// <summary>
        /// ��ѯ���ʽ��
        /// </summary>
        /// <returns></returns>
        public DataTable SelectEE01(string strwhere)
        {
            int iResult = 0;
            string strSql = " select * from " + TABLE_EE01 + strwhere;
            DataSet ds = dataUnit.FillData(strSql, TABLE_EE01, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// �������SQL���
        /// </summary>
        /// <param name="strwhere"></param>
        /// <returns></returns>
        public DataTable SelectNULL(string strwhere, string strtable)
        {
            int iResult = 0;
            string strSql = strwhere;
            DataSet ds = dataUnit.FillData(strSql, strtable, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ������ʽ��
        /// </summary>
        /// <param name="str_ZA0101"></param>
        /// <param name="str_EE0115"></param>
        /// <param name="str_EE0116"></param>
        /// <param name="str_EE0110"></param>
        /// <param name="str_EE0113"></param>
        /// <param name="str_EE0114"></param>
        /// <returns></returns>
        public int InsertEE01(string str_ZA0101, string str_EE0115, string str_EE0116, string str_EE0110, string str_EE0113, string str_EE0114, string str_EE0121, string str_EE0123, string str_EE0122, string str_EE0120)
        {
            /*
             ZA0100 ����
            EE01ID ���
            *ZA0101 ����
            ZA9999 ��ѯ��
            ZC9995 ��ע
            *EE0115 ���� ��ע1��
            *EE0116 ���ʽ��1+2*3/4��
            *EE0110 �ֶι�ϵ
            EE0112 ���ؽ��(��������ֵ��)
            *EE0113 ������
            *EE0114 SQL���
            EE0121 ���ʽ������
            EE0123 ���ʽ��������
            EE0122 ���ʽ�������ʽ
            EE0120 �Ƿ������ʷ��¼
            */
            SqlCommand insertCmd = new SqlCommand();
            string strsql;
            bool bl_table;
            bl_table = CheckValue(TABLE_EE01, FIELD_ZA0101, str_ZA0101);
            if (!bl_table)
            {
                return -1;
            }
            strsql = " SET QUOTED_IDENTIFIER OFF insert into " + TABLE_EE01
                + " (" + FIELD_ZA0100 + "," + FIELD_EE01ID +
                "," + FIELD_EE0115 + "," + FIELD_EE0116 +
                "," + FIELD_EE0110 + "," + FIELD_EE0112 + "," + FIELD_EE0113 +
                "," + FIELD_EE0114 + "," + FIELD_ZA0101 + ",EE0121,EE0123,EE0122,EE0120" +
                ")	values(" + (char)34 + GetRestrictionExpressValue(TABLE_EE01, FIELD_ZA0100, this.getValues(TABLE_EE01, FIELD_ZA0100)) + (char)34
                + "," + GetExprNo() + "," + (char)34 +
                str_EE0115 + (char)34 + "," + (char)34 + str_EE0116 + (char)34 +
                "," + (char)34 + str_EE0110 + (char)34 + "," + "1" + "," + (char)34 + str_EE0113 + (char)34 +
                "," + (char)34 + str_EE0114 + (char)34 + "," + (char)34 + str_ZA0101 + (char)34 +
                "," + (char)34 + str_EE0121 + (char)34 + "," + (char)34 + str_EE0123 + (char)34 +
                "," + (char)34 + str_EE0122 + (char)34 + "," + str_EE0120 + ")";

            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// ɾ�����ʽ��
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public int DeleteEE01(string str)
        {
            SqlCommand deleteCmd = new SqlCommand();
            string strsql = "";
            strsql = " SET QUOTED_IDENTIFIER OFF  delete from " + TABLE_EE01
                + " where " + FIELD_ZA0101 + " = " + (char)34 + str + (char)34;
            deleteCmd.CommandText = strsql;

            return dataUnit.ExecSql(deleteCmd);
        }

        /// <summary>
        /// �޸ı��ʽ��
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public int UpdateEE01(string str, string str_EE0115, string str_EE0116, string str_EE0110, string str_EE0114, string str_EE0121, string str_EE0123, string str_EE0122, string str_EE0120)
        {
            SqlCommand updateCmd = new SqlCommand();
            string strsql = "";
            strsql = " SET QUOTED_IDENTIFIER OFF update " + TABLE_EE01 +
                " set " + FIELD_EE0115 + " = " + (char)34 + str_EE0115 + (char)34 + ","
                + FIELD_EE0116 + " = " + (char)34 + str_EE0116 + (char)34 + ","
                + FIELD_EE0110 + " = " + (char)34 + str_EE0110 + (char)34 + ","
                + FIELD_EE0114 + " = " + (char)34 + str_EE0114 + (char)34 + ","
                + "EE0121 = " + (char)34 + str_EE0121 + (char)34 + ","
                + "EE0123 = " + (char)34 + str_EE0123 + (char)34 + ","
                + "EE0122 = " + (char)34 + str_EE0122 + (char)34 + ","
                + "EE0120 = '" + str_EE0120
                + "' where " + FIELD_ZA0101 + " = " + (char)34 + str + (char)34;
            updateCmd.CommandText = strsql;

            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// ȡ���ʽ���е����
        /// </summary>
        /// <returns></returns>
        public string GetExprNo()
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select IsNull(max(" + FIELD_EE01ID + "),0)+100 From " + TABLE_EE01 + "  With(TABLOCK,HOLDLOCK)";
            DataSet ds = dataUnit.FillData(tempStr, TABLE_EE01, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "100";
                }
            }
            return "100";
        }

        /// <summary>
        /// �ж�ֵ�ڱ����Ƿ����
        /// </summary>
        /// <param name="strTableName"></param>
        /// <param name="strField"></param>
        /// <param name="strValue"></param>
        /// <returns></returns>
        public bool CheckValue(string strTableName, string strField, string strValue)
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select * From " + strTableName + "  where " + strField + " ='" + strValue + "' ";
            DataSet ds = dataUnit.FillData(tempStr, strTableName, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
            return true;
        }

        /// <summary>
        /// ���ݱ������ֶ���
        /// ��ȡԼ������ֵ
        /// </summary>
        /// <param name="strTalbe"></param>
        /// <param name="strField"></param>
        /// <returns></returns>
        public string getValues(string strTalbe, string strField)
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select " + PRO_RESTRICTIONEXPLAN + " From " + PROPERTY_TABLE
                + " where  " + PRO_INFOID + " ='" + strTalbe + "' and "
                + PRO_INFOFIELD + " ='" + strField + "' and " + PRO_RESTRICTION + " =" + "4"
                + " order by OrderNo";

            DataSet ds = dataUnit.FillData(tempStr, PROPERTY_TABLE, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "";
                }
            }
            return "";
        }

        /// <summary>
        /// ����Լ�����ʽ��ȡԼ���ֶε�ֵ 
        /// Լ�����ʽ�����¼��������
        ///   1.substring(�ֶΣ�startIndex,Length)
        ///   2.right(�ֶΣ�Length)
        ///   3.left(�ֶΣ�Length)
        ///   4.Gid(length,StartValue)
        ///   5.Lid(Length,StartValue)
        /// </summary>
        /// <param name="InfoId">������</param>
        /// <param name="InfoField">����</param>
        /// <param name="RestrictionExpress">Լ�����ʽ</param>
        /// <returns>Լ�����Ե�ֵ</returns>
        public string GetRestrictionExpressValue(string InfoId, string InfoField, string RestrictionExpress)
        {
            StringCollection RestrictionCol;
            string tempResItem; //Լ�����ʽ��һ��
            string tempResValue = ""; //Լ���������յ�ֵ
            int i;
            try
            {
                //��ȡԼ������ĸ��������
                RestrictionCol = this.GetRestrictionItems(RestrictionExpress);
                //����ÿһ��			
                for (i = 0; i <= RestrictionCol.Count - 1; i++)
                {
                    tempResItem = RestrictionCol[i].ToUpper();
                    tempResValue = DealGLId(tempResItem, InfoId, InfoField, "0", "");
                }//for
                return tempResValue;
            }//try
            catch (Exception e)
            {
                throw new Exception("GetRestrictionExpressValue: " + e.Message);
            }
        }//DealRestrictionExpress

        /// <summary>
        /// ��Լ�����ʽ��ֳ�ÿһ��ŵ�������
        /// </summary>
        private StringCollection GetRestrictionItems(string RestrictionExpress)
        {
            string tempRestrictionExplain = "";
            string FirstWord = "";
            StringCollection tempResExpressCol = new StringCollection();
            int ResLength = 0;
            try
            {
                tempRestrictionExplain = RestrictionExpress; //ȡԼ�����ʽ 
                ResLength = tempRestrictionExplain.Length;
                while (ResLength > 0)
                {
                    ResLength = PopFirstWord(ref tempRestrictionExplain, out FirstWord, "+");
                    tempResExpressCol.Add(FirstWord);
                }
                return tempResExpressCol;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        /// <summary>
        /// ��ȡ�ָ��ĵ�һ���ַ���
        /// </summary>
        /// <param name="SourceString"></param>
        /// <param name="FirstWord"></param>
        /// <param name="SepChar"></param>
        /// <returns></returns>
        private int PopFirstWord(ref string SourceString, out string FirstWord, string SepChar)
        {
            string OldWord;
            int Length;
            int CharLocation;
            OldWord = SourceString;
            CharLocation = OldWord.IndexOf(SepChar);
            Length = OldWord.Length;
            if (CharLocation < 0)
            {
                FirstWord = OldWord;
                SourceString = "";
                return SourceString.Length;
            }
            else
            {
                FirstWord = OldWord.Substring(0, CharLocation);
                SourceString = OldWord.Substring(CharLocation + 1);
                return SourceString.Length;
            }
        }

        /// <summary>
        /// ����ȫ�ֻ�ֲ���ID
        /// </summary>
        /// <param name="RestrictionItem"></param>
        /// <param name="InfoId"></param>
        /// <param name="InfoField"></param>
        /// <param name="Type"></param>
        /// <param name="GroupValue"></param>
        /// <returns></returns>
        private string DealGLId(string RestrictionItem, string InfoId, string InfoField, string Type, string GroupValue)
        {
            string tempFirstWord;
            int tempOpera1 = 0, tempOpera2 = 0;
            string tempCurId;
            try
            {
                PopFirstWord(ref RestrictionItem, out tempFirstWord, "(");
                //��һ��������
                PopFirstWord(ref RestrictionItem, out tempFirstWord, ",");
                tempOpera1 = Convert.ToInt32(tempFirstWord);
                //�ڶ���������
                //PopFirstWord(ref RestrictionItem,out tempFirstWord,")");
                tempOpera2 = Convert.ToInt32(tempFirstWord);
                if (GetResGLID(InfoId, InfoField) != "1")
                {
                    tempCurId = GetResGLID(InfoId, InfoField);
                }
                else
                {
                    tempCurId = GetResEE01(InfoId, InfoField);
                }
                return add0(tempCurId, tempOpera2);
            } //try
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        } //DealStringOperator

        /// <summary>
        /// ��ȡgs_id�е�ID��
        /// </summary>
        /// <param name="strInfoId"></param>
        /// <param name="strInfoField"></param>
        /// <returns></returns>
        private string GetResGLID(string strInfoId, string strInfoField)
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select isnull(Value,0)+1 From gs_id  where infoid ='" + strInfoId + "' and infofield = '" + strInfoField + "' ";
            DataSet ds = dataUnit.FillData(tempStr, TABLE_EE01, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "1";
                }
            }
            return "1";
        }

        /// <summary>
        /// ��ȡEE01�е�ID��
        /// </summary>
        /// <param name="strInfoId"></param>
        /// <param name="strInfoField"></param>
        /// <returns></returns>
        private string GetResEE01(string strInfoId, string strInfoField)
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select isnull(max(" + strInfoField + "),0) + 1 From " + strInfoId;
            DataSet ds = dataUnit.FillData(tempStr, strInfoId, out iResult);
            if (ds != null)
            {
                dt = ds.Tables[0];
                if (dt.Rows.Count > 0)
                {
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "1";
                }
            }
            return "1";
        }

        /// <summary>
        /// ����λ������
        /// </summary>
        /// <param name="str"></param>
        /// <param name="int_temp"></param>
        /// <returns></returns>
        public string add0(string str, int int_temp)
        {
            int inttmp;
            int inttmp1 = 0;
            string strtmp = str;
            inttmp = str.Length;
            if (inttmp < int_temp)
            {
                inttmp1 = int_temp - inttmp;
            }
            for (int i = 0; i < inttmp1; i++)
            {
                strtmp = "0" + strtmp;
            }
            return strtmp;
        }

        /// <summary>
        /// ȡ�ֵ����
        /// </summary>
        /// <param name="str_TableField"></param>
        /// <returns></returns>
        public string GetDictId(string str_TableField)
        {
            int iResult = 0;
            string strSql = "select dictid from " + PROPERTY_TABLE +
                " where " + PRO_INFOFIELD + " = '" + str_TableField + "' order by orderno ";
            DataSet ds = dataUnit.FillData(strSql, PROPERTY_TABLE, out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            return "";
        }

        /// <summary>
        /// ȡ�ֵ����
        /// </summary>
        /// <param name="str_TableField"></param>
        /// <returns></returns>
        public string GetDictId(string str_TableField, string str_Table)
        {
            int iResult = 0;
            string strSql = "select dictid from " + PROPERTY_TABLE +
                " where infoid = '" + str_Table + "' and " + PRO_INFOFIELD + " = '" + str_TableField + "' order by orderno ";
            DataSet ds = dataUnit.FillData(strSql, PROPERTY_TABLE, out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            return "";
        }

        /// <summary>
        /// ��ȡ�ֵ�
        /// </summary>
        /// <param name="str_DictId"></param>
        /// <returns></returns>
        public DataTable GetDictNo(string str_DictId)
        {
            int iResult = 0;
            string strSql = "select * from gs_dictitem where dictid = '" + str_DictId + "' ";
            DataSet ds = dataUnit.FillData(strSql, "gs_dictitem", out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                return ds.Tables[0];
            }
            return null;
        }

        public DataTable GetTableNo(string str_TableDictNo)
        {
            int iResult = 0;
            //string strSql = "select * from " + str_TableDictNo + " where ZA9996 is null ";
            string strSql = "select * from " + str_TableDictNo + "  ORDER BY LEN(ZA0100), ZA0100";
            DataSet ds = dataUnit.FillData(strSql, str_TableDictNo, out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// ��ѯsql����滻����
        /// �����ֿ�ʼʱ������ֽ���ʱ��
        /// </summary>
        /// <param name="strSQL"></param>
        /// <returns></returns>
        public string QueryWhereSql(string strSQL)
        {
            try
            {
                SqlCommand objcommand = new SqlCommand();
                objcommand.Connection = dataUnit.Conn;

                objcommand.Connection.Open();
                objcommand.CommandText = "flxp_rpt_rptdealQuery";
                objcommand.CommandType = CommandType.StoredProcedure;  // use stored proc for perf
                //��������
                SqlParameter strWhereSQL = new SqlParameter("@strwhereSQL", SqlDbType.VarChar, 1000);
                strWhereSQL.Direction = ParameterDirection.InputOutput;
                strWhereSQL.Value = strSQL;
                objcommand.Parameters.Add(strWhereSQL);
                objcommand.ExecuteNonQuery();
                objcommand.Connection.Close();

                string outSQL = strWhereSQL.Value.ToString();
                return outSQL;
            }
            catch
            {
                return "";
            }
        }

        //����gs_id
        public int insertgsId(string strTable, string strField, string strCodeNo)
        {
            string strUpdateSql;
            SqlCommand updateCmd = new SqlCommand();
            strUpdateSql = " update gs_id set value = '" + strCodeNo +
                "' where InfoId = '" + strTable + "' and  InfoField = '" + strField + "' ";

            updateCmd.CommandText = strUpdateSql;
            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// ִ��Sql���
        /// </summary>
        /// <param name="strSql"></param>
        /// <returns></returns>
        public int gsExecSql(string strSql)
        {
            SqlCommand updateCmd = new SqlCommand();
            //mod by wx 20060417 (flxzh���ϲ�Ʒ20061129)
            updateCmd.CommandTimeout = 3600;
            //end wx
            updateCmd.CommandText = strSql;
            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// ִ�в�ѯSql���
        /// </summary>
        /// <param name="str_DictId"></param>
        /// <returns></returns>
        public DataTable gsQuerySql(string strSql, string strTable)
        {
            int iResult = 0;
            DataSet ds = dataUnit.FillData(strSql, strTable, out iResult);
            if (ds != null && ds.Tables[0].Rows.Count != 0)//uuuu
            //&& ds.Tables[0].Rows.Count != 0 //û�м�¼Ҳ����һ����DataTable������������ by ������ 2004-07-22 AM
            {
                return ds.Tables[0];
            }
            return null;
        }

        public DataTable gsQuerySql(string strSql, string strTable, string abc)
        {
            int iResult = 0;
            DataSet ds = dataUnit.FillData(strSql, strTable, out iResult);
            //if(ds != null && ds.Tables[0].Rows.Count != 0)//uuuu
            if (ds != null)//&& ds.Tables[0].Rows.Count != 0 //û�м�¼Ҳ����һ����DataTable������������ by ������ 2004-07-22 AM
            {
                return ds.Tables[0];
            }
            return null;
        }

        #region ���б���

        #endregion
    }
}
