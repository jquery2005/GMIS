#define DEBUG


using System;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CUsers ��ժҪ˵�����û��ļ�����
	/// </summary>
	public class CUsers : MyBase
	{

		#region ȫ�ֱ���

		 /// <summary>
		 /// ����û���Ϣ�ļ���
		 /// </summary>
		  private SortedList mUserList=new SortedList();  
		/// <summary>
		/// ��λ�û��ļ���
		/// </summary>
		  private SortedList mLocateList=new SortedList(); 
		/// <summary>
		/// �����û��ļ���
		/// </summary>
		  private SortedList OrderByList=new SortedList(); 
 

		#endregion

		/// <summary>
		/// ��ȡ���е��û�
		/// </summary>
		public CUsers(String[] ConnectInfo) : base(ConnectInfo)
		{
			
			this.GetAndSetUserInfo(""); 
			
		}


		/// <summary>
		/// ����������
		/// </summary>
		/// <param name="ConnectInfo"></param>
		/// <param name="Filter"></param>
		public CUsers(String[] ConnectInfo,string Filter) : base(ConnectInfo)
		{
			
			this.GetAndSetUserInfo(Filter); 
			
		}




		#region ����
		    
	    /// <summary>
	    /// �û�����Ŀ
	    /// </summary>
		public int Count
		{
			get
			{
				return mUserList.Count;
			}
	
		}

		/// <summary>
		/// ָ��������ĳ���û�
		/// </summary>
		public CUser this[int index]
		{
			get
			{
				return (CUser)mUserList.GetByIndex(index); 
			}
		}

	
		#endregion

		#region ˽�к���

		/// <summary>
		/// ��ȡ�������û���Ϣ
		/// </summary>
		private void GetAndSetUserInfo(string Filter)
		{
			DataTable dt;
			int i;

			try
			{

				///���������û��ı�
				dt=GetUsersTable(Filter);
				///����ÿ���û�������
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
		///��ȡ�û���Ϣuc01
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
		/// ����һ����¼�����û��������
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
		/// ��ȡ��ǰ��ӵ�ID
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
		

		#region ��������

		/// <summary>
		/// ������û�������Id);
		/// </summary>
		public void AddNew(SortedList FieldValueList,SortedList ForeignKeyList)
		{
		
			long nId;

			try
			{

		
				//1.��ȡ��ǰ��Id
				nId=this.GetAddId("XF01",ForeignKeyList);
				string IdName="XF01ID";
				IdName=IdName.ToUpper(); 

				//����ID��ֵ 
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
		/// ɾ��ָ�����û�
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="WhereSql"></param>
		public bool DeleteUser(string InfoId,string DeleteUserCode)
		{
			
			String SqlStr;
			

			try
            
			{
				
				SqlStr="delete from " + InfoId + " where ZA0100='"+ DeleteUserCode + "'"; //ɾ���û�
				return this.DataOperator.ExecuteSql(SqlStr);

				
			}
			catch(Exception e)
			{
				throw new Exception(e.Message ); 
			}

		}


		/// <summary>
		/// �ж��Ƿ��Ѵ�����ͬ�ĵ�¼��
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
