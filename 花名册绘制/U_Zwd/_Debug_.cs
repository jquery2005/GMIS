using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace U_Zwd
{
    /// <summary>
    /// 目的：调试窗口
    /// 创建人：张卫东
    /// 创建时间：2002-08-22
    /// </summary>
    public partial class frm_Debug : Form
    {
        public frm_Debug(System.Data.DataSet pdst, string s)
        {
            InitializeComponent();

            dt = pdst.Tables[0];
            this.Text = s;
        }

        public frm_Debug(System.Data.DataTable pdt, string s)
        {
            //
            // Windows 窗体设计器支持所必需的
            //
            InitializeComponent();

            dt = pdt;
            this.Text = s;
        }

        public frm_Debug(U_Zwd.U_Dt_Zwd pdst, string s)
        {
            //
            // Windows 窗体设计器支持所必需的
            //
            InitializeComponent();

            dt = pdst.Tables[0];
            this.Text = s;
        }

        private System.Data.DataTable dt;

        private void frm_Debug_Load(object sender, EventArgs e)
        {
            try
            {
                U_Zwd.U_Pub_Zwd.rsBindList(dt, lvw, 0, "");
            }
            catch { }
        }

        private void lvw_ColumnClick(object sender, ColumnClickEventArgs e)
        {
            U_Zwd.U_Pub_Zwd.SortListView(lvw, e.Column, true);
        }
    }
}
