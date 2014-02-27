#tag Module
Protected Module Version
	#tag Method, Flags = &h1
		Protected Function ASYNCHDNS() As Integer
		  Return ShiftLeft(1, 7)  // asynchronous dns resolves
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CONV() As Integer
		  Return ShiftLeft(1, 12) // character conversions are supported
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DEBUG() As Integer
		  Return ShiftLeft(1, 6)  // built with debug capabilities
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Features() As Integer
		  Return Struct.Features
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GSSNEGOTIATE() As Integer
		  Return ShiftLeft(1, 5) // Negotiate auth support
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IDN() As Integer
		  Return ShiftLeft(1, 10) // International Domain Names support
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IPV6() As Integer
		  Return ShiftLeft(0, 1)  // IPv6-enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function KERBEROS4() As Integer
		  Return ShiftLeft(1, 1) // kerberos auth is supported
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LARGEFILE() As Integer
		  Return ShiftLeft(1, 9)  // supports files bigger than 2GB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function LIBZ() As Integer
		  Return ShiftLeft(1, 3)  // libz features are present
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Name() As String
		  If Not cURL.IsAvailable Then Return ""
		  Dim p As MemoryBlock = curl_version()
		  Return p.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NTLM() As Integer
		  Return ShiftLeft(1, 4)  // NTLM auth is supported
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Protocols() As String()
		  Dim ve As CURLVersion = cURL.Version.Struct
		  Dim l() As String' = ve.Protocols.Ptr(0)
		  Dim mb As MemoryBlock = ve.Protocols.Ptr(0)
		  Dim bs As New BinaryStream(mb)
		  
		  Do
		    Dim word As String
		    Dim null As Integer
		    While Not bs.EOF
		      Dim char As Byte = bs.ReadByte
		      If char <> 0 Then
		        word = word + Chr(char)
		      Else
		        Exit While
		      End If
		    Wend
		    l.Append(word)
		    null = 0
		  Loop
		  
		  'Dim s As String = mb.CString(0)
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SPNEGO() As Integer
		  Return ShiftLeft(1, 8)  // SPNEGO auth
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SSL() As Integer
		  Return ShiftLeft(1, 2)  // SSL options are present
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SSPI() As Integer
		  Return ShiftLeft(1, 11) // SSPI is supported
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Struct() As CURLVersion
		  If cURL.IsAvailable Then
		    If curl_global_init(3) = 0 Then
		      Dim ve As MemoryBlock
		      ve = curl_version_info(CURLVERSION_FOURTH)
		      Dim v As CURLVersion
		      v.StringValue(TargetLittleEndian) = ve.StringValue(0, v.Size)
		      Return v
		    End If
		  End If
		End Function
	#tag EndMethod


	#tag Structure, Name = CURLVersion, Flags = &h1
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


End Module
#tag EndModule
