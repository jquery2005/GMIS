using System;
using System.Text; 
using System.Runtime.InteropServices;  
using System.Collections; 
//using ROCKEY4;

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxRocket4 ��ժҪ˵����
	/// </summary>
	public class CFlxRocket4
	{
		/// <summary>
		/// Rockey4 Command.
		/// </summary>
		enum Ry4Cmd:ushort
		{
			RY_FIND=1,			//����
			RY_FIND_NEXT,		//����һ��
			RY_OPEN,			//����
			RY_CLOSE,			//�ر���
			RY_READ,			//����
			RY_WRITE,			//д��
			RY_RANDOM,			//���������
			RY_SEED,			//����������
			RY_WRITE_USERID,	//д�û� ID
			RY_READ_USERID,		//���û� ID
			RY_SET_MOUDLE,		//����ģ����
			RY_CHECK_MOUDLE,	//���ģ��״̬
			RY_WRITE_ARITHMETIC,//д�㷨
			RY_CALCULATE1,		//���� 1
			RY_CALCULATE2,		//���� 2
			RY_CALCULATE3,		//���� 3
			RY_DECREASE			//�ݼ�ģ�鵥Ԫ
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
			ERR_SUCCESS=0,							//û�д���
			ERR_NO_PARALLEL_PORT=0x80300001,		//(0x80300001)�˻�û�в���
			ERR_NO_DRIVER,							//(0x80300002)û��װ��������
			ERR_NO_ROCKEY,							//(0x80300003)������û�� Rockey ��
			ERR_INVALID_PASSWORD,					//(0x80300004)�������� Rockey ��, ����������(pass1, pass2)��
			ERR_INVALID_PASSWORD_OR_ID,				//(0x80300005)����������Ӳ�� ID
			ERR_SETID,								//(0x80300006)����Ӳ�� ID ��
			ERR_INVALID_ADDR_OR_SIZE,				//(0x80300007)��д��ַ�򳤶�����
			ERR_UNKNOWN_COMMAND,					//(0x80300008)û�д�����
			ERR_NOTBELEVEL3,						//(0x80300009)�ڲ�����
			ERR_READ,								//(0x8030000A)�����ݴ�
			ERR_WRITE,								//(0x8030000B)д���ݴ�
			ERR_RANDOM,								//(0x8030000C)�������
			ERR_SEED,								//(0x8030000D)�������
			ERR_CALCULATE,							//(0x8030000E)�����
			ERR_NO_OPEN,							//(0x8030000F)�ڲ���ǰû�д���
			ERR_OPEN_OVERFLOW,						//(0x80300010)�򿪵���̫��(>16)
			ERR_NOMORE,								//(0x80300011)�Ҳ����������
			ERR_NEED_FIND,							//(0x80300012)û�� Find ֱ������ FindNext
			ERR_DECREASE,							//(0x80300013)�ݼ���
			ERR_AR_BADCOMMAND,						//(0x80300014)�㷨ָ���
			ERR_AR_UNKNOWN_OPCODE,					//(0x80300015)�㷨�������
			ERR_AR_WRONGBEGIN,						//(0x80300016)�㷨��һ��ָ��г���
			ERR_AR_WRONG_END,						//(0x80300017)�㷨���һ��ָ��г���
			ERR_AR_VALUEOVERFLOW,					//(0x80300018)�㷨�г���ֵ > 63

			ERR_UNKNOWN=0x8030ffff,					//(0x8030FFFF)δ֪����

			ERR_RECEIVE_NULL=0x80300100,			//(0x80300100)���ղ���
			ERR_PRNPORT_BUSY=0x80300101				//(0x80300101)��ӡ��æ

		};


		public CFlxRocket4()
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		}

		#region ����������



		/// <summary>
		/// �жϹ��Ƿ����
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
		/// ����
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
				//����
				iMax=CRockey2.Read (handle,block_index,csReadData);
		
		
				//�رչ�
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
		/// д��
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

				//д��
				CRockey2 ry2_Wrire=new CRockey2();
				iMax=CRockey2.Write (handle,block_index,msg);

				//�رչ�
				CRockey2 ry2_Close=new CRockey2();
				iMax=CRockey2.Close (0);
			}
			catch
			{}
		
		}

		
	
		#endregion 


	}
}
