using System;

namespace U_Zwd
{
    /// <summary>
    /// 目的：ListView 排序器
    /// 创建人：张卫东
    /// 创建时间：2002-07-31
    /// </summary>
    public class ListViewSort : System.Collections.IComparer
    {
        private int Column;
        private bool ASC;
        private bool NUM;

        // pColumn - 列
        // pASC - 排序方式
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

        // 排序算法
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
