using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
//using GMIS.CommonRightBusinessRule.cn.com.hrinfo.www;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// Frmrecord 的摘要说明。
	/// </summary>
	public class Frmrecord : System.Windows.Forms.Form
	{
		public string strMationNo = "",strRegNo = "";//机器码，注册码
		private string strCurNo = "";//客户号
		//private RegService reg;
		public bool blClose = false;

		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.TextBox textBox1;
		private System.Windows.Forms.Button button1;
		private System.Windows.Forms.Panel panel2;
		private System.Windows.Forms.Button button3;
		private System.Windows.Forms.Button button2;
		private System.Windows.Forms.TextBox textBox9;
		private System.Windows.Forms.Label label9;
		private System.Windows.Forms.TextBox textBox7;
		private System.Windows.Forms.Label label7;
		private System.Windows.Forms.TextBox textBox8;
		private System.Windows.Forms.Label label8;
		private System.Windows.Forms.TextBox textBox5;
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.TextBox textBox6;
		private System.Windows.Forms.Label label6;
		private System.Windows.Forms.TextBox textBox4;
		private System.Windows.Forms.TextBox textBox3;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.TextBox textBox2;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Button button4;
		private System.Windows.Forms.Panel panel3;
		private System.Windows.Forms.Button button5;
		private System.Windows.Forms.Button button6;
		private System.Windows.Forms.Label label10;
		private System.Windows.Forms.Label label11;
		private System.Windows.Forms.Label label12;
		private System.Windows.Forms.Label label13;
		/// <summary>
		/// 必需的设计器变量。
		/// </summary>
		private System.ComponentModel.Container components = null;

		public Frmrecord()
		{
			//
			// Windows 窗体设计器支持所必需的
			//
			InitializeComponent();

			reg = new RegService();
			reg.Timeout = 300000;

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
			this.panel1 = new System.Windows.Forms.Panel();
			this.label13 = new System.Windows.Forms.Label();
			this.button4 = new System.Windows.Forms.Button();
			this.button1 = new System.Windows.Forms.Button();
			this.textBox1 = new System.Windows.Forms.TextBox();
			this.label1 = new System.Windows.Forms.Label();
			this.panel2 = new System.Windows.Forms.Panel();
			this.button3 = new System.Windows.Forms.Button();
			this.button2 = new System.Windows.Forms.Button();
			this.textBox9 = new System.Windows.Forms.TextBox();
			this.label9 = new System.Windows.Forms.Label();
			this.textBox7 = new System.Windows.Forms.TextBox();
			this.label7 = new System.Windows.Forms.Label();
			this.textBox8 = new System.Windows.Forms.TextBox();
			this.label8 = new System.Windows.Forms.Label();
			this.textBox5 = new System.Windows.Forms.TextBox();
			this.label5 = new System.Windows.Forms.Label();
			this.textBox6 = new System.Windows.Forms.TextBox();
			this.label6 = new System.Windows.Forms.Label();
			this.textBox4 = new System.Windows.Forms.TextBox();
			this.textBox3 = new System.Windows.Forms.TextBox();
			this.label4 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.textBox2 = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.panel3 = new System.Windows.Forms.Panel();
			this.label12 = new System.Windows.Forms.Label();
			this.label11 = new System.Windows.Forms.Label();
			this.label10 = new System.Windows.Forms.Label();
			this.button5 = new System.Windows.Forms.Button();
			this.button6 = new System.Windows.Forms.Button();
			this.panel1.SuspendLayout();
			this.panel2.SuspendLayout();
			this.panel3.SuspendLayout();
			this.SuspendLayout();
			// 
			// panel1
			// 
			this.panel1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.panel1.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.label13,
																				 this.button4,
																				 this.button1,
																				 this.textBox1,
																				 this.label1});
			this.panel1.Font = new System.Drawing.Font("幼圆", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.panel1.Location = new System.Drawing.Point(16, 24);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(448, 240);
			this.panel1.TabIndex = 0;
			// 
			// label13
			// 
			this.label13.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.label13.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.label13.ForeColor = System.Drawing.SystemColors.HotTrack;
			this.label13.Location = new System.Drawing.Point(16, 8);
			this.label13.Name = "label13";
			this.label13.Size = new System.Drawing.Size(416, 104);
			this.label13.TabIndex = 21;
			this.label13.Text = "                        警告                     本计算机程序受版权法和国际条例保护。如未经授权而擅自复制或传播本程序" +
				"（或其中任何一部分），将受到严厉的民事和刑事制裁，并将在法律许可的最大限度内受到起诉。";
			// 
			// button4
			// 
			this.button4.Location = new System.Drawing.Point(352, 192);
			this.button4.Name = "button4";
			this.button4.TabIndex = 3;
			this.button4.Text = "取消";
			this.button4.Click += new System.EventHandler(this.button4_Click);
			// 
			// button1
			// 
			this.button1.Location = new System.Drawing.Point(256, 192);
			this.button1.Name = "button1";
			this.button1.TabIndex = 2;
			this.button1.Text = "下一步";
			this.button1.Click += new System.EventHandler(this.button1_Click);
			// 
			// textBox1
			// 
			this.textBox1.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.textBox1.Location = new System.Drawing.Point(160, 144);
			this.textBox1.MaxLength = 20;
			this.textBox1.Name = "textBox1";
			this.textBox1.Size = new System.Drawing.Size(168, 26);
			this.textBox1.TabIndex = 1;
			this.textBox1.Text = "";
			this.textBox1.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.label1.Location = new System.Drawing.Point(40, 144);
			this.label1.Name = "label1";
			this.label1.TabIndex = 0;
			this.label1.Text = "客户号：";
			// 
			// panel2
			// 
			this.panel2.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.panel2.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.button3,
																				 this.button2,
																				 this.textBox9,
																				 this.label9,
																				 this.textBox7,
																				 this.label7,
																				 this.textBox8,
																				 this.label8,
																				 this.textBox5,
																				 this.label5,
																				 this.textBox6,
																				 this.label6,
																				 this.textBox4,
																				 this.textBox3,
																				 this.label4,
																				 this.label3,
																				 this.textBox2,
																				 this.label2});
			this.panel2.Location = new System.Drawing.Point(16, 24);
			this.panel2.Name = "panel2";
			this.panel2.Size = new System.Drawing.Size(448, 240);
			this.panel2.TabIndex = 4;
			// 
			// button3
			// 
			this.button3.Location = new System.Drawing.Point(352, 208);
			this.button3.Name = "button3";
			this.button3.TabIndex = 10;
			this.button3.Text = "取消";
			this.button3.Click += new System.EventHandler(this.button3_Click);
			// 
			// button2
			// 
			this.button2.Location = new System.Drawing.Point(248, 208);
			this.button2.Name = "button2";
			this.button2.TabIndex = 9;
			this.button2.Text = "完成";
			this.button2.Click += new System.EventHandler(this.button2_Click);
			// 
			// textBox9
			// 
			this.textBox9.Location = new System.Drawing.Point(96, 144);
			this.textBox9.MaxLength = 25;
			this.textBox9.Name = "textBox9";
			this.textBox9.Size = new System.Drawing.Size(320, 21);
			this.textBox9.TabIndex = 6;
			this.textBox9.Text = "";
			// 
			// label9
			// 
			this.label9.Location = new System.Drawing.Point(16, 140);
			this.label9.Name = "label9";
			this.label9.Size = new System.Drawing.Size(72, 23);
			this.label9.TabIndex = 14;
			this.label9.Text = "销售商：";
			// 
			// textBox7
			// 
			this.textBox7.Location = new System.Drawing.Point(96, 176);
			this.textBox7.MaxLength = 6;
			this.textBox7.Name = "textBox7";
			this.textBox7.Size = new System.Drawing.Size(120, 21);
			this.textBox7.TabIndex = 7;
			this.textBox7.Text = "";
			// 
			// label7
			// 
			this.label7.Location = new System.Drawing.Point(16, 171);
			this.label7.Name = "label7";
			this.label7.Size = new System.Drawing.Size(72, 23);
			this.label7.TabIndex = 12;
			this.label7.Text = "邮编：";
			// 
			// textBox8
			// 
			this.textBox8.Location = new System.Drawing.Point(280, 114);
			this.textBox8.MaxLength = 25;
			this.textBox8.Name = "textBox8";
			this.textBox8.Size = new System.Drawing.Size(136, 21);
			this.textBox8.TabIndex = 5;
			this.textBox8.Text = "";
			// 
			// label8
			// 
			this.label8.Location = new System.Drawing.Point(216, 114);
			this.label8.Name = "label8";
			this.label8.Size = new System.Drawing.Size(72, 23);
			this.label8.TabIndex = 10;
			this.label8.Text = "传真：";
			// 
			// textBox5
			// 
			this.textBox5.Location = new System.Drawing.Point(96, 114);
			this.textBox5.MaxLength = 25;
			this.textBox5.Name = "textBox5";
			this.textBox5.Size = new System.Drawing.Size(120, 21);
			this.textBox5.TabIndex = 4;
			this.textBox5.Text = "";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(16, 109);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(72, 23);
			this.label5.TabIndex = 8;
			this.label5.Text = "电话：";
			// 
			// textBox6
			// 
			this.textBox6.Location = new System.Drawing.Point(96, 80);
			this.textBox6.MaxLength = 25;
			this.textBox6.Name = "textBox6";
			this.textBox6.Size = new System.Drawing.Size(320, 21);
			this.textBox6.TabIndex = 3;
			this.textBox6.Text = "";
			// 
			// label6
			// 
			this.label6.Location = new System.Drawing.Point(16, 78);
			this.label6.Name = "label6";
			this.label6.Size = new System.Drawing.Size(72, 23);
			this.label6.TabIndex = 6;
			this.label6.Text = "联系人：";
			// 
			// textBox4
			// 
			this.textBox4.Location = new System.Drawing.Point(280, 176);
			this.textBox4.MaxLength = 100;
			this.textBox4.Name = "textBox4";
			this.textBox4.Size = new System.Drawing.Size(136, 21);
			this.textBox4.TabIndex = 8;
			this.textBox4.Text = "";
			// 
			// textBox3
			// 
			this.textBox3.Location = new System.Drawing.Point(96, 48);
			this.textBox3.MaxLength = 25;
			this.textBox3.Name = "textBox3";
			this.textBox3.Size = new System.Drawing.Size(320, 21);
			this.textBox3.TabIndex = 2;
			this.textBox3.Text = "";
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(16, 47);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(72, 23);
			this.label4.TabIndex = 3;
			this.label4.Text = "联系地址：";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(216, 176);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(56, 23);
			this.label3.TabIndex = 2;
			this.label3.Text = "备注：";
			// 
			// textBox2
			// 
			this.textBox2.Location = new System.Drawing.Point(96, 13);
			this.textBox2.MaxLength = 25;
			this.textBox2.Name = "textBox2";
			this.textBox2.Size = new System.Drawing.Size(320, 21);
			this.textBox2.TabIndex = 1;
			this.textBox2.Text = "";
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(16, 16);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(72, 23);
			this.label2.TabIndex = 0;
			this.label2.Text = "单位名称：";
			// 
			// panel3
			// 
			this.panel3.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.panel3.Controls.AddRange(new System.Windows.Forms.Control[] {
																				 this.label12,
																				 this.label11,
																				 this.label10,
																				 this.button5,
																				 this.button6});
			this.panel3.Location = new System.Drawing.Point(16, 24);
			this.panel3.Name = "panel3";
			this.panel3.Size = new System.Drawing.Size(448, 240);
			this.panel3.TabIndex = 5;
			// 
			// label12
			// 
			this.label12.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.label12.Font = new System.Drawing.Font("新宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.label12.ForeColor = System.Drawing.SystemColors.HotTrack;
			this.label12.Location = new System.Drawing.Point(16, 14);
			this.label12.Name = "label12";
			this.label12.Size = new System.Drawing.Size(416, 104);
			this.label12.TabIndex = 20;
			this.label12.Text = "                        警告                    本计算机程序受版权法和国际条例保护。如未经授权而擅自复制或传播本程序（" +
				"或其中任何一部分），将受到严厉的民事和刑事制裁，并将在法律许可的最大限度内受到起诉。";
			// 
			// label11
			// 
			this.label11.AutoSize = true;
			this.label11.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.label11.Location = new System.Drawing.Point(144, 144);
			this.label11.Name = "label11";
			this.label11.Size = new System.Drawing.Size(64, 19);
			this.label11.TabIndex = 19;
			this.label11.Text = "label11";
			// 
			// label10
			// 
			this.label10.AutoSize = true;
			this.label10.Font = new System.Drawing.Font("宋体", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((System.Byte)(134)));
			this.label10.Location = new System.Drawing.Point(40, 144);
			this.label10.Name = "label10";
			this.label10.Size = new System.Drawing.Size(72, 19);
			this.label10.TabIndex = 18;
			this.label10.Text = "注册号：";
			// 
			// button5
			// 
			this.button5.Location = new System.Drawing.Point(352, 208);
			this.button5.Name = "button5";
			this.button5.TabIndex = 17;
			this.button5.Text = "取消";
			this.button5.Click += new System.EventHandler(this.button5_Click);
			// 
			// button6
			// 
			this.button6.Location = new System.Drawing.Point(248, 208);
			this.button6.Name = "button6";
			this.button6.TabIndex = 16;
			this.button6.Text = "完成";
			this.button6.Click += new System.EventHandler(this.button6_Click);
			// 
			// Frmrecord
			// 
			this.AutoScaleBaseSize = new System.Drawing.Size(6, 14);
			this.ClientSize = new System.Drawing.Size(480, 287);
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.panel2,
																		  this.panel1,
																		  this.panel3});
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.MinimizeBox = false;
			this.Name = "Frmrecord";
			this.ShowInTaskbar = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "注册信息";
			this.Load += new System.EventHandler(this.Frmrecord_Load);
			this.panel1.ResumeLayout(false);
			this.panel2.ResumeLayout(false);
			this.panel3.ResumeLayout(false);
			this.ResumeLayout(false);

		}
		#endregion

		private void Frmrecord_Load(object sender, System.EventArgs e)
		{
			panel3.Visible = false;
			panel2.Visible = false;
		}

		private void button5_Click(object sender, System.EventArgs e)
		{
			blClose = false;
			this.Close();
		}

		private void button3_Click(object sender, System.EventArgs e)
		{
			blClose = false;
			this.Close();
		}

		private void button4_Click(object sender, System.EventArgs e)
		{
			blClose = false;
			this.Close();
		}

		private void button1_Click(object sender, System.EventArgs e)
		{
			int iLogin = 0;
			try
			{
				//this.Cursor = System.Windows.Forms.Cursor
				strCurNo = this.textBox1.Text.Trim().ToUpper();
				if(strCurNo == "")
					return;
				iLogin = reg.CurLogin(strCurNo);
				if(iLogin == 0)
				{
					//textBox1.Text = "";
					//MessageBox.Show("客户号不存在！");
					MessageBox.Show("客户号不存在！","提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 

					return;
				}
				else if(iLogin == 1)
				{
					this.panel1.Visible = false;
					this.panel3.Visible = false;
					this.panel2.Visible = true;
				}
				else if(iLogin == 2)
				{
					this.panel1.Visible = false;
					this.panel2.Visible = false;
					this.panel3.Visible = true;
					this.strRegNo = reg.CurGetRegNo(strCurNo,this.strMationNo);
					if(strRegNo == null || strRegNo == "" || strRegNo == "-1")
					{
						label11.Visible = false;
						button6.Enabled = false;
						label10.Text = "此客户号已经注册过或用户数已满，请通过电话方式注册！";
					}
					else
					{
						button6.Enabled = true;
						label11.Text = strRegNo;
					}

				}

			}
			catch(System.Exception ee)
			{
				MessageBox.Show(ee.Message,"提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
			}

		}

		//注册信息
		private void button2_Click(object sender, System.EventArgs e)
		{
			try
			{
				//this.strRegNo = reg.GetRegNo(strCurNo,this.strMationNo);
				//判断必须填写的项目
				string field = reg.gsgetfield("WA01");
				if(field != "")
				{
					string[] fields = field.Split(',');
					for(int i = 0;i<fields.Length;i++)
					{
						switch(fields[i])
						{
							case "ZA0101":  //单位名称
								if(textBox2.Text.Trim() == "")
								{
									MessageBox.Show("请输入单位名称！");
									return;
								}
								break;
							case "WA0103":  //联系地址
								if(textBox3.Text.Trim() == "")
								{
									MessageBox.Show("请输入联系地址！");
									return;
								}
								break;
							case "WA0104":  //联系人
								if(textBox6.Text.Trim() == "")
								{
									MessageBox.Show("请输入联系人！");
									return;
								}
								break;

							case "WA0105": //电话
								if(textBox5.Text.Trim() == "")
								{
									MessageBox.Show("请输入电话！");
									return;
								}
								break;
							case "WA0106": //传真
								if(textBox8.Text.Trim() == "")
								{
									MessageBox.Show("请输入传真！");
									return;
								}
								break;
							case "WA0107":  //销售商
								if(textBox9.Text.Trim() == "")
								{
									MessageBox.Show("请输入销售商！");
									return;
								}

								break;
							case "WA0108": //邮编
								if(textBox7.Text.Trim() == "")
								{
									MessageBox.Show("请输入邮编！");
									return;
								}

								break;			
							case "ZC9995": //备注
								if(textBox4.Text.Trim() == "")
								{
									MessageBox.Show("请输入备注！");
									return;
								}
								break;	
						}
					}
				}

				
				strRegNo = reg.regaddrecord(strCurNo,this.strMationNo,textBox2.Text.Trim(),textBox4.Text.Trim(),textBox3.Text.Trim(),textBox6.Text.Trim(),textBox5.Text.Trim(),textBox8.Text.Trim(),textBox9.Text.Trim(),textBox7.Text.Trim());
				this.blClose = true;
				this.Close();
			}
			catch(System.Exception ee)
			{
				MessageBox.Show(ee.Message,"提示",MessageBoxButtons.OK,MessageBoxIcon.Asterisk); 
				return;
			}
		}

		private void button6_Click(object sender, System.EventArgs e)
		{
			this.blClose = true;
			this.Close();
		}

		private void textBox1_TextChanged(object sender, System.EventArgs e)
		{
			//textBox1.Text = textBox1.Text.Trim().ToUpper();
		}
	}
}
