#define DEBUG


using System;
using GMIS.CommonRightDataAccess;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CDealLayerObject ��ժҪ˵����
	/// ����ֲ����
	/// </summary>
	public class CDealLayerObject : MyBase
	{
		public CDealLayerObject(String[] ConnectInfo) : base(ConnectInfo)
		{
			
	
		}


		#region ȫ�ֱ���
		   
		    
		#endregion

		#region ����

		/// <summary>
		/// �����
		/// </summary>
		private DataTable m_ObjectTable;
		public DataTable ObjectTable
		{
			get
			{
				return m_ObjectTable;
			}
		}

		/// <summary>
		/// ������
		/// </summary>
		private String m_InfoId;
		public String InfoId
		{
			get
			{
				return m_InfoId;
			}
			set
			{
				m_InfoId=value;
			}
		}

		/// <summary>
		/// ��������
		/// </summary>
		private String m_CodeName;
		public String CodeName
		{
			get
			{
				return m_CodeName;
			}
			set
			{
				m_CodeName=value;
			}
		}

		/// <summary>
		/// ��ָ������
		/// </summary>
		private String m_ParentName;
		public String ParentName
		{
			get
			{
				return m_ParentName;
			}
			set
			{
				m_ParentName=value;
			}
		}

		#endregion

		#region ���к���

		/// <summary>
		/// ��ȡ����ĵ�һ���Ӷ���(��ʵ�ʵĿ⣩
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetFirstSubObject(String MyInfoId,String MyPPtr,String MyCodeName,String MyParentName)
		{
			String tempSql;


			m_InfoId=MyInfoId;
			m_CodeName=MyCodeName;
			m_ParentName=MyParentName;

			try
			{

			
				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + m_ParentName + "='" + MyPPtr + "'","");
				this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
				return m_ObjectTable;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// ��ȡ����ĵ�һ���Ӷ���(��ʵ�ʵĿ⣩
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetFirstSubObject(String MyPPtr)
		{
			String tempSql;
			
			m_InfoId="gs_structure";
			m_CodeName="InfoId";
			m_ParentName="ParentId";

			try
			{

				
			
				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where ((parentid='" + MyPPtr + "' and type<>'2')  or (parentid in ( select InfoId from gs_structure where parentid='" + MyPPtr + "' and type='2')))","");
				this.m_ObjectTable=this.DataOperator.GetDataTable(tempSql); 
				

				return m_ObjectTable;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ��ȡ���еķֲ��Ӷ���
		/// </summary>
		/// <param name="InfoId"> ������</param>
		/// <param name="PPtr">��ָ���ֵ</param>
		/// <param name="CodeName">��������</param>���磺ZA0100(InfoId)
		/// <param name="ParentName">��ָ������</param>ZA9996(ParentId)
		/// <returns></returns>
		public DataTable gsGetAllSubObject(String MyInfoId,String MyPPtr,String MyCodeName,String MyParentName)
		{
			String tempSql;


			m_InfoId=MyInfoId;
			m_CodeName=MyCodeName;
			m_ParentName=MyParentName;

			//�Ȳ�������
			tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + MyCodeName + "='" + MyPPtr + "'","");
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 

			//�����������������µ������Ӷ���
			GetSubObjectForTree(MyPPtr);
			return m_ObjectTable;
		}


		/// <summary>
		/// ��ȡָ�������������ض��󣬰����Ӷ������ض���
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetAllRelateObject(String PPtr)
		{
			String tempSql;
			


			m_InfoId="gs_structure";
			m_CodeName="InfoId"; 
			m_ParentName="ParentId"; 


			
			//��ȡָ�������µ�������ض���
			tempSql="select * from gs_structure where infoid in (select distinct left(dictid,charindex('.',dictid)-1) as InfoIdName  from gs_property where infoid='" + PPtr + "' and Charindex('.',dictid)>0)";
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
			//��������
			GetRelateObjectForTree(PPtr);
			return m_ObjectTable;
		}


		/// <summary>
		/// ��ȡ���е������󣬺���λΪ01
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetMainObject()
		{
			DataTable dt;
			string str;
	
			try
			{
				str=this.SqlBuilder.GetFilterSql("gs_structure"," where right(infoid,2)='01'","");
				dt=this.DataOperator.GetDataTable(str);
				return dt;
			}
			catch
			{
				return null;
			}


		}


		/// <summary>
		/// ��ȡ����ĳ����������ж����ֶΣ����ñ�����Ǳ����ö�����������ʱ����ö��������(za0100)�ı�ʱ��
		/// �����������øö�����ֶΣ�����Ӧ���޸�(��gs_property)
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		public DataTable gsGetAllRefProperty(String  InfoId)
		{
			String tempSql;

			
			//��ȡָ�������µ�������ض����ֶ�
			tempSql="select * from gs_Property where Charindex('.',dictid)>0 and left(dictid,charindex('.',dictid)-1)='" + InfoId + "'";
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
			return m_ObjectTable;
  
		}


		/// <summary>
		/// ����¼�¼������Id);
		/// </summary>
		public void gsAddNew(string InfoId,SortedList FieldValueList,SortedList ForeignKeyList)
		{
			string str;
			long nId;
			int i;
			string FieldNameSql;
			string FieldValueSql;
			string tempFieldName;
			string tempFieldValue;
			string WhereSql;
		
			try
			{
            
				//1.��ȡ��ǰ��Id
				nId=this.GetAddId(InfoId,ForeignKeyList);
				string IdName=InfoId + "ID";
				IdName=IdName.ToUpper(); 

				//ID�ӵ����ֵ������
				ForeignKeyList.Add(IdName,nId); 
				if(! ForeignKeyList.ContainsKey("ZA0100"))
				{
													   
					ForeignKeyList.Add("ZA0100",FieldValueList["ZA0100"].ToString()); 
				}

				FieldNameSql="";
				FieldValueSql="";
				WhereSql=" where ";
	
				//2.����ID,����ֵ�����¼�¼
				for(i=0;i<=ForeignKeyList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=ForeignKeyList.GetKey(i).ToString();
					tempValue=ForeignKeyList.GetByIndex(i);
					if(tempValue.GetType().FullName=="System.String")
					{
						tempFieldValue="'" + tempValue.ToString() + "'"; 
				 
					}
					else
					{
						tempFieldValue=tempValue.ToString() ;
					}
				
					FieldNameSql=FieldNameSql + tempFieldName + ",";
					FieldValueSql=FieldValueSql + tempFieldValue + ",";
					WhereSql=WhereSql + tempFieldName + "=" + tempFieldValue + " and ";
				}

				FieldNameSql=FieldNameSql.Substring(0,FieldNameSql.LastIndexOf(","));  
				FieldValueSql=FieldValueSql.Substring(0,FieldValueSql.LastIndexOf(","));  
				WhereSql=WhereSql.Substring(0,WhereSql.LastIndexOf("and")-1);  

				//�����¼�¼
				str="Insert " + InfoId + "(" + FieldNameSql + ") values(" + FieldValueSql + ")";
				this.DataOperator.ExecuteSql(str); 


				//3.������·������ֶ�
				gsUpdate(InfoId,FieldValueList,ForeignKeyList);
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}


		/// <summary>
		/// �޸ļ�¼
		/// </summary>
		public void gsUpdate(string InfoId,SortedList FieldValueList,SortedList ForeignKeyList)
		{
			string str;
			int i;
			string tempFieldName;
			string tempFieldValue;
			string WhereSql;
            
			try
			{
			
				this.DataOperator.ExecuteSql("set quoted_identifier off");  

				//�������ֵ��ID���ö�λ���
				WhereSql=" where ";
			
				for(i=0;i<=ForeignKeyList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=ForeignKeyList.GetKey(i).ToString();
					tempValue=ForeignKeyList.GetByIndex(i);
					if(tempValue.GetType().FullName=="System.String")
					{
						tempFieldValue="'" + tempValue.ToString() + "'"; 
				 
					}
					else
					{
						tempFieldValue=tempValue.ToString() ;
					}
			
					WhereSql=WhereSql + tempFieldName + "=" + tempFieldValue + " and ";
				}

			
				WhereSql=WhereSql.Substring(0,WhereSql.LastIndexOf("and"));  

			
				//������·������ֶ�
				for(i=0;i<=FieldValueList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=FieldValueList.GetKey(i).ToString();
					tempValue=FieldValueList.GetByIndex(i);

					if(tempValue==null)
					{
						tempFieldValue=null;
					}
					else
					{
						
						if(tempValue.GetType().FullName=="System.String")
						{
							tempFieldValue='"' + tempValue.ToString() + '"'; 
				 
						}
						else
						{
							tempFieldValue=tempValue.ToString() ;
						}
					}

					//��������
					if(! ForeignKeyList.ContainsKey(tempFieldName))
					{
            
						str="set quoted_identifier off update " + InfoId + " set " + tempFieldName + "=" + tempFieldValue + WhereSql;
						this.DataOperator.ExecuteSql(str); 
					}

				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}
		}


		/// <summary>
		/// ����Sql����
		/// </summary>
		/// <param name="str"></param>
		/// <returns></returns>
		public bool gsExecuteSql(string str)
		{
			return this.DataOperator.ExecuteSql(str);  
		}
		
		
	
		#endregion

		#region ˽�к���

		/// <summary>
		/// �ݹ���û�ȡָ������������Ӷ���
		/// </summary>
		/// <param name="PPtr"></param>
		private void GetSubObjectForTree(String MyPPtr)
		{
			String tempSql;
			DataTable dt;
			DataRow dr;
			int i;
			String strCode;

			try
			{

				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + m_ParentName + "='" + MyPPtr + "'","");
				dt=this.DataOperator.GetDataTable(tempSql); 
			
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					dr=dt.Rows[i];
					//��ʵ�ʵ�Ӧ�ÿ⣬�浽���ر���
					if(dr["Type"].ToString() != "2")
					{
						this.m_ObjectTable.ImportRow(dr);
					}
					strCode=dr[m_CodeName].ToString();
					GetSubObjectForTree(strCode);

				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
 
		}


		
		/// <summary>
		/// �ݹ���û�ȡָ�������������ض���
		/// </summary>
		/// <param name="PPtr"></param>
		private void GetRelateObjectForTree(String PPtr)
		{
			String tempSql;
			DataTable dt;
			DataRow dr;
			int i;
			String strCode;

			try
			{
			
				
				//���Ӷ���
				tempSql=this.SqlBuilder.GetFilterSql("gs_structure"," Where ParentId='" + PPtr + "'","");
				dt=this.DataOperator.GetDataTable(tempSql); 
			
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					dr=dt.Rows[i];
					//�������
					strCode=dr[m_CodeName].ToString();
					//���ö����������ض���
					DataTable RelateDT;
					tempSql="select * from gs_structure where infoid in (select distinct left(dictid,charindex('.',dictid)-1) as InfoIdName  from gs_property where infoid='" +  strCode + "' and Charindex('.',dictid)>0)";
					RelateDT=this.DataOperator.GetDataTable(tempSql);
					//��һ���������ض���ӵ����ر���
					for(int j=0;j<=RelateDT.Rows.Count-1;j++)
					{
						this.m_ObjectTable.ImportRow(RelateDT.Rows[j]);   
					}
				
					GetRelateObjectForTree(strCode);

				}
			}
			catch(Exception ee)
			{
				throw new Exception(ee.Message );
			}
 
		}


		/// <summary>
		/// ��ȡ��ǰ��ӵ�ID
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		private long GetAddId(String InfoId,SortedList ForeignKeyList)
		{
			String tempStr;
			DataTable dt;
			long nId;

			try
			{
				tempStr=this.SqlBuilder.GetAddID(InfoId,ForeignKeyList); 
				dt=this.DataOperator.GetDataTable(tempStr); 
				nId=Convert.ToInt64(dt.Rows[0][0]); 
				return nId;
			}
			catch(Exception e)
			{
				throw new Exception("GetAddId: " +e.Message );
			}
			
		}




		#endregion

		
    

	}//class
}//namespace
