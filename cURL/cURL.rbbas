#tag Module
Protected Module cURL
	#tag Method, Flags = &h21
		Private Function cURLException(Err As Integer) As RuntimeException
		  Dim ex As New RuntimeException
		  If cURL.IsAvailable Then
		    ex.ErrorNumber = Err
		    ex.Message = FormatError(Err)
		  Else
		    ex.Message = "libcURL is not available."
		  End If
		  
		  Return ex
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_easy_cleanup Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_duphandle Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_escape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_getinfo Lib "libcurl" (handle As Integer, infoCode As Integer, buffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_pause Lib "libcurl" (Handle As Integer, Mask As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_perform Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_recv Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToRead As Integer, ByRef BytesRead As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_easy_reset Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_send Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToWrite As Integer, ByRef BytesWritten As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_setopt Lib "libcurl" (Handle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_strerror Lib "libcurl" (errNo As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_unescape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer, ByRef OutLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_free Lib "libcurl" (char As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_global_cleanup Lib "libcurl" ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_global_init Lib "libcurl" (flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_version Lib "libcurl" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_version_info Lib "libcurl" (Version As Integer) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function Features() As Integer
		  Dim ve As CURLVersion = VersionStruct
		  Return ve.Features
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatError(cURLError As Integer) As String
		  //Translates libcurl error numbers to messages
		  If cURL.IsAvailable Then
		    Dim mb As MemoryBlock = curl_easy_strerror(cURLError)
		    Return mb.CString(0)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Return System.IsFunctionAvailable("curl_easy_init", "libcurl")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Protocols() As String()
		  Dim ve As CURLVersion = VersionStruct
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
		Protected Function URLDecode(Data As String) As String
		  If cURL.IsAvailable Then
		    If curl_global_init(3) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim outlen As Integer
		        Dim p As Ptr = curl_easy_unescape(mHandle, InP, InP.Size, outlen)
		        InP = p
		        Dim ret As String = InP.StringValue(0, outlen)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLEncode(Data As String) As String
		  If cURL.IsAvailable Then
		    If curl_global_init(3) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim p As Ptr = curl_easy_escape(mHandle, InP, InP.Size)
		        InP = p
		        Dim ret As String = InP.CString(0)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Version() As String
		  If Not cURL.IsAvailable Then Return ""
		  Dim p As MemoryBlock = curl_version()
		  Return p.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function VersionStruct() As CURLVersion
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


	#tag Constant, Name = CURLM_CALL_MULTI_PERFORM, Type = Double, Dynamic = False, Default = \"4294967295", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLVERSION_FOURTH, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = ERROR_ABORTED_BY_CALLBACK, Type = Double, Dynamic = False, Default = \"42", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_AGAIN, Type = Double, Dynamic = False, Default = \"81", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_BAD_CONTENT_ENCODING, Type = Double, Dynamic = False, Default = \"61", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_BAD_DOWNLOAD_RESUME, Type = Double, Dynamic = False, Default = \"36", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_BAD_FUNCTION_ARGUMENT, Type = Double, Dynamic = False, Default = \"43", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_CHUNK_FAILED, Type = Double, Dynamic = False, Default = \"88", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_CONV_FAILED, Type = Double, Dynamic = False, Default = \"75", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_CONV_REQUIRED, Type = Double, Dynamic = False, Default = \"76", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_COULDNT_CONNECT, Type = Double, Dynamic = False, Default = \"7", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_COULDNT_RESOLVE_HOST, Type = Double, Dynamic = False, Default = \"6", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_COULDNT_RESOLVE_PROXY, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_EVERYTHINGS_PEACHY, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FAILED_INIT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FEATURE_NOT_AVAILABLE, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FILESIZE_EXCEEDED, Type = Double, Dynamic = False, Default = \"63", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FILE_COULDNT_READ_FILE, Type = Double, Dynamic = False, Default = \"37", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_BAD_FILE_LIST, Type = Double, Dynamic = False, Default = \"87", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_CANT_GET_HOST, Type = Double, Dynamic = False, Default = \"15", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_COULDNT_RETR_FILE, Type = Double, Dynamic = False, Default = \"19", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_COULDNT_USE_REST, Type = Double, Dynamic = False, Default = \"31", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_COULDN_SET_TYPE, Type = Double, Dynamic = False, Default = \"17", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_PORT_FAILED, Type = Double, Dynamic = False, Default = \"30", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_PRET_FAILED, Type = Double, Dynamic = False, Default = \"84", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_WEIRD_227_FORMAT, Type = Double, Dynamic = False, Default = \"14", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_WEIRD_PASS_REPLY, Type = Double, Dynamic = False, Default = \"11", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_WEIRD_PASV_REPLY, Type = Double, Dynamic = False, Default = \"13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FTP_WEIRD_SERVER_REPLY, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_FUNCTION_NOT_FOUND, Type = Double, Dynamic = False, Default = \"41", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_GOT_NOTHING, Type = Double, Dynamic = False, Default = \"52", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_HTTP_POST, Type = Double, Dynamic = False, Default = \"34", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_HTTP_RETURNED_ERROR, Type = Double, Dynamic = False, Default = \"22", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_INIT_FAILED, Type = Double, Dynamic = False, Default = \"-3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_INTERFACE_FAILED, Type = Double, Dynamic = False, Default = \"45", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_LDAP_CANNOT_BIND, Type = Double, Dynamic = False, Default = \"38", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_LDAP_INVALID_URL, Type = Double, Dynamic = False, Default = \"62", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_LDAP_SEARCH_FAILED, Type = Double, Dynamic = False, Default = \"39", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_LIB_NOT_FOUND, Type = Double, Dynamic = False, Default = \"-4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_LOGIN_DENIED, Type = Double, Dynamic = False, Default = \"67", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_MALFORMED, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_NO_TARGET, Type = Double, Dynamic = False, Default = \"-2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_OUT_OF_MEMORY, Type = Double, Dynamic = False, Default = \"27", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_PARTIAL_FILE, Type = Double, Dynamic = False, Default = \"18", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_PEER_FAILED_VERIFICATION, Type = Double, Dynamic = False, Default = \"51", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_QUOTE, Type = Double, Dynamic = False, Default = \"21", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_RANGE, Type = Double, Dynamic = False, Default = \"33", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_READ, Type = Double, Dynamic = False, Default = \"26", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_RECV, Type = Double, Dynamic = False, Default = \"56", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_REMOTE_ACCESS_DENIED, Type = Double, Dynamic = False, Default = \"9", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_REMOTE_DISK_FULL, Type = Double, Dynamic = False, Default = \"70", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_REMOTE_FILE_EXISTS, Type = Double, Dynamic = False, Default = \"73", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_REMOTE_FILE_NOT_FOUND, Type = Double, Dynamic = False, Default = \"78", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_RTSP_CSEQ_ERROR, Type = Double, Dynamic = False, Default = \"85", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_RTSP_SESSION, Type = Double, Dynamic = False, Default = \"86", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SEND, Type = Double, Dynamic = False, Default = \"55", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SEND_FAIL_REWIND, Type = Double, Dynamic = False, Default = \"65", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSH, Type = Double, Dynamic = False, Default = \"79", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CACERT_BAD_FILE, Type = Double, Dynamic = False, Default = \"77", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CA_CERT, Type = Double, Dynamic = False, Default = \"60", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CERT_PROBLEM, Type = Double, Dynamic = False, Default = \"58", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CIPHER, Type = Double, Dynamic = False, Default = \"59", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CONNECT, Type = Double, Dynamic = False, Default = \"35", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_CRL_BAD_FILE, Type = Double, Dynamic = False, Default = \"82", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_ENGINE_INIT_FAILED, Type = Double, Dynamic = False, Default = \"66", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_ENGINE_NOT_FOUND, Type = Double, Dynamic = False, Default = \"53", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_ENGINE_SET_FAILED, Type = Double, Dynamic = False, Default = \"54", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_ISSUER_ERROR, Type = Double, Dynamic = False, Default = \"83", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_SSL_SHUTDOWN_FAILED, Type = Double, Dynamic = False, Default = \"80", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TELNET_OPTION_SYNTAX, Type = Double, Dynamic = False, Default = \"49", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TFTP_ILLEGAL, Type = Double, Dynamic = False, Default = \"71", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TFTP_NOT_FOUND, Type = Double, Dynamic = False, Default = \"68", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TFTP_NO_SUCH_USER, Type = Double, Dynamic = False, Default = \"74", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TFTP_PERM, Type = Double, Dynamic = False, Default = \"69", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TFTP_UNKNOWN_ID, Type = Double, Dynamic = False, Default = \"72", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TIMEOUT, Type = Double, Dynamic = False, Default = \"28", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_TOO_MANY_REDIRECTS, Type = Double, Dynamic = False, Default = \"47", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_UNKNOWN_OPTION, Type = Double, Dynamic = False, Default = \"48", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_UNSUPPORTED_PROTOCOL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_UPLOAD_FAILED, Type = Double, Dynamic = False, Default = \"25", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_USE_SSL_FAILED, Type = Double, Dynamic = False, Default = \"64", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERROR_WRITE, Type = Double, Dynamic = False, Default = \"23", Scope = Protected
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


	#tag Enum, Name = curl_infotype, Flags = &h1
		text
		  header_in
		  header_out
		  data_in
		  data_out
		  ssl_in
		  ssl_out
		info_end
	#tag EndEnum


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
