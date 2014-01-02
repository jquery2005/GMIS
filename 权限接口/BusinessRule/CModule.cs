#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 



namespace  GMIS.CommonRightBusinessRule
{


	


	/// <summary>
	/// CModel 的摘要说明。系统模块对象
	/// </summary>
	/// 
	public class CModule : MyBase
	{
		public CModule(string[] ConnectInfo) : base(ConnectInfo)
		{
			
		}


		public CModule(string[] ConnectInfo,string ModuleCode) : base(ConnectInfo)
		{
			string str;
			DataTable dt;
			

			try
			{

				str=this.SqlBuilder.GetFilterSql("XD01"," Where ZA0100='" + ModuleCode + "'","");
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					SetModuleProperty(dt.Rows[0]);
				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
  
  
		}

		public CModule(string[] ConnectInfo,DataRow dr) : base(ConnectInfo)
		{
          SetModuleProperty(dr);
		}
				

	#region 属性
		
		/// <summary>
		/// 模块编码
		/// </summary>
		private String m_MCode="";
		public String MCode
		{
			get
			{
				return m_MCode;
			}
			set
			{
				m_MCode=value;
			}
		}

		/// <summary>
		/// 模块序号
		/// </summary>
		private long m_ModuleId=0;
		public long MId
		{
			get
			{
				return m_ModuleId;
			}
			set
			{
				m_ModuleId=value;
			}
			

		}


		/// <summary>
		/// 模块名称
		/// </summary>
		private String m_MName="";
		public String MName
		{
			get
			{
				return m_MName;
			}
			set
			{
				m_MName=value;
			}
		}



		/// <summary>
		/// 模块类别
		/// </summary>
		private String m_MType="";
		public String MType
		{
			get
			{
				return m_MType;
			}
			set
			{
				m_MType=value;
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
		/// 父指针
		/// </summary>
		private String m_PPtr="";
		public String PPtr
		{
			get
			{
				return m_PPtr;
			}
			set
			{
				m_PPtr=value;
			}
		}


		/// <summary>
		/// 子指针
		/// </summary>
		private String m_CPtr="";
		public String CPtr
		{
			get
			{
				return m_CPtr;
			}
			set
			{
				m_CPtr=value;
			}
		}


		/// <summary>
		/// 主对象
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
		/// 应用程序名称
		/// </summary>
		private String m_AppName="";
		public String AppName
		{
			get
			{
				return m_AppName;
			}
			set
			{
				m_AppName=value;
			}
		}



		/// <summary>
		/// 调用来源
		/// </summary>
		private String m_LoadSource="";
		public String LoadSource
		{
			get
			{
				return m_LoadSource;
			}
			set
			{
				m_LoadSource=value;
			
			}
		
		}
		

		/// <summary>
		/// 条件表达式
		/// </summary>
		private string m_baseExpr="";
		public string baseExpr
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


		/// <summary>
		/// 模块图标
		/// </summary>
		private object m_ModuleImage;
		public object ModuleImage
		{
			get
			{
				return m_ModuleImage;
			}
			set
			{
				m_ModuleImage=value;
			}

		}


		/// <summary>
		/// 备注
		/// </summary>
		private string m_ModuleMemo;
		public string ModuleMemo
		{
			get
			{
				return m_ModuleMemo;
			}
			set
			{
				m_ModuleMemo=value;
			}
		}


		/// <summary>
		/// 参数值
		/// </summary>
		private string m_Parameter;
		public string Parameter
		{
			get
			{
				return m_Parameter;
			}
			set
			{
				m_Parameter=value;
			}
		}

		
		/// <summary>
		/// 菜单项标识名称
		/// </summary>
		private string m_ItemTag;
		public string ItemTag
		{
			get
			{
				return m_ItemTag;
			}
			set
			{
				m_ItemTag=value;
			}
		}

		/// <summary>
		/// 应用程序内部授权标识
		/// </summary>
		private string m_ModuleFlag;
		public string ModuleFlag
		{
			get
			{
				return  m_ModuleFlag;
			}
			set
			{
				m_ModuleFlag=value;
			}
		}


		/// <summary>
		/// 模块录入条件，用于主对象的录入条件
		/// </summary>
		private string m_InputCondition;
		public string InputCondition
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



		/// <summary>
		/// 是否分层模块
		/// </summary>
		private bool m_IsDelaminate;
		public bool IsDelaminate
		{
			get
			{
				return m_IsDelaminate;
			}
			set
			{
				m_IsDelaminate=value;
			}
		}


	#endregion

	#region 公共函数

 		

		/// <summary>
		/// 读取指定模块下的子模块
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public CModule[] GetModules(String[] ConnectInfo,String PPtr)
		{
			DataTable dt;
			CModule[] tempModuleArray;

			try
			{

				
  
				//读Web模块对象ua01
				dt=this.GetModuleTable(PPtr); 
				tempModuleArray=new CModule[dt.Rows.Count];
				for(int i=0;i<=dt.Rows.Count -1;i++)
				{
					tempModuleArray[i]=new  CModule(ConnectInfo,dt.Rows[i]);   
				}
		
				return tempModuleArray;
			}
			catch
			{
				return null;
			}


		}

	
		/// <summary>
		/// 添加新模块对象（处理Id);
		/// </summary>
		public void AddNew(SortedList FieldValueList,SortedList ForeignKeyList)
		{
		
			long nId;

			try
			{

		
				//1.获取当前的Id
				nId=this.GetAddId("XD01",ForeignKeyList);
				string IdName="XD01ID";
				IdName=IdName.ToUpper(); 

				//设置ID的值 
				FieldValueList[IdName]=nId;
                ForeignKeyList.Add("ZA0100", FieldValueList["ZA0100"].ToString()); 
				this.DataOperator.AddOneRec("XD01",FieldValueList,ForeignKeyList);  


			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}


		/// <summary>
		/// 修改模块对象
		/// </summary>
		public void Update(SortedList FieldValueList,SortedList PrimaryKeyList)
		{
			
			try
			{

				this.DataOperator.ModifyOneRec("XD01",FieldValueList, PrimaryKeyList); 
			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}
		}



		/// <summary>
		/// 删除模块对象（同时删除其子模块）
		/// </summary>
		/// <param name="ModuleCode"></param>
		public void Delete(string ModuleCode)
		{
			

			DeleteForTree(ModuleCode);
			
		}
			


		/// <summary>
		/// 递归处理：删除模块对象（同时删除其子模块）
		/// </summary>
		/// <param name="ModuleCode"></param>
		public void DeleteForTree(string ModuleCode)
		{
			string str;
			DataTable dt;
            int i;
			string tempSubCode;

			try
			{

				DeleteOneModule(ModuleCode);
				str="select * from  ua01 where za9996='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str); 
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					tempSubCode=dt.Rows[i]["ZA0100"].ToString();  
					//递归处理
					Delete(tempSubCode);

				}
			}
			catch(Exception ee)
			{
				throw new Exception (ee.Message );
			}

		}
			

		/// <summary>
		/// 取指定模块下的子模块的最大编码
		/// </summary>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public string GetSubMaxCode(string PPtr)
		{
			string str;
			DataTable dt;
			string subMaxCode="01";

			try
			{

				str="select right(max(za0100),len(max(za0100))-len('" + PPtr + "')) from ua01  where za9996='" + PPtr + "'";
				dt=this.DataOperator.GetDataTable(str);
				subMaxCode=dt.Rows[0][0].ToString();  
				if(subMaxCode=="")
				{
					subMaxCode="00";
				}
			
				return subMaxCode;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}
		

		/// <summary>
		/// 复制模块
		/// </summary>
		/// <param name="SourceModule">源模块编码</param>
		/// <param name="DesModule">目标模块编码</param>
		public string  CopyModule(string SourceModule,string DesModule)
		{
			string sql;
			string CurPreCode="";
			DataTable dt;

			try
			{
			
				sql="exec gsp_copy_module '" + SourceModule + "','" + DesModule + "'";
				dt=this.DataOperator.GetDataTable(sql);  
				CurPreCode=dt.Rows[0][0].ToString();

				return CurPreCode;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// 获取指定模块的子模块的当前可用编码
		/// </summary>
		/// <param name="SourceModule">源模块编码</param>
		/// <param name="DesModule">目标模块编码</param>
		public string  GetCurCode(string PPtr)
		{
			string sql;
			string CurCode="";
			DataTable dt;

			try
			{
			
				sql="exec gsp_GetWebCurModuleCode '" + PPtr + "'";
				dt=this.DataOperator.GetDataTable(sql);  
				CurCode=dt.Rows[0][0].ToString();

				return CurCode;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// 修改模块的子指针
		/// </summary>
		/// <param name="ModuleCode"></param>
		public void UpdateCPtr(string ModuleCode,bool HasChild)
		{
			string str;
			string value="0";

			try
			{
				if(HasChild)
				{
					value="1";
				}
				else
				{
					value="0";
				}

				str="update XD01 set za9997='" + value + "' where za0100='" + ModuleCode + "'";
				this.DataOperator.ExecuteSql(str);  
			}
			catch(Exception e)
			{
				throw new Exception("UpdateCPtr: " + e.Message ); 
			}
		}

	#endregion

	#region 私有函数

		/// <summary>
		///读取权限模块
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		private DataTable GetModuleTable(String CurPPtr)
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
				SqlStr=this.SqlBuilder.GetFilterSql("XD01",WhereSql,"");
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// 根据一条记录设置模块类的属性
		/// </summary>
		/// <param name="dr"></param>
		private void SetModuleProperty(DataRow dr)
		{
			try
			{
				this.m_MCode=Convert.IsDBNull( dr["ZA0100"])?"":Convert.ToString(dr["ZA0100"]);  //模块编码
				this.m_ModuleId=Convert.IsDBNull( dr["ZA0100"])?100:Convert.ToInt64(dr["XD01ID"]);  //模块序号
				this.m_MName=Convert.IsDBNull(dr["ZA0101"])?"":Convert.ToString(dr["ZA0101"]); //模块名称
				this.m_MType=Convert.IsDBNull( dr["ZB0199"])?"0":Convert.ToString(dr["ZB0199"]); //模块类别
				this.m_QueryCode=Convert.IsDBNull( dr["ZA9999"])?"":Convert.ToString(dr["ZA9999"]); //查询码
				this.m_PPtr=Convert.IsDBNull( dr["ZA9996"])?"":Convert.ToString(dr["ZA9996"]); //父指针
				this.m_CPtr=Convert.IsDBNull( dr["ZA9997"])?"":Convert.ToString(dr["ZA9997"]); //有无子项
				this.m_ModuleImage=dr["ZA9998"]; //模块图标 
				this.m_ModuleMemo=Convert.IsDBNull( dr["ZC9995"])?"":Convert.ToString(dr["ZC9995"]); //模块备注
				this.m_MainObject=Convert.IsDBNull( dr["XD0110"])?"":Convert.ToString(dr["XD0110"]); //主对象
				this.m_ReadOnlySubObject=Convert.IsDBNull( dr["XD0111"])?"":Convert.ToString(dr["XD0111"]); //只读子对象
				this.m_ReadWriteSubObject=Convert.IsDBNull( dr["XD0112"])?"":Convert.ToString(dr["XD0112"]); //读写子对象
				this.m_ReadOnlyRelateObject=Convert.IsDBNull( dr["XD0113"])?"":Convert.ToString(dr["XD0113"]); //只读相关对象
				this.m_ReadWriteRelateObject=Convert.IsDBNull( dr["XD0114"])?"":Convert.ToString(dr["XD0114"]); //读写相关对象
				this.m_AppName=Convert.IsDBNull( dr["XD0115"])?"":Convert.ToString(dr["XD0115"]); //调用的网页/应用程序名称
				this.m_LoadSource=Convert.IsDBNull( dr["XD0116"])?"":Convert.ToString(dr["XD0116"]); //调用来源
				this.m_baseExpr=Convert.IsDBNull( dr["XD0117"])?"":Convert.ToString(dr["XD0117"]); //条件表达式
				this.m_baseItem=Convert.IsDBNull( dr["XD0118"])?"":Convert.ToString(dr["XD0118"]); //条件表达项
				this.m_chineseItem=Convert.IsDBNull( dr["XD0119"])?"":Convert.ToString(dr["XD0119"]); //条件表达项的中文描述
				this.m_Parameter=Convert.IsDBNull( dr["XD011A"])?"":Convert.ToString(dr["XD011A"]); //参数
				this.m_ItemTag=Convert.IsDBNull( dr["XD011C"])?"":Convert.ToString(dr["XD011C"]); //菜单项显示名称
				this.m_ModuleFlag=Convert.IsDBNull( dr["XD011D"])?"":Convert.ToString(dr["XD011D"]); //应用程序内部授权标识
				this.m_InputCondition=Convert.IsDBNull( dr["XD011E"])?"":Convert.ToString(dr["XD011E"]); //模块主对象的录入条件
				this.m_IsDelaminate=Convert.IsDBNull( dr["XD011F"])?true:Convert.ToBoolean(Convert.ToInt16(dr["XD011F"])); //是否分层模块

			
			}
			catch(Exception e)
			{
				throw new Exception ("SetModuleProperty: " + e.Message );
			
			}
		}



		/// <summary>
		/// 删除一个模块对象
		/// </summary>
		private void DeleteOneModule(string tempMCode)
		{
			string str;

			str="delete from ua01 where za0100='" + tempMCode + "'";
			this.DataOperator.ExecuteSql (str); 
		}




		/// <summary>
		/// 获取当前添加的ID
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
