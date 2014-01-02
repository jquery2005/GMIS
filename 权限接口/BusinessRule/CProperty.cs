using System;
using System.Data;
using System.Collections;  
using GMIS.CommonRightDataAccess;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CProperty ��ժҪ˵��������������
	/// </summary>
	public class CProperty : MyBase
	{
	
		/// <summary>
		/// 
		/// </summary>
		public CProperty(string[] ConnectInfo) : base(ConnectInfo)
		{
		}


		/// <summary>
		/// 
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="InfoId"></param>
		/// <param name="InfoField"></param>
		public CProperty(String[] ConnectInfo,String InfoId,String InfoField) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			String tempSql;
			DataTable dt;
			DataRow tempDR=null;


			try

			{

				ConnectInfo =ConnectInfo;
				this.DataOperator=new CDataOperator(ConnectInfo);
				this.SqlBuilder=new CSqlBuilder();  

			
				this.mLocateList.Clear();
				this.mLocateList.Add("InfoId",InfoId); 
				this.mLocateList.Add("InfoField",InfoField); 
				tempSql=this.SqlBuilder.GetFilterSql("gs_Property",mLocateList);
				dt=this.DataOperator.GetDataTable(tempSql);
				if(dt.Rows.Count >0)
				{
					
					this.SetPropertyInfo(tempDR);  
				
				}
			} //try
			catch
			{
			}

		}


	    /// <summary>
	/// 
	/// </summary>
	/// <param name="dr"></param>
		public CProperty(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
          SetPropertyInfo(dr);
		
    	}


		#region ȫ�ֱ���

		SortedList mLocateList=new  SortedList();
 
		#endregion

		#region ����

		/// <summary>
		/// ���������Ķ���
		/// </summary>
		private string m_InfoId="";
		public string InfoId
		{
			get
			{
				return m_InfoId;
			}
		}


		/// <summary>
		/// ������
		/// </summary>
		private string m_InfoField="";
		public string InfoField
		{
			get
			{
				return m_InfoField;
			}
		}


		/// <summary>
		/// ��������
		/// </summary>
		private string m_Description="";
		public string Description
		{
			get
			{
				return m_Description;
			}
		}


		/// <summary>
		/// ��������
		/// </summary>
		private int m_DataType=0;
		public int DataType
		{
			get
			{
				return m_DataType;
			}
		}


		/// <summary>
		/// ���Գ���
		/// </summary>
		private string m_Length="";
		public string Length
		{
			get
			{
				return m_Length;
			}
		}


		/// <summary>
		/// ����
		/// </summary>
		private string m_Decimal="";
		public string Decimal
		{
			get
			{
				return m_Decimal;
			}
		}
		

		/// <summary>
		/// ȱʡֵ
		/// </summary>
		private string m_DefaultValue="";
		public string DefaultValue
		{
			get
			{
				return m_DefaultValue;
			}
		}


		/// <summary>
		/// ���Խ��� 
		/// </summary>
		private string m_Explain="";
		public string Explain
		{
			get
			{
				return m_Explain;
			}
		}


		/// <summary>
		/// Լ������
		/// </summary>
		private string m_Restriction="";
		public string Restriction
		{
			get
			{
				return m_Restriction;
			}
		}


		/// <summary>
		/// Լ�����ʽ
		/// </summary>
		private string m_RestrictionExplain="";
		public string RestrictionExplain
		{
			get
			{
				return m_RestrictionExplain;
			}
		}


		/// <summary>
		/// ���õĶ���
		/// </summary>
		private string m_DictId="";
		public string DictId
		{
			get
			{
				return m_DictId;
			}
		}


		/// <summary>
		///����
		/// </summary>
		private string m_Condition="";
		public string Condition
		{
			get
			{
				return m_Condition;
			}
		}


		/// <summary>
		///�Ƿ�ݸ�״̬��0-δ���� 1-�ѹ��� 2-�����⵫Ҫɾ�� 
		/// </summary>
		private string m_State="";
		public string State
		{
			get
			{
				return m_State;
			}
		}


		/// <summary>
		/// �Ƿ�Ϊֻ����0-��д 1-���� 2-ֻ��
		/// </summary>
		private string m_PropertySet="";
		public string PropertySet
		{
			get
			{
				return m_PropertySet;
			}
		}


		/// <summary>
		/// ���Ե���ʾ˳��
		/// </summary>
		private  int m_OrderNo=0;
		public int OrderNo
		{
			get
			{
				return m_OrderNo;
			}
		}


		/// <summary>
		/// �Ƿ�Ψһ��
		/// </summary>
		private bool  m_SingleNess=false;
		public bool SingleNess
		{
			get
			{
				return m_SingleNess;
			}
		}


		/// <summary>
		/// �ڶ�����
		/// </summary>
		private string m_SecondName="";
		public string SecondName
		{
			get
			{
				return m_SecondName;
			}
		}


		/// <summary>
		/// �ڶ�����
		/// </summary>
		private string m_SecondDisplay;
		public string SecondDisplay
		{
			get
			{
				return m_SecondDisplay;
			}
		}

					
		#endregion

		#region ��������

		/// <summary>
		/// ��ȡָ���������������gs_property
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="InfoId"></param>
		public SortedList  GetProperties(String[] ConnectInfo,String InfoId)
		{
			DataTable dt;
			String sql;
			SortedList PropertyList=new SortedList(); 
			CProperty tempProperty;
            

			try
			{
			
				ConnectInfo=ConnectInfo;
				this.DataOperator=new   CDataOperator(ConnectInfo);  
				this.SqlBuilder =new  CSqlBuilder();

				sql=this.SqlBuilder.GetFilterSql("gs_property"," where InfoId='" + InfoId + "'",""); 
				dt=this.DataOperator.GetDataTable(sql);  
			
				for(int i=0;i<=dt.Rows.Count-1;i++)
				{
					tempProperty=new CProperty(ConnectInfo, dt.Rows[i]);  
					//	PropertyList.Add(tempProperty.InfoField,tempProperty); 
					PropertyList.Add(i,tempProperty); 
					
				}

				return PropertyList;
			}
			catch
			{
				return null;
			}

		}


		/// <summary>
		///��ȡ��������� 
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		public DataTable GetProperty(String InfoId,SortedList OrderByList)
		{
			DataTable dt;
			String SqlStr;
			

			try
            
			{
				this.mLocateList.Clear();
				this.mLocateList.Add("InfoId",InfoId); 
				this.mLocateList.Add("State","1"); 

				SqlStr=this.SqlBuilder.GetFilterSql("gs_property",mLocateList,OrderByList);
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch
			{
				return null;
			}
		}//GetProperty


		public DataTable GetProperty(String InfoId)
		{
			DataTable dt;
			String SqlStr;
		
			try
        	{
				this.mLocateList.Clear();
				this.mLocateList.Add("InfoId",InfoId); 
				this.mLocateList.Add("State","1"); 
				SqlStr=this.SqlBuilder.GetFilterSql("gs_property",mLocateList);
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch
			{
				return null;
			}
		}//GetProperty



		#endregion

		#region ˽�к���

		/// <summary>
		/// �������Ե�ֵ
		/// </summary>
		/// <param name="dr"></param>
		private void SetPropertyInfo(DataRow dr)
		{
			try
			{
				this.m_InfoId=dr["InfoId"].ToString()+ "";
				this.m_InfoField=dr["InfoField"].ToString()+ "";
				this.m_Description=dr["Description"].ToString() + "" ;
				this.m_DataType=Convert.IsDBNull( dr["DataType"])?0:Convert.ToInt32(dr["DataType"]);
				this.m_Length=dr["Length"].ToString ()+ "";
				this.m_Decimal=dr["Decimal"].ToString ()+ "";
				this.m_DefaultValue=dr["DefaultValue"].ToString ()+ ""; //ȱʡֵ
				this.m_Explain=dr["Explain"].ToString ()+ "";
				this.m_Restriction=dr["Restriction"].ToString ()+ "";
				this.m_RestrictionExplain=dr["RestrictionExplain"].ToString ()+ ""; //Լ��
				this.m_DictId=dr["DictId"].ToString ()+ "";
				this.m_Condition=dr["Condition"].ToString ()+ ""; //����
				this.m_State=dr["State"].ToString ()+ "";
				this.m_PropertySet=dr["PropertySet"].ToString ()+ "";
				this.m_OrderNo=Convert.IsDBNull( dr["OrderNo"])?0:Convert.ToInt32(dr["OrderNo"]);
				this.m_SingleNess=Convert.IsDBNull( dr["SingleNess"])?false:Convert.ToBoolean(dr["SingleNess"]);
				this.m_SecondName=dr["SecondName"].ToString ()+ "";
				this.m_SecondDisplay=dr["SecondDisplay"].ToString ()+ "";
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			
			}
		}


		#endregion

	

	}//class
}//nampspace
