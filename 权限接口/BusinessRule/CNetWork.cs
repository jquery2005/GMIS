using System;
using System.Runtime.InteropServices;
using System.Collections; 

namespace GMIS.CommonRightBusinessRule
{

	public enum WNetRscScope
	{
		Connected = 0x00000001,
		GlobalNet = 0x00000002,
		Remembered = 0x00000003,
		Recent  = 0x00000004,
		Context  = 0x00000005
	}

	[Flags]
	public enum WNetRscType
	{
		Any   = 0x00000000,
		Disk  = 0x00000001,
		Print  = 0x00000002,
		Reserved = 0x00000008,
		Unknown  = unchecked( (int) 0xFFFFFFFF )
	}

	[Flags]
	public enum WNetRscUsage
	{
		Any    = 0x00000000,
		Connectable  = 0x00000001,
		Container  = 0x00000002,
		NoLocalDevice = 0x00000004,
		Sibling   = 0x00000008,
		Attached  = 0x00000010,
		All    = 0x00000013,
		Reserved  = unchecked( (int) 0x80000000 )
	}

	public enum WNetRscDisplay
	{
		Generic   = 0x00000000,
		Domain   = 0x00000001,
		Server   = 0x00000002,
		Share   = 0x00000003,
		File   = 0x00000004,
		Group   = 0x00000005,
		Network   = 0x00000006,
		Root   = 0x00000007,
		ShareAdmin  = 0x00000008,
		Directory  = 0x00000009,
		Tree   = 0x0000000A,
		NdsContainer = 0x0000000B
	}




	[StructLayoutAttribute(LayoutKind.Sequential, CharSet=CharSet.Auto)]
	public class NETRESOURCE
	{
		public WNetRscScope  Scope;
		public WNetRscType  RType;
		public WNetRscDisplay Display;
		public WNetRscUsage  Usage;

		[MarshalAs(UnmanagedType.LPTStr)]
		public string   LocalName;
		[MarshalAs(UnmanagedType.LPTStr)]
		public string   RemoteName;
		[MarshalAs(UnmanagedType.LPTStr)]
		public string   Comment;
		[MarshalAs(UnmanagedType.LPTStr)]
		public string   Provider;
	}



	public class CNetWork
	{
		public CNetWork()
		{}

		[DllImport("mpr.dll", CharSet=CharSet.Auto)]
		private static extern int WNetOpenEnum( WNetRscScope scope, WNetRscType type,
			WNetRscUsage usage, [In] NETRESOURCE rsc, out IntPtr handle );

		[DllImport("mpr.dll", CharSet=CharSet.Auto)]
		private static extern int WNetEnumResource( IntPtr handle, ref int count,
			IntPtr buffer, ref int size );

		[DllImport("mpr.dll", CharSet=CharSet.Auto)]
		private static extern int WNetCloseEnum( IntPtr handle );

		public ArrayList GetNetWorkResource()
		{
			int result;
			IntPtr handle;
			ArrayList myNetWorkRes=new   ArrayList(); 

			//result = WNetOpenEnum( WNetRscScope.Connected, WNetRscType.Any,WNetRscUsage.Any, null, out handle );
			result = WNetOpenEnum( WNetRscScope.Context , WNetRscType.Any,WNetRscUsage.Any, null, out handle );

			if( result != 0 )
			{ 
				throw new  Exception( "WNetOpenEnum failed" );
				
			}


			int entries;
			int memory = 16300;
			IntPtr buffer = Marshal.AllocHGlobal( memory );
			Type type = typeof( NETRESOURCE );
			int size = Marshal.SizeOf( type );
			NETRESOURCE rsc;
			for(;;)
			{
				entries = -1;
				memory = 16300;
				result = WNetEnumResource( handle, ref entries, buffer, ref memory );
				if( result == 259 )
				{
					Console.WriteLine( "Done." );
					break;
				}

				if( (result != 0) || (entries < 1) )
				{
					throw new  Exception( "WNetEnumResource failed ");
					
				}

				int run = (int) buffer;
				for( int i = 0; i < entries; i++ )
				{
					rsc = (NETRESOURCE) Marshal.PtrToStructure( (IntPtr) run, type );
					myNetWorkRes.Add(rsc.RemoteName);
					run += size;
				}
			}

			Marshal.FreeHGlobal( buffer );
			result = WNetCloseEnum( handle );
			return  myNetWorkRes;

			
		}
 
	} //class
} //namespace

