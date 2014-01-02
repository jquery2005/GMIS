#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 



namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// 用户类
	/// </summary>
	/// 

	public class CUser : MyBase
	{
		
		/*  构造函数 */
		public CUser(String[] ConnectInfo) : base(ConnectInfo)
		{
			

		}


		public CUser(String[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
			
			//根据数据行设置用户的属性
			SetUserProperty(dr);

		}


		public CUser(String[] ConnectInfo,string UserCode,string Flag) : base(ConnectInfo)
		{
			string str;
			DataTable dt;

			try
			{


				if(Flag=="1") //用户编码
				{
					
					//str="select * from XF01  where za0100='" + UserCode + "'";
					str="select a.*,b.xe0101 from xf01 a,xe01 b where a.xf0101=b.za0100 and a.za0100='" + UserCode + "'";
				}
				else  //用户登录名称
				{
					//str="select * from XF01 where ZA0101='" + UserCode + "'";
					str="select a.*,b.xe0101 from xf01 a,xe01 b where a.xf0101=b.za0100 and a.za0101='" + UserCode + "'";
				}

				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					mUserRow=dt.Rows[0];
					SetUserProperty(dt.Rows[0]);
					gsGroupList = "";
					//this.setUserGroup(this.m_UserGroup);
				}
				else  //无此用户
				{
					this.m_UserCode="";
					this.m_UserDescription=""; 
				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}

		}


		#region 全局变量
		
		SortedList mLocateList=new SortedList();
		public string gsGroupList="";
 
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
		/// 登录名称
		/// </summary>
		private String m_LoginName="";
		public String LoginName
		{
			get
			{
				return m_LoginName;
			}
			set
			{
				m_LoginName=value;
			}
		}


		/// <summary>
		/// 用户序号
		/// </summary>
		private long m_UserId=0;
		public long UserId
		{
			get
			{
				return m_UserId;
			}
			set
			{
				m_UserId=value;
			}
		}


		/// <summary>
		/// 用户描述
		/// </summary>
		private String m_UserDescription="";
		public String UserDescription
		{
			get
			{
				return m_UserDescription;
			}
			set
			{
				m_UserDescription=value;
			}
		}


		/// <summary>
		/// 查询码
		/// </summary>
		private String m_QueryCode="";
		public String QueryCode
		{
			get
			{
				return m_QueryCode;
			}
			set
			{
				m_QueryCode=value;
			}
		}


		/// <summary>
		/// 用户密码
		/// </summary>
		private String m_PassWord="";
		public String PassWord
		{
			get
			{
				return m_PassWord;
			}
			set
			{
				m_PassWord=value;
			}

		}


		/// <summary>
		/// 用户所属的组
		/// </summary>
		private string m_UserGroup="";
		public string UserGroup
		{
			get
			{
				return m_UserGroup;
			}
			set
			{
				m_UserGroup=value;
			}

		}

		  
		/// <summary>
		/// 起始时间
		/// </summary>
        private String m_BeginDate="";
		public String BeginDate
		{
			get
			{
				return m_BeginDate;
			}
			set
			{
				m_BeginDate=value;
			}
		}


		/// <summary>
		/// 截止时间
		/// </summary>
		private String m_EndDate="";
		public String EndDate
		{
			get
			{
				return m_EndDate;
			}
			set
			{
				m_EndDate=value;
			}
		}


		/// <summary>
		///用户是否为管理员组： 若用户组的编码为01，则为管理员组
		/// </summary>
		private bool m_IsManageGroup=false;
		public bool IsManageGroup
		{
			get
			{
				return m_IsManageGroup;
			}
			set
			{
				m_IsManageGroup=value;
			}
		}


		/// <summary>
		/// 用户所属的组类别：0-管理员组 1-业务组 2-自助组 3-领导查询组
		/// </summary>
		private string m_GroupType;
		public string GroupType
		{
			get
			{
				return m_GroupType;
			}
			set
			{
				m_GroupType=value;
			}
		}

		/// <summary>
		/// 自助组用户对应的人员编码
		/// </summary>
		private string m_MemberCode;
		public string MemberCode
		{
			get
			{
				return m_MemberCode;
			}
			set
			{
				m_MemberCode=value;
			}
		}

		/// <summary>
		/// 所属部门
		/// </summary>
		private string m_Department="";
		public string Department
		{
			get
			{
				return m_Department;
			}
			set
			{
				m_Department=value;
			}
		}


		/// <summary>
		/// 部门描述
		/// </summary>
		private string m_DepartmentDesc="";
		public string gsDepartmentDesc
		{
			get
			{
				return m_DepartmentDesc;
			}
			set
			{
				m_DepartmentDesc=value;
			}
		}


		/// <summary>
		/// 所属职务
		/// </summary>
		private string m_Duty="";
		public string Duty
		{
			get
			{
				return m_Duty;
			}
			set
			{
				m_Duty=value;
			}
		}


		/// <summary>
		/// 性别
		/// </summary>
		private string m_Sex="";
		public string Sex
		{
			get
			{
				return m_Sex;
			}
			set
			{
				m_Sex=value;
			}
		}



		/// <summary>
		/// 默认单位
		/// </summary>
		private string m_defaultDep="";
		public string defaultDep
		{
			get
			{
				 return this.m_defaultDep; 
			}
			set
			{
				this.m_defaultDep=value; 
			}
		}
		

		/// <summary>
		/// 当前人员对应的行信息
		/// </summary>
		private DataRow mUserRow=null;
		public DataRow drwInfo
		{
			get
			{
				return mUserRow;
			}

		}

		#endregion

		#region 函数
		/// <summary>
		/// 取组信息
		/// </summary>
		/// <param name="struser"></param>
		private void setUserGroup(string struser)		
		{
			this.gsGroupList += ",'" + struser + "'";
			string strSql = " select za0100,za9996 from xe01 where za0100 = '" + struser + "'";
			DataTable dt=this.DataOperator.GetDataTable(strSql);
			if(dt.Rows.Count>0)
			{
				if(dt.Rows[0][1] == null || dt.Rows[0][1].ToString() =="")
					return;
				setUserGroup(dt.Rows[0][1].ToString());
			}
		}

		/// <summary>
		/// 根据一条记录设置用户类的属性
		/// </summary>
		/// <param name="dr"></param>
		private void SetUserProperty(DataRow dr)
		{
			try
			{
				
				this.m_UserCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]); //用户编码
				this.m_UserId=Convert.IsDBNull( dr["XF01ID"])?0:Convert.ToInt64(dr["XF01ID"]); //用户序号
				this.m_LoginName=Convert.IsDBNull( dr["ZA0101"])?"":Convert.ToString(dr["ZA0101"]); //用户名称
				this.m_PassWord=Convert.IsDBNull( dr["XF0102"])?"":Convert.ToString(dr["XF0102"]); //用户密码
				this.m_UserDescription=Convert.IsDBNull( dr["XF0103"])?"":Convert.ToString(dr["XF0103"]); //用户昵称
				this.m_UserGroup=Convert.IsDBNull( dr["XF0101"])?"":Convert.ToString(dr["XF0101"]); //用户所属的组
				this.m_BeginDate=Convert.IsDBNull( dr["ZB9991"])?"":Convert.ToString(dr["ZB9991"]);  //起始时间
				this.m_EndDate=Convert.IsDBNull( dr["ZB9992"])?"":Convert.ToString(dr["ZB9992"]); //截止时间
				this.m_MemberCode=Convert.IsDBNull( dr["XF0104"])?"":Convert.ToString(dr["XF0104"]); //用户所对应的人员编码

				//XF0170 默认单位
				if(dr.Table.Columns.Contains("XF0170"))
				{
					this.m_defaultDep=Convert.IsDBNull( dr["XF0170"])?"":Convert.ToString(dr["XF0170"]); 
				}



				/*2004.06.30

				//新增字段
				 //XF0105部门
				if(dr.Table.Columns.Contains("AE0122"))
				{
					this.m_Department=Convert.IsDBNull( dr["AE0122"])?"":Convert.ToString(dr["AE0122"]); 
					//取部门描述
					string tempstr="select ZA0100,ZA0101 from ab01 where ZA0100='" + this.m_Department + "'";
					DataTable tempTable =this.DataOperator.GetDataTable(tempstr);
					if(tempTable.Rows.Count>0)
					{
						this.m_DepartmentDesc=tempTable.Rows[0]["ZA0101"].ToString();  
				    }
				}
				 //XF0106职务
				if(dr.Table.Columns.Contains("XF0106"))
				{
					this.m_Duty=Convert.IsDBNull( dr["XF0106"])?"":Convert.ToString(dr["XF0106"]); 
				}
				 //XF0107性别
				if(dr.Table.Columns.Contains("XF0107"))
				{
					this.m_Sex=Convert.IsDBNull( dr["XF0107"])?"":Convert.ToString(dr["XF0107"]); 
				}
				
				*/

				//判断用户组是否为管理员组
				
				m_GroupType="3";
				this.m_GroupType=Convert.IsDBNull( dr["XE0101"])?"":Convert.ToString(dr["XE0101"]); //用户所属的组的类别
				
				if(this.m_GroupType=="0")
				{
					this.m_IsManageGroup=true; 
				}
				else
				{
					this.m_IsManageGroup=false; 
				}
				
			}
			catch(Exception e)
			{
				throw new Exception ("SetUserProperty: " + e.Message );
			
			}

		}
		

	
		#endregion
		

	} //class

}  //namespace
