#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CModuleRight 的摘要说明。
	///用户的模块权限
	/// </summary>
	public class CModuleRight : MyBase
	{

		public CModuleRight(string[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑
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
			

	#region 全局变量

		  
		#endregion

	#region 属性
		
		/// <summary>
		/// 用户编码
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
		/// 模块对象(ZC9996)
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
		/// 模块类别
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
		/// 主对象（继承过来）
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
		/// 读写子对象
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
		/// 只读子对象
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
		/// 读写相关对象
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
		/// 只读相关对象
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
		/// 录入条件：AA1995:1,za0100,=,'001'
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

	#region 函数

		

		/// <summary>
		/// 返回模块权限记录表
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
				
				//读取该用户的模块权限
				returnDT=this.GetModuleRightTable(UserCode);
				ModuleRightList.Clear();
 
				for(i=0;i<=returnDT.Rows.Count-1;i++)
				{
					tempModuleRight=new CModuleRight(ConnectInfo, returnDT.Rows[i]);
					ModuleRightList.Add(tempModuleRight.ModuleCode,tempModuleRight); //模块编码做键值
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
		///读取用户的模块权限:受触发器影响
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
		/// 根据一条记录设置模块权限类的属性
		/// </summary>
		/// <param name="dr"></param>
		private void SetModuleRightProperty(DataRow dr)
		{
			try
			{
				this.m_UserCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]);  //用户编码
				this.m_ModuCode=Convert.IsDBNull(dr["ZC9996"])?"":Convert.ToString(dr["ZC9996"]); //模块对象
				this.m_MainObject=Convert.IsDBNull( dr["XE0210"])?"":Convert.ToString(dr["XE0210"]); //主对象
				this.m_ReadOnlySubObject=Convert.IsDBNull( dr["XE0211"])?"":Convert.ToString(dr["XE0211"]); //只读子对象
				this.m_ReadWriteSubObject=Convert.IsDBNull( dr["XE0212"])?"":Convert.ToString(dr["XE0212"]); //读写子对象
				this.m_ReadOnlyRelateObject=Convert.IsDBNull( dr["XE0213"])?"":Convert.ToString(dr["XE0213"]); //只读相关对象
				this.m_ReadWriteRelateObject=Convert.IsDBNull( dr["XE0214"])?"":Convert.ToString(dr["XE0214"]); //读写相关对象
				this.m_InputCondition=Convert.IsDBNull( dr["XE021E"])?"":Convert.ToString(dr["XE021E"]); //录入条件
                
			}
			catch(Exception e)
			{
				throw new Exception ("SetModuleRightProperty: " + e.Message );
			
			}
		}



		/// <summary>
		/// 保存该用户的模块权限
		/// </summary>
		public void Save(String[] ConnectInfo,String TableName,DataTable dt,String UserCode)
		{
			this.DataOperator.UpdateRightDataTable(TableName,dt,UserCode); 
		}


	#endregion

	}
}
