#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CConditionRight 的摘要说明。
	/// 用户的条件权限
	/// </summary>
	public class CConditionRight :MyBase
	{
		public CConditionRight(string[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}

		public CConditionRight(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
		   SetConditionRightProperty(dr);
		}
			

	#region 属性
		
		/// <summary>
		/// 用户组编码
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
		///主对象
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
		///主对象描述
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
		/// 条件表达式
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
		/// 条件表达项
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
		/// 条件表达项的中文描述
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

	#region 函数

		

		/// <summary>
		/// 读取指定用户的条件权限
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

				
				//读模块对象ua01
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
		///读取用户的条件权限
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
		/// 根据一条记录设置条件权限类的属性
		/// </summary>
		/// <param name="dr"></param>
		private void SetConditionRightProperty(DataRow dr)
		{
			try
			{
				this.m_UserGroupCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]);  //用户组编码
				this.m_MainObject=Convert.IsDBNull( dr["XE0310"])?"":Convert.ToString(dr["XE0310"]); //主对象
				this.m_baseExpr=Convert.IsDBNull( dr["XE0311"])?"":Convert.ToString(dr["XE0311"]); //条件表达式
				this.m_baseItem=Convert.IsDBNull( dr["XE0312"])?"":Convert.ToString(dr["XE0312"]); //条件表达项
				this.m_chineseItem=Convert.IsDBNull( dr["XE0313"])?"":Convert.ToString(dr["XE0313"]); //条件表达项的中文描述
				this.m_MainObjectDescription=Convert.IsDBNull( dr["Description"])?"":Convert.ToString(dr["Description"]); //主对象描述
				
			}
			catch(Exception e)
			{
				throw new Exception ("SetConditionRightProperty: " + e.Message );
			
			}
		}


		/// <summary>
		/// 添加条件权限（用户组编码+ID+主对象 为主键）
		/// </summary>
		public void AddNew(SortedList FieldValueList,SortedList ForeignKeyList)
		{
			CDealLayerObject tempDealLayerObject;

			try
			{

				
				//添加新记录
				tempDealLayerObject=new CDealLayerObject(ConnectInfo);
				tempDealLayerObject.gsAddNew("XE03",FieldValueList,ForeignKeyList); 



			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}

		/// <summary>
		/// 添加条件权限（用户编码+ID+主对象 为主键）
		/// </summary>
		public void AddNew()
		{
			CDealLayerObject tempDealLayerObject;
			SortedList FieldValueList=new SortedList(); ;
			SortedList ForeignKeyList=new SortedList(); ;

			try
			{

			

				tempDealLayerObject=new CDealLayerObject(ConnectInfo);

			
				//外键集合
				ForeignKeyList.Add("ZA0100",this.m_UserGroupCode);  //用户编码
				

				//值集合
				FieldValueList.Add("ZA0100",m_UserGroupCode);  //编码
				FieldValueList.Add("XE03ID",0); //序号
				FieldValueList.Add("ZC9993","1"); //标志位
				FieldValueList.Add("XE0310",this.m_MainObject); //主对象
				FieldValueList.Add("XE0311",this.m_baseExpr); //条件表达式
				FieldValueList.Add("XE0312",this.m_baseItem); //条件表达项
				FieldValueList.Add("XE0313",this.m_chineseItem);//条件描述
  			

				//加记录
				tempDealLayerObject.gsAddNew("XE03",FieldValueList,ForeignKeyList); 

			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}



		/// <summary>
		/// 修改条件权限
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
