#define DEBUG


using System;
using GMIS.CommonRightDataAccess;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.WebCommonRightBusinessRule
{
	/// <summary>
	/// CCommonRight 的摘要说明。
	/// 通用权限检测
	/// </summary>
	public class CCommonRight : GMIS.CommonRightBusinessRule.MyBase
	{
		public CCommonRight(string[] MyConnectInfo) : base(MyConnectInfo)
		{
			//
			// TODO: 在此处添加构造函数逻辑
			
			//
		}


		/// <summary>
		/// 判断是否存在指定用户
		/// </summary>
		/// <param name="UserLoginName"></param>
		/// <returns></returns>
		public bool gsIsExistUser(string UserId)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC01", " where ZA0101='" + UserId + "'");
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}

		}


		/// <summary>
		/// 判断用户密码是否正确
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="PassWord"></param>
		/// <returns></returns>
		public bool gsIsPasswdCorrect(string UserId,string PassWord)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC01", " where ZA0101='" + UserId + "' and UC0112='" + PassWord + "'");
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}


		/// <summary>
		/// 用户是否有创建用户的权限
		/// </summary>
		/// <param name="UserId"></param>
		/// <returns></returns>
		public bool gsCanCreateUser(string UserId)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC01", " where ZA0101='" + UserId + "' and UC0113='1'" );
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}


		/// <summary>
		/// 用户是否有授权的权限
		/// </summary>
		/// <param name="UserId"></param>
		/// <returns></returns>
		public bool gsCanGrant(string UserId)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC01", " where ZA0101='" + UserId + "' and UC0114='1'" );
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}


		/// <summary>
		/// 用户是否启动
		/// </summary>
		/// <param name="UserId"></param>
		/// <returns></returns>
		public bool gsIsActive(string UserId)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC01", " where ZA0101='" + UserId + "' and UC0115='1'" );
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}


		/// <summary>
		/// 判断用户是否有指定模块的权限:能否登录到该模块
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public bool gsHasRightForModule(string UserId,string ModuleCode)
		{
			string str;
			DataTable dt;

			try
			{
				str=this.SqlBuilder.GetFilterSql("UC02", " where ZA0100='" + UserId + "' and ZC9996='" + ModuleCode + "'" );
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					return true;
				}
				else
				{
					return false;
				}
			}
			catch
			{
				return false;
			}
		}


		/// <summary>
		/// 判断用户对某个主对象的的子对象或相关对象是否有写的权限
		/// 从系统模块对象表UA01中判断指定的相关对象是否在读写对象中
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="ModuleCode"></param>
		/// <param name="MainObject">4位</param>
		/// <param name="SubObject"></param>
		/// <returns></returns>
		public bool gsCanWriteForRelateObject(string UserId,string MainObject,string SubObject,string SubObejctType)
		{
			string str;
			//string[] strWriteObjectArray;
			string strWriteObject;
			DataTable dt;

			try
			{
				if(SubObejctType=="1")  //读写子对象
				{
					str="select UA0112 from ua01 where UA0110='" + MainObject + "' and ZB0199='1'";
				}
				else  //读写相关对象
				{
						str="select UA0114 from ua01 where UA0110='" + MainObject + "' and ZB0199='1'";
				}
				
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					strWriteObject=dt.Rows[0].ToString();
					//strWriteObjectArray=strWriteObject.Split(','); 
					if(strWriteObject.IndexOf(SubObject)>0)
					{
						return true;
					}
					else
					{
						return false;
					}
									
				}
				else
				{
					return false;
				}
				
			}
			catch
			{
				return false;
			}
		
		}


		/// <summary>
		/// 返回指定用户在某个应用程序中的可用菜单项的列表
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="AppName"></param>
		/// <returns></returns>
		public DataTable gsGetEnableItemForApp(string UserId,string AppName)
		{
			string str;
			DataTable dt;

			try
			{
				str="select distinct a.za0101 from ua01 a,uc02 b where a.za0100=b.zc9996 and a.zb0199='2' and b.za0100='" + UserId + "' and a.ua0115='" + AppName + "'";
				dt=this.DataOperator.GetDataTable(str);
				return dt;
			}
			catch
			{
				return null;
			}
				
		}


		/// <summary>
		/// 返回Where后的Sql语句,带Select,返回对象的编码Za0100,如：select AA01.ZA0100 from AA01 where [AA01.ZA0100]='05';
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="MainObject"></param>
		/// <param name="?"></param>
		/// <returns></returns>
		public string gsQueryResult(string UserId,string MainObject,string BaseExpr,string BaseItem)
		{

			string SelectSql="";
			
			DMServer.Common.ConfigMy.ConnectInfo=this.ConnectInfo;    
			AppRptCond.frm_rptCond  myFrm_rtpCond=new AppRptCond.frm_rptCond();
  
			SelectSql=myFrm_rtpCond.gsReturnSelect(MainObject,BaseExpr,BaseItem,"",out "",out "");

            
			return SelectSql;

		}

	
		/// <summary>
		/// 根据 主对象/条件表达式/条件表达项 获取最终的Sql过滤语句,不带Select,如：[AA01.ZA0100]='05' 
		/// </summary>
		/// <param name="MainObject"></param>
		/// <param name="BaseExpr"></param>
		/// <param name="BaseItem"></param>
		/// <returns></returns>
		public string gsCreateSqlCond(string UserId,string MainObject,string BaseExpr,string BaseItem)
		{
			string SelectSql="";
			
			DMServer.Common.ConfigMy.ConnectInfo=this.ConnectInfo;    
			AppRptCond.frm_rptCond  myFrm_rtpCond=new AppRptCond.frm_rptCond();
  
			SelectSql=myFrm_rtpCond.gsReturnSelect(MainObject,BaseExpr,BaseItem,"",out "",out "");

            
			return SelectSql;


		}


	}//class
}//namespace
