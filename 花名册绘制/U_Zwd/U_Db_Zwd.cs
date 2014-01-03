using System;

namespace U_Zwd
{
	/// <summary>
	/// 
	/// 目的：数据库的抽象
	/// 创建人：张卫东
	/// 创建时间：2002-07-29
	/// 
	/// </summary>
	public class U_Db_Zwd
	{
		// 数据库连接对象
		private System.Data.SqlClient.SqlConnection cn1 = null;

		//private System.Data.OleDb.OleDbConnection cn2; // 备用

		// 数据库连接参数
		private string strServerName, strUserId, strPassword, strDatabase, strConnection;
		// 是否已经连接
		private bool blnConnected;


		// add 2003-05-20
		//private bool blnDebug = true;
		private bool blnDebug = false;
		public bool Debug
		{
			get
			{
				return blnDebug;
			}
			set
			{
				blnDebug = value;
			}
		}
		// enda

		// add 2003-02-25
		private string strUserName = "";
		public string UserName
		{
			get
			{
				return strUserName;
			}
			set
			{
				strUserName = value;
			}
		}
		// enda

		// add 2003-01-21
		private string strModule = "";
		public string Module
		{
			get
			{
				return strModule;
			}
			set
			{
				strModule = value;
			}
		}
		// enda


		public string ServerName
		{
			set
			{
				strServerName = value;
			}
			get
			{
				return strServerName;
			}
		}

		public string UserId
		{
			set
			{
				strUserId = value;
			}
			get
			{
				return strUserId;
			}
		}

		public string Password
		{
			set
			{
				strPassword = value;
			}
			get
			{
				return strPassword;
			}
		}

		public string Database
		{
			set
			{
				strDatabase = value;
			}
			get
			{
				return strDatabase;
			}
		}

		public bool Connected
		{
			set
			{
				blnConnected = value;
			}
			get
			{
				return blnConnected;
			}
		}


		public string[] ConnectionInfo
		{
			get
			{
				return new string[]{ServerName, Database, UserId, Password};
			}
			set
			{
				try
				{
					string[] s = value;

					this.Init(s[0], s[2], s[3], s[1]);
				}
				catch
				{
				}
			}
		}


		public U_Db_Zwd()
		{
			Connected = false;
		}
	
		public U_Db_Zwd(string pServerName, string pUserId, string pPassword, string pDatabase)
		{
			Init(pServerName, pUserId, pPassword, pDatabase);
		}

		public bool Init(string pServerName, string pUserId, string pPassword, string pDatabase)
		{
			ServerName = pServerName;
			UserId = pUserId;
			Password = pPassword;
			Database = pDatabase;

			strConnection = "Server=" + pServerName + ";"
				+ "UId=" + pUserId + ";"
				+ "Pwd=" + pPassword + ";"
				+ "Database=" + pDatabase + ";";
			
			return Connected = false;
		}

		public System.Data.SqlClient.SqlConnection cn
		{
			get
			{
				return Connection;
			}
		}

		// 数据库连接的维护
		public System.Data.SqlClient.SqlConnection Connection
		{
			get
			{
				if(cn1 == null)
					cn1 = new System.Data.SqlClient.SqlConnection();

				return cn1;
			}
		}

		// 数据库连接的维护 - 打开连接
		public bool Connect()
		{
			if(!Connected)
			{
				try
				{
					Connection.ConnectionString = strConnection;
					Connection.Open();
					Connected = (Connection.State == System.Data.ConnectionState.Open);
				}
				catch(System.Exception ee)
				{
					Connected = false;

					if(this.Debug)
						U_Pub_Zwd.ErrorMessage("数据库连接错误：" + ee.Message);
				}
			}

			return Connected;
		}

		// 关闭
		public void DisConnect()
		{
			try
			{
				if(Connection.State == System.Data.ConnectionState.Open)
				{
					Connection.Close();
					this.Connected = false;
				}
			}
			catch
			{
			}
		}

		// 连接
		public bool Connect(string pServerName, string pUserId, string pPassword, string pDatabase)
		{
			Init(pServerName, pUserId, pPassword, pDatabase);
			
			return Connect();
		}

		// 数据库命令的维护 - 打开数据集
		public bool rsOpen(ref System.Data.DataSet dst, string pSQL)
		{
			bool blnResult;
//
			if(dst == null)
				dst = new System.Data.DataSet();

			// 清控原来的数据
			dst.Clear();
			if(dst.Tables.Count>0)
				dst.Tables[0].Columns.Clear();

			try
			{
				// del 2002-12-18
				//this.DisConnect();
				// endd

				// 连接
				if(blnResult = Connect())
				{
					// 填充数据
					new System.Data.SqlClient.SqlDataAdapter(pSQL, this.Connection).Fill(dst);

					blnResult = dst.Tables.Count > 0;
				}
			}
			catch(System.Exception ee)
			{
				blnResult = false;

				if(this.Debug)
					U_Pub_Zwd.ErrorMessage("数据集打开错误：" + ee.Message);
			}
			finally
			{
				// 断开
				// del 2002-12-18
				//DisConnect();
				// endd
			}

			return blnResult;
		}

		// 数据库命令的维护 - 返回数据集
		public System.Data.DataTable rsOpen(string pSQL)
		{
			System.Data.DataSet dst = null;
			if(rsOpen(ref dst, pSQL))
				return dst.Tables[0];
			else
				return null;
		}

		// 数据库命令的维护 - 执行命令
		public bool SQLExecute(string pSQL)
		{
			bool blnResult;

			System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(pSQL, this.Connection);

			// add 2003-06-05
			cmd.CommandTimeout = 300;
			// enda

			try
			{
				// del 2002-12-18
				//this.DisConnect();
				// endd

				// 连接
				if(blnResult = Connect())
				{
					// 执行
					cmd.ExecuteNonQuery();
				}
			}
			catch(System.Exception ee)
			{
				blnResult = false;

				if(this.Debug)
					U_Pub_Zwd.ErrorMessage("数据库命令错误：" + ee.Message);
			}
			finally
			{
				// 断开
				// del 2002-12-18
				//DisConnect();
				// endd
			}

			return blnResult;
		}


		// 绑定 ListView
		// HideColumns 以分号分割的隐藏列号组合
		public bool rsBindList(ref System.Data.DataSet dst, string pSQL, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns)
		{
			if((dst == null && pSQL == "") || lvw == null)
				return false;

			if(pSQL != "")
				rsOpen(ref dst, pSQL);

			return U_Pub_Zwd.rsBindList(dst, lvw, ImageIndex, HideColumns);
		}

		// 绑定 ListView
		// HideColumns 以分号分割的隐藏列号组合
		public bool rsBindList(ref System.Data.DataSet dst, string pSQL, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns, int SortColumn)
		{
			if((dst == null && pSQL == "") || lvw == null)
				return false;

			if(pSQL != "")
				rsOpen(ref dst, pSQL);

			return U_Pub_Zwd.rsBindList(dst.Tables[0], lvw, ImageIndex, HideColumns, SortColumn);
		}


		// rsBindTree, rsBindTreeEx
		// 绑定 TreeView
		// dst 的结构：
		// 冗余的分组结构（不用 Group By, 用重复表示分组），并且按分组排序，Levels 指定分组数（即层数）
		// ImageIndex 是用分号分割的一个字串，每个元素代表一个图标索引
		public bool rsBindTree(ref System.Data.DataSet dst, string pSQL, System.Windows.Forms.TreeView tvw
			,int Levels, string ImageIndex)
		{
			if((dst == null && pSQL == "") || tvw == null)
				return false;

			if(pSQL != "")
				rsOpen(ref dst, pSQL);

			return U_Pub_Zwd.rsBindTree(dst, tvw, Levels, ImageIndex);
		}


	}
}
