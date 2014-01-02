using System;
using GMIS.CommonRightDataAccess;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// MyBase 的摘要说明:只能被继承。
	/// </summary>
	public  abstract class MyBase
	{
		
		public MyBase(string[] MyConnectInfo)
		{
			m_ConnectInfo=MyConnectInfo;
			this.m_DataOper=new CDataOperator(m_ConnectInfo);
			this.m_SqlBuilder=new CSqlBuilder();  

		}

		public MyBase()
		{}
		
		

		#region 属性

		/// <summary>
		/// 数据库连接信息
		/// </summary>
		private  string[]  m_ConnectInfo=new string[4] ; //数据库连接信息
		public  string[] ConnectInfo
		{
			get
			{
				return m_ConnectInfo;
			}
			set
			{
				m_ConnectInfo=value;
			}
		}


		/// <summary>
		/// Sql语句构造器
		/// </summary>
		private  CSqlBuilder m_SqlBuilder; //SQL语句构造器
		public CSqlBuilder SqlBuilder
		{
			get
			{
				return m_SqlBuilder;
			}
			set
			{
				m_SqlBuilder=value;
			}
		}


		/// <summary>
		/// 数据库操作器
		/// </summary>
		private  CDataOperator m_DataOper; //数据操作对象
		public CDataOperator DataOperator
		{
			get
			{
				return m_DataOper;
			}
			set
			{
				m_DataOper=value;
			}
		}

		#endregion

	}
}
