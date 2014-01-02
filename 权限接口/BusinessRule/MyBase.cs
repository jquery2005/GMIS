using System;
using GMIS.CommonRightDataAccess;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// MyBase ��ժҪ˵��:ֻ�ܱ��̳С�
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
		
		

		#region ����

		/// <summary>
		/// ���ݿ�������Ϣ
		/// </summary>
		private  string[]  m_ConnectInfo=new string[4] ; //���ݿ�������Ϣ
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
		/// Sql��乹����
		/// </summary>
		private  CSqlBuilder m_SqlBuilder; //SQL��乹����
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
		/// ���ݿ������
		/// </summary>
		private  CDataOperator m_DataOper; //���ݲ�������
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
