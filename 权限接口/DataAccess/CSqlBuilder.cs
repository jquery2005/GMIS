using System;
using System.Collections.Specialized;
using System.Collections;

namespace GMIS.CommonRightDataAccess
{
    /// <summary>
    /// CSqlBuilder ��ժҪ˵����
    /// </summary>
    public class CSqlBuilder
    {
        public CSqlBuilder()
        {
            //
            // TODO: �ڴ˴���ӹ��캯���߼�
            //
        }

        #region ��ͼ����ദ��

        /// <summary>
        /// ��ȡ������ӵ�ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <returns></returns>
        public string GetMainSetAddID(string InfoId)
        {
            string tempStr;

            tempStr = "Select IsNull(max(" + InfoId + "ID),0)+100 From " + InfoId + "  With(TABLOCK,HOLDLOCK)";
            return tempStr;
        }

        /// <summary>
        /// ��ȡ���������ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <returns></returns>
        public string GetMainSetInsertID(string InfoId, long BeforeID)
        {
            string tempStr;
            string tempIDName;

            tempIDName = InfoId + "ID";
            tempStr = "Select IsNull(max(" + tempIDName + "),0)+5 From " + InfoId + "  With(TABLOCK,HOLDLOCK)" + " where " + tempIDName + "<" + BeforeID;
            return tempStr;
        }

        /// <summary>
        /// ��ȡ�Ӽ���ӵ�ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="ForeignKeyList"></param>
        /// <returns></returns>
        public string GetChildSetAddID(string InfoId, SortedList ForeignKeyList)
        {
            string tempStr;
            string WhereSql;

            WhereSql = GetWhereSql(ForeignKeyList);
            tempStr = "Select IsNull(max(" + InfoId + "ID),0)+100 From " + InfoId + "  With(TABLOCK,HOLDLOCK) " + WhereSql;
            return tempStr;
        }

        /// <summary>
        /// ��ȡ��ӵ�ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="ForeignKeyList"></param>
        /// <returns></returns>
        public string GetAddID(string InfoId, SortedList ForeignKeyList)
        {
            string tempStr;
            string WhereSql;

            if (ForeignKeyList == null)  //������
            {
                WhereSql = "";
            }
            else  //�Ӷ���
            {
                WhereSql = GetWhereSql(ForeignKeyList);
            }

            tempStr = "Select IsNull(max(" + InfoId + "ID),0)+100 From " + InfoId + WhereSql;
            return tempStr;
        }

        /// <summary>
        /// ��ȡ�Ӽ������ID
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="ForeignKeyList"></param>
        /// <param name="BeforeID"></param>
        /// <returns></returns>
        public string GetChildSetInsertID(string InfoId, SortedList ForeignKeyList, long BeforeID)
        {
            string tempStr;
            string WhereSql;
            string tempIDName;

            tempIDName = InfoId + "ID";

            WhereSql = GetWhereSql(ForeignKeyList);
            tempStr = "Select IsNull(max(" + tempIDName + "),0)+5 From " + InfoId + "  With(TABLOCK,HOLDLOCK) " + WhereSql + " and  " + tempIDName + "<" + BeforeID;
            return tempStr;
        }

        /// <summary>
        /// ��ȡָ�������ļ�¼�����
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetFilterSql(string InfoId, SortedList LocateList, SortedList OrderList)
        {
            string tempSql;
            string WhereSql;
            string OrderBySql;

            WhereSql = GetWhereSql(LocateList); //ɸѡ����
            OrderBySql = GetOrderBySql(OrderList); //��������

            tempSql = this.GetFilterSql(InfoId, WhereSql, OrderBySql);

            return tempSql;
        }

        /// <summary>
        ///  ��ȡָ�������ļ�¼�����
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetFilterSql(string InfoId, SortedList LocateList)
        {
            return GetFilterSql(InfoId, LocateList, null);
        }

        /// <summary>
        /// ��ȡָ�������ļ�¼�����
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetSpecialDictSql(SortedList LocateList)
        {
            string tempSql;
            string WhereSql;

            WhereSql = GetWhereSql(LocateList); //ɸѡ����
            tempSql = "select *,dictvalue + '.' + description as NewDescription  from gs_dictitem " + WhereSql;

            return tempSql;
        }

        /// <summary>
        /// ��ȡָ�������ļ�¼�����
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="Filter"></param>
        /// <returns></returns>
        public string GetSpecialDictSql(string InfoId, string Filter)
        {
            string tempSql;

            tempSql = "select *,dictvalue + '.' + description as NewDescription  from " + InfoId + " " + Filter;

            return tempSql;
        }

        /// <summary>
        ///  ��ȡָ�������ļ�¼�����
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="WhereSql"></param>
        /// <param name="OrderBySql"></param>
        /// <returns></returns>
        public string GetFilterSql(string InfoId, string WhereSql, string OrderBySql)
        {
            string tempSql;

            tempSql = "select *  from " + InfoId + WhereSql + OrderBySql;

            //Ӧ�ڶ����ϵ��������gs_property�Ĺ����ֶ�ΪOrderNo
            if (InfoId.ToUpper() == "GS_PROPERTY")
            {
                if (OrderBySql == "")
                {
                    tempSql = tempSql + " order by OrderNo";
                }
                else
                {
                    tempSql = tempSql + ",OrderNo";
                }
            }
            return tempSql;
        }

        public string GetFilterSql(string InfoId, string WhereSql)
        {
            string tempSql;

            tempSql = "select *  from " + InfoId + WhereSql;
            return tempSql;
        }

        /// <summary>
        /// ��ȡɾ����Sql��� 
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetDeleteSql(string InfoId, SortedList LocateList)
        {
            string tempSql;
            string WhereSql;

            WhereSql = GetWhereSql(LocateList);
            tempSql = "delete from " + InfoId + WhereSql;
            return tempSql;
        }

        /// <summary>
        /// ��ȡɾ����Sql��� 
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="LocateList"></param>
        /// <returns></returns>
        public string GetDeleteSql(string InfoId, string WhereSql)
        {
            string tempSql;
            tempSql = "delete from " + InfoId + WhereSql;
            return tempSql;
        }

        /// <summary>
        /// ��ȡ��λ��Sql���
        /// </summary>
        /// <returns></returns>
        public string GetWhereSql(SortedList LocateList)
        {
            string tempWhereSql;

            tempWhereSql = "";

            try
            {
                if (LocateList == null)
                {
                    tempWhereSql = "";
                }
                else  //!=null
                {
                    if (LocateList.Count <= 0)
                    {
                        tempWhereSql = "";
                    }
                    else //count>0
                    {
                        //if(LocateList.GetByIndex(0).ToString()=="")
                        //{
                        //    tempWhereSql = "";
                        //}
                        //else
                        //{
                        tempWhereSql = " where ";
                        for (int i = 0; i <= LocateList.Count - 1; i++)
                        {
                            string ValueSql;

                            ValueSql = GetSqlByValueType(LocateList.GetByIndex(i));
                            tempWhereSql = tempWhereSql + LocateList.GetKey(i) + "=" + ValueSql + " and ";
                        }//for

                        tempWhereSql = tempWhereSql.Substring(0, tempWhereSql.Length - 4);
                    }//else
                }//else

                return tempWhereSql;
            }//try
            catch
            {
                return "";
            }
        }//GetWhereSql

        /// <summary>
        /// ��ȡ�����Sql���
        /// </summary>
        /// <param name="OrderByList"></param>
        /// <returns></returns>
        public string GetOrderBySql(SortedList OrderByList)
        {
            string tempOrderBySql;

            tempOrderBySql = "";

            try
            {
                if (OrderByList == null)
                {
                    tempOrderBySql = "";
                }
                else  //!=null
                {
                    if (OrderByList.Count <= 0)
                    {
                        tempOrderBySql = "";
                    }
                    else //count>0
                    {
                        if (OrderByList.GetByIndex(0).ToString() == "")
                        {
                            tempOrderBySql = "";
                        }
                        else
                        {
                            tempOrderBySql = " order by  ";
                            for (int i = 0; i <= OrderByList.Count - 1; i++)
                            {
                                string ValueSql;

                                ValueSql = OrderByList.GetByIndex(i).ToString();
                                tempOrderBySql = tempOrderBySql + ValueSql + ",";
                            }//for

                            tempOrderBySql = tempOrderBySql.Substring(0, tempOrderBySql.Length - 1);
                        }//else
                    }//else
                }//else

                return tempOrderBySql;
            }//try
            catch
            {
                return "";
            }
        }//GetWhereSql

        /// <summary>
        /// �����������ͻ�ȡֵ��Sql
        /// </summary>
        /// <param name="Value"></param>
        /// <returns></returns>
        private string GetSqlByValueType(object Value)
        {
            string ValueType;
            string ValueStr;

            try
            {
                ValueType = Value.GetType().FullName.Split(new char[] { '.' })[1]; ;

                switch (ValueType)
                {
                    case "STRING":
                        ValueStr = "'" + Value + "'";
                        break;
                    case "INT16":
                        ValueStr = Value.ToString();
                        break;
                    default:
                        ValueStr = "'" + Value + "'";
                        break;
                }

                return ValueStr;
            }
            catch
            {
                return "";
            }
        }

        #endregion

        #region ȫ��/�ֲ�ID����

        /// <summary>
        /// GS_Id��Ӽ�¼
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="InfoField"></param>
        /// <param name="Type"></param>
        /// <param name="GroupValue"></param>
        /// <param name="Value"></param>
        /// <returns></returns>
        public string InsertGLID(string InfoId, string InfoField, string Type, string GroupValue, string Value)
        {
            string tempSql;

            tempSql = "insert into gs_id(infoid,infofield,type,groupvalue,value)  values('" + InfoId + "','"
                     + InfoField + "','"
                     + Type + "','"
                     + GroupValue + "','"
                     + Value + "')";

            return tempSql;
        }

        /// <summary>
        /// GS_ID�޸ļ�¼
        /// </summary>
        /// <param name="InfoId"></param>
        /// <param name="InfoField"></param>
        /// <param name="Type"></param>
        /// <param name="GroupValue"></param>
        /// <param name="Value"></param>
        /// <returns></returns>
        public string UpdateGLID(string InfoId, string InfoField, string Type, string GroupValue, string Value)
        {
            string tempSql;

            tempSql = "update gs_id set GroupValue='" + GroupValue + "',Value='" + Value + "'"
                     + " where InfoId='" + InfoId
                     + "' and InfoField='" + InfoField
                     + "' and GroupValue='" + GroupValue
                     + "' and Type='" + Type + "'";

            return tempSql;
        }

        #endregion

        #region ģ�������


        #endregion

    }
}
