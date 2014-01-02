using System;
using System.Collections; 
using System.Data; 
using GMIS.CommonRightDataAccess;
using System.IO; 
using System.Windows.Forms;  
using System.Reflection; 
using System.Collections.Specialized;   
using System.Management;
using Microsoft.Win32;

namespace GMIS.CommonRightBusinessRule
{
	
	
	/// <summary>
	/// CCommonInfo ��ժҪ˵����ͨ����Ϣ��
	/// ��������/���ݿ���/�û��� ��ŵ������ļ�GmisInfo.ini��(servername,gmisinfo,sa)
	/// </summary>
	public  class CCommonInfo : MyBase
	{

		public CCommonInfo()
		{
		
		}


		public CCommonInfo(string CurHostName,string CurDataBase,string CurAppLoginName,string CurAppLoginPassword)
		{
	

			Init(CurHostName,CurDataBase,CurAppLoginName,CurAppLoginPassword);
			
		}


		public CCommonInfo(string[] ConnectInfo) 
		{
		

			Init(ConnectInfo[0],ConnectInfo[1],ConnectInfo[2],ConnectInfo[3]); 
			
		}
	

		
		#region ȫ�ֱ���

		private string mConfigFile;

		private int mDogErr=-1;

		private DataTable mdtbUserModuleRight; //��ǰ�û���ģ��Ȩ��

		private string mModuleMainObject; //ģ���������
		private SortedList mUserReadOnlyObjectList;  //�û���ֻ���Ӷ���
		private SortedList mUserReadWriteObjectList;  //�û��Ķ�д�Ӷ���
		private SortedList mUserObjectList;  //�û��Ķ�д/ֻ���Ӷ���
		private string mModuleInputCondition;  //ģ��¼������
		private string mUserInputCondition;  //�û���¼������
		private string mModuleParam;  //�û���ģ�����
		  
		
		private string myDogValue="flx_single3.0";
		  
		#endregion
		
        #region ����

        
         
		/// <summary>
		/// ������������
		/// </summary>
		private string m_HostName;
		public string HostName
		{
			get
			{
				return m_HostName;
			}
			set
			{
				m_HostName=value;
			}

		}
		

		/// <summary>
		/// ���ݿ�����
		/// </summary>
		private string m_DataBase;
		public string DataBase
		{
			get
			{
				return m_DataBase;
			}
			set
			{
				m_DataBase=value;
			}
		}


		/// <summary>
		/// ���ݿ��¼��
		/// </summary>
		private string m_SqlLoginName="";
		public  string SqlLoginName
		{
			get
			{
				if (m_SqlLoginName=="")
				{
					m_SqlLoginName=this.gsGetConfigPropertyValue("���ݿ�","UserName");
					if (m_SqlLoginName=="")
					{
						m_SqlLoginName="gmis2002";
					}
				}
				return m_SqlLoginName;
			}
			set
			{
				m_SqlLoginName=value;
			}
		}


		/// <summary>
		/// ���ݿ��¼����
		/// </summary>
		private  string m_SqlLoginPassWord="";
		public string SqlLoginPassWord
		{
			get
			{
				if (m_SqlLoginPassWord=="")
				{
					m_SqlLoginPassWord=this.GetPassword();
				}
				return m_SqlLoginPassWord;
			}
			set
			{
				m_SqlLoginPassWord=value;
			}
			
		}


		/// <summary>
		/// ϵͳ��¼��
		/// </summary>
		private   string m_AppLoginName="sa";
		public  string AppLoginName
		{
			get
			{
				return m_AppLoginName;
			}
			set
			{
				
				m_AppLoginName=value;
				//m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2");   
				
			}
		}


		/// <summary>
		/// ϵͳ��¼����
		/// </summary>
		private  string m_AppLoginPassWord="";
		public  string AppLoginPassWord
		{
			get
			{
				return m_AppLoginPassWord;
			}
			set
			{
				m_AppLoginPassWord=value;
			}
			
		}
			

		/// <summary>
		/// ģ�����
		/// </summary>
		private string m_CurModuleCode;
		public string CurModuleCode
		{
			get
			{
				return m_CurModuleCode;
 
			}
			set
			{
				m_CurModuleCode=value;
			}
		}
	
		
		/// <summary>
		/// ��ǰϵͳ��¼���û���
		/// </summary>
		private  CUser m_CurUser=null;
		public  CUser CurUser
		{
			get
			{
				if(m_CurUser == null)
				{
					m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2"); 
				}
				return m_CurUser;
					
			}
		}
		  

		/// <summary>
		/// �û����õĲ˵����б�
		/// </summary>
		private SortedList m_MenuItemList=new SortedList();
		public SortedList gsMenuItemList
		{
			get
			{
				return m_MenuItemList;
			}
			
		}


		/// <summary>
		/// ָ��ģ���µ����в˵�
		/// </summary>
		private SortedList m_SourceMenuItemList=new SortedList();
		public SortedList gsSourceMenuItemList
		{
			get
			{
				return m_SourceMenuItemList;
			}
			
		}


		/// <summary>
		/// ֻ���Ӷ����б�
		/// </summary>
		private SortedList m_ReadOnlySubObject=new SortedList();
		public SortedList gsReadOnlySubObject
		{
			get
			{
				return m_ReadOnlySubObject;
			}
		}


		/// <summary>
		/// ��д�Ӷ����б�
		/// </summary>
		private SortedList m_ReadWriteSubObject=new SortedList();
		public SortedList gsReadWriteSubObject
		{
			get
			{
				return m_ReadWriteSubObject;
			}
		}


		/// <summary>
		/// ֻ����ض����б�
		/// </summary>
		private SortedList m_ReadOnlyRealteObject=new SortedList();
		public SortedList gsReadOnlyRelateObject
		{
			get
			{
				return m_ReadOnlyRealteObject;
			}
		}


		/// <summary>
		/// ��д��ض����б�
		/// </summary>
		private SortedList m_ReadWriteRealteObject=new SortedList();
		public SortedList gsReadWriteRelateObject
		{
			get
			{
				return m_ReadWriteRealteObject;
			}
		}


		/// <summary>
		/// ģ������
		/// </summary>
		private string m_ModuleDesription="";
		public string gsModuleDescription
		{
			get
			{
				//m_ModuleDesription=GetModuleDesc(m_CurModuleCode);
				return m_ModuleDesription;

			}
			
		}



		private string m_curLogId="";

		/// <summary>
		/// ��ȡģ���¼����������
		/// </summary>
		public SortedList gsInputCondition
		{
			get
			{
				return GetModuleInputCondition();
			}
		
		}

		
		public bool gsIsDebug
		{
			get
			{
				if(this.gsGetConfigPropertyValue("���Թ���","�Ƿ����").ToUpper ()== "TRUE")
				{
					return true;
				}
				else
				{
					return false;
				}
			}
		}


		/// <summary>
		/// �������Ĵ����
		/// </summary>
		public int gsDogErr
		{
			get
			{
				return mDogErr;
			}
		}




		#endregion

		#region ���к���

		#region Ȩ���ж�
		
		/// <summary>
		/// �ж��û������Ƿ���ȷ
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="UserPassword"></param>
		/// <returns></returns>

		public bool gsIsPasswordCorrect(out string ErrMsg)
		{
			return gsIsPasswordCorrect(m_AppLoginName,m_AppLoginPassWord,out ErrMsg); 

			
		}


		/// <summary>
		/// �ж��û��Ƿ��ܽ�ĳ��ģ��
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public bool gsCanEnterModule(string ModuleCode,out string ErrMsg)
		{
			bool flag=false;



			try
			{
				this.m_CurModuleCode=ModuleCode; 

				/*  2004.06.30  ע��
				if(!gsIsPasswordCorrect(out ErrMsg))
				{
					//throw new Exception(strErr);
					return false;
				}
				*/

				//ȡ�û���Ϣ
				if(m_CurUser == null)
				{
					m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2"); 

				}

				if(m_CurUser.UserCode =="")
				{
					ErrMsg="�޴��û�";
					return false;
				}
			     //2004.01.10  �������޸� ,���û��������
				else if(m_CurUser.PassWord != this.gsGetEncryptMsg(m_AppLoginPassWord))
				{
					ErrMsg="�������";
					return false;
				}
				/*
				else if(m_CurUser.PassWord != m_AppLoginPassWord )
				{
					ErrMsg="�������";
					return false;
				}
				*/

				//����ģ����ӵ�¼��Ϣ
				if(CanEnterModule(out ErrMsg))
				{
					flag=true;
				}
				else
				{
					if(ErrMsg == "")
					{
						ErrMsg="��Ȩ��¼��ģ�飡";
					}
					flag=false;
				}


				if(flag)
				{
					

					//��ӵ�¼��Ϣ
					gsInserLoginLog(); 

					//ȡ��ǰ�û��Ķ�д/ֻ���Ӷ���
					this.GetReadWriteObjectForUser(); 
				}
			

				return flag;
			}//try
			catch(Exception e)
			{
				ErrMsg=e.Message; 
				return false;
			}
			
		}

		

		/// <summary>
		/// ��д��ֻ���Ӷ���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetSubObject(string UserCode,string ModuleCode)
		{

			return this.mUserObjectList; 

			/*
			SortedList sl1;
			SortedList sl2;
			SortedList sl3=new SortedList();

			try
			{

				sl1=gsGetReadOnlySubObject(UserCode,ModuleCode);
				sl2=gsGetReadWriteSubObject(UserCode,ModuleCode);

				sl3=new SortedList();
				for(int i=0;i<sl1.Count;i++)
				{
					if(! sl3.ContainsKey(sl1.GetKey(i)))
					{
						sl3.Add(sl1.GetKey(i),sl1.GetByIndex(i));   
					}
				}
				for(int i=0;i<sl2.Count;i++)
				{
					if(! sl3.ContainsKey(sl2.GetKey(i)))
					{
						sl3.Add(sl2.GetKey(i),sl2.GetByIndex(i));   
					}
				}

				return sl3;
			}
			catch
			{
				return  sl3;
			}
			*/

		}


		/// <summary>
		/// ��д��ֻ����ض���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetRelateObject(string UserCode,string ModuleCode)
		{
			SortedList sl1;
			SortedList sl2;
			SortedList sl3;

			sl1=gsGetReadOnlyRelateObject(UserCode,ModuleCode);
			sl2=gsGetReadWriteRelateObject(UserCode,ModuleCode);

			sl3=new SortedList();
			for(int i=0;i<sl1.Count;i++)
			{
				sl3.Add(sl1.GetKey(i),sl1.GetByIndex(i));   
			}
			for(int i=0;i<sl2.Count;i++)
			{
				sl3.Add(sl2.GetKey(i),sl2.GetByIndex(i));   
			}

			return sl3;
		}



		/// <summary>
		/// ��ȡ�û���ĳ���������е�ֻ���Ӷ����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetReadOnlySubObject(string UserCode,string ModuleCode)
		{
			return this.mUserReadOnlyObjectList; 
			//return GetObjectForMainObject(UserCode,ModuleCode,"XE0211");
		
		}


		/// <summary>
		/// ��ȡ�û���ĳ���������еĶ�д�Ӷ����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetReadWriteSubObject(string UserCode,string ModuleCode)
		{
			return this.mUserReadWriteObjectList; 
			//return GetObjectForMainObject(UserCode,ModuleCode,"XE0212");
		}


		/// <summary>
		/// ��ȡ�û���ĳ���������е�ֻ����ض����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetReadOnlyRelateObject(string UserCode,string ModuleCode)
		{
			return GetObjectForMainObject(UserCode,ModuleCode,"XE0213");
		}


		/// <summary>
		/// ��ȡ�û���ĳ���������еĶ�д��ض����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetReadWriteRelateObject(string UserCode,string ModuleCode)
		{
			return GetObjectForMainObject(UserCode,ModuleCode,"XE0214");
		}

		
		/// <summary>
		/// ��ȡĳ��ģ�������Ȩ��
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public string gsGetModuleCondition(string ModuleCode)
		{
			string str;
			DataTable dt;
			string ConditionSql="";
			string BaseExpr="";
			string BaseItem="";
			string MainObject="";

			try
			{
				/*
			
				//��ȡģ���������
				str="select XD0110,XD0117,XD0118 from XD01 where ZA0100='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					MainObject=dt.Rows[0]["XD0110"].ToString();  //������
					BaseExpr=dt.Rows[0]["XD0117"].ToString();  //�������ʽ
					BaseItem=dt.Rows[0]["XD0118"].ToString();  //���������
				}
				ConditionSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				*/

				//2004/06.30  ȡģ������
				string ModuleSql="";
				DataRow[] drs;

				//�û�������
				drs=this.mdtbUserModuleRight.Select("UserGroup='c' and zc9996='" + ModuleCode + "'");  
				if(drs.Length>0)
				{
					MainObject=drs[0]["XE0210"].ToString();  //������
					BaseExpr=drs[0]["XE0201"].ToString();  //�������ʽ
					BaseItem=drs[0]["XE0202"].ToString();  //���������
					ModuleSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				}
				
				ConditionSql=ModuleSql;
				
				return ConditionSql;
			}
			catch
			{
				return "";
			}
			
		}


		/// <summary>
		/// ��ȡĳ��ģ�������Ȩ��ԭʼ��
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public void gsGetModuleCondition(string ModuleCode,out string  BaseExpr,out string BaseItem)
		{
			string str;
			DataTable dt;
			string MainObject="";

			BaseExpr="";
			BaseItem="";

			try
			{
				
			
				//��ȡģ���������
				str="select XD0110,XD0117,XD0118 from XD01 where ZA0100='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					MainObject=dt.Rows[0]["XD0110"].ToString();  //������
					BaseExpr=dt.Rows[0]["XD0117"].ToString();  //�������ʽ
					BaseItem=dt.Rows[0]["XD0118"].ToString();  //���������
				
				}
				
			}
			catch
			{
				
			}
			
		}



		/// <summary>
		/// ��ȡ�û���ĳ��ģ�������Ȩ�����
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public string gsGetMainObjectCondition(string UserLoginName,string ModuleCode)
		{
		
			string ConditionSql="";
			string BaseExpr="";
			string BaseItem="";
			string MainObject="";
		
			try
			{
			
			
				//2004/06.30  �û��������Ȩ�� ����  �û�������Ȩ��
				string UserGroupSql="";
				string UserSql="";
				DataRow[] drs;

				//�û�������
				drs=this.mdtbUserModuleRight.Select("UserGroup='a' and zc9996='" + ModuleCode + "'");  
				if(drs.Length>0)
				{
					MainObject=drs[0]["XE0210"].ToString();  //������
					BaseExpr=drs[0]["XE0201"].ToString();  //�������ʽ
					BaseItem=drs[0]["XE0202"].ToString();  //���������
					UserGroupSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				}
				

				//�û�����
				drs=this.mdtbUserModuleRight.Select("UserGroup='b' and zc9996='" + ModuleCode + "'");  
				if(drs.Length>0)
				{
					MainObject=drs[0]["XE0210"].ToString();  //������
					BaseExpr=drs[0]["XE0201"].ToString();  //�������ʽ
					BaseItem=drs[0]["XE0202"].ToString();  //���������
					UserSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				}
				
				if(UserGroupSql.Trim() != "" &&  UserSql.Trim() != "" )
				{
					ConditionSql="select ZA0100 from  " + MainObject + " where ZA0100 in(" + UserGroupSql + ") and ZA0100 in(" + UserSql + ")";
				}
				else
				{
					ConditionSql=UserGroupSql + UserSql;
				}

				//�����û���Ĭ�ϵ�λȨ��
				//cc 20050813 
				if(MainObject=="") MainObject="AA01";
				//end cc
				if(this.CurUser.defaultDep.Trim() != "" && MainObject=="AA01")
				{
					//cc 20050614 �����ȱʡ��λ����
					string depSql="(AB0111 like '" + this.CurUser.defaultDep + "%' or AB0110 like '" + this.CurUser.defaultDep + "%')";
					if(this.CurUser.defaultDep.Trim().IndexOf(",")>=0)
					{
						string[] list = this.CurUser.defaultDep.Trim().Split(',');
						depSql = "";
						for(int i=0;i<list.Length;i++)
						{
							depSql += "(AB0111 like '"+list[i]+"%' or AB0110 like '"+list[i]+"%') or ";
						}
						depSql = "("+depSql.Substring(0,depSql.Length - 4)+")";
					}
					//end cc
					if(ConditionSql.Trim() != "")
					{
						//cc
						//ConditionSql =ConditionSql + " and AB0110 like '" + this.CurUser.defaultDep + "%'"; 
						ConditionSql =ConditionSql + " and "+depSql; 
					}
					else
					{
						//cc
						//ConditionSql ="select ZA0100 from  " + MainObject + " where AB0110 like '" + this.CurUser.defaultDep + "%'"; 
						ConditionSql ="select ZA0100 from  " + MainObject + " where "+depSql; 
					}
				}


				//�ּ���Ȩ���û�������Ȩ��=�����������Ȩ��+�û�������Ȩ��+ģ�������Ȩ��+�û������˵�����Ȩ��
				string UserRelateCreateFilter=GetUserRelateCreateManFilter(UserLoginName,ModuleCode);
				if(ConditionSql.Trim() != "")
				{
					if(UserRelateCreateFilter.Trim() != "")
					{
						ConditionSql += " and " + UserRelateCreateFilter;
					}

				}
				else
				{
					if(UserRelateCreateFilter.Trim() != "")
					{
						ConditionSql = "select ZA0100 from  " + MainObject + " where " + UserRelateCreateFilter;
					}
				}
				
				return ConditionSql;
			}
			catch(Exception e)
			{
				string errmsg=e.Message ;
				return "";
			}
			
		}


		/// <summary>
		/// 2004.01.12 ���������ӣ�
		/// ȡ�û���������ش����˵�ģ���������ݹ�Ѱ��ֱ��ĳ���û���Ĵ�����Ϊadmin
		/// </summary>
		/// <param name="UserLoginName"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private string GetUserRelateCreateManFilter(string UserLoginName,string ModuleCode)
		{

			string sql;

			try
			{
		
				sql="select za0101,xf0101 from xf01";
				DataTable dtbUser=this.DataOperator.GetDataTable(sql);  //�û���Ϣ��  

				sql="select za0100,xk0103 from xe01";
				DataTable dtbGroup=this.DataOperator.GetDataTable(sql);  //�û�����Ϣ��  

				string curCreateMan=UserLoginName;
				string curGroup;

			
				string UserRelateCreateFilter="";
				while(curCreateMan.ToUpper() != "ADMIN")
				{
					//�û���������
					DataRow[] drsGroup=dtbUser.Select("ZA0101='" + curCreateMan + "'");
					if(drsGroup.Length >0)
					{
						curGroup=drsGroup[0]["XF0101"].ToString();
						//ȡ���û�������Ĵ�����
						DataRow[] drsCreateUser=dtbGroup.Select("ZA0100='" + curGroup + "'");
						if(drsCreateUser.Length>0)
						{
							curCreateMan=drsCreateUser[0]["XK0103"].ToString(); 
							//ȡ�ô����˵�ģ������
							string  UserSelfRight=GetUserSelfModuleRight(curCreateMan,ModuleCode);
							if(UserSelfRight.Trim() != "")
							{
								UserRelateCreateFilter +=" and ZA0100 in(" + UserSelfRight + ")";
							}
						}
						else
						{
							curCreateMan="ADMIN";
						}
					}
					else
					{
						curCreateMan="ADMIN";
					}
				}

				if(UserRelateCreateFilter != "")
				{
					UserRelateCreateFilter=UserRelateCreateFilter.Substring(4); 
				}

				return UserRelateCreateFilter;
			}
			catch(Exception e)
			{
				string errmsg=e.Message ;
				return "";
			}


		}


		/// <summary>
		/// ȡָ���û���ĳ��ģ�������Ȩ��
		/// </summary>
		/// <param name="UserLoginName"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private string GetUserSelfModuleRight(string UserLoginName,string ModuleCode)
		{
			string ConditionSql="";
			string BaseExpr="";
			string BaseItem="";
			string MainObject="";
			string str;

			try
			{

				str="(select '' as moduledesc,'' as moduleparam,zc9996,xe0210,xe0211,xe0212,xe0213,xe0214,xe021e,xe0201,xe0202,xe0203,'a' as usergroup  from xe02 where za0100 in(select xf0101 from xf01 where za0101='" + UserLoginName  + "') and zc9996='" + ModuleCode + "') "; 
				str += "  union ";
				str += "(select '' as moduledesc,'' as moduleparam,zc9996,xf0310,xf0311,xf0312,xf0313,xf0314,xf031e,xf0301,xf0302,xf0303,'b' as usergroup from xf03 where za0100 in(select za0100 from xf01 where za0101='" + UserLoginName + "') )";
				str += "  union ";
				str +="(select ZA0101 as moduledesc,xd011a as moduleparam,za0100,xd0110,xd0111,xd0112,xd0113,xd0114,xd011e,xd0117,xd0118,xd0119,'c' as usergroup  from xd01 where ZA0100='" + ModuleCode + "')";

				DataTable tempUserModuleRight=this.DataOperator.GetDataTable(str);  

				string UserGroupSql="";
				string UserSql="";
				DataRow[] drs;

				//�û�������
				drs=tempUserModuleRight.Select("UserGroup='a' and zc9996='" + ModuleCode + "'");  
				if(drs.Length>0)
				{
					MainObject=drs[0]["XE0210"].ToString();  //������
					BaseExpr=drs[0]["XE0201"].ToString();  //�������ʽ
					BaseItem=drs[0]["XE0202"].ToString();  //���������
					UserGroupSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				}
				

				//�û�����
				drs=tempUserModuleRight.Select("UserGroup='b' and zc9996='" + ModuleCode + "'");  
				if(drs.Length>0)
				{
					MainObject=drs[0]["XE0210"].ToString();  //������
					BaseExpr=drs[0]["XE0201"].ToString();  //�������ʽ
					BaseItem=drs[0]["XE0202"].ToString();  //���������
					UserSql=gsGetQueryResult(MainObject,BaseExpr,BaseItem);
				}
				
				if(UserGroupSql.Trim() != "" &&  UserSql.Trim() != "" )
				{
					ConditionSql="select ZA0100 from  " + MainObject + " where ZA0100 in(" + UserGroupSql + ") and ZA0100 in(" + UserSql + ")";
				}
				else
				{
					ConditionSql=UserGroupSql + UserSql;
				}

				return ConditionSql;
			}
			catch(Exception e)
			{
				string errmsg=e.Message ;
				return "";
			}
					
		}


		/// <summary>
		/// ��ȡ�û���ĳ��ģ�������Ȩ�����
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public void gsGetMainObjectCondition(string UserLoginName,string ModuleCode,out string  BaseExpr,out string BaseItem)
		{
			string str;
			DataTable dt;
			string MainObject="";
			int icount1 = 0,icount2 = 0;

			BaseExpr="";
			BaseItem="";


			try
			{
			
			
				//�����û���¼���Ƶø��û�����Ϣ
				CUser tempUser=new CUser(ConnectInfo,UserLoginName,"0");  
				Report.stat.reQuery re = new Report.stat.reQuery();

				str="select * from XE02 where ZA0100 in (" + tempUser.gsGroupList.Substring(1)+ ") and  ZC9996='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					MainObject=dt.Rows[0]["XE0210"].ToString();   //������
					for(int i = 0;i<dt.Rows.Count;i++)
					{
						if(dt.Rows[i]["XE0202"] != null && dt.Rows[i]["XE0202"].ToString() != "")
						{

							icount1 = BaseItem.Split('~').Length;
							icount2 = dt.Rows[i]["XE0202"].ToString().Split('~').Length;
							BaseExpr = re.gs_Comexpress(icount1,icount2,BaseExpr,dt.Rows[i]["XE0201"].ToString());
							if(BaseItem == "")
								BaseItem=dt.Rows[i]["XE0202"].ToString();  //���������
							else
								BaseItem+= "~" + dt.Rows[i]["XE0202"].ToString(); 
						}
					}

				}
				
			}
			catch
			{
				
			}
			
		}



		/// <summary>
		/// ���ò˵���Ŀ�����
		/// </summary>
		public void gsSetItemStatus(MainMenu myMainMenu)
		{
			SortedList UsableItemList;
			SortedList SourceItemList;

			try
			{

				CUser tempUser=new CUser(ConnectInfo,m_AppLoginName,"0");
   
				//ԭ�˵���
				SourceItemList=this.gsGetSourceMenuItems(this.m_CurModuleCode); 

				//Ȩ������Ĳ˵���
				UsableItemList=gsGetUsableMenuItems(tempUser.UserGroup ,this.m_CurModuleCode);
				

				//����Ȩ�����ò˵���
				for(int i=0;i<=myMainMenu.MenuItems.Count-1;i++)
				{
					DealItemForTree(UsableItemList,SourceItemList,myMainMenu.MenuItems[i],true);  
				}
			}
			catch(Exception e)
			{
				throw new Exception ("SetItemStatus : " +e.Message );
			}
		}

		
		/// <summary>
		/// ����Where���Sql���,��Select,���ض���ı���Za0100,�磺select AA01.ZA0100 from AA01 where [AA01.ZA0100]='05';
		/// </summary>
		/// <param name="UserId"></param>
		/// <param name="MainObject"></param>
		/// <param name="?"></param>
		/// <returns></returns>
		public string gsGetQueryResult(string MainObject,string BaseExpr,string BaseItem)
		{

			string SelectSql="";

			try
			{
			
				DMServer.Common.ConfigMy.ConnectInfo=ConnectInfo;
				Report.stat.QueryDeal myQueryDeal=new Report.stat.QueryDeal(MainObject,BaseExpr,BaseItem,"");
							
				SelectSql=myQueryDeal.QueryResult();
			
				return SelectSql;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}

		}

	
		/// <summary>
		/// ��ȡģ���������
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="MainObject"></param>
		/// <returns></returns>
		public string gsGetMainObject(string ModuleCode)
		{

			
			string str;
			DataTable dt;
			string MainObject="";

			try
			{
			
				//��ȡģ���������
				str="select XD0110 from XD01 where ZA0100='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					MainObject=dt.Rows[0]["XD0110"].ToString();  
				
				}

				return MainObject;
			}
			catch
			{
				return "";
			}
			
			//return mModuleMainObject;
			
		}


		/// <summary>
		/// ��ȡ�����ļ��������
		/// </summary>
		/// <returns></returns>
		public string gsGetLocalHostName()
		{
			string HostName;
			try
			{
				HostName = System.Net.Dns.GetHostName();
				return HostName;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ��ȡ����IP��ַ
		/// </summary>
		/// <returns></returns>
		public string gsGetLocalHostIp()
		{
			string HostName;
			string HostIp;

			try
			{
          
				HostName = System.Net.Dns.GetHostName();
				System.Net.IPHostEntry HostIps=System.Net.Dns.GetHostByName(HostName);   
				HostIp=HostIps.AddressList[0].ToString();  
				return HostName;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// ��ȡ�����ھӵ���Դ
		/// </summary>
		/// <returns></returns>
		private ArrayList gsGetNetWorkResource()
		{
			ArrayList myNetWorkObject=new ArrayList(); 

			System.Management.ManagementObjectSearcher query;
			
			query= new  System.Management.ManagementObjectSearcher("\\\\xsm\\root\\cimv2", "Select * From Win32_Share") ;
			System.Management.ManagementObjectCollection queryCollection = query.Get();
			foreach(System.Management.ManagementObject mobject in queryCollection )
			{
				string path = (string)mobject["Path"];
				string name = (string)mobject["Name"];
				myNetWorkObject.Add(path + (char)10 + name); 
				
			}

			return myNetWorkObject;


		}


		/// <summary>
		/// ��ȡ�����ھӵ���Դ
		/// </summary>
		/// <returns></returns>
		public ArrayList gsGetNetWorkRes()
		{
			ArrayList myNetWorkObject=new ArrayList(); 

			CNetWork myCNetWork=new CNetWork();
			myNetWorkObject=myCNetWork.GetNetWorkResource(); 
				
			return myNetWorkObject;


		}


		/// <summary>
		/// �����¼��־
		/// </summary>
		private bool gsInserLoginLog()
		{
			string str="";
			DataTable dt;
			string CurLoginTime;
			string HostName;
			bool flag=false;

			try
			{

				CurLoginTime=DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
				HostName=this.gsGetLocalHostName(); 
			

				str="exec gsp_WebInsertLoginLog '" + CurUser.UserCode + "','" + this.CurModuleCode + "','" + CurLoginTime + "','" + HostName + "'";
				dt=this.DataOperator.GetDataTable(str);
				m_curLogId=dt.Rows[0][0].ToString();  
				flag=true;

				return flag;

			}
			catch
			{
				return false;
			
			}
  
		}


		/// <summary>
		/// �޸ĵ�¼��־���˳�ʱ��
		/// </summary>
		public void gsUpdateLoginLog()
		{
			string str;
			string CurLoginTime;

			try
			{
			
				CurLoginTime=DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");   
	
				str="exec gsp_WebUpdateLoginLog '" + CurUser.UserCode + "','" + this.m_curLogId + "','" + CurLoginTime + "'";
				this.DataOperator.ExecuteSql(str);
			}
			catch
			{}
			
		}


		/// <summary>
		/// ִ��Sql���
		/// </summary>
		/// <param name="sql"></param>
		public void gsExecSql(string sql)
		{
			this.DataOperator.ExecuteSql(sql);  
		}


		/// <summary>
		/// ���ز�ѯ���
		/// </summary>
		/// <param name="Sql"></param>
		/// <returns></returns>
		public DataTable gsGetDataTable(string sql)
		{
			DataTable dt;
			dt=this.DataOperator.GetDataTable(sql);
			return dt;
		}


		/// <summary>
		/// �ж�ĳ�����Ƿ���Ҫ����
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		public bool gsRequireApprove(string InfoId)
		{

			DataTable dt;
			string str;

			str="select * from gs_structure where infoid='" + InfoId + "' and state='1'";
			dt=this.DataOperator.GetDataTable(str);
			if(dt.Rows.Count >0)
			{
				if(Convert.ToBoolean(dt.Rows[0]["secrit"])) //�а�����Ҫ����
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


		/// <summary>
		/// ��ȡ��ǰ��¼�û�������Ŀ��õ�ģ�鼯��
		/// </summary>
		/// <returns></returns>
		public SortedList gsGetUsableModuleList()
		{
			string str="";
			DataTable dt;
			SortedList ModuleList=new SortedList(); 

			//��ȡ��ǰ�û���Ϣ
			if(m_CurUser == null)
			{
				m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2");   
			}

			//����Ա��������Ȩ��
			if(m_CurUser.IsManageGroup)
			{
				str="select za0100 as zc9996 from xd01";
			}
			else  //ҵ����
			{
				
				str="if exists(select zc9996 from xf03 where za0100 in(select za0100 from xf01 where za0101='" + m_CurUser.LoginName +"'))";
				str += "(select zc9996 from xf03 where za0100 in(select za0100 from xf01 where za0101='" + m_CurUser.LoginName +"'))";
				str += "else (select zc9996 from xe02 where za0100 in(select xf0101 from xf01 where za0101='" + m_CurUser.LoginName +"'))";

			
			}

			
			dt=this.DataOperator.GetDataTable(str);

			for(int i=0;i<dt.Rows.Count;i++)
			{
				string ModuleCode;
				ModuleCode=dt.Rows[i]["ZC9996"].ToString();
				if(ModuleCode.Trim()!="")
				{
				
					if(! ModuleList.ContainsKey(ModuleCode))
					{
						ModuleList.Add(ModuleCode,dt.Rows[i]);    
					}

				}

				

			}

			return ModuleList;
  
			
		}


		/// <summary>
		/// ��ȡ��ǰ��¼�û�������Ŀ��õ�ҵ����뼯�ϣ� ģ�����.ҵ�����.���̱���
		/// </summary>
		/// <returns></returns>
		public SortedList gsGetUsableFlowList()
		{
			string str;
			DataTable dt;
			SortedList FlowList=new SortedList(); 


			//��ȡ��ǰ�û���Ϣ
			if(m_CurUser == null)
			{
				m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2");   
			}


			str="select * from XE04 where ZA0100='" + m_CurUser.UserGroup + "'";
			dt=this.DataOperator.GetDataTable(str);

			for(int i=0;i<dt.Rows.Count;i++)
			{
				FlowList.Add(dt.Rows[i]["XE0401"].ToString()+ "." +dt.Rows[i]["XE0402"].ToString()+ "." + dt.Rows[i]["XE0403"].ToString() ,dt.Rows[i]);    

			}

			return FlowList;
  
			
		}

		
		/// <summary>
		/// ��ȡָ��ģ���µ����в˵���
		/// </summary>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetSourceMenuItems(string ModuleCode)
		{
			this.m_SourceMenuItemList.Clear();  
			return GetSourceMenuItemsForTree(ModuleCode,"","",false);
		}


		/// <summary>
		///�ݹ���ã� ��ȡ�û�����ĳ��ģ���µĿ��õĲ˵����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetUsableMenuItems(string UserCode,string ModuleCode)
		{

			this.m_MenuItemList.Clear();  
			return GetUsableMenuItemsForTree(UserCode,ModuleCode,"","",false);
			
		}


		/// <summary>
		///�ݹ���ã� ��ȡ�û�����ĳ��ģ���µĿ��õ���Ҳ˵����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetUsableOutnerMenuItems(string UserCode,string ModuleCode)
		{

			this.m_MenuItemList.Clear();  
			return GetUsableOutnerMenuItemsForTree(UserCode,ModuleCode,"","",false);
			
		}


		
		/// <summary>
		/// ��ĳ��ģ���£����ģ������в˵���
		/// </summary>
		public void gsAddAllMenuItems(MainMenu myMainMenu,string ModuleCode)
		{
			
			try
			{

				//��ɾ����ģ���µ����в˵���
				string str;
				str="delete from xd01 where Za0100 like '" + ModuleCode + "%' and ZA0100 <> '" + ModuleCode + "'";
				this.DataOperator.ExecuteSql(str);  

			
				//����Ȩ�����ò˵���
				for(int i=0;i<=myMainMenu.MenuItems.Count-1;i++)
				{
					string SubCode;
					SubCode=Convert.ToString(i+1).PadLeft(2,'0');

					AddOneItemForTree(ModuleCode,ModuleCode+ SubCode,myMainMenu.MenuItems[i],true);  
				}
			}
			catch(Exception e)
			{
				throw new Exception ("SetItemStatus : " +e.Message );
			}
		}


		
		/// <summary>
		/// �ݹ鴦��������еĲ˵���
		/// </summary>
		/// <param name="PMenuItem"></param>
		private void AddOneItemForTree(string  PtrModuleCode,string ItemModuleCode,MenuItem PMenuItem,bool blnDealRoot)
		{
			int i;
			string str;

			
			try
			{
				
				//������ڵ�
				if(PMenuItem.Text.Trim() == "-")
				{
					return ;
				}

				//��Ӹ���
				str="insert XD01(ZA0100,XD01ID,ZA0101,ZA9996,ZA9997,XD011C,ZB0199,ZC9993,XD011F,XD011H) values('" + ItemModuleCode + "',"  +
					"'100'," + 
					"'" + PMenuItem.Text + "'," + 
					"'" + PtrModuleCode + "'," + 
					"'" + "1" + "'," + 
					"'" + PMenuItem.Text + "'," + 
					"'" + "2" + "'," + 
					"'" + "1" + "'," +
					"'" + "0" + "'," + 
					"'" + "0" + "')"; 

				this.DataOperator.ExecuteSql(str);  


			

				//������ڵ��µ��ӽڵ�
				for(i=0;i<=PMenuItem.MenuItems.Count-1;i++)
				{
					string SubCode;

					SubCode=Convert.ToString(i+1).PadLeft(2,'0');
					AddOneItemForTree(ItemModuleCode,ItemModuleCode + SubCode,PMenuItem.MenuItems[i],true); 

				}
			}
			catch(Exception e)
			{
				throw new   Exception("DealItemFroTree: " + e.Message ); 
			}

		}

	
		/// <summary>
		/// ȡģ��Ĳ���
		/// </summary>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public string gsGetModulaParam(string ModuleCode)
		{
			/*
			string str;
			DataTable dt;
			string param="";

			str="select XD011A from xd01 where ZA0100='" + ModuleCode + "'";
			dt=this.DataOperator.GetDataTable(str);
  
			if(dt.Rows.Count>0)
			{
				param=dt.Rows[0]["XD011A"].ToString();  
			}
			return param;
			*/


			return this.mModuleParam; 

			
		}
		

		/// <summary>
		/// ȡ�û���ĳ��ģ�����Ϣ��Ȩ��
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		public SortedList gsGetPropertyRightItems(string UserCode,string ModuleCode,string InfoId)
		{

			SortedList tempObjectList=new SortedList(); 
			string str;
			DataTable dt;

			try
			{

				//ȡ�û���Ϣ
				CUser tempUser=new CUser(ConnectInfo,UserCode,"0");  

		
				//��Ϊ����Ա�飬�򷵻�Property��Ϣ������Ϣ��
				if(tempUser.IsManageGroup)
				{
					str="select InfoField,PropertySet from gs_property  where InfoId='" + InfoId + "'";
				}
				else  //Ϊһ���飬���ֶ�Ȩ���ж�ȡ��Ϣ��
				{
					//cc 20050816 ����ģ�����
//					//str="select XE0502 as InfoField,XE0503 as PropertySet  from XE05 where ZA0100='" + tempUser.UserGroup + "' and XE0501='" + InfoId + "' and XE0504='" + ModuleCode + "'";
//					str="select XE0502 as InfoField,XE0503 as PropertySet  from XE05 where ZA0100='" + tempUser.UserGroup + "' and XE0501='" + InfoId + "'";
					str="select XE0502 as InfoField,XE0503 as PropertySet  from XE05 where ZA0100='" + tempUser.UserGroup + "' and XE0501='" + InfoId + "' and XE0504='" + ModuleCode + "'";
					//end cc
				}
				dt=this.DataOperator.GetDataTable(str);

				
				//�ӵ�������
				for(int i=0;i<=dt.Rows.Count-1;i++)
				{
					if(! tempObjectList.ContainsKey(dt.Rows[i]["InfoField"].ToString()))
					{
						tempObjectList.Add(dt.Rows[i]["InfoField"].ToString(),dt.Rows[i]["PropertySet"].ToString()); 
					}
				}
						
			
				return tempObjectList;
			}
			catch
			{
				return tempObjectList;
			}
		}


		/// <summary>
		/// ȡ�û����ֶ�Ȩ��
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetUserFieldRight()
		{
			try
			{
				//ȡ�û�����������ֶ�Ȩ�޷ŵ�������
				string sql="select XE0501 as InfoId,XE0502 as InfoField,XE0503 as PropertySet from XE05 a,XE01 b,XF01 c where a.za0100=b.za0100 and b.za0100=c.xf0101   and a.xe0504='" + this.CurModuleCode + "' and c.za0101='" + this.CurUser.LoginName + "'";
				DataTable dtbFieldRight=this.DataOperator.GetDataTable(sql);
				return dtbFieldRight;
			}
			catch
			{
				return null;
			}
		}
	
		#endregion

		#region �����ļ�����

		/// <summary>
		/// �������ļ���ֵ
		/// </summary>
		/// <param name="sectionName"></param>
		/// <param name="itemName"></param>
		/// <returns></returns>
		public string gsGetConfigPropertyValue(string sectionName, string itemName)
		{

			Assembly SampleAssembly;
			string FilePath;

			try
			{
				SampleAssembly = Assembly.GetExecutingAssembly();
				FilePath=System.IO.Path.GetDirectoryName(SampleAssembly.CodeBase.Substring(8));
				mConfigFile= FilePath + "\\Config.Xml";

				CConfigManager myConfigManager=new CConfigManager(mConfigFile);
				return myConfigManager.getPropertyValue(sectionName,itemName);
			}
			catch(Exception e)
			{
				return "";
			}
			
		}


		/// <summary>
		///��������ֵ 
		/// </summary>
		/// <param name="sectionName"></param>
		/// <param name="itemName"></param>
		/// <param name="itemValue"></param>
		public void gsSetConfigPropertyValue(string sectionName, string itemName, string itemValue)
		{
			Assembly SampleAssembly;
			string FilePath;

			try
			{

				SampleAssembly = Assembly.GetExecutingAssembly();
				FilePath=System.IO.Path.GetDirectoryName(SampleAssembly.CodeBase.Substring(8));
				mConfigFile= FilePath + "\\Config.Xml";

				CConfigManager myConfigManager=new CConfigManager(mConfigFile);
				myConfigManager.setPropertyValue(sectionName,itemName,itemValue);
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			
		}



		#endregion

		#region ����

		  
		/// <summary>
		/// ��ȡ�������е�����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_All(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ�����ֻ������
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_ReadOnly(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and PropertySet='2' order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ����Ķ�д����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_ReadWrite(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and PropertySet='0' order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ�������������
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_unVisible(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and PropertySet='1' order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ�����ϵͳ����,���������ֶ�
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public DataTable gsProperty_get_SystemNoComput(string InfoId)
		{
			string str;
			DataTable dt;
			
			str="select * from gs_property where infoid='" + InfoId + "' and Flag='0' and Restriction<>'7' order by orderno";
			dt=this.DataOperator.GetDataTable(str);
			return dt;
			
		}


		/// <summary>
		/// ��ȡ�����ϵͳ����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public DataTable gsProperty_get_System(string InfoId)
		{
			string str;
			DataTable dt;
			
			str="select * from gs_property where infoid='" + InfoId + "' and Flag='0'  order by orderno";
			dt=this.DataOperator.GetDataTable(str);
			return dt;
			
		}


		/// <summary>
		/// ��ȡ����ķ�ϵͳ����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_NonSystem(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and Flag='1' order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ����ı䶯����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_Change(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and (StandByVarchar = 'A' or StandByVarchar='B') order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;

		}


		/// <summary>
		/// ��ȡ����ı䶯Դ����
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_ChangeSource(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and (StandByVarchar = 'A') order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;
		}


		/// <summary>
		/// ��ȡ����ı䶯������
		/// </summary>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public CProperty[] gsProperty_get_ChangeDest(string InfoId)
		{
			string str;
			CProperty[] myPropertyArray;
			
			str="select * from gs_property where infoid='" + InfoId + "' and (StandByVarchar = 'B') order by orderno";
			myPropertyArray=GetPropertyByFilter(str);
			
			return myPropertyArray;
			 
		}


		/// <summary>
		/// ��ȡĳ�����Ե�����Դ
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="InfoField"></param>
		/// <returns></returns>
		public string gsProperty_get_DictId(string InfoId,string InfoField)
		{
			string str;
			DataTable dt;
			string DictId="";
			
			str="select DictId from gs_property where infoid='" + InfoId + "' and InfoField='" + InfoField + "'";
			dt=this.DataOperator.GetDataTable(str);
			if(dt.Rows.Count>0)
			{
				DictId=dt.Rows[0]["DictId"].ToString();  
			}

			return DictId;
  
		}

		#endregion

		#region  ָ�꼯/����

		/// <summary>
		/// ���ؼ򵥰汾����������Ա/����/ְλ/����֯
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisMainObjectForSimple()
		{
			string str;
			DataTable dt;

			try
			{
			
				
				str=gsGetGmisMainObjectForSimpleSql();
				dt=this.DataOperator.GetDataTable(str);

				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}


		/// <summary>
		/// 
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisMainObjectForSimpleSql()
		{

			string str;

			str="select infoid,description,shortdesc from gs_structure where type in ('0','1') and State='1' " +
				" and (( upper(left(infoid,2))>='AA'" +
				" and upper(left(infoid,2))<='AO'" +
				" or  upper(left(infoid,2))>='BA'" + 
				" and upper(left(infoid,2))<='BO'" +
				" or  upper(left(infoid,2))>='CA'" +
				" and upper(left(infoid,2))<='CO'" + 
				" or  upper(left(infoid,2))>='DA'" + 
				" and upper(left(infoid,2))<='DO'" + 
				" or  upper(left(infoid,2))>='GA'" + 
				" and upper(left(infoid,2))<='GO'" + 
				" ) OR  ParentID='WF00') and right(infoid,2)='01'";

			
			return str;

		
		}


		/// <summary>
		/// ���ظ߼��汾��������01��β�Ķ���
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisMainObjectForComplex()
		{
			string str;
			DataTable dt;

			
			try
			{
				str=gsGetGmisMainObjectForComplexSql();
				dt=this.DataOperator.GetDataTable(str);

				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}


		/// <summary>
		/// ���ظ߼��汾��������01��β�Ķ���
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisMainObjectForComplexSql()
		{
			string str;
		
			
			try
			{
				str="select infoid,description,shortdesc from gs_structure where type in ('0','1') and State='1'" +
					" and right(infoid,2)='01'";

				return str;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}



		/// <summary>
		/// ����ָ���������ָ�꼯
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisSubObject(ArrayList MainObjectList)
		{
			string str;
			DataTable dt;
			
			try
			{
				
				str=gsGetGmisSubObjectSql(MainObjectList);
				dt=this.DataOperator.GetDataTable(str);
				return dt;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}


		
		/// <summary>
		/// ����ָ���������ָ�꼯
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisSubObjectSql(ArrayList MainObjectList)
		{
			string str;
			string strMainObject="";

			try
			{
				for(int i=0;i<MainObjectList.Count;i++)
				{
					strMainObject=strMainObject + ",'" + MainObjectList[i].ToString().Substring(0,2)  + "'"; 
				}
			
				strMainObject=strMainObject.Substring(1);
 
				str="select * from gs_structure where State='1'and type not in('2','7') and upper(left(infoid,2)) in (" + strMainObject + ")";
				return str;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}



		/// <summary>
		/// ����ָ���������������ض���
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisRelateObject(ArrayList MainObjectList)
		{
			string str;
			DataTable dt;
			
			try
			{
				
				str=gsGetGmisRelateObjectSql(MainObjectList);
				dt=this.DataOperator.GetDataTable(str);
				return dt;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}

			
		/// <summary>
		/// ����ָ���������ָ�꼯
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisRelateObjectSql(ArrayList MainObjectList)
		{
			string str;
			string strMainObject="";

			try
			{
				for(int i=0;i<MainObjectList.Count;i++)
				{
					strMainObject=strMainObject + ",'" + MainObjectList[i].ToString().Substring(0,2)  + "'"; 
				}
			
				strMainObject=strMainObject.Substring(1);
 
				
				str="select * from gs_structure where infoid in (select distinct left(dictid,charindex('.',dictid)-1) as InfoIdName  from gs_property where upper(left(infoid,2)) in (" + strMainObject + ")" + " and Charindex('.',dictid)>0) and state='1'";
				return str;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}





		

		/// <summary>
		/// ����ָ����Ϣ��������:ֻ�����д,����ϵͳ�ֶ�,������������
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisProperty(string InfoId)
		{
			string str;
			DataTable dt;

			
			try
			{
				str=gsGetGmisPropertySql(new ArrayList(new String[]{InfoId}));
				dt=this.DataOperator.GetDataTable(str);

				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}



		/// <summary>
		/// ����ָ����Ϣ��������:ֻ�����д,����ϵͳ�ֶ�
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisProperty(ArrayList ObjectList)
		{
			return gsGetGmisProperty(ObjectList,false);
		}
		public DataTable gsGetGmisProperty(ArrayList ObjectList,bool blnContainComputed)
		{
			string str;
			DataTable dt;
		
			try
			{
				
				str=gsGetGmisPropertySql(ObjectList,blnContainComputed);
				dt=this.DataOperator.GetDataTable(str);

				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}
/// <summary>
/// ����ָ����Ϣ��������:ֻ�����д,����ϵͳ�ֶ�
/// </summary>
/// <param name="ObjectList"></param>
/// <returns></returns>
		public string gsGetGmisPropertySql(ArrayList ObjectList)
		{
			return gsGetGmisPropertySql(ObjectList,false);

		}

		/// <summary>
		/// ����ָ����Ϣ��������:ֻ�����д,����ϵͳ�ֶ�,blnContainComputed�Ƿ���������ֶ�
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisPropertySql(ArrayList ObjectList,bool blnContainComputed)
		{
			string str;
			string strMainObject="";

			
			try
			{
				for(int i=0;i<ObjectList.Count;i++)
				{
					strMainObject=strMainObject + ",'" + ObjectList[i].ToString()  + "'"; 
				}

				strMainObject=strMainObject.Substring(1);

				if(! blnContainComputed)
					str="select * from gs_property where infoid in (" + strMainObject + ") and (propertyset='0' or propertyset='2') and state='1' and flag <> '0' and Restriction<>'7' order by orderno ";
				else
					str="select * from gs_property where infoid in (" + strMainObject + ") and (propertyset='0' or propertyset='2') and state='1' and flag <> '0' order by orderno ";
				return str;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}
			
		
		/// <summary>
		/// ����ָ����Ϣ��������:
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetGmisPropertyforAll(string InfoId)
		{
			string str;
			DataTable dt;

			
			try
			{
				str=gsGetGmisPropertySqlforAll(new ArrayList(new String[]{InfoId}));
				dt=this.DataOperator.GetDataTable(str);

				return dt;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}


		/// <summary>
		/// ����ָ����Ϣ��������:ֻ�����д,����ϵͳ�ֶ�
		/// </summary>
		/// <returns></returns>
		public string gsGetGmisPropertySqlforAll(ArrayList ObjectList)
		{
			string str;
			string strMainObject="";

			
			try
			{
				for(int i=0;i<ObjectList.Count;i++)
				{
					strMainObject=strMainObject + ",'" + ObjectList[i].ToString()  + "'"; 
				}

				strMainObject=strMainObject.Substring(1);

				str="select * from gs_property where infoid in (" + strMainObject + ") and state='1' order by orderno ";
				return str;

			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
												
		}




		#endregion

		#region �������

		/// <summary>
		/// select ��䣬���ر���
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="selectA"></param>
		/// <param name="selectB"></param>
		/// <returns></returns>
		public string gsGetSelectSql(string InfoId,string FilterA,string FilterB)
		{
			string str="";
			string strA="";
			string strB="";
			

			if(FilterA.Trim() == "")
			{
				return "";
			}

			FilterA=FilterA.ToUpper().Trim() ; 

			if(FilterA.IndexOf("SELECT") == 0 )
			{
				strA=FilterA;
			}
			else
			{
				strA="select ZA0100 from " + InfoId + " where "  + FilterA;
			}

			FilterB=FilterB.ToUpper().Trim() ; 
			if(FilterB.Trim() != "")
			{
				if(FilterB.IndexOf("SELECT") == 0 )
				{
					strB = FilterB;
				}
				else
				{
					strB =" select ZA0100 from " + InfoId + " where "  + FilterB;
				}

			}
		
			str="select ZA0100 from " + InfoId + " where ZA0100 in(" + strA + ") and ZA0100 in (" + strB + ")";

			return str;
		}
	


		/// <summary>
		/// Where��䣬���ع������
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="selectA"></param>
		/// <param name="selectB"></param>
		/// <returns></returns>
		public string gsGetWhereSql(string InfoId,string FilterA,string FilterB)
		{
			string str="";
			string strA="";
			string strB="";
			

			if(FilterA.Trim() == "")
			{
				return "";
			}

			FilterA=FilterA.ToUpper().Trim() ; 

			if(FilterA.IndexOf("SELECT") == 0 )
			{
				strA=InfoId + ".ZA0100 in(" + FilterA + ")";
			}
			else
			{
				if(FilterA.Substring(4,1)=="." || FilterA.Substring(0,6).ToUpper() == "ISNULL" )
				{
					strA=FilterA;
				}
				else
				{
					strA=InfoId + "." + FilterA;
				}
			}

			FilterB=FilterB.ToUpper().Trim() ; 
			if(FilterB.Trim() != "")
			{
				if(FilterB.IndexOf("SELECT") == 0 )
				{
					strB=InfoId + ".ZA0100 in(" + FilterB + ")";
				}
				else
				{
					if(FilterB.Substring(4,1)=="." || FilterB.Substring(0,6).ToUpper() == "ISNULL")
					{
						strB=FilterB;
					}
					else
					{
						strB=InfoId + "." + FilterB;
					}
				}

			}

			str=strA + " and " + strB;

			return str;
		}



		#endregion 


		/// <summary>
		/// ȡ��ǰ�û�������
		/// </summary>
		/// <returns></returns>
		public string gsGetUserSalarySet()
		{
			try
			{
				string sql="select * from xf01 where ZA0101='" + this.CurUser.LoginName + "'";
				DataTable dt= this.DataOperator.GetDataTable(sql);
				object tempSet=dt.Rows[0]["XF0150"]; 
				if(tempSet == null   || tempSet.ToString().Trim() == "")
				{
					return "1";
				}
				else
				{
					return tempSet.ToString() ;
				}
			}
			catch
			{
				return "1";
			}
  
		}

		/// <summary>
		/// ȡ��ǰ�û�������
		/// </summary>
		/// <returns></returns>
		public string gsGetUserSalarySet(out string SetDesc)
		{
			SetDesc="��ǰ����";
			try
			{
				string sql="select * from xf01 where ZA0101='" + this.CurUser.LoginName + "'";
				DataTable dt= this.DataOperator.GetDataTable(sql);
				object tempSet=dt.Rows[0]["XF0150"]; 
				if(tempSet == null   || tempSet.ToString().Trim() == "")
				{
					tempSet="1";
				}

				sql="select SetNo,SetDescription from gs_salaryset  where setno='" + tempSet + "'";
				dt=this.DataOperator.GetDataTable(sql);
				if(dt.Rows.Count>0)
				{
					SetDesc=dt.Rows[0]["SetDescription"].ToString();  
				}
				
				return tempSet.ToString() ;
				
			}
			catch
			{
				return "1";
			}
  
		}


		/// <summary>
		/// ��ȡ���ֵļ�ƴ
		/// </summary>
		/// <param name="strHZ"></param>
		/// <returns></returns>
		public string gsGetHZtoSpell(string strHZ)
		{
			string str;
			try
			{
				str=createdmquery.createDmquery.HzToSpell(strHZ);
				return str;
			}
			catch
			{
				return "";
			}
		}


		/// <summary>
		/// д������Ϣ���ļ���
		/// </summary>
		/// <param name="LogFile"></param>
		/// <param name="ErrMsg"></param>
		/// <returns></returns>
		public void gsWriteErrLog(string LogFileName,string ErrMsg)
		{
			System.IO.FileStream fs;
		
			
			try
			{
				Assembly SampleAssembly;

				SampleAssembly = Assembly.GetExecutingAssembly();
				string FilePath=System.IO.Path.GetDirectoryName(SampleAssembly.CodeBase.Substring(8));
		
				if(! System.IO.Directory.Exists(FilePath + "\\Log"))
				{
					System.IO.Directory.CreateDirectory(FilePath + "\\Log");   
				}

				//ֻ����������¼�
				if(System.IO.File.GetLastWriteTime( FilePath + "\\Log\\" +  LogFileName).ToString("yyyy-MM-dd") != DateTime.Now.ToString("yyyy-MM-dd"))
				{
					System.IO.File.Delete( FilePath + "\\Log\\" +  LogFileName);   
				}
    
				
				fs=System.IO.File.Open(FilePath + "\\Log\\" +  LogFileName,System.IO.FileMode.Append,System.IO.FileAccess.Write,System.IO.FileShare.Read  ); 
				
				ErrMsg = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\r\n" + ErrMsg + "\r\n";
				byte[] myByte=System.Text.ASCIIEncoding.Default.GetBytes(ErrMsg);
				fs.Write(myByte,0,myByte.Length); 
				fs.Close(); 
				
			}    
			catch(Exception e)
			{
			}
		}

	
		#region ע�ᴦ��
	

		/// <summary>
		/// ��⹷
		/// </summary>
		/// <returns></returns>
		public bool gsDogValidate(out string ErrMsg)
		{
#if Dog
			try
			{
				ErrMsg="";

		
				
#if Single  
				if(!CFlxDog.gsIsExistDog())
				{
					ErrMsg="û�ҵ����ܹ�";
					return false;

				}
				else //������
				{
					//�жϼ��ܹ��İ汾��3.0
					string dogValue=CFlxDog.gsReadDog(1);
					if(myDogValue.ToUpper() != dogValue.ToUpper())
					{
						ErrMsg= "���ܹ��汾�Ų�һ��";
						return false;
	
					}
				}
				
				//�ж�ע����
				if(!CheckEnrol())
				{
					ErrMsg="ע��ʧ�ܣ�";
					return false;
				}
				else
				{
					ErrMsg="ע��ɹ���";
					return true;
				}

#elif Complex


//				if(!CheckEnrol())
//				{
//					ErrMsg="ע��ʧ�ܣ�";
//					return false;
//				}
//				else
//				{
//					ErrMsg="ע��ɹ���";
//					return true;
//				}

									//string dogValue=CFlxDog.gsReadDog(1);

			int dogReturnCode;
			dogReturnCode=CFlxDog.gsConnectNetDog();
			if(dogReturnCode==211 || dogReturnCode==212 )
			{
				return true;
			}
			else
			{
				switch  (dogReturnCode)
				{

                    case 213:
                        ErrMsg = "û�ҵ����ܹ�";
                        ////�������ڣ��ж�ע����
                        if (!CheckEnrol())
                        {
                            ErrMsg = "ע��ʧ�ܣ�";
                            return false;
                        }
                        else
                        {
                            ErrMsg = "ע��ɹ���";
                            return true;
                        }
                        break;
					case 214 :
						ErrMsg= "�û���";
						break;
					//cc 20050920
					case 216 :
						ErrMsg= "�汾�Ų���ͬ��";
						break;
					//end cc 
                        //�ж�ע���루ע����
                    //case 311 :
                    //    ErrMsg= "���ӳ�ʱ";
                    //    //�������ڣ��ж�ע����
                    //    if(!CheckEnrol())
                    //    {
                    //        ErrMsg="ע��ʧ�ܣ�";
                    //        return false;
                    //    }
                    //    else
                    //    {
                    //        ErrMsg="ע��ɹ���";
                    //        return true;
                    //    }
                    //    break;
					case 312 :
						ErrMsg = "�����쳣";
						break;
				}
				return false;
			}
			


#endif

			}
			
			catch
			{
				ErrMsg= "û�ҵ����ܹ�";
				return false;
			}
#else
			ErrMsg="";
			return true;
#endif


			
			
		}


		/// <summary>
		/// ���ע����
		/// </summary>
		/// <returns></returns>
        public bool gsCheckEnrol(out string ErrMsg)
        {
            ErrMsg = "";
            return true;

        }


		/// <summary>
		/// �˳�����
		/// </summary>
		public void gsExitConnectDog()
		{
			CFlxDog.gsExitNetDog(); 
		}

		/// <summary>
		/// ����Ƿ�ע��
		/// </summary>
        /// ��ʱע�������ü��ܹ���
		/// <returns></returns>
        private bool CheckEnrol()
        {

//            string SerialNo = "";  //���к�
//            string SaveRegisterNo = "";//�洢��ע���
//            string ComputeRegisterNo;  //�������ע���
//            string LaterNo = ""; //�Ժ���ע���ֵ
//            bool flag;



//#if (Single)//����

//            strBase="Single"+strVersion;

//#elif (Complex)//����

//            strBase = "Complex" + strVersion;

//#endif



//            try
//            {


//                //��Ӳ�̵����к�
//                SerialNo = this.getVolumnSerial();
//                SerialNo = SerialNo.ToUpper();



//                //�������кŻ����ע����
//                ComputeRegisterNo = getHash(SerialNo);


//                //��ע�����Ϣ
//                SaveRegisterNo = ReadRememberField(out LaterNo);


//                //�ж�ע�����Ƿ���Ч��ע����
//                flag = compareRegisterNo(SaveRegisterNo, ComputeRegisterNo, SerialNo, LaterNo);



//                return flag;
            return true;

//            }
//            catch (System.Exception ee)
//            {
//                MessageBox.Show(ee.Message);

//                return false;
//            }
        }
       
		/// <summary>
		/// �ж��������Ƿ����
		/// </summary>
		/// <param name="sourceNo"></param>
		/// <param name="RegisterNo"></param>
		/// <returns></returns>
		private bool compareRegisterNo(string SaveRegisterNo,string ComputeRegisterNo,string SerialNo,string LaterNo)
		{
			bool flag=false;

			if(SaveRegisterNo != ComputeRegisterNo&&LaterNo!="1")
			{
		
				FrmKey frm = new FrmKey(strBase,SerialNo);
				frm.TopMost = true;
				frm.ShowDialog();

				if(frm.gsBl)
				{
					flag=true;
					
				}
				else 
				{
					flag=false;
				}
			}
			else 
			{
				flag=true;
			}
			
			return flag;
		}


		/// <summary>
		/// ����ע���
		/// </summary>
		/// <param name="str"></param>
		/// <returns></returns>
		private string getHash(string str)
		{
			try
			{
				string strNo = "";
				string  temp1= Convert.ToBase64String(System.Text.Encoding.Unicode.GetBytes(str));
				temp1 = temp1.Substring(1,temp1.Length-2);
				for(int i = temp1.Length-1;i>=0;i--)
				{
					strNo += temp1.Substring(i,1);
				}
				strNo += strBase;
				int k1= Math.Abs(strNo.GetHashCode());
				return k1.ToString();
			
			}
			catch
			{
				return "";
			}

		}


		#endregion 


		/// <summary>
		/// �����㷨
		/// </summary>
		/// <param name="msg"></param>
		/// <returns></returns>
		public string gsGetEncryptMsg(string msg)
		{
			string EncryptMsg=System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(msg,"md5");    
			return EncryptMsg;
				
		}
		//==========��ʾע���봰�� 2005��5��9 LDM
		/// <summary>
		/// ��ʾע���봰��
		/// </summary>
		public void gsShowKeyForm()
		{
//            string SerialNo="";
//#if (Single)//����

//            strBase="Single"+strVersion;

//#elif (Complex)//����
			
//            strBase="Complex"+strVersion;
//#endif
//            //��Ӳ�̵����к�
//            SerialNo=this.getVolumnSerial(); 
//            SerialNo=SerialNo.ToUpper(); 

//            FrmKey frm = new FrmKey(strBase,SerialNo,1);
//            frm.TopMost = true;
//            frm.ckxLater.Visible=true;

//            frm.ShowDialog();

		}
		/// <summary>
		/// �ж��Ƿ�ע�� 
		/// </summary>
		/// <returns></returns>

		public bool gsIsRegister()
		{
//           string SerialNo="";
//           string LaterNo="";
//           string ComputeRegisterNo="";;  //�������ע���
//           string SaveRegisterNo="";//�洢��ע���
//#if (Single)//����

//            strBase="Single"+strVersion;

//#elif (Complex)//����
			
//            strBase="Complex"+strVersion;
//#endif
//            //��Ӳ�̵����к�
//            SerialNo=this.getVolumnSerial(); 
//            SerialNo=SerialNo.ToUpper(); 
			
				
//            //�������кŻ����ע����
//            ComputeRegisterNo=getHash(SerialNo);


//            //��ע�����Ϣ
//            SaveRegisterNo=ReadRememberField(out LaterNo);
//            if(ComputeRegisterNo==SaveRegisterNo)
//            {
//               return true;
//            }
//            else
//            {
                return false;
//            }
	}
		//======================================================

		//cc 20050614 �ṩbs�ӿ�
		public string gsGetFieldsRight(string InfoID)
		{
			string text4 = this.m_CurModuleCode;
			string text3 = this.m_CurUser.UserGroup;
			string[] textArray1 = new string[7] { "select * from xe05 where za0100='", text3, "' and xe0504='", text4, "' and xe0501='", InfoID, "'" } ;
			string text1 = string.Concat(textArray1);
			string text2 = "";
			DataTable table1 = this.gsGetDataTable(text1);
			int num1 = table1.Rows.Count;
			if (num1 > 0)
			{
				for (int num2 = 0; num2 < num1; num2++)
				{
					if (table1.Rows[num2]["XE0502"].ToString() == "")
					{
						text2 = "";
					}
					else
					{
						string[] textArray2 = new string[7] { text2, table1.Rows[num2]["XE0501"].ToString(), ".", table1.Rows[num2]["XE0502"].ToString(), ".", table1.Rows[num2]["XE0503"].ToString(), ";" } ;
						text2 = string.Concat(textArray2);
					}
				}
			}
			if (text2 != "")
			{
				text2 = text2.Substring(0, text2.Length - 1);
			}
			return text2;
		}
		//������2004��5��24��Ϊ�����Ӷ��ֶ�Ȩ�޵Ĺ�������ӵ�һ��������
		//���ã������û����ģ��ŷ��������ֶ���Ϣ���á�
		//�ӿڶ��壺����ʱ����ֵΪ������.�ֶ�����������Ϊ���ֶ�Ȩ�ޡ�
		//����Ϣ��Ϊ�յģ����ŵ�����ֵ�С�
		public SortedList gsGetFieldsRight()
		{
			SortedList retList= new SortedList();

			DataTable dtFieldsRight;
			string rightSQL;
			string returnStr;
			string whichInfoID;
			string GroupID,ModuleID;
			ModuleID = m_CurModuleCode;
			GroupID = m_CurUser.UserGroup;
			int rowcount;
			rightSQL = "select * from xe05 where za0100='"+GroupID+"' and xe0504='"+ModuleID+"' order by xe0501";
			returnStr = "";
			dtFieldsRight = gsGetDataTable(rightSQL);
			rowcount = dtFieldsRight.Rows.Count;
			//���ݼ�¼��������Ϣ���ֶ��
			if (rowcount>0)
			{
				for (int i=0;i<rowcount;i++)
				{//�����ִ��ĸ�ʽ���£�����Ϣ��.��Ϣ��,Ȩ�ޣ���
					if(dtFieldsRight.Rows[i]["XE0502"].ToString()=="")  
						//2004��5��17������IF�жϣ�ԭ������û�û�ж�ĳ����Ϣ�������ֶ�Ȩ�����ã����ֶ�Ȩ�ޱ�XE05�洢ʱ
						//����Ϣ��һ��Ϊ�գ���ֻ�й��ڴ��û��飬��ģ�飬����Ϣ����һ����¼��
						//���б���ʾʱ�Ĵ���ʽΪ���ȴ�gs_property��ȡ���ֶ���Ϣ��Ȼ����ͨ����xe05�е��ֶ�Ȩ�����ý�һ�����ˡ�
						//���������Ȩ������ʱû��ָ�����Ͱ�gs_property�е����ã�ֻ�践�ؿ��ַ���
					{
						returnStr = "";
					}
					else
					{
						//						returnStr = returnStr + dtFieldsRight.Rows[i]["XE0501"].ToString()+"."+dtFieldsRight.Rows[i]["XE0502"].ToString()
						//							+"."+dtFieldsRight.Rows[i]["XE0503"].ToString()+";";
						returnStr = dtFieldsRight.Rows[i]["XE0503"].ToString();
						retList.Add(dtFieldsRight.Rows[i]["XE0501"].ToString()+"."+dtFieldsRight.Rows[i]["XE0502"].ToString(),returnStr);
					}
					//					//�����һ����¼�Ѿ�����һ����Ϣ���������������Ϣ������Ϣ�ŵ�SortedList�С�
					//					if (dtFieldsRight.Rows[i]["XE0501"].ToString()!=dtFieldsRight.Rows[i+1]["XE0501"].ToString())
					//					{
					//						if (returnStr!="")
					//						{
					//							returnStr = returnStr.Substring(0,returnStr.Length-1);
					//						}
					//						retList.Add(dtFieldsRight.Rows[i]["XE0501"].ToString(),returnStr);
					//					}
				}
			}
			
			return retList;
		}
 
		//end cc


		#endregion

		#region ˽�к���
		
		/// <summary>
		/// ��ȡ�������ָ������(��д�Ӷ���ֻ���Ӷ��󣬶�д��ض���ֻ����ض���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <param name="FieldName"></param>
		/// <returns></returns>
		private SortedList GetObjectForMainObject(string UserCode,string ModuleCode,string FieldName)
		{
			string str;
		
			DataTable dt;
			SortedList tempObjectList=new  SortedList(); 
			int i;

			try
			{
				CUser tempUser=new CUser(ConnectInfo,UserCode,"0");  

				//���û���Ӧ�����Ȩ��

				//��Ϊ����Ա�飬�򷵻�ģ��Ķ�д����
				if(tempUser.IsManageGroup)
				{
					FieldName="XD01" + FieldName.Substring(4); 
					str="select * from gs_structure  where charindex(infoid,(select " + FieldName + " from XD01 where ZA0100='" + ModuleCode + "'))>0 and state='1'";
				}
				else  //Ϊһ���飬����ģ��Ȩ���ж�ȡ��д����
				{
					string strSql = " select " + FieldName + " from XE02 where za0100 in (" + tempUser.gsGroupList.Substring(1)+ ") and ZC9996='" + ModuleCode + "' ";
					string strtmp = "";
					dt=this.DataOperator.GetDataTable(strSql);
					if(dt != null && dt.Rows.Count!=0)
					{
						for(i=0;i<dt.Rows.Count;i++)
						{
							strtmp += "," + dt.Rows[i][0].ToString();
						}
					}
					str="select * from gs_structure  where charindex(infoid,('" +strtmp.Substring(1)+ "'))>0 and state='1'";
				}
				dt=this.DataOperator.GetDataTable(str);

				
				//�ӵ�������
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					if(! tempObjectList.ContainsKey(dt.Rows[i]["InfoId"].ToString()))
					{
						tempObjectList.Add(dt.Rows[i]["InfoId"].ToString().ToUpper(),dt.Rows[i]["ShortDesc"].ToString()); 
					}
				}
						
			
				return tempObjectList;
				
			}
			catch
			{
				return tempObjectList;
			}
		}


		/// <summary>
		/// ��ȡ�������ָ������(��д�Ӷ���ֻ���Ӷ��󣬶�д��ض���ֻ����ض���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <param name="FieldName"></param>
		/// <returns></returns>
		private SortedList GetObjectForMainObject(string UserCode,string ModuleCode,string FieldName,string FieldName1)
		{
			string str;
		
			DataTable dt;
			SortedList tempObjectList=new  SortedList(); 
			int i;

			try
			{
				CUser tempUser=new CUser(ConnectInfo,UserCode,"0");  

				//���û���Ӧ�����Ȩ��

				//��Ϊ����Ա�飬�򷵻�ģ��Ķ�д����
				if(tempUser.IsManageGroup)
				{
					FieldName="XD01" + FieldName.Substring(4); 
					str="select * from gs_structure  where charindex(infoid,(select " + FieldName + " from XD01 where ZA0100='" + ModuleCode + "'))>0 and state='1'";
				}
				else  //Ϊһ���飬����ģ��Ȩ���ж�ȡ��д����
				{
					str="select * from gs_structure  where charindex(infoid,(select " + FieldName + " from XE02 where za0100 in (" 
						+ tempUser.gsGroupList.Substring(1)+ ") and " +FieldName+ " not in (select " +FieldName1
						+ " from xe02 where za0100 in ("+ tempUser.gsGroupList.Substring(1)+ ") and ZC9996='" + ModuleCode + "')  and ZC9996='" + ModuleCode + "' group by " +FieldName+ "))>0 and state='1'";
				}
				dt=this.DataOperator.GetDataTable(str);

				
				//�ӵ�������
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					if(! tempObjectList.ContainsKey(dt.Rows[i]["InfoId"].ToString()))
					{
						tempObjectList.Add(dt.Rows[i]["InfoId"].ToString().ToUpper(),dt.Rows[i]["ShortDesc"].ToString()); 
					}
				}
						
			
				return tempObjectList;
				
			}
			catch
			{
				return tempObjectList;
			}
		}


		/// <summary>
		///�ݹ���ã� ��ȡĳ��ģ���µ����в˵���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private SortedList GetSourceMenuItemsForTree(string ModuleCodePPtr,string ItemDescription,string ItemFlag,bool blnDealRoot)
		{
			string str;
			DataTable dt;
			string tempModuleCode;
			string tempItemDescription;
			string tempItemFlag;
			int i;
		
			try
			{
				
				//ȡ�ò˵����µ��Ӳ˵���
				str="select *  from XD01 where ZA0100 like '" + ModuleCodePPtr + "%'  and ZB0199='2'";
				dt=this.DataOperator.GetDataTable(str);

				for(i=0;i<=dt.Rows.Count-1;i++)  
				{
					
					tempModuleCode=dt.Rows[i]["ZA0100"].ToString(); //�˵������
					tempItemDescription=dt.Rows[i]["ZA0101"].ToString().Trim() ; //�˵�������
					tempItemFlag=dt.Rows[i]["XD011C"].ToString().Trim() ; //�˵�������

					//�ӵ�������
					if(tempItemFlag.Trim()!="")
					{
						this.m_SourceMenuItemList.Add(tempItemFlag,tempItemDescription);  
					}
					
					
				}
				
				return m_SourceMenuItemList;
				


				
			}
			catch
			{
				return m_SourceMenuItemList;
			}
		}

		//ע�������
		private string strBase = "Resource";
		private string strVersion="3.0";

	

		private string getMac()
		{
			try
			{
				//ManagementClass mc = new ManagementClass("Win32_NetworkAdapterConfiguration");
				//Ӳ�̾���
				ManagementClass mc = new ManagementClass("Win32_LogicalDisk");
				ManagementObjectCollection moc = mc.GetInstances();
				
//				foreach(ManagementObject mo in moc)
//				{
//					if((bool)mo["IPEnabled"] == true && !mo["Description"].ToString().StartsWith("PPP"))
//					{
//						return mo["MacAddress"].ToString();
//					}
//				}
				return "";
			}
			catch
			{
				return "";
			}

		}


		/// <summary>
		/// ��ע����ж��ַ�����������
		/// </summary>
		private string ReadRememberField(out string LaterStr)
		{
			object strRemember;
			LaterStr="";
			try
			{
				string strNo="HserialNo";
				string strtemp = "�й�������Ϣ����ϵͳ";
#if (Single)//����
			
				strNo="HserialNo";
				strtemp = "�й�������Ϣ����ϵͳ";

#elif (Complex)//����
			
				strNo="serialNoNet";
				strtemp = "�й�������Ϣ����ϵͳ";

#endif 

				RegistryKey LMRK=Registry.LocalMachine;
				RegistryKey SoftRK=LMRK.OpenSubKey("software",true);
				//RegistryKey GmisRK=SoftRK.OpenSubKey("������").OpenSubKey("�й�������Ϣ����ϵͳ").OpenSubKey("1.00.000",false);
				RegistryKey GmisRK=SoftRK.OpenSubKey("������",true).OpenSubKey(strtemp,true).OpenSubKey("3.00.000",false);
			
				//strRemember=GmisRK.GetValue("serialNoNet");
				//strRemember=GmisRK.GetValue("serialNoHR");
				//strRemember=GmisRK.GetValue("HserialNo");
				strRemember=GmisRK.GetValue(strNo);
				//cc 20050617
				//LaterStr = GmisRK.GetValue("Later").ToString();
				//end cc
				if(strRemember==null || strRemember.ToString() =="" )
				{
					strRemember="123";
				}
				

				return strRemember.ToString();
				
			}//try
			catch
			{
				return "123";
			
			}

		}


		/// <summary>
		///�ݹ���ã� ��ȡ�û���ĳ��ģ���µĿ��õĲ˵����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private SortedList GetUsableMenuItemsForTree(string UserCode,string ModuleCodePPtr,string ItemDescription,string ItemFlag,bool blnDealRoot)
		{
			string str;
			DataTable dt;
			string tempModuleCode;
			string tempItemDescription;
			string tempItemFlag;
			int i;
			SortedList UsableModuleList;

			try
			{

				//��ǰ�û����õ�ģ��
				UsableModuleList=this.gsGetUsableModuleList(); 


				//����ò˵����µ��Ӳ˵���
				str="select *  from XD01 where ZA0100 like '" + ModuleCodePPtr + "%'";
				dt=this.DataOperator.GetDataTable(str);

				for(i=0;i<=dt.Rows.Count-1;i++)  
				{
					
					tempModuleCode=dt.Rows[i]["ZA0100"].ToString(); //�˵������
					tempItemFlag=dt.Rows[i]["ZA0101"].ToString().Trim() ; //�˵�������
					tempItemDescription=dt.Rows[i]["XD011c"].ToString().Trim() ; //�˵�������

					if(UsableModuleList.ContainsKey(tempModuleCode))
					{
						if(tempItemFlag.Trim()!="")
						{
							//�ӵ�������
							this.m_MenuItemList.Add(tempItemFlag,dt.Rows[i]);  
						}
					}
				}
				
				return m_MenuItemList;
			}
			catch
			{
				return m_MenuItemList;
			}
		}


		/// <summary>
		///��ȡ�û���ĳ��ģ���µĿ��õ���Ҳ˵����б�
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private SortedList GetUsableOutnerMenuItemsForTree(string UserCode,string ModuleCodePPtr,string ItemDescription,string ItemFlag,bool blnDealRoot)
		{
			string str;
			DataTable dt;
			string tempModuleCode;
			string tempItemDescription;
			string tempItemFlag;
			int i;
			SortedList UsableModuleList;

			try
			{

				//��ǰ�û����õ�ģ��
				UsableModuleList=this.gsGetUsableModuleList(); 


				//����ò˵����µ��Ӳ˵���
				str="select *  from XD01 where ZA0100 like '" + ModuleCodePPtr + "%' and substring(ZA0101,1,1)='*'";
				dt=this.DataOperator.GetDataTable(str);

				for(i=0;i<=dt.Rows.Count-1;i++)  
				{
					
					tempModuleCode=dt.Rows[i]["ZA0100"].ToString(); //�˵������
					tempItemFlag=dt.Rows[i]["ZA0101"].ToString().Trim() ; //�˵�������
					tempItemDescription=dt.Rows[i]["XD011C"].ToString().Trim() ; //�˵�������

					if(UsableModuleList.ContainsKey(tempModuleCode))
					{
						if(tempItemFlag.Trim()!="")
						{
							//�ӵ�������
							this.m_MenuItemList.Add(tempItemFlag.Substring(1) ,dt.Rows[i]);  
						}
					}

					
									
				}
				
				return m_MenuItemList;
	
			}
			catch
			{
				return m_MenuItemList;
			}
		}




		/// <summary>
		/// 
		/// </summary>
		/// <param name="CurHostName"></param>
		/// <param name="CurDataBase"></param>
		/// <param name="CurAppLoginName"></param>
		/// <param name="CurAppLoginPassword"></param>
		private void Init(string CurHostName,string CurDataBase,string CurAppLoginName,string CurAppLoginPassword)
		{
			

			this.HostName=CurHostName;
			this.DataBase=CurDataBase;
			this.AppLoginName=CurAppLoginName;  //ϵͳ�û�
			this.AppLoginPassWord=CurAppLoginPassword;  //ϵͳ�û�����

 
			ConnectInfo[0]=HostName; //����������
			ConnectInfo[1]=DataBase; //���ݿ�
			ConnectInfo[2]=SqlLoginName;  //���ݿ��û�
			ConnectInfo[3]=SqlLoginPassWord;;  //���ݿ��û�����

	
			//��ȡ��ǰ�û���Ϣ
			//m_CurUser=new  CUser(ConnectInfo, m_AppLoginName,"2");   

			this.DataOperator=new CDataOperator(ConnectInfo);
			this.SqlBuilder=new  CSqlBuilder(); 

			
		}


		/// <summary>
		/// �ݹ鴦��ָ���˵����µ������Ӳ˵�
		/// </summary>
		/// <param name="PMenuItem"></param>
		private void DealItemForTree(SortedList UsableItemList,SortedList SourceItemList,MenuItem PMenuItem,bool blnDealRoot)
		{
			int i;

			
			try
			{
				
				//������ڵ�
				if(PMenuItem.Text.Trim() == "-")
				{
					PMenuItem.Visible=true;
					PMenuItem.Enabled=true; 
				}
				else
				{
					//����ǰ�˵��������õĲ˵����ڣ��򲻴���
					if(SourceItemList.Contains(PMenuItem.Text.Trim()))
					{
						if(UsableItemList.Contains(PMenuItem.Text.Trim()))
						{
							PMenuItem.Enabled=true;
							PMenuItem.Visible=true; 
				 
						}
						else
						{
							PMenuItem.Enabled=false; 
							PMenuItem.Visible=false;
						}
						//������������ò˵��������
						PMenuItem.Text =SourceItemList[PMenuItem.Text.Trim()].ToString() ;
					}
					
				}

			

				//������ڵ��µ��ӽڵ�
				for(i=0;i<=PMenuItem.MenuItems.Count-1;i++)
				{
					DealItemForTree(UsableItemList,SourceItemList,PMenuItem.MenuItems[i],true); 

				}
			}
			catch(Exception e)
			{
				throw new   Exception("DealItemFroTree: " + e.Message ); 
			}

		}

	 
		/// <summary>
		/// �ж��û������Ƿ���ȷ
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="UserPassword"></param>
		/// <returns></returns>
		private bool gsIsPasswordCorrect(string UserName,string UserPassword,out string ErrMsg)
		{
			string str;
			DataTable dt;
			string tempPassword;
			

			try
			{
				ErrMsg="";
				str="select * from XF01 where ZA0101='" + UserName + "'";
				dt=this.DataOperator.GetDataTable(str);
				//���û�����
				if(dt.Rows.Count>0)
				{
					//�ж������Ƿ���ȷ
					tempPassword=dt.Rows[0]["XF0102"].ToString().Trim();

					//2004.01.10 �������޸�  ���û��������
					//if(tempPassword == UserPassword.Trim() )
					if(tempPassword == this.gsGetEncryptMsg(UserPassword.Trim()))
					{
						return true;
					}
					else
					{
						ErrMsg="�������";
						return false;
					}
   					
				}
				else
				{
					ErrMsg="�޴��û�";
					return false;
					
				}
			}
			catch(Exception e)
			{
				ErrMsg=e.Message; 
				return false;
			}

		}


		/// <summary>
		/// �ж��û��Ƿ��ܽ�ĳ��ģ��
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <returns></returns>
		private bool CanEnterModule(out string ErrMsg)
		{
			string str="";
			DataTable dt;
			bool flag=false;

			try
			{

				
				ErrMsg="";

				//����Ĭ��ֵ
				mModuleMainObject="AA01";  //������
				mModuleInputCondition="";  //ģ��¼������
				mUserInputCondition="";  //�û�¼������
				this.m_ModuleDesription=""; //ģ������ 

				if(this.CurUser.IsManageGroup)  //����Ա���ܽ��κ�ģ��
				{
					str ="select za0101 as moduledesc,xd011a as moduleparam,za0100 as zc9996,xd0110 as xe0210,xd0111 as xe0211,xd0112 as xe0212,xd0113 as xe0213 ,xd0114 as xe0214,xd011e as xe021e,xd0117 as xe0201,xd0118 as xe0202,xd0119 as xe0203,'c' as usergroup  from xd01 where  ZA0100='" + m_CurModuleCode + "'";
					mdtbUserModuleRight=this.DataOperator.GetDataTable(str);
					if(mdtbUserModuleRight.Rows.Count>0)
					{
						this.mModuleMainObject=mdtbUserModuleRight.Rows[0]["xe0210"].ToString();  //������
						this.mModuleInputCondition=mdtbUserModuleRight.Rows[0]["xe021e"].ToString();   //ģ��¼������
						this.m_ModuleDesription=mdtbUserModuleRight.Rows[0]["moduledesc"].ToString();   //ģ������
						this.mModuleParam=mdtbUserModuleRight.Rows[0]["moduleparam"].ToString();   //ģ�����

						flag=true;
					}
					else
					{
						mModuleMainObject="AA01";
						flag=false;
					}
				}
				else  //һ��ҵ����
				{


					/************************
					 2004.06.30
					 �����û�Ҳ����Ȩ��ȡ���û��顢�û���ģ���Ӧ������Ȩ��
					*******************/
					str="(select '' as moduledesc,'' as moduleparam,zc9996,xe0210,xe0211,xe0212,xe0213,xe0214,xe021e,xe0201,xe0202,xe0203,'a' as usergroup,'0' as xd011h  from xe02 where za0100 in(select xf0101 from xf01 where za0101='" + this.CurUser.LoginName  + "') and zc9996='" + m_CurModuleCode + "') "; 
					str += "  union ";
					str += "(select '' as moduledesc,'' as moduleparam,zc9996,xf0310,xf0311,xf0312,xf0313,xf0314,xf031e,xf0301,xf0302,xf0303,'b' as usergroup,'0' as xd011h from xf03 where za0100 in(select za0100 from xf01 where za0101='" + this.CurUser.LoginName + "') )";
					str += "  union ";
					str +="(select ZA0101 as moduledesc,xd011a as moduleparam,za0100,xd0110,xd0111,xd0112,xd0113,xd0114,xd011e,xd0117,xd0118,xd0119,'c' as usergroup,xd011h  from xd01 where ZA0100='" + m_CurModuleCode + "')";


					mdtbUserModuleRight=this.DataOperator.GetDataTable(str);  

					//�ּ��������1���û�����û���ڹ�Ȩ(xf03��û�м�¼)�����Զ�ȡ�û����Ȩ�ޣ�  2���û����ڹ�Ȩ����ȡ�û���Ȩ��
					DataRow[] userDrs=mdtbUserModuleRight.Select("usergroup='b'");  //�û�Ȩ��
					DataRow[] userGroupDrs=mdtbUserModuleRight.Select("usergroup='a'"); //�û���Ȩ��
					DataRow[] moduleGroupDrs=mdtbUserModuleRight.Select("usergroup='c'"); //ģ��Ȩ��

					
					
					//cc 20050708 ���£�bsģ��ֻ���û���Ȩ��
					string isBsModule = moduleGroupDrs[0]["xd011h"].ToString();
					//if(userDrs.Length>0) //�û����ڹ�Ȩ����ȡ�û���Ȩ��
					if(userDrs.Length>0 && isBsModule=="0") //�û����ڹ�Ȩ����ȡ�û���Ȩ��
					{
                        DataRow[] tempUserDrs = mdtbUserModuleRight.Select("(usergroup='b' or usergroup='c') and zc9996='" + m_CurModuleCode + "'");
						if(tempUserDrs.Length>0)
						{
							this.mModuleMainObject=moduleGroupDrs[0]["XE0210"].ToString();   //������
							this.mModuleInputCondition=moduleGroupDrs[0]["xe021e"].ToString();   //ģ��¼������
							this.mUserInputCondition=tempUserDrs[0]["xe021e"].ToString();   //�û���¼������
							this.m_ModuleDesription=moduleGroupDrs[0]["moduledesc"].ToString();   //ģ������
							this.mModuleParam=moduleGroupDrs[0]["moduleparam"].ToString();   //ģ�����
							flag=true;
						}
						else
						{
							flag=false;
						}
					}
					else  //�û�����û���ڹ�Ȩ(xf03��û�м�¼)
					{
						if(userGroupDrs.Length>0)  //�û�����Ȩ��
						{
							this.mModuleMainObject=moduleGroupDrs[0]["XE0210"].ToString();  //������
							this.mModuleInputCondition=moduleGroupDrs[0]["xe021e"].ToString();   //ģ��¼������
							this.mUserInputCondition=userGroupDrs[0]["xe021e"].ToString();   //�û���¼������
							this.m_ModuleDesription=moduleGroupDrs[0]["moduledesc"].ToString();   //ģ������
							this.mModuleParam=moduleGroupDrs[0]["moduleparam"].ToString();   //ģ�����
							flag=true;
						}
						else
						{
							flag=false;
						}
					}
					
 

					/*

					str="select * from XE02 where za0100='" + UserCode + "' and ZC9996='" + ModuleCode + "'";
					dt=this.DataOperator.GetDataTable(str);
					if(dt.Rows.Count>0)
					{
						flag=true;
					}
					else
					{
						flag=false;
						
					}
					*/
				}

				return flag;
			}
			catch(Exception e)
			{
				ErrMsg=e.Message + str ; 
				return false;

			}
		}


	
		/// <summary>
		/// ��ȡģ������
		/// </summary>
		/// <returns></returns>
		private string GetModuleDesc(string ModuleCode)
		{
			string str;
			DataTable dt;
			string MDes="";

			try
			{
				str="select za0101 from XD01 where za0100='" + ModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{

					MDes=dt.Rows[0][0].ToString(); //ģ������   
			
				}
				return MDes;
			}
			catch
			{
				return "";
			}
			
		}


		/// <summary>
		/// ��ȡģ���������¼��������AA0104:1,ZA0100,=,'001';AA0105:1,dictValue,=,'022'
		/// ��������: #C--���ݿ�������Ϣ  #O--������  #U--��ǰ��¼�û�
		/// </summary>
		/// <returns></returns>
		private SortedList GetModuleInputCondition()
		{
			string str;
			DataTable dt;
			SortedList InputConditionList=new SortedList();
			string InputConditionStr="";

			try
			{
				InputConditionStr="";


				//����ģ���¼������
				/*
				str="select XD011E from XD01 where za0100='"  + this.m_CurModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					InputConditionStr=dt.Rows[0][0].ToString(); //ģ��¼��������ÿ���÷ֺŸ���
				}
				*/
				InputConditionStr=this.mModuleInputCondition; 
				
				if(InputConditionStr.Trim() != "")
				{
					string[] strList=InputConditionStr.Split(';');
					for(int i=0;i<strList.GetLength(0);i++)
					{
						string FieldName;
						string FieldCondition;

						if(strList[0].Trim() != "")
						{
							FieldName=strList[0].Split(':')[0].ToUpper(); 
							FieldCondition=strList[0].Split(':')[1]; 

							//�滻���� #u-�û�  #g-�û��� #d-����
							FieldCondition=FieldCondition.Replace("#U","'" + this.m_CurUser.UserCode + "'"); 
							FieldCondition=FieldCondition.Replace("#u","'" + this.m_CurUser.UserCode + "'"); 

							//Ȩ����
							FieldCondition=FieldCondition.Replace("#g","'" + this.m_CurUser.UserGroup + "'"); 
							FieldCondition=FieldCondition.Replace("#G","'" + this.m_CurUser.UserGroup + "'"); 

							//����
							FieldCondition=FieldCondition.Replace("#d","'" + this.m_CurUser.Department + "'"); 
							FieldCondition=FieldCondition.Replace("#D","'" + this.m_CurUser.Department + "'"); 

							//�ӵ�������
							InputConditionList.Add(FieldName,FieldCondition); 

						}//if
					
					}//for
				}//if



				InputConditionStr="";
				//�����û����Ӧ��ģ���¼������
				/*
				str="select XE021E from XE02 where za0100='"  + CurUser.UserGroup +  "' and ZC9996='" + this.m_CurModuleCode + "'";
				dt=this.DataOperator.GetDataTable(str);
				if(dt.Rows.Count>0)
				{
					InputConditionStr=dt.Rows[0][0].ToString(); //ģ��¼��������ÿ���÷ֺŸ���
				}*/
				InputConditionStr=this.mUserInputCondition; 
				
				if(InputConditionStr.Trim() != "")
				{
					string[] strList=InputConditionStr.Split(';');
					for(int i=0;i<strList.GetLength(0);i++)
					{
						string FieldName;
						string FieldCondition;

						if(strList[0].Trim() != "")
						{
							FieldName=strList[0].Split(':')[0].ToUpper(); 
							FieldCondition=strList[0].Split(':')[1]; 

							//�滻����
							FieldCondition=FieldCondition.Replace("#U","'" + this.m_CurUser.UserCode + "'"); 
							FieldCondition=FieldCondition.Replace("#u","'" + this.m_CurUser.UserCode + "'"); 

							//�ӵ�������,�û�����ȡ�û���
							if(InputConditionList.ContainsKey(FieldName))
							{
								InputConditionList.Remove(FieldName);
								InputConditionList.Add(FieldName,FieldCondition);
 			
							}
							else
							{
								InputConditionList.Add(FieldName,FieldCondition); 
							}
							

						}//if
					
					}//for
				}//if

				return InputConditionList;

			}//catch
			catch
			{
				return InputConditionList;
			}
			
		}


		/// <summary>
		/// ����������ȡ��������
		/// </summary>
		/// <param name="Filter"></param>
		/// <returns></returns>
		private CProperty[] GetPropertyByFilter(string Filter)
		{
			
			DataTable dt;
			CProperty[] myPropertyArray;

			dt=this.DataOperator.GetDataTable(Filter);  
			myPropertyArray=new CProperty[dt.Rows.Count];
			
			for(int i=0;i<dt.Rows.Count;i++)
			{
				myPropertyArray[i]=new CProperty(this.ConnectInfo,dt.Rows[i]);   
			}

			return myPropertyArray;

		}


		/// <summary>
		/// ȡӲ�����к�
		/// </summary>
		/// <returns></returns>
		private string getVolumnSerial()
		{
			string serial;
			try
			{
				System.Management.ManagementObject disk = new System.Management.ManagementObject("win32_logicaldisk.deviceid=\"c:\"");
				disk.Get();
				//ȡ�������
				System.Net.IPHostEntry myHost = new System.Net.IPHostEntry();
				myHost = System.Net.Dns.GetHostByName(System.Net.Dns.GetHostName());
				string computername  = myHost.HostName.ToString().Trim();
				computername = "";

				serial=disk.GetPropertyValue("VolumeSerialNumber").ToString();
				return serial;
			}
			catch
			{
				return "24F779C7";
			}
		}


		/// <summary>
		/// �ж��Ƿ�����Ƿ����ַ�
		/// </summary>
		/// <param name="msg"></param>
		/// <returns></returns>
		private bool isContailValidateCode(string msg)
		{
           return true;
		}


		/// <summary>
		/// ��ȡ�û���ָ��ģ��Ķ�д�Ӷ���
		/// </summary>
		/// <param name="UserCode"></param>
		/// <param name="ModuleCode"></param>
		/// <param name="FieldName"></param>
		/// <returns></returns>
		private void GetReadWriteObjectForUser()
		{
			string str="";
		
			DataTable dt;
			SortedList tempObjectList=new  SortedList(); 
			int i;

			try
			{
				mUserReadOnlyObjectList=new SortedList(); 
				mUserReadWriteObjectList=new SortedList(); 
				mUserObjectList=new SortedList();  

				//CUser tempUser=new CUser(ConnectInfo,UserCode,"0");  

				//���û���Ӧ�����Ȩ��

				//��Ϊ����Ա�飬�򷵻�ģ��Ķ�д����
				if(this.CurUser.IsManageGroup)
				{
					//FieldName="XD01" + FieldName.Substring(4); 
					//str="select * from gs_structure  where charindex(infoid,(select " + FieldName + " from XD01 where ZA0100='" + ModuleCode + "'))>0 and state='1'";
					str="select infoId,ShortDesc,'r' as flag from gs_structure  where charindex(infoid,(select xd0111 from XD01 where ZA0100='" + m_CurModuleCode + "'))>0 and state='1'";
					str +=" union " ;
					str +="select infoId,ShortDesc,'w' as flag from gs_structure  where charindex(infoid,(select xd0112 from XD01 where ZA0100='" + m_CurModuleCode + "'))>0 and state='1'";

				}
				else  //Ϊһ���飬����ģ��Ȩ���ж�ȡ��д����
				{
					str="if exists(select zc9996 from xf03 where zc9996='" + this.m_CurModuleCode + "' and za0100 in(select za0100 from xf01 where za0101='" + this.CurUser.LoginName + "'))";
					str += "(select infoId,ShortDesc,'R' as flag from gs_structure  where charindex(infoid,(select xf0311 from Xf03 where Zc9996='" + this.m_CurModuleCode + "' and za0100 in(select za0100 from xf01 where za0101='" + this.CurUser.LoginName + "')))>0 and state='1' union select infoId,ShortDesc,'W' as flag from gs_structure  where charindex(infoid,(select xf0312 from Xf03 where Zc9996='" + this.m_CurModuleCode + "'  and za0100 in(select za0100 from xf01 where za0101='" + this.CurUser.LoginName + "')))>0 and state='1' )";
					str += "else";
					str += "(";
					str += "select infoId,ShortDesc,'R' as flag from gs_structure  where charindex(infoid,(select xe0211 from Xe02 where Zc9996='" + this.m_CurModuleCode + "'  and za0100='" + this.CurUser.UserGroup + "'))>0 and state='1' union select infoId,ShortDesc,'W' as flag from gs_structure  where charindex(infoid,(select xe0212 from Xe02 where Zc9996='" + this.m_CurModuleCode + "' and za0100='" + this.CurUser.UserGroup + "'))>0 and state='1' ";
					str += ")";

				}
				dt=this.DataOperator.GetDataTable(str);
				

				//�ӵ�������
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					//�ŵ��Ӷ��󼯺���
					if(! mUserObjectList.ContainsKey(dt.Rows[i]["InfoId"].ToString()))
					{
                        //if (dt.Rows[i]["flag"].ToString().ToUpper() == "W"||dt.Rows[i]["flag"].ToString().ToUpper() == "R")
						    mUserObjectList.Add(dt.Rows[i]["InfoId"].ToString().ToUpper(),dt.Rows[i]["ShortDesc"].ToString()); 
					}
					
					if(dt.Rows[i]["flag"].ToString().ToUpper()=="W") //��д�Ӷ���
					{
						if(! mUserReadWriteObjectList.ContainsKey(dt.Rows[i]["InfoId"].ToString()))
						{
							mUserReadWriteObjectList.Add(dt.Rows[i]["InfoId"].ToString().ToUpper(),dt.Rows[i]["ShortDesc"].ToString()); 
						}
					}
                    else if (dt.Rows[i]["flag"].ToString().ToUpper() == "R") //ֻ���Ӷ���
					{
						if(! mUserReadOnlyObjectList.ContainsKey(dt.Rows[i]["InfoId"].ToString()))
						{
							mUserReadOnlyObjectList.Add(dt.Rows[i]["InfoId"].ToString().ToUpper(),dt.Rows[i]["ShortDesc"].ToString()); 
						}
					}

				}
				
			}
			catch(Exception e)
			{
				string errmsg=e.Message ;
			}
		}

		private string GetPassword()
		{
			string strPassword="";
			string strSafeguard=gsGetConfigPropertyValue("���ݿ�","Safeguard");		
			if (strSafeguard=="")
			{
				strSafeguard="true";
			}
			bool blnSafeguard=bool.Parse(strSafeguard);

			if (blnSafeguard)
			{
				string strFile=this.GetPasswordFile();
				if (strFile!="")
				{
					strPassword=RSAProtection.Decrypt(strFile);
				}
			
			}
			else
			{
				strPassword=this.gsGetConfigPropertyValue("���ݿ�","Password");
			}
			return strPassword;
			
		}

		private string GetPasswordFile()
		{		
			string strFile= this.gsGetConfigPropertyValue("���ݿ�","PasswordFile");			
			if (strFile=="" || strFile.IndexOf(@"\")>0) return strFile;
			
			Assembly SampleAssembly = Assembly.GetExecutingAssembly();
			string FilePath=System.IO.Path.GetDirectoryName(SampleAssembly.CodeBase.Substring(8));			
			strFile = FilePath + "\\"+strFile;
			return strFile;

		}


		

		#endregion

	}//class
}//namespace
