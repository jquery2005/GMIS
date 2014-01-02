using System;
using GMIS.CommonRightDataAccess;
using System.Data; 
using System.Collections; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CStructure ��ժҪ˵��������ṹ��
	/// ������
	/// </summary>
	public class CStructure : MyBase
	{


		public CStructure(String[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
//				this.ConnectInfo =ConnectInfo;
//				this.DataOperator=new CDataOperator(this.ConnectInfo);
//				this.SqlBuilder=new CSqlBuilder();  
		}


		public CStructure(String[] ConnectInfo,String InfoId) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�

			String tempSql;
			DataTable dt;
			DataRow dr;


			try

			{
//
//				this.ConnectInfo =ConnectInfo;
//				this.DataOperator=new CDataOperator(this.ConnectInfo);
//				this.SqlBuilder=new CSqlBuilder();  
//
//			
			
				this.mLocateList.Clear();
				this.mLocateList.Add("InfoId",InfoId); 
				tempSql=this.SqlBuilder.GetFilterSql("gs_structure",mLocateList);
				dt=this.DataOperator.GetDataTable(tempSql);
				if(dt.Rows.Count >0)
				{
					dr=dt.Rows[0];
					this.SetStructureProperty(dr); 
					
				}
			} //try
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}

		}


		public CStructure(String[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
//			this.ConnectInfo =ConnectInfo;
//			this.DataOperator=new CDataOperator(this.ConnectInfo);
//			this.SqlBuilder=new CSqlBuilder();  

			this.SetStructureProperty(dr); 
		}


		#region ȫ�ֱ���

		SortedList mLocateList=new  SortedList();
 
		#endregion

		#region ����

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
		}


		/// <summary>
		/// ��������
		/// </summary>
		private String m_Description;
		public String Description
			{
				get
				{
					return m_Description;
				}
			}


		/// <summary>
		/// ������
		/// </summary>
		private String m_ShortDesc;
		public String ShortDesc
		{
			get
			{
				return m_ShortDesc;
			}
		}


		/// <summary>
		/// ������
		/// </summary>
		private String m_ParentId;
		public String ParentId
		{
			get
			{
				return m_ParentId;
			}
		}


		/// <summary>
		/// �Ƿ����Ӷ���
		/// </summary>
        private String m_IsExistChild="";
	    public String IsExistChild
		{
			get
			{
				return m_IsExistChild;
			}
		}


		/// <summary>
		/// ��������
		/// </summary>
		private String m_Type="";
		public String Type
		{
			get
			{
				return m_Type;
			}
		}
		

		/// <summary>
		/// ����
		/// </summary>
		private int m_OrderNo=0;
		public int OrderNo
		{
			get
			{
				return m_OrderNo;
			}
		}


		/// <summary>
		/// �����ֶ�
		/// </summary>
		private String m_PKey="";
		public String PKey
		{
			get
			{
				return m_PKey;
			}
		}


		/// <summary>
		/// ����
		/// </summary>
		private String m_Condition="";
		public String Condition
		{
			get
			{
				return m_Condition;
			}
		}


		/// <summary>
		/// ״̬
		/// </summary>
		private String m_State="";
		public String State
		{
			get
			{
				return m_State;
			}
		}


		/// <summary>
		/// ����Id
		/// </summary>
        private String m_ConstId="";
		public String ConstId
		{
			get
			{
				return m_ConstId;
			}
		}


		/// <summary>
		/// ����Ĳ�����1��ʾ��һ�㡣
		/// </summary>
		private int m_Layer=1;
		public int Layer
		{
			get
			{
				return m_Layer;
			}
		}


		/// <summary>
		/// �����Ƿ��а���0��û�� 1����
		/// </summary>
		private bool m_Secrit=false;
		public bool Secrit
		{
			get
			{
				return m_Secrit;
			}
		}

					
		#endregion

		#region ��������

		
		/// <summary>
		/// ��ȡָ�������µ��Ӷ���
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public CStructure[] GetSubStructures(string PPtr)
		{
			DataTable dt;
			CStructure[] tempCStructureArray;

			try
			{

				
				//��ģ�����ua01
				dt=this.GetSubObject(PPtr); 
				tempCStructureArray=new  CStructure[dt.Rows.Count];
				for(int i=0;i<=dt.Rows.Count -1;i++)
				{
					tempCStructureArray[i]=new    CStructure(ConnectInfo,dt.Rows[i]);   
				}
		
				return tempCStructureArray;
			}
			catch
			{
				return null;
			}


		}


		/// <summary>
		/// �����������ȡ���е��Ӷ��󣬷ǲݸ�״̬��
		/// </summary>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public CStructure[] gsGetObjectByMain(string MainObject)
		{
			string Filter;

			Filter="Select * from gs_structure where substring(InfoId,1,2)='" + MainObject.Substring(0,2) + "'";
			return this.GetObjects(Filter); 
		}

		
		#endregion

		#region ˽�к���

		/// <summary>
		///��ȡָ�������µ��Ӷ���
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		private DataTable GetSubObject(String CurPPtr)
		{
			DataTable dt;
			String SqlStr;
			String WhereSql;
			

			try
            
			{
				if(CurPPtr==null)
				{
					WhereSql=" Where ZA9996 is null";
				}
				else
				{
					WhereSql=" Where ZA9996='" + CurPPtr + "'";
				}
				SqlStr=this.SqlBuilder.GetFilterSql("gs_structure",WhereSql,"");
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ��ȡָ������
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		private CStructure[] GetObjects(string Filter)
		{
			DataTable dt;
			CStructure[] tempCStructureArray;

			try
			{

				
				//��ģ�����ua01
				dt=this.DataOperator.GetDataTable(Filter);
				tempCStructureArray=new  CStructure[dt.Rows.Count];
				for(int i=0;i<=dt.Rows.Count -1;i++)
				{
					tempCStructureArray[i]=new    CStructure(ConnectInfo,dt.Rows[i]);   
				}
		
				return tempCStructureArray;
			}
			catch
			{
				return null;
			}


		}



		/// <summary>
		/// ����һ����¼���ýṹ�������
		/// </summary>
		/// <param name="dr"></param>
		private void SetStructureProperty(DataRow dr)
		{

			this.m_InfoId=dr["InfoId"].ToString()+ "";
			this.m_Type=dr["Type"].ToString() + "" ;
			this.m_Description=dr["Description"].ToString() +"" ;
			this.m_ShortDesc=dr["ShortDesc"].ToString ()+ "";
			this.m_ParentId=dr["ParentId"].ToString ()+ "";
			this.m_IsExistChild=dr["IsExistChild"].ToString ()+ "";
			this.m_OrderNo=Convert.IsDBNull( dr["OrderNo"])?0:Convert.ToInt32(dr["OrderNo"]);
			this.m_PKey=dr["PKey"].ToString ()+ "";
			this.m_Condition=dr["Condition"].ToString ()+ "";
			this.m_State=dr["State"].ToString ()+ "";
			this.m_ConstId=dr["ConstId"].ToString ()+ "";
			this.m_Layer=Convert.IsDBNull(dr["Layer"])?1:Convert.ToInt32(dr["Layer"]);
			this.m_Secrit=Convert.IsDBNull(dr["Secrit"])?false:Convert.ToBoolean(dr["Secrit"]);
    

		}
		

		#endregion

	}//class
}//namespace
