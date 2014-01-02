using System;
using System.IO;
using System.Text;
using System.Security.Cryptography;
using System.Threading;

namespace Gmis.Protection
{
    /// <summary>
    /// DataProtection 的摘要说明。
    /// </summary>
    public class DataProtection
    {
        #region 变量

        private RSACryptoServiceProvider crypt;

        private string strPublicKey = "";
        private string strPrivateKey = "";

        #endregion 变量

        #region 构造器

        public DataProtection()
        {
            crypt = new RSACryptoServiceProvider();
        }

        public DataProtection(string publicKey, string privateKey)
        {
            crypt = new RSACryptoServiceProvider();
            this.strPublicKey = publicKey;
            this.strPrivateKey = privateKey;
        }

        #endregion

        #region 属性

        /// <summary>
        /// 公钥
        /// </summary>
        public string PublicKey
        {
            set
            {
                this.strPublicKey = value;
            }
        }

        /// <summary>
        /// 私钥
        /// </summary>
        public string Privatekey
        {
            set
            {
                this.strPrivateKey = value;
            }
        }

        #endregion 属性

        #region 公共函数

        #region 产生公私钥

        /// <summary>
        /// 产生公私钥
        /// </summary>
        /// <param name="publicKey"></param>
        /// <param name="privatekey"></param>
        public void CreateKey(out string publicKey, out string privateKey)
        {
            RSACryptoServiceProvider crypt = new RSACryptoServiceProvider();
            publicKey = crypt.ToXmlString(false);
            privateKey = crypt.ToXmlString(true);
            crypt.Clear();
        }

        #endregion 产生公私钥

        #region 文本

        /// <summary>
        /// 加密文本
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public string EncryptText(string text)
        {
            if (this.strPublicKey == "")
            {
                return "";
            }
            try
            {
                byte[] bytes = this.StringToBytes(text);
                MemoryStream ms = this.Encrypt(bytes);
                string strReturn = this.StreamToString(ms);
                return strReturn;
            }
            catch (Exception ex)
            {
                //ExceptionManagement.PublishException(ex);
                return "";
            }
        }

        /// <summary>
        /// 解密文本
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public string DecryptText(string text)
        {
            if (this.strPrivateKey == "")
            {
                return "";
            }
            try
            {
                byte[] bytes = this.StringToBytes(text);
                MemoryStream ms = this.Decrypt(bytes);
                string strReturn = this.StreamToString(ms);
                return strReturn;
            }
            catch (Exception ex)
            {
                //ExceptionManagement.PublishException(ex);
                return "";
            }
        }

        #endregion 文本

        #region File

        /// <summary>
        /// 加密文件
        /// </summary>
        /// <param name="fileSource"></param>
        /// <param name="fileTo"></param>
        public void EncryptFile(string fileSource, string fileTo)
        {
            if (this.strPublicKey == "")
            {
                return;
            }

            byte[] bytes = this.FileToBytes(fileSource);
            MemoryStream ms = this.Encrypt(bytes);
            this.StreamToFile(ms, fileTo);
        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="fileSource"></param>
        /// <param name="fileTo"></param>
        public void DecryptFile(string fileSource, string fileTo)
        {
            if (this.strPrivateKey == "")
            {
                return;
            }
            byte[] bytes = this.FileToBytes(fileSource);
            MemoryStream ms = this.Decrypt(bytes);
            this.StreamToFile(ms, fileTo);
        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="fileSource"></param>
        /// <returns></returns>
        public string DecryptFile(string fileSource)
        {
            if (this.strPrivateKey == "")
            {
                return null;
            }

            byte[] bytes = this.FileToBytes(fileSource);
            MemoryStream ms = this.Decrypt(bytes);
            byte[] dbytes = StreamToBytes(ms);
            //UnicodeEncoding enc = new UnicodeEncoding();
            ASCIIEncoding enc = new ASCIIEncoding();

            string strReturn = enc.GetString(dbytes, 0, dbytes.Length);
            return strReturn;
        }

        #endregion File

        #region MemoryStream

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="fileSource"></param>
        /// <returns></returns>
        public MemoryStream DecryptFileToStream(string fileSource)
        {
            return this.DecryptFileToStream(fileSource, false);
        }

        /// <summary>
        /// 解密文件
        /// </summary>
        /// <param name="fileSource"></param>
        /// <param name="createLog"></param>
        /// <returns></returns>
        public MemoryStream DecryptFileToStream(string fileSource, bool createLog)
        {
            if (this.strPrivateKey == "")
            {
                return null;
            }

            byte[] bytes = this.FileToBytes(fileSource);
            MemoryStream ms = this.Decrypt(bytes);

            if (createLog)
            {
                this.StreamToFile(ms, fileSource + ".log");
            }
            return ms;
        }

        #endregion MemoryStream

        #endregion 公共函数

        #region 私有函数

        #region 加密解密

        private MemoryStream Encrypt(byte[] bytes)
        {
            crypt.FromXmlString(this.strPublicKey);
            int blockSize = 0;
            if (crypt.KeySize == 1024)
            {
                blockSize = 16;
            }
            else
            {
                blockSize = 8;
            }
            MemoryStream ms = new MemoryStream();

            byte[] rawblock, encryblock;
            for (int i = 0; i < bytes.Length; i += blockSize)
            {
                if ((bytes.Length - i) > blockSize)
                {
                    rawblock = new byte[blockSize];
                }
                else
                {
                    rawblock = new byte[bytes.Length - i];
                }
                Buffer.BlockCopy(bytes, i, rawblock, 0, rawblock.Length);
                encryblock = crypt.Encrypt(rawblock, false);
                ms.Write(encryblock, 0, encryblock.Length);
            }

            return ms;
        }

        private MemoryStream Decrypt(byte[] bytes)
        {
            crypt.FromXmlString(this.strPrivateKey);
            int keySize = crypt.KeySize / 8;
            byte[] rawblock, decryptblock;

            MemoryStream ms = new MemoryStream();

            for (int i = 0; i < bytes.Length; i += keySize)
            {
                if ((bytes.Length - i) > keySize)
                {
                    rawblock = new byte[keySize];
                }
                else
                {
                    rawblock = new byte[bytes.Length - i];
                }

                Buffer.BlockCopy(bytes, i, rawblock, 0, rawblock.Length);
                decryptblock = crypt.Decrypt(rawblock, false);
                ms.Write(decryptblock, 0, decryptblock.Length);
            }
            return ms;
        }

        #endregion 加密解密

        #region 转换

        private byte[] FileToBytes(string file)
        {
            FileStream fs = new FileStream(@file, FileMode.Open);
            byte[] bytes = new byte[fs.Length];
            fs.Read(bytes, 0, (int)fs.Length);
            fs.Close();

            return bytes;
        }

        private byte[] StreamToBytes(MemoryStream ms)
        {
            ms.Position = 0;
            byte[] bytes = new byte[ms.Length];
            ms.Read(bytes, 0, (int)ms.Length);
            ms.Close();

            return bytes;
        }

        private byte[] StringToBytes(string text)
        {
            UnicodeEncoding enc = new UnicodeEncoding();
            //ASCIIEncoding enc = new ASCIIEncoding();
            byte[] bytes = enc.GetBytes(text);
            return bytes;
        }

        private string BytesToString(byte[] bytes)
        {
            UnicodeEncoding enc = new UnicodeEncoding();
            //ASCIIEncoding enc = new ASCIIEncoding();

            string strReturn = enc.GetString(bytes, 0, bytes.Length);
            return strReturn;
        }

        private string StreamToString(MemoryStream ms)
        {
            byte[] bytes = this.StreamToBytes(ms);
            string strReturn = this.BytesToString(bytes);
            return strReturn;
        }

        private void BytesToFile(byte[] bytes, string file)
        {
            FileStream fsTo = new FileStream(@file, FileMode.Create);
            fsTo.Flush();
            fsTo.Write(bytes, 0, bytes.Length);
            fsTo.Close();
        }

        private void StreamToFile(MemoryStream ms, string file)
        {
            byte[] bytes = StreamToBytes(ms);
            this.BytesToFile(bytes, file);
        }

        #endregion 转换

        #endregion 私有函数

    }
}
