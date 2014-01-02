using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data ;
using System.Data .SqlClient ;
using GMIS.CommonRightDataAccess;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// regDistinctForm 的摘要说明。
	/// </summary>
	public class regDistinctForm : System.Windows.Forms.Form
	{
		private LayObjTreeControl.LayObjTree layObjTree1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button btn_cancel;
		private System.Windows.Forms.Button btn_ok;
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.Container components = null;
		private System.Windows.Forms.Label label2;
	 	  //数据操作对象
		private CDataOperator _DataOper;
		public  string[]  _ConnectInfo=new string[4] ; //数据库连接信息
        
		public regDistinctForm()
		{
			//
			// Windows 窗体设计器支持所必需的
			//
			InitializeComponent();

			//
			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
			//
		}

		/// <summary>
		/// 清理所有正在使用的资源。
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if(components != null)
				{
					components.Dispose();
				}
			}
			base.Dispose( disposing );
		}

		#region Windows Form Designer generated code
		/// <summary>
		/// 设计器支持所需的方法 - 不要使用代码编辑器修改
		/// 此方法的内容。
		/// </summary>
		private void InitializeComponent()
		{
			this.layObjTree1 = new LayObjTreeControl.LayObjTree();
			this.label1 = new System.Windows.Forms.Label();
			this.btn_cancel = new System.Windows.Forms.Button();
			this.btn_ok = new System.Windows.Forms.Button();
			this.label2 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// layObjTree1
			// 
			this.layObjTree1.gsCheckBoxes = false;
			this.layObjTree1.gsConnectInfo = null;
			this.layObjTree1.gsDefaultOrgs = "";
			this.layObjTree1.gsDepInheritFields = "";
			this.layObjTree1.gsIsAddBrotherNode = false;
			this.layObjTree1.gsIsDeleteAll = true;
			this.layObjTree1.gsIsMainObjReadOnly = false;
			this.layObjTree1.gsisRestrictionDepCode = true;
			this.layObjTree1.gsIsSelectAfterExpland = true;
			this.layObjTree1.gsIsSimple = false;
			this.layObjTree1.gsIsViewRootAddChildNode = true;
			this.layObjTree1.gsmAllowDrop = false;
			this.layObjTree1.gsMovingCorlor = 0;
			this.layObjTree1.gsMultiNodeCheck = false;
			this.layObjTree1.gsTableName = null;
			this.layObjTree1.Location = new System.Drawing.Point(8, 40);
			this.layObjTree1.Name = "layObjTree1";
			this.layObjTree1.Size = new System.Drawing.Size(392, 248);
			this.layObjTree1.TabIndex = 0;
			this.layObjTree1.Click += new System.EventHandler(this.layObjTree1_Click);
			// 
			// label1
			// 
			this.label1.Location = new System.Drawing.Point(8, 8);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(128, 27);
			this.label1.TabIndex = 5;
			this.label1.Text = "请选择您所在的行政区";
			// 
			// btn_cancel
			// 
			this.btn_cancel.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.btn_cancel.Location = new System.Drawing.Point(288, 304);
			this.btn_cancel.Name = "btn_cancel";
			this.btn_cancel.Size = new System.Drawing.Size(88, 24);
			this.btn_cancel.TabIndex = 7;
			this.btn_cancel.Text = "取消(&Q)";
			this.btn_cancel.Click += new System.EventHandler(this.btn_cancel_Click);
			// 
			// btn_ok
			// 
			this.btn_ok.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
			this.btn_ok.Location = new System.Drawing.Point(192, 304);
			this.btn_ok.Name = "btn_ok";
			this.btn_ok.Size = new System.Drawing.Size(88, 24);
			this.btn_ok.TabIndex = 6;
			this.btn_ok.Text = "确定(&Y)";
			this.btn_ok.Click += new System.EventHandler(this.btn_ok_Click);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(144, 8);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(232, 16);
			this.label2.TabIndex = 8;
			this.label2.Text = "label2";
			this.label2.Visible = false;
			// 
			// regDistinctForm
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
			this.ClientSize = new System.Drawing.Size(410, 360);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.label2,
																		  this.btn_cancel,
																		  this.btn_ok,
																		  this.label1,
																		  this.layObjTree1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "regDistinctForm";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "注册行政区";
			this.TopMost = true;
			this.Load += new System.EventHandler(this.regDistinctForm_Load);
			this.ResumeLayout(false);

		}
		#endregion

		private void regDistinctForm_Load(object sender, System.EventArgs e)
		{
		    this._DataOper =new CDataOperator(_ConnectInfo);

			
			this.layObjTree1.Visible=true;
			this.layObjTree1.gsConnectInfo=this._ConnectInfo;
			this.layObjTree1.gsTableName= "ab01";
			this.layObjTree1.gswherestr = "ZC9993='1'";
			this.layObjTree1.gsDefaultOrgs="";  
		 //	if(this.mInputID == "")
				this.layObjTree1.gsShowLayObjTree("");
		 //	else
		 //		this.layObjTree1.gsShowLayObjTree(this.mInputID);
			this.layObjTree1.Visible = true;
		}

		private void btn_cancel_Click(object sender, System.EventArgs e)
		{
			this.Close ();
		}

		private void layObjTree1_Click(object sender, System.EventArgs e)
			{
			this.label2 .Text = this.label2 .Text + this.layObjTree1.gsDescription ;
		}

		private void btn_ok_Click(object sender, System.EventArgs e)
		{
		   string strinsert ="";
           string _guid = this.layObjTree1 .gsDeptID ;
		   DataTable  _dt = this._DataOper .GetDataTable ("select ab0100,za9996,za0100 from ab01 where za0100 ='"+this.layObjTree1 .gsDeptID +"' ");
		   int _level = 0;
			//////////-----------------------------------------------------
			try
			{
				if(_dt.Rows [0][1].ToString () == "")
				{
					_level = _dt.Rows [0][2].ToString ().Length ;
				 
				}
				if(_dt.Rows [0][1].ToString ().Length  == _dt.Rows [0][2].ToString ().Length )
				{
					_level = _dt.Rows [0][1].ToString ().Length ;
				 
				}
				if(_dt.Rows [0][1].ToString ().Length  < _dt.Rows [0][2].ToString ().Length ) 
				{
					_level = _dt.Rows [0][2].ToString ().Length ;
				 
				}
			}
			catch
			{}
			//////////-----------------------------------------------------
		    this._DataOper .ExecuteSql ("insert into regdistinct(guid,ab0111,ab0110,level) values('"+_dt.Rows [0][0].ToString ()+"','"+_dt.Rows [0][1].ToString ()+"','"+_dt.Rows [0][2].ToString ()+"','"+_level+"')");
			this.Close ();
			this.DialogResult = DialogResult .OK ;
		}
	}
}
