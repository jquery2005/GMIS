using System;

namespace U_Zwd
{
    /// <summary>
    /// Ŀ�ģ�ListView ������
    /// �����ˣ�������
    /// ����ʱ�䣺2002-07-31
    /// </summary>
    public class ListViewSort : System.Collections.IComparer
    {
        private int Column;
        private bool ASC;
        private bool NUM;

        // pColumn - ��
        // pASC - ����ʽ
        public ListViewSort(int pColumn, bool pASC)
        {
            Column = pColumn;
            ASC = pASC;
            NUM = true;
        }

        public ListViewSort(int pColumn, bool pASC, bool pNUM)
        {
            Column = pColumn;
            ASC = pASC;
            NUM = pNUM;
        }

        // �����㷨
        public System.Int32 Compare(System.Object x, System.Object y)
        {
            try
            {
                string x2 = ((System.Windows.Forms.ListViewItem)(ASC ? x : y)).SubItems[Column].Text;
                string y2 = ((System.Windows.Forms.ListViewItem)(ASC ? y : x)).SubItems[Column].Text;

                if (NUM)
                {
                    try
                    {
                        return System.Convert.ToInt32(x2).CompareTo(System.Convert.ToInt32(y2));
                    }
                    catch
                    {
                        return x2.CompareTo(y2);
                    }
                }
                else
                {
                    return x2.CompareTo(y2);
                }
            }
            catch
            {
                return 0;
            }
        }
    }
}
