using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using Microsoft.Win32;
using System.Management;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// FrmKey 的摘要说明。
	/// </summary>
	public class FrmKey : System.Windows.Forms.Form
	{
		private string strBase;
		public  bool gsBl = false;

		private System.Windows.Forms.Button cmdCancel;
		private System.Windows.Forms.Button cmdOk;
		private System.Windows.Forms.GroupBox groupBox1;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.PictureBox pictureBox1;
		private System.Windows.Forms.TextBox txtSerialNo;
		private System.Windows.Forms.TextBox txtRegisterNo;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label4;
		public System.Windows.Forms.CheckBox ckxLater;
		private int FlagFrm=0;
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FrmKey(string mystrBase,string mySerialNo)
		{
			//
			// Windows 窗体设计器支持所必需的
			//
			InitializeComponent();
			strBase = mystrBase;
			this.txtSerialNo.Text= mySerialNo; 
			//
			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
			//



		}
		//=========重载注册窗口的初始化 2005－5－10 LDM
		public FrmKey(string mystrBase,string mySerialNo,int Flag)
		{
			//
			// Windows 窗体设计器支持所必需的
			//
			InitializeComponent();
			strBase = mystrBase;
			this.txtSerialNo.Text= mySerialNo; 
			this.FlagFrm = Flag;
			//
			// TODO: 在 InitializeComponent 调用后添加任何构造函数代码
			//
		}
		//=============================================


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
			System.Resources.ResourceManager resources = new System.Resources.ResourceManager(typeof(FrmKey));
			this.cmdCancel = new System.Windows.Forms.Button();
			this.cmdOk = new System.Windows.Forms.Button();
			this.groupBox1 = new System.Windows.Forms.GroupBox();
			this.label3 = new System.Windows.Forms.Label();
			this.txtSerialNo = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.txtRegisterNo = new System.Windows.Forms.TextBox();
			this.pictureBox1 = new System.Windows.Forms.PictureBox();
			this.label2 = new System.Windows.Forms.Label();
			this.label4 = new System.Windows.Forms.Label();
			this.ckxLater = new System.Windows.Forms.CheckBox();
			this.groupBox1.SuspendLayout();
			this.SuspendLayout();
			// 
			// cmdCancel
			// 
			this.cmdCancel.Location = new System.Drawing.Point(200, 160);
			this.cmdCancel.Name = "cmdCancel";
			this.cmdCancel.Size = new System.Drawing.Size(56, 24);
			this.cmdCancel.TabIndex = 8;
			this.cmdCancel.Text = "取消";
			this.cmdCancel.Click += new System.EventHandler(this.cmdCancel_Click);
			// 
			// cmdOk
			// 
			this.cmdOk.Location = new System.Drawing.Point(120, 160);
			this.cmdOk.Name = "cmdOk";
			this.cmdOk.Size = new System.Drawing.Size(56, 24);
			this.cmdOk.TabIndex = 7;
			this.cmdOk.Text = "确定";
			this.cmdOk.Click += new System.EventHandler(this.cmdOk_Click);
			// 
			// groupBox1
			// 
			this.groupBox1.Controls.AddRange(new System.Windows.Forms.Control[] {
																					this.label3,
																					this.txtSerialNo,
																					this.label1,
																					this.txtRegisterNo});
			this.groupBox1.Location = new System.Drawing.Point(8, 56);
			this.groupBox1.Name = "groupBox1";
			this.groupBox1.Size = new System.Drawing.Size(248, 96);
			this.groupBox1.TabIndex = 9;
			this.groupBox1.TabStop = false;
			// 
			// label3
			// 
			this.label3.AutoSize = true;
			this.label3.Location = new System.Drawing.Point(16, 24);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(54, 14);
			this.label3.TabIndex = 4;
			this.label3.Text = "序列号：";
			// 
			// txtSerialNo
			// 
			this.txtSerialNo.BackColor = System.Drawing.Color.White;
			this.txtSerialNo.Location = new System.Drawing.Point(80, 24);
			this.txtSerialNo.Name = "txtSerialNo";
			this.txtSerialNo.ReadOnly = true;
			this.txtSerialNo.Size = new System.Drawing.Size(144, 21);
			this.txtSerialNo.TabIndex = 0;
			this.txtSerialNo.Text = "";
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(16, 56);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(54, 14);
			this.label1.TabIndex = 0;
			this.label1.Text = "注册码：";
			// 
			// txtRegisterNo
			// 
			this.txtRegisterNo.Location = new System.Drawing.Point(80, 56);
			this.txtRegisterNo.Name = "txtRegisterNo";
			this.txtRegisterNo.Size = new System.Drawing.Size(144, 21);
			this.txtRegisterNo.TabIndex = 1;
			this.txtRegisterNo.Text = "";
			// 
			// pictureBox1
			// 
			this.pictureBox1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.pictureBox1.Cursor = System.Windows.Forms.Cursors.Hand;
			this.pictureBox1.Image = ((System.Drawing.Bitmap)(resources.GetObject("pictureBox1.Image")));
			this.pictureBox1.Location = new System.Drawing.Point(224, 10);
			this.pictureBox1.Name = "pictureBox1";
			this.pictureBox1.Size = new System.Drawing.Size(32, 24);
			this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
			this.pictureBox1.TabIndex = 5;
			this.pictureBox1.TabStop = false;
			this.pictureBox1.Visible = false;
			this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
			// 
			// label2
			// 
			this.label2.ForeColor = System.Drawing.SystemColors.HotTrack;
			this.label2.Location = new System.Drawing.Point(8, 8);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(177, 25);
			this.label2.TabIndex = 10;
			this.label2.Text = "为了保证您能获得优质的服务，请尽快与我们联系注册软件！";
			// 
			// label4
			// 
			this.label4.ForeColor = System.Drawing.SystemColors.HotTrack;
			this.label4.Location = new System.Drawing.Point(8, 40);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(186, 13);
			this.label4.TabIndex = 11;
			this.label4.Text = "联系电话：010－62358383转370";
			// 
			// ckxLater
			// 
			this.ckxLater.Location = new System.Drawing.Point(8, 163);
			this.ckxLater.Name = "ckxLater";
			this.ckxLater.Size = new System.Drawing.Size(85, 18);
			this.ckxLater.TabIndex = 12;
			this.ckxLater.Text = "以后再注册";
			this.ckxLater.Visible = false;
			// 
			// FrmKey
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
			this.ClientSize = new System.Drawing.Size(264, 192);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.ckxLater,
																		  this.label4,
																		  this.label2,
																		  this.cmdCancel,
																		  this.cmdOk,
																		  this.groupBox1,
																		  this.pictureBox1});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "FrmKey";
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "注册--网络3.3 版";
			this.TopMost = true;
			this.Load += new System.EventHandler(this.FrmKey_Load);
			this.groupBox1.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void FrmKey_Load(object sender, System.EventArgs e)
		{
		

			this.TopMost = false;
	

		}


		/// <summary>
		/// 
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void cmdOk_Click(object sender, System.EventArgs e)
		{
			try
			{
				if(!ckxLater.Checked)
				{
					if(this.txtRegisterNo.Text.Trim() == "")
					{
						MessageBox.Show("请输入注册码！","提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
						return;
					}
				}


				//根据序列号计算注册码
				string ComputeRegisterNo=getHash(this.txtSerialNo.Text.Trim().ToUpper());  

				//提供的注册码
				string ProviderRegisterNo=this.txtRegisterNo.Text.Trim();   

				if(FlagFrm==0)
				{
					this.WriteRegister();
				}

				if(ComputeRegisterNo==ProviderRegisterNo)  //相同，写到注册表中
				{
                  this.WriteRegister( ProviderRegisterNo);
				  this.gsBl=true; 
				  this.Close(); 

				}
				else
				{
					if(!ckxLater.Checked)
					{
						MessageBox.Show("注册码无效！","提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
						return;
					}
					this.gsBl=true; 
					this.Close(); 
				}
  
			}
			catch(Exception ee)
			{
				string errmsg=ee.Message ;
				MessageBox.Show("注册出错！","提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
				return;
			}

		}


		
		/// <summary>
		/// 生成注册号
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



		private void cmdCancel_Click(object sender, System.EventArgs e)
		{
			this.gsBl = false;
			this.Close();
		}


		//web注册信息
		private void button1_Click(object sender, System.EventArgs e)
		{
//			Frmrecord frm = new Frmrecord();
//			frm.strMationNo =this.txtSerialNo.Text.Trim();
//			frm.ShowDialog();
//			if(frm.blClose)
//				this.txtRegisterNo.Text = frm.strRegNo;
//			else
//				this.txtRegisterNo.Text = "";

		}


		private void pictureBox1_Click(object sender, System.EventArgs e)
		{
		
			System.Diagnostics.Process.Start("http://www.hrinfo.com.cn");
		}


		/// <summary>
		/// 写注册表
		/// </summary>
		private void WriteRegister(string registerNo)
		{

					RegistryKey LMRK=Registry.LocalMachine;
					RegistryKey SoftRK=LMRK.OpenSubKey("software",true);
					//RegistryKey GmisRK=SoftRK.OpenSubKey("飞利信").OpenSubKey("中国人事信息管理系统").OpenSubKey("1.00.000",true);

					string strNo="HserialNo";
					string strtemp = "中国人事信息管理系统";
#if (Single)
					//单机
					strNo="HserialNo";
					strtemp = "中国人事信息管理系统";
#elif (Complex)
			//网络
    				strNo="serialNoNet";
					strtemp = "中国人事信息管理系统";

#endif 

					//RegistryKey GmisRK=SoftRK.OpenSubKey("飞利信").OpenSubKey(strtemp).OpenSubKey("3.00.000",true);
			       
			         RegistryKey GmisRK=SoftRK.CreateSubKey("飞利信").CreateSubKey(strtemp).CreateSubKey("3.00.000");
					GmisRK.SetValue(strNo,registerNo);
				
			}
		//=================2005－5－9 LDM
        /// <summary>
        /// 向注册表中写以后再注册的信息
        /// 
        /// </summary>
		private void WriteRegister()
		{
			RegistryKey LMRK=Registry.LocalMachine;
			RegistryKey SoftRK=LMRK.OpenSubKey("software",true);
			//RegistryKey GmisRK=SoftRK.OpenSubKey("飞利信").OpenSubKey("中国人事信息管理系统").OpenSubKey("1.00.000",true);

			string strNo="HserialNo";
			string strtemp = "中国人事信息管理系统";
#if (Single)
			//单机
			strNo="Later";
			strtemp = "中国人事信息管理系统";
#elif (Complex)
			//网络
    		strNo="NetLater";
			strtemp = "中国人事信息管理系统";

#endif 

			RegistryKey GmisRK=SoftRK.CreateSubKey("飞利信").CreateSubKey(strtemp).CreateSubKey("3.00.000");
			if(ckxLater.Checked)
			{
				GmisRK.SetValue(strNo,"1");
			}
			else
			{
				GmisRK.SetValue(strNo,"0");
			}
		}
		//=============================================== 
  }
}
