using System;
using System.Xml;
using System.IO;
using System.Collections;


namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// ϵͳ���ù���Config.Xml
	/// </summary>
	public class CConfigManager
	{
		// �����ļ���
		private string configFileName = "";

		/// <summary>
		/// Xml�ĵ�����
		/// </summary>
		private XmlDocument doc;
		
		public CConfigManager(string ConfigFile)
		{
			configFileName = ConfigFile;
			if(!load()){
				throw new Exception("���������ļ�����");
			}
		}


		#region ����

		// ���ݿ��������
		public string dbServerName
		{
			get { return getPropertyValue("���ݿ�", "��������"); }
			set { setPropertyValue("���ݿ�", "��������", value); }
		}


		// ���ݿ���
		public string databaseName
		{
			get { return getPropertyValue("���ݿ�", "���ݿ���"); }
			set { setPropertyValue("���ݿ�", "���ݿ���", value); }
		}


		// �û���
		public string dbUserName
		{
			get { return getPropertyValue("���ݿ�", "�û���"); }
			set { setPropertyValue("���ݿ�", "�û���", value); }
		}


		// ����
		public string dbPassword
		{
			get { return getPropertyValue("���ݿ�", "����"); }
			set { setPropertyValue("���ݿ�", "����", value); }
		}


		// ϵͳ��װ·��
		public string installDir
		{
			get { return getPropertyValue("ϵͳ", "·��"); }
			set { setPropertyValue("ϵͳ", "·��", value); }
		}


		// Web��������
		public string webServerName
		{
			get { return getPropertyValue("ϵͳ", "��������"); }
			set { setPropertyValue("ϵͳ", "��������", value); }
		}


		// http����Ŀ¼
		public string httpVDir
		{
			get { return getPropertyValue("ϵͳ", "http����Ŀ¼"); }
			set { setPropertyValue("ϵͳ", "http����Ŀ¼", value); }
		}


		// ftp����Ŀ¼
		public string ftpVDir
		{
			get { return getPropertyValue("ϵͳ", "ftp����Ŀ¼"); }
			set { setPropertyValue("ϵͳ", "ftp����Ŀ¼", value); }
		}


		// ��Ŀÿҳ��ʾ��Ŀ��
		public int colDisplayCount
		{
			get
			{
				int r = int.Parse(getPropertyValue("ϵͳ", "��Ŀÿҳ��ʾ��Ŀ��")); 
				return r;
			}
			set
			{
				setPropertyValue("ϵͳ", "��Ŀÿҳ��ʾ��Ŀ��", value.ToString());
			}
		}


		// ��ѯ���ÿҳ��ʾ��Ŀ��
		public int searchResultDisplayCount
		{
			get
			{
				int r = int.Parse(getPropertyValue("ϵͳ", "��ѯ���ÿҳ��ʾ��Ŀ��")); 
				return r;
			}
			set
			{
				setPropertyValue("ϵͳ", "��ѯ���ÿҳ��ʾ��Ŀ��", value.ToString());
			}
		}


		// ftp�û���
		public string ftpUserName
		{
			get { return getPropertyValue("FTP", "�û���"); }
			set { setPropertyValue("FTP", "�û���", value); }
		}


		// ftp����
		public string ftpPassword
		{
			get { return getPropertyValue("FTP", "����"); }
			set { setPropertyValue("FTP", "����", value); }
		}
			
			
		// ͼƬ����·��
		public string imagePath
		{
			get { return installDir + @"\Data\Image\"; }
		}


		// ͼƬHTTPǰ׺
		public string imageHttp
		{
			get
			{
				return "Data/Image/";
			}
		}


		// ͼƬFTPǰ׺
		public string imageFtp
		{
			get
			{
				return "Image/";
			}
		}
		

		// �ļ�����·��
		public string filePath
		{
			get { return installDir + @"\Data\File\"; }
		}


		// �ļ�HTTPǰ׺
		public string fileHttp
		{
			get
			{
				return "Data/File/";
			}
		}


		// �ļ�FTPǰ׺
		public string fileFtp
		{
			get
			{
				return "File/";
			}
		}


		// ����.net�������ַ���
		public string netDataConnString
		{
			get
			{
				return string.Format("server={0};database={1};uid={2};pwd={3};",
					dbServerName, databaseName, dbUserName, dbPassword);
			}
		}


		// ����ado�������ַ���
		public string adoDataConnString
		{
			get
			{
				return string.Format("Provider=SQLOLEDB.1;Persist Security Info=True;Data Source={0};Initial Catalog={1};User ID={2};Password={3}",
					dbServerName, databaseName, dbUserName, dbPassword);
			}
		}


		// Httpǰ׺
		public string httpPrefix
		{
			get{ return "http://" + webServerName + "/" + httpVDir; }
		}


		// Ftpǰ׺
		public string ftpPrefix
		{
			get{ return "ftp://" + webServerName + "/" + ftpVDir; }
		}



		#endregion

		#region ˽�к���

		
		/// <summary>
		///���������ļ� 
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


	
		//�����ñ��浽setup.ini�ļ���
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
			string strConfig = "���÷���Wsdl=" + httpPrefix + "/ConfigService.asmx?wsdl";
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

		#region ���к���
	

			
		/// <summary>
		///��ȡ����ֵ 
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
		///��������ֵ 
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
		/// �������õ�Setup.ini�ļ���
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
