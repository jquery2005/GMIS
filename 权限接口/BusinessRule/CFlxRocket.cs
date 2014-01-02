using System;
using System.Text; 
using System.Runtime.InteropServices;  
using System.Collections; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxRocket ��ժҪ˵����
	/// </summary>
	public class CFlxRocket
	{
		public CFlxRocket()
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
			bool flag=false;
			int iMax;
			try
			{
			
				CRockey2 ry2_Find=new CRockey2();

				iMax=CRockey2.Find();

				if(iMax<=0)
				{
				
					flag=false;
				}
				else
				{
					flag=true;

				}

			
				CRockey2 ry2_Open=new CRockey2();

				uint uid=0;
				uint  hid=0;

				iMax=CRockey2.Open(CRockey2.AUTO_MODE, uid,ref hid);

				if(iMax>=0)
				{
			
					flag=true;
				}
				else
				{
					flag=false;
				}

			
				int handle;
				handle=iMax;

			
				char[] seed = new char[65];
			
				seed="12345".ToCharArray();


				//string seed="0123456789012345678901234567890123456789012345678901234567890123";
			
				CRockey2.GenUID(handle, ref uid, seed,CRockey2.ROCKEY2_DISABLE_WRITE_PROTECT );
			
				if(iMax>=0)
				{
			
					flag=true;
				
				}
				else
				{
					flag=false;
				}


				//�رռ�����
				CRockey2 ry2_Close=new CRockey2();
				iMax=CRockey2.Close (handle);

				return flag;
			}
			catch
			{
				return false;
			}
			
		
		
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
