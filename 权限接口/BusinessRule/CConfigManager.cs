using System;
using System.Xml;
using System.IO;
using System.Collections;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// 系统配置管理Config.Xml
	/// </summary>
	public class CConfigManager
	{
		// 配置文件名
		private string configFileName = "";

		/// <summary>
		/// Xml文档操作
		/// </summary>
		private XmlDocument doc;
		
		public CConfigManager(string ConfigFile)
		{
			configFileName = ConfigFile;
			if(!load()){
				throw new Exception("载入配置文件错误！");
			}
		}


		#region 属性

		// 数据库服务器名
		public string dbServerName
		{
			get { return getPropertyValue("数据库", "服务器名"); }
			set { setPropertyValue("数据库", "服务器名", value); }
		}


		// 数据库名
		public string databaseName
		{
			get { return getPropertyValue("数据库", "数据库名"); }
			set { setPropertyValue("数据库", "数据库名", value); }
		}


		// 用户名
		public string dbUserName
		{
			get { return getPropertyValue("数据库", "用户名"); }
			set { setPropertyValue("数据库", "用户名", value); }
		}


		// 口令
		public string dbPassword
		{
			get { return getPropertyValue("数据库", "口令"); }
			set { setPropertyValue("数据库", "口令", value); }
		}


		// 系统安装路径
		public string installDir
		{
			get { return getPropertyValue("系统", "路径"); }
			set { setPropertyValue("系统", "路径", value); }
		}


		// Web服务器名
		public string webServerName
		{
			get { return getPropertyValue("系统", "服务器名"); }
			set { setPropertyValue("系统", "服务器名", value); }
		}


		// http虚拟目录
		public string httpVDir
		{
			get { return getPropertyValue("系统", "http虚拟目录"); }
			set { setPropertyValue("系统", "http虚拟目录", value); }
		}


		// ftp虚拟目录
		public string ftpVDir
		{
			get { return getPropertyValue("系统", "ftp虚拟目录"); }
			set { setPropertyValue("系统", "ftp虚拟目录", value); }
		}


		// 栏目每页显示条目数
		public int colDisplayCount
		{
			get
			{
				int r = int.Parse(getPropertyValue("系统", "栏目每页显示条目数")); 
				return r;
			}
			set
			{
				setPropertyValue("系统", "栏目每页显示条目数", value.ToString());
			}
		}


		// 查询结果每页显示条目数
		public int searchResultDisplayCount
		{
			get
			{
				int r = int.Parse(getPropertyValue("系统", "查询结果每页显示条目数")); 
				return r;
			}
			set
			{
				setPropertyValue("系统", "查询结果每页显示条目数", value.ToString());
			}
		}


		// ftp用户名
		public string ftpUserName
		{
			get { return getPropertyValue("FTP", "用户名"); }
			set { setPropertyValue("FTP", "用户名", value); }
		}


		// ftp口令
		public string ftpPassword
		{
			get { return getPropertyValue("FTP", "口令"); }
			set { setPropertyValue("FTP", "口令", value); }
		}
			
			
		// 图片绝对路径
		public string imagePath
		{
			get { return installDir + @"\Data\Image\"; }
		}


		// 图片HTTP前缀
		public string imageHttp
		{
			get
			{
				return "Data/Image/";
			}
		}


		// 图片FTP前缀
		public string imageFtp
		{
			get
			{
				return "Image/";
			}
		}
		

		// 文件绝对路径
		public string filePath
		{
			get { return installDir + @"\Data\File\"; }
		}


		// 文件HTTP前缀
		public string fileHttp
		{
			get
			{
				return "Data/File/";
			}
		}


		// 文件FTP前缀
		public string fileFtp
		{
			get
			{
				return "File/";
			}
		}


		// 生成.net的连接字符串
		public string netDataConnString
		{
			get
			{
				return string.Format("server={0};database={1};uid={2};pwd={3};",
					dbServerName, databaseName, dbUserName, dbPassword);
			}
		}


		// 生成ado的连接字符串
		public string adoDataConnString
		{
			get
			{
				return string.Format("Provider=SQLOLEDB.1;Persist Security Info=True;Data Source={0};Initial Catalog={1};User ID={2};Password={3}",
					dbServerName, databaseName, dbUserName, dbPassword);
			}
		}


		// Http前缀
		public string httpPrefix
		{
			get{ return "http://" + webServerName + "/" + httpVDir; }
		}


		// Ftp前缀
		public string ftpPrefix
		{
			get{ return "ftp://" + webServerName + "/" + ftpVDir; }
		}



		#endregion

		#region 私有函数

		
		/// <summary>
		///载入配置文件 
		/// </summary>
		/// <returns></returns>
		private bool load()
		{
			doc = new XmlDocument();
			XmlTextReader reader = new XmlTextReader(configFileName);
			try
			{
				doc.Load(reader);
				return true;
			}
			catch(Exception ex)
			{
				Console.WriteLine(ex.Message);
			}
			finally
			{
				reader.Close();
			}
			return false;
		}


	
		//把配置保存到setup.ini文件中
		private void SaveIni()
		{
			string strIniFile = "";
			for(int i=installDir.Length-1; i>=0; i--)
			{
				if(installDir[i] == '\\')
				{
					for(int j=0; j<=i; ++j)
						strIniFile += installDir[j];
					break;
				}
			}
			strIniFile += "managetool\\setup.ini"; 
			StreamReader srReadLine = new StreamReader(
				(System.IO.Stream)File.OpenRead(strIniFile),
				System.Text.Encoding.Default);
			srReadLine.BaseStream.Seek(0, SeekOrigin.Begin);
			ArrayList arrList = new ArrayList();
			while (srReadLine.Peek() > -1) 
			{
				arrList.Add(srReadLine.ReadLine());                
			}
			srReadLine.Close();
			string strConfig = "配置服务Wsdl=" + httpPrefix + "/ConfigService.asmx?wsdl";
			if(arrList[1].ToString() == strConfig)
				return;
			arrList[1] = strConfig;
			StreamWriter srWriter = new StreamWriter(
				strIniFile, false, System.Text.Encoding.Default);
			try
			{
				for(int i=0; i<arrList.Count; i++)
				{
					srWriter.WriteLine(arrList[i]);
				}
			}
			catch(Exception ex)
			{
				Console.Write(ex.Message);
			}
			finally
			{
				srWriter.Close();
			}
		}


		#endregion

		#region 公有函数
	

			
		/// <summary>
		///获取属性值 
		/// </summary>
		/// <param name="sectionName"></param>
		/// <param name="itemName"></param>
		/// <returns></returns>
		public string getPropertyValue(string sectionName, string itemName)
		{
			try
			{
				XmlNode node = doc.DocumentElement[sectionName][itemName];
				return node.InnerText;
			}
			catch
			{
				return "";
			}
		}


		/// <summary>
		///设置属性值 
		/// </summary>
		/// <param name="sectionName"></param>
		/// <param name="itemName"></param>
		/// <param name="itemValue"></param>
		public void setPropertyValue(string sectionName, string itemName, string itemValue)
		{
			try
			{
				XmlNode SectionNode=doc.DocumentElement[sectionName];
				if(SectionNode == null)
				{
					SectionNode=doc.CreateElement(sectionName); 
					doc.DocumentElement.AppendChild(SectionNode); 
				}


				XmlNode ItemNode=SectionNode[itemName];
				if(ItemNode == null)
				{
					ItemNode=doc.CreateElement(itemName); 
					SectionNode.AppendChild(ItemNode); 
				}
 
				ItemNode.InnerText = itemValue;
				doc.Save(configFileName);

				
			}
			catch
			{

			}
		}

		
		/// <summary>
		/// 保存配置到Setup.ini文件中
		/// </summary>
		public void save()
		{
			System.IO.FileAttributes fa = System.IO.File.GetAttributes(configFileName);
			if((fa & System.IO.FileAttributes.ReadOnly) != 0){
				fa = fa & (~System.IO.FileAttributes.ReadOnly);
                System.IO.File.SetAttributes(configFileName, fa);
			}
			doc.Save(configFileName);
            SaveIni();
		}



		#endregion
      
       
	}
}
