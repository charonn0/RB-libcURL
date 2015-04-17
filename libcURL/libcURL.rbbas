#tag Module
Protected Module libcURL
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_cleanup Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_duphandle Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_escape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_getinfo Lib "libcurl" (handle As Integer, infoCode As Integer, buffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_pause Lib "libcurl" (Handle As Integer, Mask As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_perform Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_recv Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToRead As Integer, ByRef BytesRead As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_reset Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_send Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToWrite As Integer, ByRef BytesWritten As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_setopt Lib "libcurl" (Handle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_strerror Lib "libcurl" (errNo As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_unescape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer, ByRef OutLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_formadd Lib "libcurl" (ByRef FirstItem As Ptr, ByRef LastItem As Ptr, Option1 As Integer, Value1 As CString, Option2 As Integer, Value2 As CString, FinalOption As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_formfree Lib "libcurl" (curlform As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_free Lib "libcurl" (char As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_getdate Lib "libcurl" (DateString As CString, Reserved As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_global_cleanup Lib "libcurl" ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_global_init Lib "libcurl" (flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_add_handle Lib "libcurl" (MultiHandle As Integer, EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_assign Lib "libcurl" (MultiHandle As Integer, SockFD As Integer, sockptr As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_cleanup Lib "libcurl" (MultiHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_fdset Lib "libcurl" (MultiHandle As Integer, ByRef read_fd As Integer, ByRef write_fd As Integer, ByRef exc_fd As Integer, ByRef max_fd As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_info_read Lib "libcurl" (MultiHandle As Integer, ByRef MsgCount As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_perform Lib "libcurl" (MultiHandle As Integer, ByRef ActiveCount As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_remove_handle Lib "libcurl" (MultiHandle As Integer, EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_setopt Lib "libcurl" (MultiHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_socket_action Lib "libcurl" (MultiHandle As Integer, sock_fd As Integer, ev_bitmask As Integer, ByRef running_handles As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_strerror Lib "libcurl" (errNo As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_timeout Lib "libcurl" (MultiHandle As Integer, ByRef Timeout As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_slist_append Lib "libcurl" (sList As Ptr, Data As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_slist_free_all Lib "libcurl" (sList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_version Lib "libcurl" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_version_info Lib "libcurl" (Version As Integer) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function FormatError(cURLError As Integer) As String
		  ' Translates libcurl error numbers to messages
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_strerror.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatError
		  
		  Select Case True
		  Case Not libcURL.IsAvailable
		    Return "libcURL is not available or is an unsupported version."
		    
		  Case cURLError = libcURL.Errors.INIT_FAILED
		    Return "Unknown failure while constructing a cURL handle."
		    
		  Else
		    Dim mb As MemoryBlock = curl_easy_strerror(cURLError)
		    Return mb.CString(0)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatMultiError(cURLMultiError As Integer) As String
		  ' Translates libcurl multi error numbers to messages
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_strerror.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatMultiError
		  
		  Select Case True
		  Case Not libcURL.IsAvailable
		    Return "libcURL is not available or is an unsupported version."
		    
		  Case cURLError = libcURL.Errors.INIT_FAILED
		    Return "Unknown failure while constructing a cURL multi handle."
		    
		  Else
		    Dim mb As MemoryBlock = curl_multi_strerror(cURLMultiError)
		    Return mb.CString(0)
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Get(URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' Pass a connection TimeOut interval (in seconds), or 0 to wait forever. Pass an InternetHeaders instance and
		  ' an Integer by reference to contain the response headers (if any) and final result code (if any). Headers and
		  ' StatusCode are mandatory and MUST NOT be Nil. Pass a username or password if a username and/or password will
		  ' be required to complete the transfer. Returns a MemoryBlock containing any downloaded data.
		  
		  Dim out As New MemoryBlock(0)
		  Dim outstream As New BinaryStream(out)
		  Dim c As libcURL.cURLItem = libcURL.SynchronousHelpers.Get(URL, TimeOut, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  c.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  ' Returns True if libcURL is available and at least version 7.15.2
		  Const MinMajor = 7
		  Const MinMinor = 15
		  Const MinPatch = 2
		  
		  Static available As Boolean
		  
		  If Not available Then
		    Select Case True
		    Case Not System.IsFunctionAvailable("curl_easy_init", "libcurl")
		      available = False
		      
		    Case libcURL.Version.MajorNumber > MinMajor
		      available = True
		      
		    Case libcURL.Version.MajorNumber = MinMajor
		      If libcURL.Version.MinorNumber > MinMinor Or _
		        (libcURL.Version.MinorNumber = MinMinor And libcURL.Version.PatchNumber >= MinPatch) Then
		        available = True
		      End If
		      
		    End Select
		  End If
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDate(RawDate As String, ByRef Parsed As Date) As Boolean
		  ' Parses the passed date string into the referenced Date object.
		  ' If parsing was successful, returns True and instantiates the passed date reference; else, returns false.
		  ' Valid for dates on or before December 31, 2036 23:59:59 GMT
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_getdate.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.ParseDate
		  
		  Dim count As Integer = curl_getdate(RawDate, Nil)
		  If count > -1 Then
		    Parsed = New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		    Parsed.TotalSeconds = Parsed.TotalSeconds + count
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Post(FormData As Dictionary, URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
		  ' Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem. Pass a connection TimeOut interval (in seconds), or 0 to wait forever. Pass an
		  ' InternetHeaders instance and an Integer by reference to contain the response headers (if any) and final result
		  ' code (if any). Headers and StatusCode are mandatory and MUST NOT be Nil. Pass a username or password if a username
		  ' and/or password will be required to complete the transfer. Returns a MemoryBlock containing any downloaded data.
		  
		  Dim out As New MemoryBlock(0)
		  Dim outstream As New BinaryStream(out)
		  Dim frm As New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not frm.AddElement(item, FormData.Value(item)) Then Raise New cURLException(frm)
		  Next
		  Dim c As libcURL.cURLItem = libcURL.SynchronousHelpers.Post(frm, URL, TimeOut, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  c.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Put(File As FolderItem, URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
		  ' Synchronously uploads the passed FolderItem using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses. The
		  ' path part of the URL specifies the remote directory and file name to store the file under. Pass a connection
		  ' TimeOut interval (in seconds), or 0 to wait forever. Pass an InternetHeaders instance and an Integer by reference
		  ' to contain the response headers (if any) and final result code (if any). Headers and StatusCode are mandatory
		  ' and MUST NOT be Nil. Pass a username or password if a username and/or password will be required to complete
		  ' the transfer. Returns a MemoryBlock containing any downloaded data.
		  
		  Dim out As New MemoryBlock(0)
		  Dim outstream As New BinaryStream(out)
		  Dim instream As BinaryStream = BinaryStream.Open(File)
		  
		  Dim c As libcURL.cURLItem = libcURL.SynchronousHelpers.Put(URL, TimeOut, instream, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  instream.Close
		  c.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLDecode(Data As String) As String
		  ' Returns the decoded Data using percent encoding as defined in rfc2396
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_unescape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.URLDecode
		  
		  If libcURL.IsAvailable Then
		    If curl_global_init(CURL_GLOBAL_DEFAULT) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim outlen As Integer
		        Dim p As Ptr = curl_easy_unescape(mHandle, InP, InP.Size, outlen)
		        InP = p
		        Dim ret As String = InP.StringValue(0, outlen)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        curl_global_cleanup()
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLEncode(Data As String) As String
		  ' Returns the Data encoded using percent encoding as defined in rfc2396
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_escape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.URLEncode
		  
		  If libcURL.IsAvailable Then
		    If curl_global_init(CURL_GLOBAL_DEFAULT) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim p As Ptr = curl_easy_escape(mHandle, InP, InP.Size)
		        InP = p
		        Dim ret As String = InP.CString(0)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        curl_global_cleanup()
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod


	#tag Note, Name = Copying
		libcURL Copyright (c) 1996 - 2014, Daniel Stenberg, <daniel@haxx.se>.
		RB-libcURL Copyright (c)2014 Andrew Lambert, <andrew@boredomsoft.org>.
		 
		All rights reserved.
		 
		Permission to use, copy, modify, and distribute this software for any purpose
		with or without fee is hereby granted, provided that the above copyright
		notice and this permission notice appear in all copies.
		 
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
		NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
		DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
		OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
		OR OTHER DEALINGS IN THE SOFTWARE.
		 
		Except as contained in this notice, the name of a copyright holder shall not
		be used in advertising or otherwise to promote the sale, use or other dealings
		in this Software without prior written authorization of the copyright holder.
	#tag EndNote


	#tag Constant, Name = CURL_GLOBAL_ALL, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_DEFAULT, Type = Double, Dynamic = False, Default = \"CURL_GLOBAL_ALL", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_NOTHING, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_SSL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_WIN32, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_READFUNC_ABORT, Type = Double, Dynamic = False, Default = \"&h10000000", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_READFUNC_PAUSE, Type = Double, Dynamic = False, Default = \"&h10000001", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = CURLMsg, Flags = &h1
		msg As Integer
		  easy_handle As Integer
		Data As Ptr
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
