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
	/// CCommonRight ��ժҪ˵����
	/// ͨ��Ȩ�޼��
	/// </summary>
	public class CCommonRight : GMIS.CommonRightBusinessRule.MyBase
	{
		public CCommonRight(string[] MyConnectInfo) : base(MyConnectInfo)
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			
			//
		}


		/// <summary>
		/// �ж��Ƿ����ָ���û�
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
		/// �ж��û������Ƿ���ȷ
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
		/// �û��Ƿ��д����û���Ȩ��
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
		/// �û��Ƿ�����Ȩ��Ȩ��
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
		/// �û��Ƿ�����
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
		/// �ж��û��Ƿ���ָ��ģ���Ȩ��:�ܷ��¼����ģ��
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
		/// �ж��û���ĳ��������ĵ��Ӷ������ض����Ƿ���д��Ȩ��
		/// ��ϵͳģ������UA01���ж�ָ������ض����Ƿ��ڶ�д������
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="ModuleCode"></param>
		/// <param name="MainObject">4λ</param>
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
				if(SubObejctType=="1")  //��д�Ӷ���
				{
					str="select UA0112 from ua01 where UA0110='" + MainObject + "' and ZB0199='1'";
				}
				else  //��д��ض���
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
		/// ����ָ���û���ĳ��Ӧ�ó����еĿ��ò˵�����б�
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
		/// ����Where���Sql���,��Select,���ض���ı���Za0100,�磺select AA01.ZA0100 from AA01 where [AA01.ZA0100]='05';
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
		/// ���� ������/�������ʽ/��������� ��ȡ���յ�Sql�������,����Select,�磺[AA01.ZA0100]='05' 
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
