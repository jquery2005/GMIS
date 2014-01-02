using System;
using System.Data;
using System.Collections;
using GMIS.CommonRightDataAccess;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CObjectAssociate 的摘要说明：对象关系类：
	/// </summary>
	public class CObjectAssociate : MyBase
	{


		#region  全局变量
		SortedList mLocateList=new SortedList(); 
		#endregion


		/// <summary>
		/// 构造函数
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="InfoId"></param>
		/// <param name="AssociateType"></param>
		public CObjectAssociate(String[] ConnectInfo,String InfoId,String AssociateType) : base(ConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑
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
/// 根据一条对象关系记录设置
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


		#region 属性

       

		/// <summary>
		/// 被关联对象
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
		///关联对象
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
		/// 关联类型：1-继承 2-组成 3-关联 4-汇总关系
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
		/// 标志：1:追加，2：覆盖
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
		/// 属性字段
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
