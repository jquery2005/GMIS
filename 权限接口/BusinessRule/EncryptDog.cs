using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Runtime.InteropServices;

namespace GMIS.CommonRightBusinessRule
{
    class EncryptDog
    {
        public const uint RY_SUCCESS = 0x00000000;              // 操作成功

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Find(string strVendorID, ref int iCount);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Read(uint handle, int offset, byte[] pOutbuf, int len);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Write(uint handle, int offset, string pInbuf, int len);

        [DllImport("Rockey3.dll")]
        public static extern uint RY3_Open(ref uint hHandle, int iIndex);
    }
}
