using System;

namespace U_Zwd
{
	/// <summary>
	/// 
	/// Ŀ�ģ����ú����ĳ���
	/// �����ˣ�������
	/// ����ʱ�䣺2002-08-01
	/// 
	/// </summary>
	public class U_Pub_Zwd
	{
		// ����ͼ��
		static private string ArrowUp = " ��";
		static private string ArrowDown = " ��";


		public U_Pub_Zwd()
		{

		}


		// �� Combobox
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


		// �� ListView
		// HideColumns �Էֺŷָ�������к����
		static public bool rsBindList(System.Data.DataSet dst, System.Windows.Forms.ListView lvw
			, int ImageIndex, string HideColumns)
		{
			if(dst == null || lvw == null)
				return false;

			if(dst.Tables.Count == 0)
				return false;

			return rsBindList(dst.Tables[0], lvw, ImageIndex, HideColumns);
		}

		// �� ListView
		// HideColumns �Էֺŷָ�������к����
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

		// �� ListView
		// HideColumns �Էֺŷָ�������к����
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
			
			// ���ӱ�ͷ
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

			// ��������
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


		// ���ء���
		static public bool rsBindTree(System.Data.DataSet dst, System.Windows.Forms.TreeView tvw
			,int Levels, string ImageIndex, string RootName)
		{
			bool blnResult;

			if(blnResult = rsBindTree(dst, tvw, Levels, ImageIndex))
				tvw.Nodes[0].Text = RootName;

			return blnResult;
		}

		// rsBindTree, rsBindTreeEx
		// �� TreeView
		// dst �Ľṹ��
		// ����ķ���ṹ������ Group By, ���ظ���ʾ���飩�����Ұ���������Levels ָ������������������
		// ImageIndex ���÷ֺŷָ��һ���ִ���ÿ��Ԫ�ش���һ��ͼ������
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
				// һ��Ҫ���� "��"?
				rsBindTreeEx(dst, tvw.Nodes.Add("��"), ref intRow, dst.Tables[0].Rows.Count, 0, Levels, ImageIndex);
				tvw.Nodes[0].Expand();
			}
			catch
			{
				return false;
			}
			
			return true;
		}

		// Row ��Ϊȫ�ֵ���ָ��
		static private bool rsBindTreeEx(System.Data.DataSet dst, System.Windows.Forms.TreeNode tn
			,ref int Row, int Rows, int Col, int Levels, string ImageIndex)
		{
			bool b;
			string s;

			if(Col == Levels)
				return true;

			while(Row < Rows)
			{
				// ������ Col(Col<Levels) ���ظ��ԣ����ȫ���ظ�����ʾ�������ڸ��飬����ת��һ��
				System.Windows.Forms.TreeNode t = tn;
				b = true;
				for(int i=Col; i>0; i--)
				{
					if(!(b = (t.Text == U_Pub_Zwd.GetFirstString(dst.Tables[0].Rows[Row][i-1].ToString(), "-"))))
						break;
					t = t.Parent;
				}

				if(!b)
					// ������һ��
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
						// ���Ӹýڵ�
						t = tn.Nodes.Add(U_Pub_Zwd.GetFirstString(s, "-"));
						t.Tag = U_Pub_Zwd.GetLastString(s, "-");
						t.ImageIndex = (t.SelectedImageIndex = System.Convert.ToInt16(ImageIndex.Split(';')[Col]));

						// ������һ��
						if(Col+1 < Levels)
							// ������һ��
							if(!rsBindTreeEx(dst, t, ref Row, Rows, Col+1, Levels, ImageIndex))
								Row--;
					}
				}

				Row++;
			}

			return true;
		}


		// ���� ListView
		static public void SortListView(System.Windows.Forms.ListView lvw, int Column, bool NUM)
		{
			try
			{
				if(lvw.Sorting == System.Windows.Forms.SortOrder.Ascending)
					lvw.Sorting = System.Windows.Forms.SortOrder.Descending;
				else
					lvw.Sorting = System.Windows.Forms.SortOrder.Ascending;

				// ����������
				lvw.ListViewItemSorter = new ListViewSort(Column, lvw.Sorting == System.Windows.Forms.SortOrder.Ascending, NUM);

				// ���ͼ��
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

				// ����ͼ��
				lvw.Columns[Column].Text += (lvw.Sorting == System.Windows.Forms.SortOrder.Ascending ? ArrowUp : ArrowDown);
			}
			catch
			{
			}
		}


		// һ�ֱ���
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

		// ����
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

		// ������ chr �ָ�� str ��ǰ�벿��
		static public string GetFirstString(string str, string chr)
		{
			int i = str.IndexOf(chr);
			if(i == -1)
				return str;
			else
				return str.Substring(0, i).Trim();
		}

		// ������ chr �ָ�� str �ĺ�벿��
		static public string GetLastString(string str, string chr)
		{
			int i = str.IndexOf(chr);
			if(i == -1)
				return str;
			else
				return str.Substring(i + chr.Length, str.Length - i - chr.Length).Trim();
		}


		// ����������Ϣ
		static public void ErrorMessage(string ErrorString)
		{
			System.Windows.Forms.MessageBox.Show(ErrorString, "��ʾ"
				, System.Windows.Forms.MessageBoxButtons.OK
				, System.Windows.Forms.MessageBoxIcon.Information);
		}

		// ȷ����Ϣ
		static public bool ConfirmMessage(string ConfirmString)
		{
			return System.Windows.Forms.MessageBox.Show(ConfirmString, "ȷ��"
				, System.Windows.Forms.MessageBoxButtons.YesNo
				, System.Windows.Forms.MessageBoxIcon.Question
				, System.Windows.Forms.MessageBoxDefaultButton.Button2
				) == System.Windows.Forms.DialogResult.Yes;
		}


		// str2: �Էֺŷָ��һ��
		// str1: �Ƿ������е�һ��
		static public bool IsIn(string str1, string str2)
		{
			bool blnResult = str2.IndexOf(str1) > -1;

			if(str2.IndexOf(str1) > 0)
				blnResult = blnResult && str2.IndexOf(";"+str1) > -1;
			
			if(str2.IndexOf(str1) + str1.Length < str2.Length)
				blnResult = blnResult && str2.IndexOf(str1+";") > -1;

			return blnResult;
		}


		// ����
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


		// �ƶ� ListView
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
						// ��һ�����������뵽���
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
						// ��һ�����������뵽���
						lvw2.Items.Add(li);
						if(SortColumn != 0)
							li.SubItems[SortColumn].Text = System.Convert.ToString(lvw2.Items.Count);
					}
				}
			}

			return true;
		}
		// enda

		// ȫ��ɾ�� DataTable
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

		// ȫ������ DataTable
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


		// ���������� -����������
		static public string NumToChinese(long pNumber)
		{
			return U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(pNumber.ToString(), false, false);
		}

		// ���������� -�����ִ�д����
		static public string NumToCapitalChinese(long pNumber)
		{
			string s = U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(pNumber.ToString(), true, false);

			return s;
		}

		// ���������� -�����ִ�д����
		static public string NumToCapitalChinese(double pNumber)
		{
			long ll = (long)pNumber;

			string s = U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital(ll.ToString(), true, false);


			int ii = System.Convert.ToInt32((pNumber - ll) * 100);

			if(ii > 0)
			{
				s = s + "��";

				for(int i = 0; i < 2; i++)
				{
					s = s + U_Zwd_VB.U_Pub_Zwd_VB.ChineseCapital1(ii / 10, true, true);
					ii = ii % 10 * 10;
				}
			}


			return s;
		}

		// ���������� -��Ӣ����ĸ
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

		// Ӣ����ĸ -������������
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

		// �ַ���У��
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
