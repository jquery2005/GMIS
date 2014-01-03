using System;

namespace U_Zwd
{
	/// <summary>
	/// 
	/// 目的：常用函数的抽象
	/// 创建人：张卫东
	/// 创建时间：2002-08-01
	/// 
	/// </summary>
	public class U_Pub_Zwd
	{
		// 排序图标
		static private string ArrowUp = " ↑";
		static private string ArrowDown = " ↓";


		public U_Pub_Zwd()
		{

		}


		// 绑定 Combobox
		static public bool rsBindCmbx(System.Data.DataTable dt, System.Windows.Forms.ComboBox cmb
			, string ListItem, string BindItem)
		{
			if(dt == null || cmb == null)
				return false;

			int ii = dt.Rows.Count;
			for(int i=0; i<ii; i++)
			{
				cmb.Items.Add(dt.Rows[i][dt.Columns.IndexOf(ListItem)]);
			}

			return true;
		}


		// 绑定 ListView
		// HideColumns 以分号分割的隐藏列号组合
		static public bool rsBindList(System.Data.DataSet dst, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns)
		{
			if(dst == null || lvw == null)
				return false;

			if(dst.Tables.Count == 0)
				return false;

			return rsBindList(dst.Tables[0], lvw, ImageIndex, HideColumns);
		}

		// 绑定 ListView
		// HideColumns 以分号分割的隐藏列号组合
		static public bool rsBindList(System.Data.DataTable dt, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns, int SortColumn)
		{
			bool blnResult;
			if(blnResult = rsBindList(dt, lvw, ImageIndex, HideColumns))
			{
				lvw.Sorting = System.Windows.Forms.SortOrder.Descending;
				SortListView(lvw, SortColumn, true);
			}
			return blnResult;
		}

		// 绑定 ListView
		// HideColumns 以分号分割的隐藏列号组合
		static public bool rsBindList(System.Data.DataTable dt, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns)
		{
			int intWidth = 0, intWidths = 0, intMax = 0, intWidth2 = 0;
			
			if(dt == null || lvw == null)
				return false;

			lvw.ListViewItemSorter = null;
			// del 2002-12-13
			//lvw.Sorting = System.Windows.Forms.SortOrder.Ascending;
			// endd
			lvw.Clear();

			System.Windows.Forms.ListViewItem li;
			
			// 增加表头
			int intCols = dt.Columns.Count;
			for(int intCol=0; intCol<intCols; intCol++)
			{
				if(U_Pub_Zwd.IsIn(intCol.ToString(), HideColumns))
					intWidth = 0;
				else if(intCol == 0)
				{
					intWidth2 = (intWidth = 300);
					intMax = intCol;
				}
				else
				{
					intWidth2 = (intWidth = 100);
					intMax = intCol;
				}

				lvw.Columns.Add(dt.Columns[intCol].ColumnName, intWidth, System.Windows.Forms.HorizontalAlignment.Left);
				intWidths += intWidth;
			}
			// move 2003-04-25
			/*
			intWidth = lvw.ClientSize.Width - intWidths + intWidth2 - 16;
			if(intWidth > 0)
				lvw.Columns[intMax].Width = intWidth;
			*/
			// endm =>

			// 增加数据
			int intRows = dt.Rows.Count;
			for(int intRow=0; intRow<intRows; intRow++)
			{
				if(dt.Rows[intRow].RowState == System.Data.DataRowState.Deleted)
					continue;

				li = lvw.Items.Add(dt.Rows[intRow][0].ToString());
				li.ImageIndex = ImageIndex;
				for(int intCol=1; intCol<intCols; intCol++)
				{
					li.SubItems.Add(dt.Rows[intRow][intCol].ToString());
				}
			}

			// => move 2003-04-25
			intWidth = lvw.ClientSize.Width - intWidths + intWidth2;
			if(intWidth > 0)
				lvw.Columns[intMax].Width = intWidth;
			// endm

			return true;
		}


		// 重载……
		static public bool rsBindTree(System.Data.DataSet dst, System.Windows.Forms.TreeView tvw
			,int Levels, string ImageIndex, string RootName)
		{
			bool blnResult;

			if(blnResult = rsBindTree(dst, tvw, Levels, ImageIndex))
				tvw.Nodes[0].Text = RootName;

			return blnResult;
		}

		// rsBindTree, rsBindTreeEx
		// 绑定 TreeView
		// dst 的结构：
		// 冗余的分组结构（不用 Group By, 用重复表示分组），并且按分组排序，Levels 指定分组数（即层数）
		// ImageIndex 是用分号分割的一个字串，每个元素代表一个图标索引
		static public bool rsBindTree(System.Data.DataSet dst, System.Windows.Forms.TreeView tvw
			,int Levels, string ImageIndex)
		{
			if(dst == null || tvw == null)
				return false;

			if(dst.Tables.Count == 0)
				return false;

			tvw.Nodes.Clear();

			try
			{
				int intRow = 0;
				// 一定要叫做 "根"?
				rsBindTreeEx(dst, tvw.Nodes.Add("根"), ref intRow, dst.Tables[0].Rows.Count, 0, Levels, ImageIndex);
				tvw.Nodes[0].Expand();
			}
			catch
			{
				return false;
			}
			
			return true;
		}

		// Row 作为全局的行指针
		static private bool rsBindTreeEx(System.Data.DataSet dst, System.Windows.Forms.TreeNode tn
			,ref int Row, int Rows, int Col, int Levels, string ImageIndex)
		{
			bool b;
			string s;

			if(Col == Levels)
				return true;

			while(Row < Rows)
			{
				// 检查分组 Col(Col<Levels) 的重复性，如果全部重复，表示该行仍在该组，否则转下一组
				System.Windows.Forms.TreeNode t = tn;
				b = true;
				for(int i=Col; i>0; i--)
				{
					if(!(b = (t.Text == U_Pub_Zwd.GetFirstString(dst.Tables[0].Rows[Row][i-1].ToString(), "-"))))
						break;
					t = t.Parent;
				}

				if(!b)
					// 返回上一级
					return false;
				else
				{
					try
					{
						s = dst.Tables[0].Rows[Row][Col].ToString();
					}
					catch
					{
						s = "";
					}

					if(s.Length > 0)
					{
						// 增加该节点
						t = tn.Nodes.Add(U_Pub_Zwd.GetFirstString(s, "-"));
						t.Tag = U_Pub_Zwd.GetLastString(s, "-");
						t.ImageIndex = (t.SelectedImageIndex = System.Convert.ToInt16(ImageIndex.Split(';')[Col]));

						// 进入下一级
						if(Col+1 < Levels)
							// 返回上一级
							if(!rsBindTreeEx(dst, t, ref Row, Rows, Col+1, Levels, ImageIndex))
								Row--;
					}
				}

				Row++;
			}

			return true;
		}


		// 排序 ListView
		static public void SortListView(System.Windows.Forms.ListView lvw, int Column, bool NUM)
		{
			try
			{
				if(lvw.Sorting == System.Windows.Forms.SortOrder.Ascending)
					lvw.Sorting = System.Windows.Forms.SortOrder.Descending;
				else
					lvw.Sorting = System.Windows.Forms.SortOrder.Ascending;

				// 创建排序器
				lvw.ListViewItemSorter = new ListViewSort(Column, lvw.Sorting == System.Windows.Forms.SortOrder.Ascending, NUM);

				// 清除图标
				int ii = lvw.Columns.Count;
				for(int i=0; i<ii; i++)
				{
					try
					{
						lvw.Columns[i].Text = lvw.Columns[i].Text.Replace(ArrowUp, "").Replace(ArrowDown, "");
					}
					catch
					{
					}
				}

				// 设置图标
				lvw.Columns[Column].Text += (lvw.Sorting == System.Windows.Forms.SortOrder.Ascending ? ArrowUp : ArrowDown);
			}
			catch
			{
			}
		}


		// 一种编码
		static public string Code64(string str)
		{
			// add 2003-06-18
			return "RptBrowse.Tmp";
			// enda

			int ii = str.Length;
			byte[] byt = new byte[ii*2];
			char[] chr = str.ToCharArray();
			for(int i=0; i<ii; i++)
			{
				byt[i*2] = (byte)(chr[i]/256);
				byt[i*2+1] = (byte)(chr[i]%256);
			}

			//return System.Convert.ToBase64String(byt);

			// modi 2003-05-24
			//return Base64Ex(byt);
			return Base64Ex(byt).Replace("0", "");
			// endm
		}

		// 编码
		static private string Base64Ex(byte[] byt)
		{
			string s = "";

			int ii = byt.GetLength(0);
			for(int i=0; i<ii; i++)
			{
				s = s + byt[i].ToString();
			}

			return s;
		}

		// 返回由 chr 分割的 str 的前半部分
		static public string GetFirstString(string str, string chr)
		{
			int i = str.IndexOf(chr);
			if(i == -1)
				return str;
			else
				return str.Substring(0, i).Trim();
		}

		// 返回由 chr 分割的 str 的后半部分
		static public string GetLastString(string str, string chr)
		{
			int i = str.IndexOf(chr);
			if(i == -1)
				return str;
			else
				return str.Substring(i + chr.Length, str.Length - i - chr.Length).Trim();
		}


		// 弹出错误信息
		static public void ErrorMessage(string ErrorString)
		{
			System.Windows.Forms.MessageBox.Show(ErrorString, "提示"
				, System.Windows.Forms.MessageBoxButtons.OK
				, System.Windows.Forms.MessageBoxIcon.Information);
		}

		// 确认信息
		static public bool ConfirmMessage(string ConfirmString)
		{
			return System.Windows.Forms.MessageBox.Show(ConfirmString, "确认"
				, System.Windows.Forms.MessageBoxButtons.YesNo
				, System.Windows.Forms.MessageBoxIcon.Question
				, System.Windows.Forms.MessageBoxDefaultButton.Button2
				) == System.Windows.Forms.DialogResult.Yes;
		}


		// str2: 以分号分割的一组
		// str1: 是否是其中的一项
		static public bool IsIn(string str1, string str2)
		{
			bool blnResult = str2.IndexOf(str1) > -1;

			if(str2.IndexOf(str1) > 0)
				blnResult = blnResult && str2.IndexOf(";"+str1) > -1;
			
			if(str2.IndexOf(str1) + str1.Length < str2.Length)
				blnResult = blnResult && str2.IndexOf(str1+";") > -1;

			return blnResult;
		}


		// 交换
		static public void Swap(System.Windows.Forms.ListViewItem li, System.Windows.Forms.ListViewItem li2, int Column)
		{
			// add 2002-12-13
			if(Column == 0)
			{
				int ii = li.SubItems.Count;
				if(ii > li2.SubItems.Count)
					ii = li2.SubItems.Count;

				string s;
				bool b;
				for(int i=0; i<ii; i++)
				{
					s = li.SubItems[i].Text;
					li.SubItems[i].Text = li2.SubItems[i].Text;
					li2.SubItems[i].Text = s;
				
					b = li.Checked;
					li.Checked = li2.Checked;
					li2.Checked = b;
				}

				li.Selected = !li.Selected;
				li2.Selected = !li2.Selected;

				return ;
			}
			else if(Column >= li.SubItems.Count || Column >= li2.SubItems.Count)
				return ;
			// enda

			string str = li.SubItems[Column].Text;
			li.SubItems[Column].Text = li2.SubItems[Column].Text;
			li2.SubItems[Column].Text = str;
		}


		// 移动 ListView
		static public bool MoveListView(System.Windows.Forms.ListView lvw, System.Windows.Forms.ListView lvw2
			, bool All, bool Delete, bool Copy, int SortColumn)
		{
			if(lvw == null || lvw2 == null)
				return false;

			System.Windows.Forms.ListViewItem li;

			// add 2003-04-28
//			if(All)
//				lvw2.Items.Clear();

			int ii2 = lvw2.Items.Count;
			// enda

			int ii = lvw.Items.Count;
			for(int i=ii-1; i>=0; i--)
			{
				li = lvw.Items[i];
				if(li.Selected || All)
				{
					if(Delete)
						lvw.Items.Remove(li);
					if(Copy)
					{
						li = (System.Windows.Forms.ListViewItem)(li.Clone());
						// 作一下排序处理，插入到最后
						// modi 2003-04-28
						//lvw2.Items.Add(li);
						lvw2.Items.Insert(ii2, li);
						// endm
						if(SortColumn != 0)
							li.SubItems[SortColumn].Text = System.Convert.ToString(lvw2.Items.Count);
					}
				}
			}

			return true;
		}

		// add 2002-12-21
		static public bool MoveListView(System.Windows.Forms.ListView lvw, System.Windows.Forms.ListView lvw2
			, bool All, bool Delete, bool Copy, int SortColumn, int CopyByImage)
		{
			if(lvw == null || lvw2 == null)
				return false;

			System.Windows.Forms.ListViewItem li;

			int ii = lvw.Items.Count;
			for(int i=0; i<ii; i++)
			{
				li = lvw.Items[i];
				if(li.ImageIndex == CopyByImage || All)
				{
					if(Delete)
						lvw.Items.Remove(li);
					if(Copy)
					{
						li = (System.Windows.Forms.ListViewItem)(li.Clone());
						// 作一下排序处理，插入到最后
						lvw2.Items.Add(li);
						if(SortColumn != 0)
							li.SubItems[SortColumn].Text = System.Convert.ToString(lvw2.Items.Count);
					}
				}
			}

			return true;
		}
		// enda

		// 全部删除 DataTable
		static public void RemoveAll(System.Data.DataTable dt)
		{
			if(dt == null)
				return;

			int ii = dt.Rows.Count;
			for(int i=ii-1; i>=0; i--)
			{
				dt.Rows[i].Delete();
			}
		}

		// 全部复制 DataTable
		static public void CopyAll(System.Data.DataTable dt, System.Data.DataTable dt2)
		{
			if(dt == null || dt2 == null)
				return;

			int ii = dt.Rows.Count;
			for(int i=ii-1; i>=0; i--)
			{
				if(dt.Rows[i].RowState == System.Data.DataRowState.Deleted)
					continue;
				dt2.Rows.Add(dt.Rows[i].ItemArray);
			}
		}


		// 阿拉伯数字 -〉汉字数字
		static public string NumToChinese(long pNumber)
		{
			return U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(pNumber.ToString(), false, false);
		}

		// 阿拉伯数字 -〉汉字大写数字
		static public string NumToCapitalChinese(long pNumber)
		{
			string s = U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(pNumber.ToString(), true, false);

			return s;
		}

		// 阿拉伯数字 -〉汉字大写数字
		static public string NumToCapitalChinese(double pNumber)
		{
			long ll = (long)pNumber;

			string s = U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(ll.ToString(), true, false);


			int ii = System.Convert.ToInt32((pNumber - ll) * 100);

			if(ii > 0)
			{
				s = s + "点";

				for(int i = 0; i < 2; i++)
				{
					s = s + U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital1(ii / 10, true, true);
					ii = ii % 10 * 10;
				}
			}


			return s;
		}

		// 阿拉伯数字 -〉英文字母
		static public string NumToLetter(long pNumber)
		{
			long i = pNumber - 1;

			string s = "";

			while(i > -1)
			{
				s = System.Convert.ToChar(65 + (i%26)) + s;
				i /= 26;
				i--;
			}

			return s;
		}

		// 英文字母 -〉阿拉伯数字
		static public int LetterToNum(string pNumber)
		{
			int n = 0;

			string s = pNumber;
			if(s != null)
			{
				s = s.ToUpper();

				int ii = s.Length;
				for(int i = 0; i < ii; i++)
				{
					if(s[i] >= 64 && s[i] <= 64 + 26)
					{
						n = n * 26 + (s[i] - 64);
					}
					else
					{
						n = 0;
						break;
					}
				}
			}

			return n;
		}

		// 字符串校验
		static public bool Validating(string s)
		{
			bool b = false;

			if(s != null)
			{
				b = s.IndexOf("\"") < 0;
				b = s.IndexOf("'") < 0;
				b = b && s.IndexOf("-") < 0;
			}

			return b;
		}

	}
}
