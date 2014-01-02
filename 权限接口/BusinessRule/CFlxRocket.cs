using System;
using System.Text; 
using System.Runtime.InteropServices;  
using System.Collections; 

namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxRocket 的摘要说明。
	/// </summary>
	public class CFlxRocket
	{
		public CFlxRocket()
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


				//关闭加密琐
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
