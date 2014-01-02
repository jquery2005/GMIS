using System;
namespace GMIS.CommonRightBusinessRule
{
	/// <summary>
	/// RSAProtection 的摘要说明。
	/// </summary>
	public class RSAProtection
	{
		private  RSAProtection()
		{			
		}

		private  readonly static string  RSAPublicKey=@"<RSAKeyValue><Modulus>ykGHw0KFKgNtUJXawebJz0YliRida/zUudN4Rsxaahx/HJPH+CksHI22Wqf0R0cWOkDx4+m9/GQ6Gvg7WxdCkDDim166PFurc5H13eH8WcaReUy1z0g1uOJgGvOFRZw73anTdgWha7MucrVBtPAB2nOApC6jnRHxvxmRIY0N8mM=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue><RSAKeyValue><Modulus>wpJvpL9oOaulih77lCYHXec5q59AVy4DmwQR2DLB6iQKzeAs5f+/Tc6A09atUAkRIgU6a+mQ/QsKHYuAhTadhBl+HwoKohsbLki4ZQCbrgRQaszv2DN/pDhymWhtXfBwb351vicmDVMUplNUH9rmgrEg7WEiU9+s/qFW9QAXu+U=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
		private  readonly static string  RSAPrivateKey=@"<RSAKeyValue><Modulus>ykGHw0KFKgNtUJXawebJz0YliRida/zUudN4Rsxaahx/HJPH+CksHI22Wqf0R0cWOkDx4+m9/GQ6Gvg7WxdCkDDim166PFurc5H13eH8WcaReUy1z0g1uOJgGvOFRZw73anTdgWha7MucrVBtPAB2nOApC6jnRHxvxmRIY0N8mM=</Modulus><Exponent>AQAB</Exponent><P>5gc+Vj/j3gLjsF68X7n3PffaBEQZpxryEGwgbJ5d2vsS1rGjI1d74VaxNnDxh1MImHKZgB+ZKtTMnq/z6jpdrw==</P><Q>4ReNswbrz+X+mkKu3Su57fSocjX/Fuyic7NL0Peq/ICUHBt4EvI3WlUhKBBYdfQCNfAF515FzlQUx9H+f2R3jQ==</Q><DP>CNA4PDfAdE4qCSToFMbcSTyI1ucBEJ0Ar05lQ6QhtnUuOJmfxYfhkDWxHoPfTS8KQkUJypXrWW/D00SslMndsw==</DP><DQ>4E40ap8PBtHO8bJZxxT352TTJ10fopyVFm8pskfcIFuRPKEy+s5c0qvaqq3/OSu7uDxD5dhP/9hSDP36esCHUQ==</DQ><InverseQ>jQNciSrxi8V9Zz7E9Q2ts9UKsMyP877jusDWXZnyGMTvCFETlPAzDuiVWi7fiAmV6NeINU1jTcr01spF2kFuvQ==</InverseQ><D>nIm5bNu4OvsqCRvikv5vpXfyJzig5mpprmVIiusw8z2Y9+I8/AnJtVPNFj81plETmASZ8r7/Jy/fdO446liHT7f2MCs/yZZ2p4BgkNbLQbVnBhBraO1rpwQ35cC0KAFTj0V6qqAdkY0V0cky5dN12K5AHIyR3p5KIKSslNxE7Hk=</D></RSAKeyValue><RSAKeyValue><Modulus>wpJvpL9oOaulih77lCYHXec5q59AVy4DmwQR2DLB6iQKzeAs5f+/Tc6A09atUAkRIgU6a+mQ/QsKHYuAhTadhBl+HwoKohsbLki4ZQCbrgRQaszv2DN/pDhymWhtXfBwb351vicmDVMUplNUH9rmgrEg7WEiU9+s/qFW9QAXu+U=</Modulus><Exponent>AQAB</Exponent><P>/1IDUf5PtpV5q4mnABLylUz0zq0cckwa1JW08JcqdK07E9UmrcSRPcO9l3pzrVgI6jMPGHJg1ux3gCQ+3fe06w==</P><Q>wxcGw5ct9EniEMT+12zLqWtDNGJlQQ/Y0o1+kcNPzwo3NecR8/Pl/kTf0lgGMPoVBP5abjWUk0HEAVaxv0Zebw==</Q><DP>pbNvTjZzO3cVCLwEcyrY3wab1spIrPExdIhYbtBckG6g6cUrHhl1fZVcpUOmcXiyCHTsthv9N18uSy660knh0w==</DP><DQ>k186odf7Q/XoCyj1JgEunE3F17WYrZxt+ygd+7ih+lHKQTLLshCFph2bQodyLd9Mr5gA8g4RrWfZy/UUktxyiw==</DQ><InverseQ>+L3p7kH0twE7O0zQlI0Kabjywp989tihZSRpmZXwswhWEwYWVNvcXetOS5VaFxJjtBAC9ozhQopCWpVynJ44ng==</InverseQ><D>QwjWhAkZ7HyRnOONw33SneyS9uj37tFAlsCxMS5TlspyGnn4ngkdrL3PrqxQq7lj+LeaaCFhPXz3MDSmw76MR6Ke9cg/L52nTqPnrt+H63TFOgJJUyP0p9l4ZF/+9AfG+B2ZKUJN/h7Um6FvdHNv4MLcNS4paK/MS4eHcs9ns+U=</D></RSAKeyValue>";
	
		internal static string Encrypt(string data)
		{
			Gmis.Protection.DataProtection rsaPro=new Gmis.Protection.DataProtection();
			rsaPro.PublicKey=RSAPublicKey;
			string strData=rsaPro.EncryptText(data);
			return strData;
		}



		internal static string Decrypt(string fileName)
		{
		
			Gmis.Protection.DataProtection rsaPro=new Gmis.Protection.DataProtection();
			rsaPro.Privatekey=RSAPrivateKey;
			string strData=rsaPro.DecryptFile(fileName);
			return strData;
		}
	}
}
