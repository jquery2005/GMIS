#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CModuleRight ��ժҪ˵����
	///�û���ģ��Ȩ��
	/// </summary>
	public class CModuleRight : MyBase
	{

		public CModuleRight(string[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		}

		public CModuleRight(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
			SetModuleRightProperty(dr);
		}


		public CModuleRight(string[] ConnectInfo,string UserCode,string ModuleCode) : base(ConnectInfo)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("XE02"," Where ZA0100='" + UserCode + "' and ZC9996='" + ModuleCode + "'","");
				dt=this.DataOperator.GetDataTable(str);

				if(dt.Rows.Count >0)
				{
					SetModuleRightProperty(dt.Rows[0]);
				}
			}
			catch(Exception e)
			{
				throw new Exception(e.Message);
			}
		}
			

	#region ȫ�ֱ���

		  
		#endregion

	#region ����
		
		/// <summary>
		/// �û�����
		/// </summary>
		private String m_UserCode="";
		public String UserCode
		{
			get
			{
				return m_UserCode;
			}
			set
			{
				m_UserCode=value;
			}
		}


		/// <summary>
		/// ģ�����(ZC9996)
		/// </summary>
		private String m_ModuCode;
		public String ModuleCode
		{
			get
			{
				return m_ModuCode;
			}
			set
			{
				m_ModuCode=value;
			}
		}



		/// <summary>
		/// ģ�����
		/// </summary>
		private String m_ModuType;
		public String ModuType
		{
			get
			{
				return m_ModuType;
			}
			set
			{
				m_ModuType=value;
			}
		}


		/// <summary>
		/// �����󣨼̳й�����
		/// </summary>
		private String m_MainObject="";
		public String MainObject
		{
			get
			{
				return m_MainObject;
			}
			set
			{
				m_MainObject=value;
			}
		}


		/// <summary>
		/// ��д�Ӷ���
		/// </summary>
		private String m_ReadWriteSubObject="";
		public String ReadWriteSubObject
		{
			get
			{
				return m_ReadWriteSubObject;
			}
			set
			{
				m_ReadWriteSubObject=value;
			}
		}


		/// <summary>
		/// ֻ���Ӷ���
		/// </summary>
		private String m_ReadOnlySubObject="";
		public String ReadOnlySubObject
		{
			get
			{
				return m_ReadOnlySubObject;
			}
			set
			{
				m_ReadOnlySubObject=value;
			}
		}


		/// <summary>
		/// ��д��ض���
		/// </summary>
		private String m_ReadWriteRelateObject="";
		public String ReadWriteRelateObject
		{
			get
			{
				return m_ReadWriteRelateObject;
			}
			set
			{
				m_ReadWriteRelateObject=value;
			}
		}


		/// <summary>
		/// ֻ����ض���
		/// </summary>
		private String m_ReadOnlyRelateObject="";
		public String ReadOnlyRelateObject
		{
			get
			{
				return m_ReadOnlyRelateObject;
			}
			set
			{
				m_ReadOnlyRelateObject=value;
			}
		}


		

		/// <summary>
		/// ¼��������AA1995:1,za0100,=,'001'
		/// </summary>
		private string m_InputCondition="";
		public string  InputCondition
		{
			get
			{
				return m_InputCondition;
			}
			set
			{
				m_InputCondition=value;
			}
		}

	
	#endregion

	#region ����

		

		/// <summary>
		/// ����ģ��Ȩ�޼�¼��
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="UserCode"></param>
		/// <returns></returns>
		public SortedList GetModuleRights(String[] ConnectInfo,String UserCode,out DataTable returnDT)
		{
			
			
			//DataTable dt;
			SortedList ModuleRightList=new SortedList(); 
			int i;
			CModuleRight tempModuleRight;;

			

			try
			{

				ConnectInfo=ConnectInfo; 
				
				//��ȡ���û���ģ��Ȩ��
				returnDT=this.GetModuleRightTable(UserCode);
				ModuleRightList.Clear();
 
				for(i=0;i<=returnDT.Rows.Count-1;i++)
				{
					tempModuleRight=new CModuleRight(ConnectInfo, returnDT.Rows[i]);
					ModuleRightList.Add(tempModuleRight.ModuleCode,tempModuleRight); //ģ���������ֵ
				}


				return ModuleRightList;
				
			}
			catch(Exception ee)
			{
				
				//returnDT=null;
				throw new Exception(ee.Message ); 
				//return null;
			}


		}


		/// <summary>
		///��ȡ�û���ģ��Ȩ��:�ܴ�����Ӱ��
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		private DataTable GetModuleRightTable(String UserCode)
		{
			DataTable dt;
			String SqlStr;
			String WhereSql="";
			

			try
            
			{
				if(UserCode != "")
				{
					WhereSql=" Where ZA0100='" + UserCode + "' and zc9996 is not null ";
				}
				SqlStr=this.SqlBuilder.GetFilterSql("XE02",WhereSql,"");
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ����һ����¼����ģ��Ȩ���������
		/// </summary>
		/// <param name="dr"></param>
		private void SetModuleRightProperty(DataRow dr)
		{
			try
			{
				this.m_UserCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]);  //�û�����
				this.m_ModuCode=Convert.IsDBNull(dr["ZC9996"])?"":Convert.ToString(dr["ZC9996"]); //ģ�����
				this.m_MainObject=Convert.IsDBNull( dr["XE0210"])?"":Convert.ToString(dr["XE0210"]); //������
				this.m_ReadOnlySubObject=Convert.IsDBNull( dr["XE0211"])?"":Convert.ToString(dr["XE0211"]); //ֻ���Ӷ���
				this.m_ReadWriteSubObject=Convert.IsDBNull( dr["XE0212"])?"":Convert.ToString(dr["XE0212"]); //��д�Ӷ���
				this.m_ReadOnlyRelateObject=Convert.IsDBNull( dr["XE0213"])?"":Convert.ToString(dr["XE0213"]); //ֻ����ض���
				this.m_ReadWriteRelateObject=Convert.IsDBNull( dr["XE0214"])?"":Convert.ToString(dr["XE0214"]); //��д��ض���
				this.m_InputCondition=Convert.IsDBNull( dr["XE021E"])?"":Convert.ToString(dr["XE021E"]); //¼������
                
			}
			catch(Exception e)
			{
				throw new Exception ("SetModuleRightProperty: " + e.Message );
			
			}
		}



		/// <summary>
		/// ������û���ģ��Ȩ��
		/// </summary>
		public void Save(String[] ConnectInfo,String TableName,DataTable dt,String UserCode)
		{
			this.DataOperator.UpdateRightDataTable(TableName,dt,UserCode); 
		}


	#endregion

	}
}
