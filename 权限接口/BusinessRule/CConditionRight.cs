#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CConditionRight ��ժҪ˵����
	/// �û�������Ȩ��
	/// </summary>
	public class CConditionRight :MyBase
	{
		public CConditionRight(string[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		}

		public CConditionRight(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
		   SetConditionRightProperty(dr);
		}
			

	#region ����
		
		/// <summary>
		/// �û������
		/// </summary>
		private String m_UserGroupCode="";
		public String UserGroupCode
		{
			get
			{
				return m_UserGroupCode;
			}
			set
			{
				m_UserGroupCode=value;
			}
		}


		/// <summary>
		///������
		/// </summary>
		private String m_MainObject;
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
		///����������
		/// </summary>
		private String m_MainObjectDescription;
		public String MainObjectDescription
		{
			get
			{
				return m_MainObjectDescription;
			}
			set
			{
				m_MainObjectDescription=value;
			}
		}


		/// <summary>
		/// �������ʽ
		/// </summary>
		private String m_baseExpr="";
		public String baseExpr
		{
			get
			{
				return m_baseExpr;
			}
			set
			{
				m_baseExpr=value;
			}
		}

		/// <summary>
		/// ���������
		/// </summary>
		private string m_baseItem="";
		public string baseItem
		{
			get
			{
				return m_baseItem;
			}
			set
			{
				m_baseItem=value;
			}
		}


		/// <summary>
		/// ������������������
		/// </summary>
		private string m_chineseItem="";
		public string chineseItem
		{
			get
			{
				return m_chineseItem;
			}
			set
			{
				m_chineseItem=value;
			}
		}

		
	#endregion

	#region ����

		

		/// <summary>
		/// ��ȡָ���û�������Ȩ��
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public CConditionRight[] GetConditionRights(String UserGroupCode)
		{
			DataTable dt;
			CConditionRight[] tempConditionRightArray;

			try
			{

				
				//��ģ�����ua01
				dt=this.GetConditionRightTable(UserGroupCode); 
				tempConditionRightArray=new CConditionRight[dt.Rows.Count];
				for(int i=0;i<=dt.Rows.Count -1;i++)
				{
					tempConditionRightArray[i]=new CConditionRight(ConnectInfo, dt.Rows[i]);   
				}
		
				return tempConditionRightArray;
			}
			catch
			{
				return null;
			}


		}


		/// <summary>
		///��ȡ�û�������Ȩ��
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		private DataTable GetConditionRightTable(String UserGroupCode)
		{
			DataTable dt;
			String SqlStr;
			String WhereSql="";
			

			try
            
			{
				if(UserGroupCode != "")
				{
					WhereSql=" Where ZA0100='" + UserGroupCode + "'";
				}

				SqlStr="select a.*,b.description from XE03 a,gs_structure b where a.XE0310=b.infoid and za0100='" + UserGroupCode + "'";
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ����һ����¼��������Ȩ���������
		/// </summary>
		/// <param name="dr"></param>
		private void SetConditionRightProperty(DataRow dr)
		{
			try
			{
				this.m_UserGroupCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]);  //�û������
				this.m_MainObject=Convert.IsDBNull( dr["XE0310"])?"":Convert.ToString(dr["XE0310"]); //������
				this.m_baseExpr=Convert.IsDBNull( dr["XE0311"])?"":Convert.ToString(dr["XE0311"]); //�������ʽ
				this.m_baseItem=Convert.IsDBNull( dr["XE0312"])?"":Convert.ToString(dr["XE0312"]); //���������
				this.m_chineseItem=Convert.IsDBNull( dr["XE0313"])?"":Convert.ToString(dr["XE0313"]); //������������������
				this.m_MainObjectDescription=Convert.IsDBNull( dr["Description"])?"":Convert.ToString(dr["Description"]); //����������
				
			}
			catch(Exception e)
			{
				throw new Exception ("SetConditionRightProperty: " + e.Message );
			
			}
		}


		/// <summary>
		/// �������Ȩ�ޣ��û������+ID+������ Ϊ������
		/// </summary>
		public void AddNew(SortedList FieldValueList,SortedList ForeignKeyList)
		{
			CDealLayerObject tempDealLayerObject;

			try
			{

				
				//����¼�¼
				tempDealLayerObject=new CDealLayerObject(ConnectInfo);
				tempDealLayerObject.gsAddNew("XE03",FieldValueList,ForeignKeyList); 



			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}

		/// <summary>
		/// �������Ȩ�ޣ��û�����+ID+������ Ϊ������
		/// </summary>
		public void AddNew()
		{
			CDealLayerObject tempDealLayerObject;
			SortedList FieldValueList=new SortedList(); ;
			SortedList ForeignKeyList=new SortedList(); ;

			try
			{

			

				tempDealLayerObject=new CDealLayerObject(ConnectInfo);

			
				//�������
				ForeignKeyList.Add("ZA0100",this.m_UserGroupCode);  //�û�����
				

				//ֵ����
				FieldValueList.Add("ZA0100",m_UserGroupCode);  //����
				FieldValueList.Add("XE03ID",0); //���
				FieldValueList.Add("ZC9993","1"); //��־λ
				FieldValueList.Add("XE0310",this.m_MainObject); //������
				FieldValueList.Add("XE0311",this.m_baseExpr); //�������ʽ
				FieldValueList.Add("XE0312",this.m_baseItem); //���������
				FieldValueList.Add("XE0313",this.m_chineseItem);//��������
  			

				//�Ӽ�¼
				tempDealLayerObject.gsAddNew("XE03",FieldValueList,ForeignKeyList); 

			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}



		/// <summary>
		/// �޸�����Ȩ��
		/// </summary>
		public void Update(SortedList FieldValueList,SortedList ForeignKeyList)
		{
			CDealLayerObject tempDealLayerObject;

			try
			{

				tempDealLayerObject=new CDealLayerObject(ConnectInfo);
				tempDealLayerObject.gsUpdate("XE03",FieldValueList,ForeignKeyList); 			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}
		}



	#endregion

	}//class
}//namespace
