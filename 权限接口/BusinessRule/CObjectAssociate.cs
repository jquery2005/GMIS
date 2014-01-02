using System;
using System.Data;
using System.Collections;
using GMIS.CommonRightDataAccess;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CObjectAssociate ��ժҪ˵���������ϵ�ࣺ
	/// </summary>
	public class CObjectAssociate : MyBase
	{


		#region  ȫ�ֱ���
		SortedList mLocateList=new SortedList(); 
		#endregion


		/// <summary>
		/// ���캯��
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="InfoId"></param>
		/// <param name="AssociateType"></param>
		public CObjectAssociate(String[] ConnectInfo,String InfoId,String AssociateType) : base(ConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
			String tempSql;
			DataTable dt;
			DataRow dr;


			try

			{
//				this.ConnectInfo =ConnectInfo;
//				this.DataOperator=new CDataOperator(this.ConnectInfo);
//				this.SqlBuilder=new CSqlBuilder();  

				this.mLocateList.Clear();
				this.mLocateList.Add("InfoIdA",InfoId); 
				this.mLocateList.Add("AssociateType",AssociateType); 
				tempSql=this.SqlBuilder.GetFilterSql("gs_ObjectAssociate",mLocateList);
				dt=this.DataOperator.GetDataTable(tempSql);
				if(dt.Rows.Count >0)
				{
					dr=dt.Rows[0];
					SetOneObjectAssociate(dr);
				}
			}//try
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}
		
	}		


		/// <summary>
		/// 
		/// </summary>
		/// <param name="dr"></param>
		public CObjectAssociate(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
			
			SetOneObjectAssociate(dr);
			
		}


        /// <summary>
/// ����һ�������ϵ��¼����
/// </summary>
/// <param name="dr"></param>
		private void SetOneObjectAssociate(DataRow dr)
		{
			try

			{

				this.m_AssociateType=dr["AssociateType"].ToString() + "" ;
				this.m_Flag=dr["Flag"].ToString() +"" ;
				this.m_InfoIdA=dr["InfoIdA"].ToString ()+ "";
				this.m_InfoIdB=dr["InfoIdB"].ToString ()+ "";
				this.m_PropertySet=dr["PropertySet"].ToString ()+ "";
					
			
			} //try
			catch(Exception e)
			{
				throw new Exception(e.Message);
			}
		}


		#region ����

       

		/// <summary>
		/// ����������
		/// </summary>
		private String m_InfoIdA="";
		public String InfoIdA
		{
			get
			{
				return m_InfoIdA;
			}
		}

		/// <summary>
		///��������
		/// </summary>
		private String m_InfoIdB="";
		public String InfoIdB
		{
			get
			{
				return m_InfoIdB;
			}
		}

		/// <summary>
		/// �������ͣ�1-�̳� 2-��� 3-���� 4-���ܹ�ϵ
		/// </summary>
		private String m_AssociateType="";
		public String AssociateType
		{
			get
			{
				return m_AssociateType;
			}
		}


		/// <summary>
		/// ��־��1:׷�ӣ�2������
		/// </summary>
		private String m_Flag="";
		public String Flag
		{
			get
			{
				return m_Flag;
			}
		}

		/// <summary>
		/// �����ֶ�
		/// </summary>
		private String m_PropertySet="";
		public String PropertySet
		{
			get
			{
				return m_PropertySet;
			}
		}

		#endregion

	}
}
