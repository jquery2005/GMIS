using System;
using System.Text; 
using System.Runtime.InteropServices;  
using System.Collections; 
//using ROCKEY4;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxRocket4 的摘要说明。
	/// </summary>
	public class CFlxRocket4
	{
		/// <summary>
		/// Rockey4 Command.
		/// </summary>
		enum Ry4Cmd:ushort
		{
			RY_FIND=1,			//找锁
			RY_FIND_NEXT,		//找下一锁
			RY_OPEN,			//打开锁
			RY_CLOSE,			//关闭锁
			RY_READ,			//读锁
			RY_WRITE,			//写锁
			RY_RANDOM,			//产生随机数
			RY_SEED,			//产生种子码
			RY_WRITE_USERID,	//写用户 ID
			RY_READ_USERID,		//读用户 ID
			RY_SET_MOUDLE,		//设置模块字
			RY_CHECK_MOUDLE,	//检查模块状态
			RY_WRITE_ARITHMETIC,//写算法
			RY_CALCULATE1,		//计算 1
			RY_CALCULATE2,		//计算 2
			RY_CALCULATE3,		//计算 3
			RY_DECREASE			//递减模块单元
		};

		/// <summary>
		/// Rockey4 Type.
		/// </summary>
		enum Ry4Type:uint
		{
			// Rockey4 Type
			TYPE_ROCKEY4=1,			//Normal Ry4.
			TYPE_ROCKEY4Plus,		//Ry4Plus.
			TYPE_ROCKEYUSB,			//Ry4 USB.
			TYPE_ROCKEYUSBPlus,		//Ry4 USB Plus
			TYPE_ROCKEYNET,			//NetRy4
			TYPE_ROCKEYUSBNET		//NetRy4 USB.
		};


	
		enum Ry4ErrCode:uint
		{
			ERR_SUCCESS=0,							//没有错误
			ERR_NO_PARALLEL_PORT=0x80300001,		//(0x80300001)此机没有并口
			ERR_NO_DRIVER,							//(0x80300002)没安装驱动程序
			ERR_NO_ROCKEY,							//(0x80300003)并口上没有 Rockey 锁
			ERR_INVALID_PASSWORD,					//(0x80300004)并口上有 Rockey 锁, 但基本密码(pass1, pass2)错
			ERR_INVALID_PASSWORD_OR_ID,				//(0x80300005)错误的密码或硬件 ID
			ERR_SETID,								//(0x80300006)设置硬件 ID 错
			ERR_INVALID_ADDR_OR_SIZE,				//(0x80300007)读写地址或长度有误
			ERR_UNKNOWN_COMMAND,					//(0x80300008)没有此命令
			ERR_NOTBELEVEL3,						//(0x80300009)内部错误
			ERR_READ,								//(0x8030000A)读数据错
			ERR_WRITE,								//(0x8030000B)写数据错
			ERR_RANDOM,								//(0x8030000C)随机数错
			ERR_SEED,								//(0x8030000D)种子码错
			ERR_CALCULATE,							//(0x8030000E)计算错
			ERR_NO_OPEN,							//(0x8030000F)在操作前没有打开锁
			ERR_OPEN_OVERFLOW,						//(0x80300010)打开的锁太多(>16)
			ERR_NOMORE,								//(0x80300011)找不到更多的锁
			ERR_NEED_FIND,							//(0x80300012)没有 Find 直接用了 FindNext
			ERR_DECREASE,							//(0x80300013)递减错
			ERR_AR_BADCOMMAND,						//(0x80300014)算法指令错
			ERR_AR_UNKNOWN_OPCODE,					//(0x80300015)算法运算符错
			ERR_AR_WRONGBEGIN,						//(0x80300016)算法第一条指令含有常数
			ERR_AR_WRONG_END,						//(0x80300017)算法最后一条指令含有常数
			ERR_AR_VALUEOVERFLOW,					//(0x80300018)算法中常数值 > 63

			ERR_UNKNOWN=0x8030ffff,					//(0x8030FFFF)未知错误

			ERR_RECEIVE_NULL=0x80300100,			//(0x80300100)接收不到
			ERR_PRNPORT_BUSY=0x80300101				//(0x80300101)打印口忙

		};


		public CFlxRocket4()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}

		#region 加密锁操作



		/// <summary>
		/// 判断狗是否存在
		/// </summary>
		/// <param name="ErrMsg"></param>
		/// <returns></returns>
		public static  bool gsIsExistDog()
		{
//			try
//			{
//
//				
//				CRockey4Class ry4=new CRockey4Class();
//
//
//				uint	lp1=0,lp2=0;
//				ushort	p1=0,p2=0,p3=0,p4=0,handle=0;
//				object	obBuffer=(int)0;
//			
//
//				//Find rockey
//				p1=0xc44c; p2=0xc8f8; p3=0x0799; p4=0xc43b;
//				ry4.DoCmd((ushort)Ry4Cmd.RY_FIND,ref handle,ref lp1,ref lp2,ref p1,ref p2,ref p3,ref p4,ref obBuffer);
//
//				if(lp1 == 0)
//				{
//					return false;
//				}
//
//				//open rockey
//				ry4.DoCmd((ushort)Ry4Cmd.RY_OPEN,ref handle,ref lp1,ref lp2,ref p1,ref p2,ref p3,ref p4,ref obBuffer);
//
//				Ry4Type type=(Ry4Type)lp2;
//
//				if(type != Ry4Type.TYPE_ROCKEYUSB)
//				{
//					return false;
//				}
//
//				//close
//				ry4.DoCmd((ushort)Ry4Cmd.RY_CLOSE,ref handle,ref lp1,ref lp2,ref p1,ref p2,ref p3,ref p4,ref obBuffer);
//
//			
//
				return true;
//
//			}
//			catch
//			{
//				return false;
//			}
		}


	

		/// <summary>
		/// 读狗
		/// </summary>
		/// <param name="msg"></param>
		/// <returns></returns>
		public static string  gsReadDog(byte num)
		{
			int		iMax;

			try
			{
			
		
				CRockey2 ry2_Find=new CRockey2();

				iMax=CRockey2.Find();

			
				CRockey2 ry2_Open=new CRockey2();

				uint hid=1860477016;
				uint uid=715400947;

				iMax=CRockey2.Open(CRockey2.UID_MODE ,  uid, ref hid);

			
			
				int handle;
				handle=iMax;

		
				StringBuilder csReadData = new StringBuilder("", 512);

				//string str=new String ( '0',512);
				int block_index=0;
				CRockey2 ry2_Read=new CRockey2();
				//读狗
				iMax=CRockey2.Read (handle,block_index,csReadData);
		
		
				//关闭狗
				CRockey2 ry2_Close=new CRockey2();
				iMax=CRockey2.Close  (0);

				return csReadData.ToString(); 
			}
			catch
			{
				return "123";
			}

		}

		/// <summary>
		/// 写狗
		/// </summary>
		/// <param name="msg"></param>
		/// <param name="num"></param>
		/// <returns></returns>
		public static void gsWriteDog(string msg,byte num)
		{
			int		iMax;
			
			try
			{
		
				CRockey2 ry2_Find=new CRockey2();

				iMax=CRockey2.Find();

		
			
				CRockey2 ry2_Open=new CRockey2();

				uint hid=1860477016;
				//uint hid=0;
				uint uid=715400947;

				//iMax=CRockey2.Open(CRockey2.UID_MODE , ref uid, ref hid);

				iMax=CRockey2.Open(1 ,  uid, ref hid);

				
				int handle;
				handle=iMax;


				int block_index=0;

				//写狗
				CRockey2 ry2_Wrire=new CRockey2();
				iMax=CRockey2.Write (handle,block_index,msg);

				//关闭狗
				CRockey2 ry2_Close=new CRockey2();
				iMax=CRockey2.Close (0);
			}
			catch
			{}
		
		}

		
	
		#endregion 


	}
}
