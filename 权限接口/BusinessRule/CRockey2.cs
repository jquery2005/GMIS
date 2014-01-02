using System;
using System.Runtime.InteropServices;  
using System.Collections; 
using System.Text; 

namespace GMIS.CommonRightBusinessRule
{
		
	/// <summary>
	/// Rockey2 ��ժҪ˵����
	/// </summary>
	public class CRockey2
	{
		

		public CRockey2()
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		}

		/// <summary>
		/// ���Ҽ���������ӵ� Rockey2 �������豸
		/// </summary>
		[DllImport("Rockey2.dll", EntryPoint="RY2_Find")]
		public static extern int Find();	
		// ����:
		// �������ֵС�� 0����ʾ���ص���һ��������룬���庬���뿴����Ĵ�����롣
		// �������ֵΪ 0����ʾû���κ� Rockey2 �豸���ڡ�
		// �������ֵ���� 0�����ص����ҵ��� Rockey2 �������ĸ�����

		/// <summary>
		/// ��ָ���ļ�����
		/// </summary>
		
		[DllImport("Rockey2.dll", EntryPoint="RY2_Open")]
		public static extern int Open(int  mode,  uint uid , ref uint  hid);	
		// ����:
		// mode �Ǵ򿪼������ķ�ʽ
		// mode = 0 ��ʾ���Ǵ򿪵�1���ҵ��� Rockey2������� UID �� HID
		// mode > 0 ��ʾ���ǰ� UID ��ʽ�򿪣���ʱ�� mode ��ֵ��ʾ����Ҫ���������
		//          Ʃ��: uid=12345678, mode=2 ��ʾ����ϣ���� uid ����12345678 ��
		//          ��2�Ѽ�������
		// mode = -1 ��ʾ���ǰ� HID ��ʽ�򿪣�Ҫ�� *hid ����Ϊ 0
		public const int AUTO_MODE=	0;
		public const int HID_MODE=-1;
		public const int UID_MODE=1;
		
		// uid(UserID)
		// ���� UID ��ʽ�򿪵�ʱ���������Ҫ�򿪼������� UID���� UID �����û�����
		// RY2_GenUID ���ܻ�õ��û� ID��
		// hid
		// ����Ǽ�������Ӳ�� ID������1������/���ֵ������� HID ��ʽ�򿪼�������
		// ʱ�򣬱�ʾϣ����Ӳ��ID = *hid �ļ�������
		// ���������ַ�ʽ�򿪼��������ڳɹ��򿪼������Ժ�����ⷵ�ؼ�������Ӳ�� ID
		// ����ֵ:
		// ���ڵ���0		��ʾ�ɹ������صľ��Ǵ򿪵ļ������ľ��
		// С��0			���ص���һ��������룬���庬���뿴����Ĵ�����벿�֡�
		
		// 3. �ر�ָ���ļ�����
		[DllImport("Rockey2.dll", EntryPoint="RY2_Close")]
		public static extern int Close(int handle);
		// ����:
		// handle �豸�ľ������ RY2_Open ����ص� handle һ�¡�
		// ����:
		// ���ص���һ��������룬���庬���뿴����Ĵ�����벿�֡�

		// 4. �����û� ID
		[DllImport("Rockey2.dll", EntryPoint="RY2_GenUID")]
		public static extern int GenUID(int handle, ref uint uid, char[]  seed, int isProtect);	
		// ����:
		// handle �豸�ľ������ RY2_Open ����ص� handle һ�¡�
		// uid ������������ɵ��û� ID �Ӵ˲�������
		// seed �û����������������û� ID �����ӣ�����һ����󳤶ȿ����� 64 ���ֽڵ��ַ���
		// isProtect ����ָ���� Rockey2 �Ƿ��д��0 �ǿ�д��1 �ǲ���д
		public const int ROCKEY2_DISABLE_WRITE_PROTECT=	0;
		public const int ROCKEY2_ENSABLE_WRITE_PROTECT=1;
		// ����:
		// ���ص���һ��������룬���庬���뿴����Ĵ�����벿��

		// 5. ��ȡ����������
		[DllImport("Rockey2.dll", EntryPoint="RY2_Read",SetLastError=true)]
		public static extern int Read(int  handle, int block_index, StringBuilder  buffer512);	

		

		// ����:
		// handle �豸�ľ������ RY2_Open ����ص� handle һ�¡�
		// block_index ��������ָ��Ҫ��ȡ������1���飬ȡֵΪ(0-4)
		// buffer512 ������Ļ���������Ϊÿ����ĳ��ȹ̶�Ϊ 512 ���ֽڣ��������
		// buffer �Ĵ�С������ 512 ���ֽ�
		// ����:
		// ���ص���һ��������룬���庬���뿴����Ĵ�����벿�֡�

		// 6. д�����������
		[DllImport("Rockey2.dll", EntryPoint="RY2_Write")]
		public static extern int Write(int  handle, int block_index, string buffer512);	
		// ����:
		// handle �豸�ľ������ RY2_Open ����ص� handle һ�¡�
		// block_index ��������ָ��Ҫд�������1���飬ȡֵΪ(0-4)
		// buffer512 д���Ļ���������Ϊÿ����ĳ��ȹ̶�Ϊ 512 ���ֽڣ��������
		// buffer �Ĵ�С������ 512 ���ֽ�
		// ����:
		// ���ص���һ��������룬���庬���뿴����Ĵ�����벿�֡�


		// ������� ===========================================================

		// �ɹ���û�д���
		public const int RY2ERR_SUCCESS		=		0;

		// û���ҵ�����Ҫ����豸(��������)
		public const uint RY2ERR_NO_SUCH_DEVICE	=	0xA0100001;

		// �ڵ��ô˹���ǰ��Ҫ�ȵ��� RY2_Open ���豸(��������)
		public const uint RY2ERR_NOT_OPENED_DEVICE=	0xA0100002;

		// ������ UID ����(��������)
		public const uint RY2ERR_WRONG_UID	=							0xA0100003;

		// ��д���������Ŀ���������(��������)
		public const uint RY2ERR_WRONG_INDEX		=						0xA0100004;

		// ���� GenUID ���ܵ�ʱ�򣬸����� seed �ַ������ȳ����� 64 ���ֽ�(��������)
		public const uint RY2ERR_TOO_LONG_SEED		=					0xA0100005;

		// ��ͼ��д�Ѿ�д������Ӳ��(��������)
		public const uint RY2ERR_WRITE_PROTECT	=						0xA0100006;

		// ���豸��(Windows ����)
		public const uint RY2ERR_OPEN_DEVICE		=						0xA0100007;

		// ����¼��(Windows ����)
		public const uint RY2ERR_READ_REPORT		=						0xA0100008;

		// д��¼��(Windows ����)
		public const uint RY2ERR_WRITE_REPORT	=						0xA0100009;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_SETUP_DI_GET_DEVICE_INTERFACE_DETAIL	=	0xA010000A;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_GET_ATTRIBUTES	=						0xA010000B;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_GET_PREPARSED_DATA			=			0xA010000C;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_GETCAPS		=							0xA010000D;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_FREE_PREPARSED_DATA		=				0xA010000E;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_FLUSH_QUEUE	=							0xA010000F;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_SETUP_DI_CLASS_DEVS	=					0xA0100010;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_GET_SERIAL		=						0xA0100011;

		// �ڲ�����(Windows ����)
		public const uint RY2ERR_GET_PRODUCT_STRING	=					0xA0100012;
		// �ڲ�����
		public const uint RY2ERR_TOO_LONG_DEVICE_DETAIL	=				0xA0100013;

		// δ֪���豸(Ӳ������)
		public const uint RY2ERR_UNKNOWN_DEVICE	=						0xA0100020;

		// ������֤����(Ӳ������)
		public const uint RY2ERR_VERIFY	=								0xA0100021;

		// δ֪����(Ӳ������)
		public const uint RY2ERR_UNKNOWN_ERROR=							0xA010FFFF;



		
	}

}
