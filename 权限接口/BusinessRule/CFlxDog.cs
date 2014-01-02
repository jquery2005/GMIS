using System;
using System.Runtime.InteropServices;  
using System.Reflection; 



namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// CFlxDog ��ժҪ˵����
	/// </summary>
	public class CFlxDog
	{
		public CFlxDog()
		{
			//
			// TODO: �ڴ˴���ӹ��캯���߼�
			//
		}


		#region ���ܹ�����

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

		#region ����������



		/// <summary>
		/// �жϹ��Ƿ����
		/// </summary>
		/// <param name="ErrMsg"></param>
		/// <returns></returns>
		public static  bool gsIsExistDog()
		{
			
			int result;

			try
			{

				CloseDog();

				//��ʼ����
				result=InitDog();

				//����У��
				result=PwdAuthentication();

				//����У��
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
		/// ����
		/// </summary>
		/// <param name="msg"></param>
		/// <returns></returns>
		public static string  gsReadDog(byte num)
		{
			int result;

			try
			{

				InitDog();
		
				//����У��
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
		/// д��
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
		
				//����У��
				result=PwdAuthentication();

				result=-1;

				//����Ӳ��ԭ�򣬿�����Ҫ���д
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
		/// �������繷
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
		/// д������Ϣ���ļ���
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
		/// �˳����Ӽ��ܹ�
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
