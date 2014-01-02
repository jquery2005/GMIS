using System;
using System.Runtime.InteropServices;  
using System.Reflection; 



namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxDog 的摘要说明。
	/// </summary>
	public class CFlxDog
	{
		public CFlxDog()
		{
			//
			// TODO: 在此处添加构造函数逻辑
			//
		}


		#region 加密狗函数

		[DllImport("dog.dll")]
		private static extern int InitDog( );

		[DllImport("dog.dll")]
		private static extern int CloseDog();

		[DllImport("dog.dll")]
		private static extern int PwdAuthentication();


		[DllImport("dog.dll")]
		private static extern int WriteDog(string info,int len,int num);

		[DllImport("dog.dll")]
		private static extern string ReadDog( out int len,int num);

		[DllImport("UDPClient.dll")]
		private static extern int StartClient();//string Version);

		[DllImport("UDPClient.dll")]
		private static extern void StopClient();
	

		#endregion

		#region 加密锁操作



		/// <summary>
		/// 判断狗是否存在
		/// </summary>
		/// <param name="ErrMsg"></param>
		/// <returns></returns>
		public static  bool gsIsExistDog()
		{
			
			int result;

			try
			{

				CloseDog();

				//初始化狗
				result=InitDog();

				//密码校验
				result=PwdAuthentication();

				//密码校验
				result=PwdAuthentication();



				if(result==0)
				{
					CloseDog();
					return true;
				}
				else
				{
					CloseDog();
					return false;
				}
			}
			catch
			{
				CloseDog();
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
			int result;

			try
			{

				InitDog();
		
				//密码校验
				result=PwdAuthentication();

				int len;
				string dogMsg;
				dogMsg=ReadDog(out len,num);
				dogMsg=dogMsg.Substring(0,len);

				CloseDog();

				return dogMsg;
			}
			catch
			{
				CloseDog();
				return "";
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
			int result=-1;
			string returnValue="";
			int count=0;

			try
			{

				InitDog();
		
				//密码校验
				result=PwdAuthentication();

				result=-1;

				//由于硬件原因，可能需要多次写
				while(returnValue != msg  && count<100)
				{
					result=WriteDog(msg,msg.Length,num );
					returnValue=gsReadDog(num);
					count++;

				}

				CloseDog();
			}
			catch
			{
					CloseDog();
			}
		}

		
		/// <summary>
		/// 连接网络狗
		/// </summary>
		/// <returns></returns>
		public static int gsConnectNetDog()
		{
			try
			{
				WriteErrLog("commoninfo.log","begin startclient");
				return StartClient();//"flx_net3.0");
			}
			catch(Exception ee)
			{
Console.Write(ee.Message);
				return 213;
			}

					
		}

		/// <summary>
		/// 写错误信息到文件中
		/// </summary>
		/// <param name="LogFile"></param>
		/// <param name="ErrMsg"></param>
		/// <returns></returns>
		public static void WriteErrLog(string LogFileName,string ErrMsg)
		{
			System.IO.FileStream fs;
		
			
			try
			{
				Assembly SampleAssembly;

				SampleAssembly = Assembly.GetExecutingAssembly();
				string FilePath=System.IO.Path.GetDirectoryName(SampleAssembly.CodeBase.Substring(8));
		
				if(! System.IO.Directory.Exists(FilePath + "\\Log"))
				{
					System.IO.Directory.CreateDirectory(FilePath + "\\Log");   
				}

			
    
				
				fs=System.IO.File.Open(FilePath + "\\Log\\" +  LogFileName,System.IO.FileMode.Append,System.IO.FileAccess.Write,System.IO.FileShare.Read  ); 
				
				ErrMsg = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "\r\n" + ErrMsg + "\r\n";
				byte[] myByte=System.Text.ASCIIEncoding.Default.GetBytes(ErrMsg);
				fs.Write(myByte,0,myByte.Length); 
				fs.Close(); 
				
			}    
			catch(Exception e)
			{
				string errmsg=e.Message ;
			}
		}

	

		/// <summary>
		/// 退出连接加密狗
		/// </summary>
		/// <returns></returns>
		public static void gsExitNetDog()
		{
			try
			{
				StopClient();
			}
			catch
			{}
		}
	
		#endregion 




	}
}
