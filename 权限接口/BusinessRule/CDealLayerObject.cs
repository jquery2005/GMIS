#define DEBUG


using System;
using GMIS.CommonRightDataAccess;
using System.Data; 
using System.Collections; 
using System.Collections.Specialized;  
using System.Diagnostics; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CDealLayerObject 的摘要说明。
	/// 处理分层对象
	/// </summary>
	public class CDealLayerObject : MyBase
	{
		public CDealLayerObject(String[] ConnectInfo) : base(ConnectInfo)
		{
			
	
		}


		#region 全局变量
		   
		    
		#endregion

		#region 属性

		/// <summary>
		/// 对象表
		/// </summary>
		private DataTable m_ObjectTable;
		public DataTable ObjectTable
		{
			get
			{
				return m_ObjectTable;
			}
		}

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
			set
			{
				m_InfoId=value;
			}
		}

		/// <summary>
		/// 编码名称
		/// </summary>
		private String m_CodeName;
		public String CodeName
		{
			get
			{
				return m_CodeName;
			}
			set
			{
				m_CodeName=value;
			}
		}

		/// <summary>
		/// 父指针名称
		/// </summary>
		private String m_ParentName;
		public String ParentName
		{
			get
			{
				return m_ParentName;
			}
			set
			{
				m_ParentName=value;
			}
		}

		#endregion

		#region 公有函数

		/// <summary>
		/// 获取对象的第一层子对象(有实际的库）
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetFirstSubObject(String MyInfoId,String MyPPtr,String MyCodeName,String MyParentName)
		{
			String tempSql;


			m_InfoId=MyInfoId;
			m_CodeName=MyCodeName;
			m_ParentName=MyParentName;

			try
			{

			
				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + m_ParentName + "='" + MyPPtr + "'","");
				this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
				return m_ObjectTable;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// 获取对象的第一层子对象(有实际的库）
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetFirstSubObject(String MyPPtr)
		{
			String tempSql;
			
			m_InfoId="gs_structure";
			m_CodeName="InfoId";
			m_ParentName="ParentId";

			try
			{

				
			
				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where ((parentid='" + MyPPtr + "' and type<>'2')  or (parentid in ( select InfoId from gs_structure where parentid='" + MyPPtr + "' and type='2')))","");
				this.m_ObjectTable=this.DataOperator.GetDataTable(tempSql); 
				

				return m_ObjectTable;
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
		}


		/// <summary>
		/// 获取所有的分层子对象
		/// </summary>
		/// <param name="InfoId"> 对象名</param>
		/// <param name="PPtr">父指针的值</param>
		/// <param name="CodeName">编码名称</param>例如：ZA0100(InfoId)
		/// <param name="ParentName">父指针名称</param>ZA9996(ParentId)
		/// <returns></returns>
		public DataTable gsGetAllSubObject(String MyInfoId,String MyPPtr,String MyCodeName,String MyParentName)
		{
			String tempSql;


			m_InfoId=MyInfoId;
			m_CodeName=MyCodeName;
			m_ParentName=MyParentName;

			//先查主对象
			tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + MyCodeName + "='" + MyPPtr + "'","");
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 

			//按树遍历（主对象下的所有子对象）
			GetSubObjectForTree(MyPPtr);
			return m_ObjectTable;
		}


		/// <summary>
		/// 获取指定对象的所有相关对象，包括子对象的相关对象
		/// </summary>
		/// <param name="InfoId"></param>
		/// <param name="PPtr"></param>
		/// <returns></returns>
		public DataTable gsGetAllRelateObject(String PPtr)
		{
			String tempSql;
			


			m_InfoId="gs_structure";
			m_CodeName="InfoId"; 
			m_ParentName="ParentId"; 


			
			//读取指定对象下的所有相关对象
			tempSql="select * from gs_structure where infoid in (select distinct left(dictid,charindex('.',dictid)-1) as InfoIdName  from gs_property where infoid='" + PPtr + "' and Charindex('.',dictid)>0)";
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
			//按树遍历
			GetRelateObjectForTree(PPtr);
			return m_ObjectTable;
		}


		/// <summary>
		/// 获取所有的主对象，后两位为01
		/// </summary>
		/// <returns></returns>
		public DataTable gsGetMainObject()
		{
			DataTable dt;
			string str;
	
			try
			{
				str=this.SqlBuilder.GetFilterSql("gs_structure"," where right(infoid,2)='01'","");
				dt=this.DataOperator.GetDataTable(str);
				return dt;
			}
			catch
			{
				return null;
			}


		}


		/// <summary>
		/// 获取引用某个对象的所有对象字段（引用保存的是被引用对象的主键，故被引用对象的主键(za0100)改变时，
		/// 查找所有引用该对象的字段，做相应的修改(表gs_property)
		/// </summary>
		/// <param name="InfoId"></param>
		/// <returns></returns>
		public DataTable gsGetAllRefProperty(String  InfoId)
		{
			String tempSql;

			
			//读取指定对象下的所有相关对象字段
			tempSql="select * from gs_Property where Charindex('.',dictid)>0 and left(dictid,charindex('.',dictid)-1)='" + InfoId + "'";
			this.m_ObjectTable =this.DataOperator.GetDataTable(tempSql); 
			return m_ObjectTable;
  
		}


		/// <summary>
		/// 添加新记录（处理Id);
		/// </summary>
		public void gsAddNew(string InfoId,SortedList FieldValueList,SortedList ForeignKeyList)
		{
			string str;
			long nId;
			int i;
			string FieldNameSql;
			string FieldValueSql;
			string tempFieldName;
			string tempFieldValue;
			string WhereSql;
		
			try
			{
            
				//1.获取当前的Id
				nId=this.GetAddId(InfoId,ForeignKeyList);
				string IdName=InfoId + "ID";
				IdName=IdName.ToUpper(); 

				//ID加到外键值集合中
				ForeignKeyList.Add(IdName,nId); 
				if(! ForeignKeyList.ContainsKey("ZA0100"))
				{
													   
					ForeignKeyList.Add("ZA0100",FieldValueList["ZA0100"].ToString()); 
				}

				FieldNameSql="";
				FieldValueSql="";
				WhereSql=" where ";
	
				//2.根据ID,主键值插入新记录
				for(i=0;i<=ForeignKeyList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=ForeignKeyList.GetKey(i).ToString();
					tempValue=ForeignKeyList.GetByIndex(i);
					if(tempValue.GetType().FullName=="System.String")
					{
						tempFieldValue="'" + tempValue.ToString() + "'"; 
				 
					}
					else
					{
						tempFieldValue=tempValue.ToString() ;
					}
				
					FieldNameSql=FieldNameSql + tempFieldName + ",";
					FieldValueSql=FieldValueSql + tempFieldValue + ",";
					WhereSql=WhereSql + tempFieldName + "=" + tempFieldValue + " and ";
				}

				FieldNameSql=FieldNameSql.Substring(0,FieldNameSql.LastIndexOf(","));  
				FieldValueSql=FieldValueSql.Substring(0,FieldValueSql.LastIndexOf(","));  
				WhereSql=WhereSql.Substring(0,WhereSql.LastIndexOf("and")-1);  

				//插入新记录
				str="Insert " + InfoId + "(" + FieldNameSql + ") values(" + FieldValueSql + ")";
				this.DataOperator.ExecuteSql(str); 


				//3.逐个更新非主键字段
				gsUpdate(InfoId,FieldValueList,ForeignKeyList);
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
			

		}


		/// <summary>
		/// 修改记录
		/// </summary>
		public void gsUpdate(string InfoId,SortedList FieldValueList,SortedList ForeignKeyList)
		{
			string str;
			int i;
			string tempFieldName;
			string tempFieldValue;
			string WhereSql;
            
			try
			{
			
				this.DataOperator.ExecuteSql("set quoted_identifier off");  

				//根据外键值和ID设置定位语句
				WhereSql=" where ";
			
				for(i=0;i<=ForeignKeyList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=ForeignKeyList.GetKey(i).ToString();
					tempValue=ForeignKeyList.GetByIndex(i);
					if(tempValue.GetType().FullName=="System.String")
					{
						tempFieldValue="'" + tempValue.ToString() + "'"; 
				 
					}
					else
					{
						tempFieldValue=tempValue.ToString() ;
					}
			
					WhereSql=WhereSql + tempFieldName + "=" + tempFieldValue + " and ";
				}

			
				WhereSql=WhereSql.Substring(0,WhereSql.LastIndexOf("and"));  

			
				//逐个更新非主键字段
				for(i=0;i<=FieldValueList.Count-1;i++)
				{
					object tempValue;
					tempFieldName=FieldValueList.GetKey(i).ToString();
					tempValue=FieldValueList.GetByIndex(i);

					if(tempValue==null)
					{
						tempFieldValue=null;
					}
					else
					{
						
						if(tempValue.GetType().FullName=="System.String")
						{
							tempFieldValue='"' + tempValue.ToString() + '"'; 
				 
						}
						else
						{
							tempFieldValue=tempValue.ToString() ;
						}
					}

					//不是主键
					if(! ForeignKeyList.ContainsKey(tempFieldName))
					{
            
						str="set quoted_identifier off update " + InfoId + " set " + tempFieldName + "=" + tempFieldValue + WhereSql;
						this.DataOperator.ExecuteSql(str); 
					}

				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message);
			}
		}


		/// <summary>
		/// 运行Sql命令
		/// </summary>
		/// <param name="str"></param>
		/// <returns></returns>
		public bool gsExecuteSql(string str)
		{
			return this.DataOperator.ExecuteSql(str);  
		}
		
		
	
		#endregion

		#region 私有函数

		/// <summary>
		/// 递归调用获取指定对象的所有子对象
		/// </summary>
		/// <param name="PPtr"></param>
		private void GetSubObjectForTree(String MyPPtr)
		{
			String tempSql;
			DataTable dt;
			DataRow dr;
			int i;
			String strCode;

			try
			{

				tempSql=this.SqlBuilder.GetFilterSql(m_InfoId," Where " + m_ParentName + "='" + MyPPtr + "'","");
				dt=this.DataOperator.GetDataTable(tempSql); 
			
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					dr=dt.Rows[i];
					//是实际的应用库，存到本地表中
					if(dr["Type"].ToString() != "2")
					{
						this.m_ObjectTable.ImportRow(dr);
					}
					strCode=dr[m_CodeName].ToString();
					GetSubObjectForTree(strCode);

				}
			}
			catch(Exception e)
			{
				throw new Exception (e.Message );
			}
 
		}


		
		/// <summary>
		/// 递归调用获取指定对象的所有相关对象
		/// </summary>
		/// <param name="PPtr"></param>
		private void GetRelateObjectForTree(String PPtr)
		{
			String tempSql;
			DataTable dt;
			DataRow dr;
			int i;
			String strCode;

			try
			{
			
				
				//读子对象
				tempSql=this.SqlBuilder.GetFilterSql("gs_structure"," Where ParentId='" + PPtr + "'","");
				dt=this.DataOperator.GetDataTable(tempSql); 
			
				for(i=0;i<=dt.Rows.Count-1;i++)
				{
					dr=dt.Rows[i];
					//对象编码
					strCode=dr[m_CodeName].ToString();
					//读该对象的所有相关对象
					DataTable RelateDT;
					tempSql="select * from gs_structure where infoid in (select distinct left(dictid,charindex('.',dictid)-1) as InfoIdName  from gs_property where infoid='" +  strCode + "' and Charindex('.',dictid)>0)";
					RelateDT=this.DataOperator.GetDataTable(tempSql);
					//将一个对象的相关对象加到本地表中
					for(int j=0;j<=RelateDT.Rows.Count-1;j++)
					{
						this.m_ObjectTable.ImportRow(RelateDT.Rows[j]);   
					}
				
					GetRelateObjectForTree(strCode);

				}
			}
			catch(Exception ee)
			{
				throw new Exception(ee.Message );
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

		
    

	}//class
}//namespace
