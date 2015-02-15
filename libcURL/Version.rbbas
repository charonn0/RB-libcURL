#tag Module
Protected Module Version
	#tag Method, Flags = &h21
		Private Function Features() As Integer
		  Return Struct.Features
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MajorNumber() As Integer
		  ' libcurl's major version; e.g. if the version is 1.2.3 then the MajorNumber is 1
		  Return Val(NthField(NthField(NthField(libcURL.Version.Name, " ", 1), "/", 2), ".", 1))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function MinorNumber() As Integer
		  ' libcurl's minor version; e.g. if the version is 1.2.3 then the MinorNumber is 2
		  Return Val(NthField(NthField(NthField(libcURL.Version.Name, " ", 1), "/", 2), ".", 2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Name() As String
		  If Not System.IsFunctionAvailable("curl_version", "libcurl") Then Return ""
		  Static p As MemoryBlock
		  If p = Nil Then
		     p = curl_version()
		  End If
		  Return p.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PatchNumber() As Integer
		  ' libcurl's patch version; e.g. if the version is 1.2.3 then the PatchNumber is 3
		  Return Val(NthField(NthField(NthField(libcURL.Version.Name, " ", 1), "/", 2), ".", 3))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Protocols() As String()
		  Dim prots() As String
		  If Not System.IsFunctionAvailable("curl_version", "libcurl") Then Return prots
		  Dim ve As CURLVersion = libcURL.Version.Struct
		  Dim p1 As Ptr = ve.Protocols.Ptr(0)
		  Dim mb As MemoryBlock = p1
		  ' Note that the following line fails on my Linux Vm
		  ' The docs say that the Protocols list is terminated
		  ' by an empty entry, but on Linux the final entry is
		  ' not empty.
		  Dim s As String = mb.WString(0) + Chr(0)
		  s = DefineEncoding(s, Encodings.ASCII)
		  prots = Split(s, Chr(0))
		  For i As Integer = UBound(prots) DownTo 0
		    If prots(i).Trim = "" Then prots.Remove(i)
		  Next
		  Return prots
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Struct() As CURLVersion
		  If System.IsFunctionAvailable("curl_version_info", "libcurl") Then
		    If curl_global_init(CURL_GLOBAL_DEFAULT) = 0 Then
		      Dim ve As MemoryBlock
		      ve = curl_version_info(CURLVERSION_FOURTH)
		      Dim v As CURLVersion
		      v.StringValue(TargetLittleEndian) = ve.StringValue(0, v.Size)
		      curl_global_cleanup()
		      Return v
		    End If
		  End If
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kASYNCHDNS As Integer = ShiftLeft(1, 7)
			  Return BitAnd(Features, kASYNCHDNS) = kASYNCHDNS  // asynchronous dns resolves
			End Get
		#tag EndGetter
		Protected ASYNCHDNS As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kCONV As Integer = ShiftLeft(1, 12)
			  Return BitAnd(Features, kCONV) = kCONV // character conversions are supported
			End Get
		#tag EndGetter
		Protected CONV As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kDEBUG As Integer = ShiftLeft(1, 6)
			  Return BitAnd(Features, kDEBUG) = kDEBUG // built with debug capabilities
			End Get
		#tag EndGetter
		Protected DEBUG As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kGSSNEGOTIATE As Integer = ShiftLeft(1, 5)
			  Return BitAnd(Features, kGSSNEGOTIATE) = kGSSNEGOTIATE // Negotiate auth support
			End Get
		#tag EndGetter
		Protected GSSNEGOTIATE As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kIDN As Integer = ShiftLeft(1, 10)
			  Return BitAnd(Features, kIDN) = kIDN // International Domain Names support
			End Get
		#tag EndGetter
		Protected IDN As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kIPV6 As Integer = ShiftLeft(0, 1)
			  Return BitAnd(Features, kIPV6) = kIPV6 // IPv6-enabled
			End Get
		#tag EndGetter
		Protected IPV6 As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kKERBEROS4 As Integer = ShiftLeft(1, 1)
			  Return BitAnd(Features, kKERBEROS4) = kKERBEROS4 // kerberos auth is supported
			End Get
		#tag EndGetter
		Protected KERBEROS4 As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kLARGEFILE As Integer = ShiftLeft(1, 9)
			  Return BitAnd(Features, kLARGEFILE) = kLARGEFILE // supports files bigger than 2GB
			End Get
		#tag EndGetter
		Protected LARGEFILE As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kLIBZ As Integer = ShiftLeft(1, 3)
			  Return BitAnd(Features, kLIBZ) = kLIBZ // libz features are present
			End Get
		#tag EndGetter
		Protected LIBZ As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kNTLM As Integer = ShiftLeft(1, 4)
			  Return BitAnd(Features, kNTLM) = kNTLM // NTLM auth is supported
			End Get
		#tag EndGetter
		Protected NTLM As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kSPNEGO As Integer = ShiftLeft(1, 8)
			  Return BitAnd(Features, kSPNEGO) = kSPNEGO // SPNEGO auth
			End Get
		#tag EndGetter
		Protected SPNEGO As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kSSL As Integer = ShiftLeft(1, 2)
			  Return BitAnd(Features, kSSL) = kSSL // SSL options are present
			End Get
		#tag EndGetter
		Protected SSL As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  Dim kSSPI As Integer = ShiftLeft(1, 11)
			  Return BitAnd(Features, kSSPI) = kSSPI // SSPI is supported
			End Get
		#tag EndGetter
		Protected SSPI As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = CURLVERSION_FOURTH, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CURLVersion, Flags = &h21
		Age As Integer
		  VersionString As Ptr
		  VersionNumber As UInt32
		  HostString As Ptr
		  Features As Integer
		  SSLVersionString As Ptr
		  SSLVersionNumber As Integer
		  libzVersion As Ptr
		  Protocols As Ptr
		  ares As Ptr
		  aresnum As Integer
		  libidn As Ptr
		  iconvVersion as Integer
		libSSHVersion As Ptr
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
