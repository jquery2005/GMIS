using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

// modi Zhangwd 2003-05-20
//
// -------------------------------------------
// Replace
//		propertyset='0'
// To
//		propertyset in('0','2')
// -------------------------------------------
//
// endm
namespace DMServer.DataMolde
{
    /// <summary>
    /// GetSql 的摘要说明。
    /// 处理SQL语句
    /// </summary>
    public class GetSql
    {
        private DM dataUnit;

        #region 全局常量

        private const string PRO_TABLE = "GS_PROPERTY";

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

        private const string STR_TABLE = "GS_STRUCTURE";

        private const string STR_INFOID = "InfoId";
        private const string STR_TYPE = "Type";
        private const string STR_DESCRIPTION = "Description";
        private const string STR_SHORTDESC = "ShortDesc";
        private const string STR_PARENTID = "ParentId";
        private const string STR_PARENTID1 = "ParentId1";

        private const string STRTYPE = "0,1";
        private const string ORDERNAME = "OrderNo";
        private const string DATATYPE = "'9','10','11','14','15'";
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
        表达式表EE01
        ZA0100 编码
        EE01ID 序号
        ZA9999 查询码
        ZC9995 备注
        EE0115 类型 （注1）
        EE0116 表达式（1+2*3/4）
        EE0110 字段关系
        （AA01.AA0101:年龄:0~AA01.AA0102:年限::2~AA01.AA0101:年龄:0）
        EE0112 返回结果(类型是数值型)
        EE0113 对象名
        EE0114 SQL语句
        */

        #endregion

        private string tableno;
        private string strno;

        public GetSql(string[] s)
        {
            dataUnit = new DM(s);
            tableno = null;
            strno = null;
        }

        /// <summary>
        /// 获取serialNo的值
        /// </summary>
        public string TableNo
        {
            get { return tableno; }
            set { tableno = value; }
        }

        /// <summary>
        /// 查询对象关系表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectGSType(string str)
        {
            string strWhere = GS_FIELD_INFOIDA + " = '" + str + "' ";
            return SelectGS(strWhere);
        }

        /// <summary>
        /// 查询所用的表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectByType(string str)
        {
            string strWhere = STR_INFOID + " in (" + str + ") and " + STR_TYPE + " in (" + STRTYPE + ") ";
            return Select(strWhere);
        }

        /// <summary>
        /// 查询父表下的所用表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectPARType(string str)
        {
            //???zwd
            string strWhere = "(" + STR_PARENTID1 + " in (" + str + ") or " + STR_INFOID + " in (" + str + "))"
                + " and type in('0','1','8') and state='1'";
            return Select(strWhere);
        }

        //???zwd
        /// <summary>
        /// 查询父表及其关联表下的所用表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public DataTable SelectPARType2(string str)
        {
            string str_InfoIdB = "";
            DataTable dt = SelectGSType(str);
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str_InfoIdB += U_Zwd.U_Pub_Zwd.GetFirstString(dt.Rows[i][0].ToString(), ",") + ",";
                }
            }
            str_InfoIdB += str;
            str_InfoIdB = "'" + str_InfoIdB.Replace(",", "','") + "'";
            return this.SelectPARType(str_InfoIdB);
        }

        //???zwd
        /// <summary>
        /// 查询主对象
        /// </summary>
        /// <returns></returns>
        public DataTable SelectByType1(string strcmbObject)
        {
            string strWhere;
            if (strcmbObject != "")
            {
                strWhere = STR_INFOID + " = '" + strcmbObject + "' ";
            }
            else
            {
                strWhere = STR_TYPE + " in (" + STRTYPE + ")  AND  " + STR_INFOID + " LIKE '%" + INFOFIELD + "' ";
            }

            strWhere = "(" + strWhere + ") and type in('0','1') and state='1'";
            return Select(strWhere);
        }

        /// <summary>
        /// 查询表中的字段
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByPro(string strType)
        {
            string strWhere = PRO_INFOID + "='" + strType + "' AND " + PRO_DATATYPE +
                //" not in (" + DATATYPE + ")  and  " + PRO_INFOFIELD +" not like ('" + INFOFIELD + "')  order by " + ORDERNAME;
                " not in (" + DATATYPE + ")  and  " + PRO_PROPERTYSET + " !='" + PROPERTYSET + "' ";
            //+ "'  order by " + ORDERNAME;
            return SelectPRO(strWhere);
        }

        /// <summary>
        /// 查询表中的字段
        /// 类型是2，3，4，5
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByPro1(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPRO(strWhere);
        }

        public DataTable SelectByPro1_1(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPRO_1(strWhere);
        }

        //add8.19
        public DataTable SelectByPro2_1(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPR2_1(strWhere);
        }

        //???zwd
        /// <summary>
        /// 查询表中的字段
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectByPro8(string SequenceId)
        {
            int iResult = 0;
            string strSql = "select itemname,infoid,infofields,datatype,'*'"
                + "+Direction+Express+ExtreMum+ExtreStyle+UseFun+DataFormat"
                + " from r903 where id=@SequenceId and itemname<>'序号' order by itemid";
            strSql = strSql.Replace("@SequenceId", SequenceId);
            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        //???zwd
        /// <summary>
        /// 查询表中的字段
        /// 类型是2，3，4，5
        /// </summary>
        /// <param name="strType"></param>
        /// <returns></returns>
        public DataTable SelectByPro9(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPRO9(strWhere);
        }

        public DataTable SelectByPro9_1(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPRO9_1(strWhere);
        }

        //add8.19
        public DataTable SelectByPro19_1(string strType)
        {
            //???zwd
            string strWhere = "(T1." + PRO_INFOID + "='" + strType + "') and t1.propertyset in('0','2') and t1.state='1'";
            //order by " + ORDERNAME;
            return SelectPRO19_1(strWhere);
        }

        /// <summary>
        /// 表查询
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable Select(string strWhere)
        {
            int iResult = 0;
            string strSql = "select * from " + STR_TABLE + " where "
                + strWhere;
            DataSet ds = dataUnit.FillData(strSql, STR_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 对象关系查询
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
        /// hjh 2005.03.24 获取表类型，唯一集处理
        /// </summary>
        /// <param name="strtable"></param>
        /// <returns></returns>
        public string SelectTableType(string strtable)
        {
            int iResult = 0;
            string strSql = "select type from gs_structure where infoid = '" + strtable + "' ";
            DataSet ds = dataUnit.FillData(strSql, GS_TABLE_OBJECT, out iResult);
            if (ds != null)
            {
                return ds.Tables[0].Rows[0][0].ToString();
            }
            else
            {
                return "0";
            }
        }

        /// <summary>
        /// 查询关系表达式树表
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectItem(string strWhere)
        {
            int iResult = 0;
            string strSql = "select * from " + TABLETREENAME + " where " + TABLETREEFIELD3 + strWhere;
            DataSet ds = dataUnit.FillData(strSql, TABLETREENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 查询关系表达式表
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectCondition(string strWhere)
        {
            int iResult = 0;
            string strSql = "select * from " + TABLENAME + " where " + TABLEFIELD1 + " = " + strWhere + "";
            DataSet ds = dataUnit.FillData(strSql, TABLENAME, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 查询表中的字段
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectPRO(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId+'.'+InfoField,InfoId+'.'+InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo,T1.DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in(0,2)";
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
            //    + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //    + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype not in(9,10,11,14,15,17)";
            // endm
            //修改部分0812
            string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
                + ",case when T1.DataType=2 then 2 when T1.DataType=3 then 3 when T1.DataType=4 then 4  when T1.DataType=5 then 5 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype not in(9,10,11,15,17,21)";//去掉备注型  //hjh 2005.03.25 去掉格式备注类型

            // add 2002-12-13
            strSql = strSql + " ORDER BY T1.OrderNo";
            // enda
            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        public DataTable SelectPRO_1(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId+'.'+InfoField,InfoId+'.'+InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo,T1.DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in(0,2)";
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
            //    + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //    + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype in(1,2,12)";
            //修改部分0812
            string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
                + ",case when T1.DataType=2 then 2 when T1.DataType=3 then 3 when T1.DataType=4 then 4  when T1.DataType=5 then 5 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype in(1,2,12)";
            // endm

            // add 2002-12-13
            strSql = strSql + " ORDER BY T1.OrderNo";
            // enda
            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        //add8.19
        public DataTable SelectPR2_1(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId+'.'+InfoField,InfoId+'.'+InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo,T1.DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in(0,2)";
            //string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
            //    + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //    + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype in(1,2,12)";
            //修改部分0812
            string strSql = "select T1.Description,T1.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId)+'.'+T1.InfoField,T1.OrderNo"
                + ",case when T1.DataType=2 then 2 when T1.DataType=3 then 3 when T1.DataType=4 then 4  when T1.DataType=5 then 5 else 0 end as DataType,T1.DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in('0','2') and t1.state='1' and t1.datatype in(1,2,12,0)";
            // endm

            // add 2002-12-13
            strSql = strSql + " ORDER BY T1.OrderNo";
            // enda
            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        //???zwd
        /// <summary>
        /// 查询表中的字段
        /// </summary>
        /// <param name="strWhere"></param>
        /// <returns></returns>
        public DataTable SelectPRO9(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId,InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField,T1.DataType AS DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  ORDER BY T1.OrderNo";
            string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField"
                + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  and t1.datatype not in(9,10,11,15,17) ORDER BY T1.OrderNo";//去掉备注型
            // endm

            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        public DataTable SelectPRO9_1(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId,InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField,T1.DataType AS DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  ORDER BY T1.OrderNo";
            string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField"
                + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  and t1.datatype in(1,2,12) ORDER BY T1.OrderNo";
            // endm

            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        //add8.19
        public DataTable SelectPRO19_1(string strWhere)
        {
            int iResult = 0;
            //???zwd
            //string strSql = "select Description,InfoId,InfoField,DataType,DictId from " + PRO_TABLE + " where "
            //    + strWhere + " ORDER BY OrderNo";

            // modi 2002-12-21
            //string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField,T1.DataType AS DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
            //	+ strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  ORDER BY T1.OrderNo";
            string strSql = "select T1.Description AS Description,T2.InfoId+':'+ISNULL(T2.ParentId1,T2.InfoId) AS InfoId,T1.InfoField AS InfoField"
                + ",case when T1.DataType=2 then 2 when t1.datatype in(3,4,5) then 3 else 0 end as DataType,T1.DictId AS DictId from " + PRO_TABLE + " T1,Gs_Structure T2 where "
                + strWhere + " AND T1.InfoId=T2.InfoId and t1.propertyset in ('0','2')  and t1.datatype in(1,2,12,0) ORDER BY T1.OrderNo";
            // endm

            DataSet ds = dataUnit.FillData(strSql, PRO_TABLE, out iResult);
            if (ds != null)
            {
                return ds.Tables[0];
            }
            return null;
        }

        /// <summary>
        /// 保存关系表达式表
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
            bl_table = this.CheckValue(TABLENAME, TABLEFIELD3, strserialName);
            if (!bl_table)
                return -1;
            strNO = GetserialNo();
            if ((strNO == "") || (strNO == null))
                strNO = "0";
            SqlCommand insertCmd = new SqlCommand();
            insertCmd.CommandText = "insert into " + TABLENAME
                + " (" + TABLEFIELD1 + "," + TABLEFIELD2 + "," + TABLEFIELD3 +
                "," + TABLEFIELD5 + "," + TABLEFIELD6 + "," +
                TABLEFIELD7 + "," + TABLEFIELD8 + "," + TABLEFIELD9 +
                    ")	values(" + this.TableNo + "," + strNO + "+1,'" + strserialName +
                 "','" + strExpr + "','" + strItem + "','" + FIELDP7 + "','" + strchinese + "','" + strusertable + "')";
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 替换关系表达式表
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
            updateCmd.CommandText = "update " + TABLENAME
                + " set " + TABLEFIELD3 + " = '" + strserialName + "', "
                + TABLEFIELD5 + " = '" + strExpr + "', " + TABLEFIELD6 + " = '"
                + strItem + "', " + TABLEFIELD8 + " = '" + strchinese + "', " + TABLEFIELD9 + " = '" + strusertable + "'  WHERE  "
                + TABLEFIELD1 + " = " + this.TableNo + " AND " + TABLEFIELD2 + " = " + strNo;
            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// 删除关系表达式表
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
        /// 保存关系表达式树表
        /// </summary>
        /// <param name="strserialNo"></param>
        /// <param name="strDescription"></param>
        /// <returns></returns>
        public int InsertCondition(string strserialNo, string strDescription)
        {
            SqlCommand insertCmd = new SqlCommand();
            string strsql;
            strsql = "insert into " + TABLETREENAME
                + " (" + TABLETREEFIELD1 + "," + TABLETREEFIELD2 +
                   "," + TABLETREEFIELD3 + "," + TABLETREEFIELD4 +
                ")	values(" + strserialNo + ",'" + strDescription +
                        "'," + this.TableNo + "," + INTCHILD + ")";

            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 取关系表达式树表中的序号
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
                    return dt.Rows[0][0].ToString();
                }
                else
                {
                    return "0";
                }
            }
            return "0";
        }

        /// <summary>
        /// 删除关系表达式树表
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
        /// 递归取父表下的子表
        /// </summary>
        /// <param name="str"></param>
        private void getParentId(string str)
        {
            string strwhere = "";

            DataTable dt1 = SelectItem(" in (" + str + ") ");
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
        /// 取函数表
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
        /// 取常量表
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
        /// 查询字典表
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
        /// 查询表达式条件
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
        /// 查询表达式表
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
        /// 处理传入的SQL语句
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
        /// 保存表达式表
        /// </summary>
        /// <param name="str_ZA0101"></param>
        /// <param name="str_EE0115"></param>
        /// <param name="str_EE0116"></param>
        /// <param name="str_EE0110"></param>
        /// <param name="str_EE0113"></param>
        /// <param name="str_EE0114"></param>
        /// <returns></returns>
        public int InsertEE01(string str_ZA0101, string str_EE0115, string str_EE0116, string str_EE0110, string str_EE0113, string str_EE0114)
        {
            /*
             ZA0100 编码
            EE01ID 序号
            *ZA0101 名称
            ZA9999 查询码
            ZC9995 备注
            *EE0115 类型 （注1）
            *EE0116 表达式（1+2*3/4）
            *EE0110 字段关系
            EE0112 返回结果(类型是数值型)
            *EE0113 对象名
            *EE0114 SQL语句
            */
            SqlCommand insertCmd = new SqlCommand();
            string strsql;
            bool bl_table;
            bl_table = CheckValue(TABLE_EE01, FIELD_ZA0101, str_ZA0101);
            if (!bl_table)
            {
                return -1;
            }
            strsql = "insert into " + TABLE_EE01
                + " (" + FIELD_ZA0100 + "," + FIELD_EE01ID +
                "," + FIELD_EE0115 + "," + FIELD_EE0116 +
                "," + FIELD_EE0110 + "," + FIELD_EE0112 + "," + FIELD_EE0113 +
                "," + FIELD_EE0114 + "," + FIELD_ZA0101 +
                ")	values('" + GetRestrictionExpressValue(TABLE_EE01, FIELD_ZA0100, this.getValues(TABLE_EE01, FIELD_ZA0100))
                + "'," + GetExprNo() + ",'" +
                str_EE0115 + "','" + str_EE0116 +
                "','" + str_EE0110 + "'," + "1" + ",'" + str_EE0113 +
                "','" + str_EE0114 + "','" + str_ZA0101 + "')";

            insertCmd.CommandText = strsql;
            return dataUnit.ExecSql(insertCmd);
        }

        /// <summary>
        /// 删除表达式表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public int DeleteEE01(string str)
        {
            SqlCommand deleteCmd = new SqlCommand();
            string strsql = "";
            strsql = " delete from " + TABLE_EE01
                + " where " + FIELD_ZA0100 + " = '" + str + "' ";
            deleteCmd.CommandText = strsql;

            return dataUnit.ExecSql(deleteCmd);
        }

        /// <summary>
        /// 修改表达式表
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public int UpdateEE01(string str, string str_EE0115, string str_EE0116, string str_EE0110, string str_EE0114)
        {
            SqlCommand updateCmd = new SqlCommand();
            string strsql = "";
            strsql = " update " + TABLE_EE01 +
                " set " + FIELD_EE0115 + " = '" + str_EE0115 + "',"
                + FIELD_EE0116 + " = '" + str_EE0116 + "',"
                + FIELD_EE0110 + " = '" + str_EE0110 + "',"
                + FIELD_EE0114 + " = '" + str_EE0114 + "' "
                + " where " + FIELD_ZA0100 + " = '" + str + "' ";
            updateCmd.CommandText = strsql;

            return dataUnit.ExecSql(updateCmd);
        }

        /// <summary>
        /// 取表达式表中的序号
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
        /// 判断值在表中是否存在
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
        /// 根据表名和字段名
        /// 获取约束属性值
        /// </summary>
        /// <param name="strTalbe"></param>
        /// <param name="strField"></param>
        /// <returns></returns>
        public string getValues(string strTalbe, string strField)
        {
            int iResult;
            DataTable dt = new DataTable();
            string tempStr = "Select " + PRO_RESTRICTIONEXPLAN + " From " + PRO_TABLE
                + " where  " + PRO_INFOID + " ='" + strTalbe + "' and "
                + PRO_INFOFIELD + " ='" + strField + "' and " + PRO_RESTRICTION + " =" + "4";

            DataSet ds = dataUnit.FillData(tempStr, PRO_TABLE, out iResult);
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
        /// 根据约束表达式获取约束字段的值 
        /// 约束表达式有以下几种情况：
        ///   1.substring(字段，startIndex,Length)
        ///   2.right(字段，Length)
        ///   3.left(字段，Length)
        ///   4.Gid(length,StartValue)
        ///   5.Lid(Length,StartValue)
        /// </summary>
        /// <param name="InfoId">对象名</param>
        /// <param name="InfoField">属性</param>
        /// <param name="RestrictionExpress">约束表达式</param>
        /// <returns>约束属性的值</returns>
        private string GetRestrictionExpressValue(string InfoId, string InfoField, string RestrictionExpress)
        {
            StringCollection RestrictionCol;
            string tempResItem; //约束表达式的一项
            string tempResValue = ""; //约束属性最终的值
            int i;
            try
            {
                //获取约束规则的各项到集合中
                RestrictionCol = this.GetRestrictionItems(RestrictionExpress);
                //处理每一项			
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
        /// 将约束表达式拆分出每一项放到集合中
        /// </summary>
        private StringCollection GetRestrictionItems(string RestrictionExpress)
        {
            string tempRestrictionExplain = "";
            string FirstWord = "";
            StringCollection tempResExpressCol = new StringCollection();
            int ResLength = 0;
            try
            {
                tempRestrictionExplain = RestrictionExpress; //取约束表达式 
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
        /// 获取分隔的第一个字符串
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
        /// 处理全局或局部的ID
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
                //第一个操作数
                PopFirstWord(ref RestrictionItem, out tempFirstWord, ",");
                tempOpera1 = Convert.ToInt32(tempFirstWord);
                //第二个操作数
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
        /// 获取gs_id中的ID号
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
        /// 获取EE01中的ID号
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
        /// 根据位数加零
        /// </summary>
        /// <param name="str"></param>
        /// <param name="int_temp"></param>
        /// <returns></returns>
        private string add0(string str, int int_temp)
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
    }
}
