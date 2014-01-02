using System;
using GMIS.CommonRightDataAccess;
using System.Data; 
using System.Collections; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CStructure 的摘要说明：对象结构类
	/// 对象类
	/// </summary>
	public class CStructure : MyBase
	{


		public CStructure(String[] ConnectInfo) : base(ConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑
//				this.ConnectInfo =ConnectInfo;
//				this.DataOperator=new CDataOperator(this.ConnectInfo);
//				this.SqlBuilder=new CSqlBuilder();  
		}


		public CStructure(String[] ConnectInfo,String InfoId) : base(ConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑

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


		#region 全局变量

		SortedList mLocateList=new  SortedList();
 
		#endregion

		#region 属性

		/// <summary>
		/// 对象名
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
		/// 对象描述
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
		/// 对象简称
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
		/// 父对象
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
		/// 是否有子对象
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
		/// 对象类型
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
		/// 排序
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
		/// 主键字段
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
		/// 条件
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
		/// 状态
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
		/// 常量Id
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
		/// 对象的层数：1表示第一层。
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
		/// 对象是否有暗表：0：没有 1：有
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

		#region 公共函数

		
		/// <summary>
		/// 读取指定对象下的子对象
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

				
				//读模块对象ua01
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
		/// 根据主对象读取所有的子对象，非草稿状态的
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

		#region 私有函数

		/// <summary>
		///读取指定对象下的子对象
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
		/// 读取指定对象
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

				
				//读模块对象ua01
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
		/// 根据一条记录设置结构类的属性
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
