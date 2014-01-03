using System;

namespace U_Zwd
{
	/// <summary>
	/// 
	/// 目的：常用数据库对象的抽象
	/// 创建人：张卫东
	/// 创建时间：2002-08-22
	/// 
	/// </summary>
	public class U_Dt_Zwd
	{
		private System.Data.DataSet dst, dstDeleted;
		private System.Data.DataTable dt, dtDeleted;
		private System.Data.SqlClient.SqlCommandBuilder cmd;
		private System.Data.SqlClient.SqlDataAdapter dta;

		private U_Zwd.U_Db_Zwd udb;


		public U_Dt_Zwd(string strSQL, U_Zwd.U_Db_Zwd pudb)
		{
			udb = pudb;
			udb.Connect();

			dta = new System.Data.SqlClient.SqlDataAdapter(strSQL, udb.Connection);
			cmd = new System.Data.SqlClient.SqlCommandBuilder(dta);

			dst = new System.Data.DataSet();
			dta.Fill(dst);
			dt = dst.Tables[0];

			dstDeleted = new System.Data.DataSet();
			dta.Fill(dstDeleted);
			dtDeleted = dstDeleted.Tables[0];

			udb.DisConnect();
		}

		public System.Data.DataRowCollection Rows
		{
			get
			{
				return dt.Rows;
			}
		}

		public System.Data.DataColumnCollection Columns
		{
			get
			{
				return dt.Columns;
			}
		}

		public System.Data.DataTableCollection Tables
		{
			get
			{
				return dst.Tables;
			}
		}

		public System.Data.DataSet DataSet
		{
			get
			{
				return dst;
			}
		}
					  
		public void Update()
		{
			udb.Connect();

			// 先删除
			try
			{
				U_Zwd.U_Pub_Zwd.RemoveAll(dtDeleted);
				dta.Update(dstDeleted);
				U_Zwd.U_Pub_Zwd.CopyAll(dt, dtDeleted);
				dtDeleted.AcceptChanges();
			}
			catch(Exception ee)
			{
				if(udb.Debug)
					new U_Zwd.frm_Debug(dtDeleted, ee.Message).Show();
			}

			// 后增加
			try
			{
				dt.Clear();
				U_Zwd.U_Pub_Zwd.CopyAll(dtDeleted, dt);
				dta.Update(dst);
			}
			catch(Exception ee)
			{
				if(udb.Debug)
					new U_Zwd.frm_Debug(dt, ee.Message).Show();
			}

			udb.DisConnect();
		}

		public void Delete(int RowIndex)
		{
			dt.Rows.RemoveAt(RowIndex);
		}

	}
}
