#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CUsers 的摘要说明。用户的集合类
	/// </summary>
	public class CUsers : MyBase
	{

		#region 全局变量

		 /// <summary>
		 /// 存放用户信息的集合
		 /// </summary>
		  private SortedList mUserList=new SortedList();  
		/// <summary>
		/// 定位用户的集合
		/// </summary>
		  private SortedList mLocateList=new SortedList(); 
		/// <summary>
		/// 排序用户的集合
		/// </summary>
		  private SortedList OrderByList=new SortedList(); 
 

		#endregion

		/// <summary>
		/// 读取所有的用户
		/// </summary>
		public CUsers(String[] ConnectInfo) : base(ConnectInfo)
		{
			
			this.GetAndSetUserInfo(""); 
			
		}


		/// <summary>
		/// 带过滤条件
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="Filter"></param>
		public CUsers(String[] ConnectInfo,string Filter) : base(ConnectInfo)
		{
			
			this.GetAndSetUserInfo(Filter); 
			
		}




		#region 属性
		    
	    /// <summary>
	    /// 用户的数目
	    /// </summary>
		public int Count
		{
			get
			{
				return mUserList.Count;
			}
	
		}

		/// <summary>
		/// 指定索引的某个用户
		/// </summary>
		public CUser this[int index]
		{
			get
			{
				return (CUser)mUserList.GetByIndex(index); 
			}
		}

	
		#endregion

		#region 私有函数

		/// <summary>
		/// 读取并设置用户信息
		/// </summary>
		private void GetAndSetUserInfo(string Filter)
		{
			DataTable dt;
			int i;

			try
			{

				///返回所有用户的表
				dt=GetUsersTable(Filter);
				///设置每个用户的属性
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					this.SetUserProperty(dt.Rows[i]);  
				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}

		}


		/// <summary>
		///读取用户信息uc01
		/// </summary>
		/// <param name="Filter"></param>
		/// <returns></returns>
		private DataTable GetUsersTable(string Filter)
		{
			DataTable dt;
			String SqlStr;
			

			try
            
			{
				SqlStr="select a.*,b.XE0101 from XF01 a,XE01 b where a.XF0101=b.za0100 and " + Filter;
				dt=this.DataOperator.GetDataTable(SqlStr); 
				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// 根据一条记录设置用户类的属性
		/// </summary>
		/// <param name="dr"></param>
		private void SetUserProperty(DataRow dr)
		{
            CUser tempCUser;

			try
			{

				tempCUser=new CUser(ConnectInfo ,dr);
				this.mUserList.Add(mUserList.Count,tempCUser);   
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}


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
		

		#region 公共函数

		/// <summary>
		/// 添加新用户（处理Id);
		/// </summary>
		public void AddNew(SortedList FieldValueList,SortedList ForeignKeyList)
		{
		
			long nId;

			try
			{

		
				//1.获取当前的Id
				nId=this.GetAddId("XF01",ForeignKeyList);
				string IdName="XF01ID";
				IdName=IdName.ToUpper(); 

				//设置ID的值 
				FieldValueList[IdName]=nId;
				ForeignKeyList.Add("ZA0100", FieldValueList["ZA0100"].ToString()); 
				this.DataOperator.AddOneRec("XF01",FieldValueList,ForeignKeyList);  


			
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}



		/// <summary>
		/// 删除指定的用户
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="WhereSql"></param>
		public bool DeleteUser(string InfoId,string DeleteUserCode)
		{
			
			String SqlStr;
			

			try
            
			{
				
				SqlStr="delete from " + InfoId + " where ZA0100='"+ DeleteUserCode + "'"; //删除用户
				return this.DataOperator.ExecuteSql(SqlStr);

				
			}
			catch(Exception e)
			{
				throw new Exception(e.Message ); 
			}

		}


		/// <summary>
		/// 判断是否已存在相同的登录名
		/// </summary>
		/// <param name="UserCode"></param>
		/// <returns></returns>
		public bool IsExistLoginName(string UserLoginName)
		{
			bool flag;
			string str;
			DataTable dt;

			str="select * from XF01 where ZA0101='" + UserLoginName + "'";
			dt=this.DataOperator.GetDataTable(str);
			if(dt.Rows.Count >0)
			{
				flag=true;
			}
			else
			{
				flag=false;
			}

			return flag;

		}


		#endregion


	}//class
}//NameSpace
