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
	/// FrmKey ��ժҪ˵����
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
		/// ����������������
		/// </summary>
		private System.ComponentModel.Container components = null;

		public FrmKey(string mystrBase,string mySerialNo)
		{
			//
			// Windows ���������֧���������
			//
			InitializeComponent();
			strBase = mystrBase;
			this.txtSerialNo.Text= mySerialNo; 
			//
			// TODO: �� InitializeComponent ���ú�����κι��캯������
			//



		}
		//=========����ע�ᴰ�ڵĳ�ʼ�� 2005��5��10 LDM
		public FrmKey(string mystrBase,string mySerialNo,int Flag)
		{
			//
			// Windows ���������֧���������
			//
			InitializeComponent();
			strBase = mystrBase;
			this.txtSerialNo.Text= mySerialNo; 
			this.FlagFrm = Flag;
			//
			// TODO: �� InitializeComponent ���ú�����κι��캯������
			//
		}
		//=============================================


		/// <summary>
		/// ������������ʹ�õ���Դ��
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
		/// �����֧������ķ��� - ��Ҫʹ�ô���༭���޸�
		/// �˷��������ݡ�
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
			this.cmdCancel.Text = "ȡ��";
			this.cmdCancel.Click += new System.EventHandler(this.cmdCancel_Click);
			// 
			// cmdOk
			// 
			this.cmdOk.Location = new System.Drawing.Point(120, 160);
			this.cmdOk.Name = "cmdOk";
			this.cmdOk.Size = new System.Drawing.Size(56, 24);
			this.cmdOk.TabIndex = 7;
			this.cmdOk.Text = "ȷ��";
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
			this.label3.Text = "���кţ�";
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
			this.label1.Text = "ע���룺";
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
			this.label2.Text = "Ϊ�˱�֤���ܻ�����ʵķ����뾡����������ϵע�������";
			// 
			// label4
			// 
			this.label4.ForeColor = System.Drawing.SystemColors.HotTrack;
			this.label4.Location = new System.Drawing.Point(8, 40);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(186, 13);
			this.label4.TabIndex = 11;
			this.label4.Text = "��ϵ�绰��010��62358383ת370";
			// 
			// ckxLater
			// 
			this.ckxLater.Location = new System.Drawing.Point(8, 163);
			this.ckxLater.Name = "ckxLater";
			this.ckxLater.Size = new System.Drawing.Size(85, 18);
			this.ckxLater.TabIndex = 12;
			this.ckxLater.Text = "�Ժ���ע��";
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
			this.Text = "ע��--����3.3 ��";
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
						MessageBox.Show("������ע���룡","��ʾ",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
						return;
					}
				}


				//�������кż���ע����
				string ComputeRegisterNo=getHash(this.txtSerialNo.Text.Trim().ToUpper());  

				//�ṩ��ע����
				string ProviderRegisterNo=this.txtRegisterNo.Text.Trim();   

				if(FlagFrm==0)
				{
					this.WriteRegister();
				}

				if(ComputeRegisterNo==ProviderRegisterNo)  //��ͬ��д��ע�����
				{
                  this.WriteRegister( ProviderRegisterNo);
				  this.gsBl=true; 
				  this.Close(); 

				}
				else
				{
					if(!ckxLater.Checked)
					{
						MessageBox.Show("ע������Ч��","��ʾ",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
						return;
					}
					this.gsBl=true; 
					this.Close(); 
				}
  
			}
			catch(Exception ee)
			{
				string errmsg=ee.Message ;
				MessageBox.Show("ע�����","��ʾ",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
				return;
			}

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



		private void cmdCancel_Click(object sender, System.EventArgs e)
		{
			this.gsBl = false;
			this.Close();
		}


		//webע����Ϣ
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
		/// дע���
		/// </summary>
		private void WriteRegister(string registerNo)
		{

					RegistryKey LMRK=Registry.LocalMachine;
					RegistryKey SoftRK=LMRK.OpenSubKey("software",true);
					//RegistryKey GmisRK=SoftRK.OpenSubKey("������").OpenSubKey("�й�������Ϣ����ϵͳ").OpenSubKey("1.00.000",true);

					string strNo="HserialNo";
					string strtemp = "�й�������Ϣ����ϵͳ";
#if (Single)
					//����
					strNo="HserialNo";
					strtemp = "�й�������Ϣ����ϵͳ";
#elif (Complex)
			//����
    				strNo="serialNoNet";
					strtemp = "�й�������Ϣ����ϵͳ";

#endif 

					//RegistryKey GmisRK=SoftRK.OpenSubKey("������").OpenSubKey(strtemp).OpenSubKey("3.00.000",true);
			       
			         RegistryKey GmisRK=SoftRK.CreateSubKey("������").CreateSubKey(strtemp).CreateSubKey("3.00.000");
					GmisRK.SetValue(strNo,registerNo);
				
			}
		//=================2005��5��9 LDM
        /// <summary>
        /// ��ע�����д�Ժ���ע�����Ϣ
        /// 
        /// </summary>
		private void WriteRegister()
		{
			RegistryKey LMRK=Registry.LocalMachine;
			RegistryKey SoftRK=LMRK.OpenSubKey("software",true);
			//RegistryKey GmisRK=SoftRK.OpenSubKey("������").OpenSubKey("�й�������Ϣ����ϵͳ").OpenSubKey("1.00.000",true);

			string strNo="HserialNo";
			string strtemp = "�й�������Ϣ����ϵͳ";
#if (Single)
			//����
			strNo="Later";
			strtemp = "�й�������Ϣ����ϵͳ";
#elif (Complex)
			//����
    		strNo="NetLater";
			strtemp = "�й�������Ϣ����ϵͳ";

#endif 

			RegistryKey GmisRK=SoftRK.CreateSubKey("������").CreateSubKey(strtemp).CreateSubKey("3.00.000");
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
