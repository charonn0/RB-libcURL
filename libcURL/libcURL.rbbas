#tag Module
Protected Module libcURL
	#tag Method, Flags = &h1
		Protected Function CompareDomains(Hostname1 As String, Hostname2 As String, Optional EasyItem As libcURL.EasyHandle) As Boolean
		  ' Compares Hostname1 and Hostname2 to determine whether they belong to the same subdomain.
		  ' For example 'api.example.com' matches 'example.com' and 'api.example.com' but not 'www.example.com'
		  ' libcurl needs a curl_easy handle to URLdecode data. If EasyItem is not Nil, then the EasyItem is 
		  ' used; otherwise a new EasyHandle is constructed.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.CompareDomains
		  ' https://github.com/charonn0/RB-libcURL/wiki/HTTP-Cookies-Example#domain-name-matching
		  
		  Dim tmp() As String = Split(Hostname1, ".")
		  Dim h1() As String
		  For i As Integer = 0 To UBound(tmp)
		    If tmp(i).Trim = "" Then Continue
		    h1.Insert(0, URLDecode(tmp(i), EasyItem))
		  Next
		  
		  tmp = Split(Hostname2, ".")
		  Dim h2() As String
		  For i As Integer = 0 To UBound(tmp)
		    If tmp(i).Trim = "" Then Continue
		    h2.Insert(0, URLDecode(tmp(i), EasyItem))
		  Next
		  
		  Dim count As Integer = Min(h1.Ubound, h2.Ubound)
		  For i As Integer = 0 To count
		    If StrComp(h1(i), h2(i), 0) <> 0 Then Return False
		  Next
		  
		  Return True
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_cleanup Lib cURLLib (EasyHandle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_duphandle Lib cURLLib (EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_escape Lib cURLLib (EasyHandle As Integer, CharBuffer As Ptr, Length As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_getinfo Lib cURLLib (EasyHandle As Integer, InfoCode As Integer, Buffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_init Lib cURLLib () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_pause Lib cURLLib (EasyHandle As Integer, Mask As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_perform Lib cURLLib (EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_recv Lib cURLLib (EasyHandle As Integer, Buffer As Ptr, BytesToRead As Integer, ByRef BytesRead As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_reset Lib cURLLib (EasyHandle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_send Lib cURLLib (EasyHandle As Integer, Buffer As Ptr, BytesToWrite As Integer, ByRef BytesWritten As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_setopt Lib cURLLib (EasyHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_strerror Lib cURLLib (EasyError As Integer) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_unescape Lib cURLLib (EasyHandle As Integer, char As Ptr, Length As Integer, ByRef OutLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_formadd Lib cURLLib (ByRef FirstItem As Integer, ByRef LastItem As Ptr, Option As Integer, Value As Ptr, Option1 As Integer, Value1 As Ptr, Option2 As Integer, Value2 As Ptr, Option3 As Integer, Value3 As Ptr, Option4 As Integer, Value4 As Ptr, Option5 As Integer, Value5 As Ptr, Option6 As Integer, Value6 As Ptr, Option7 As Integer, Value7 As Ptr, Option8 As Integer, Value8 As Ptr, Option9 As Integer, Value9 As Ptr, Option10 As Integer, Value10 As Ptr, FinalOption As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_formfree Lib cURLLib (curlform As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_formget Lib cURLLib (First As Integer, UserData As Integer, Callback As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_free Lib cURLLib (char As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_getdate Lib cURLLib (DateString As CString, Reserved As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_global_cleanup Lib cURLLib ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_global_init Lib cURLLib (flags As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function curl_infoname(MessageType As libcURL.curl_infotype) As String
		  ' Returns the name of the specified curl_infotype
		  
		  Select Case MessageType
		  Case libcURL.curl_infotype.data_in
		    Return "Data In"
		  Case libcURL.curl_infotype.data_out
		    Return "Data Out"
		  Case libcURL.curl_infotype.header_in
		    Return "Header In"
		  Case libcURL.curl_infotype.header_out
		    Return "Header Out"
		  Case libcURL.curl_infotype.info_end
		    Return "Info End"
		  Case libcURL.curl_infotype.ssl_in
		    Return "SSL In"
		  Case libcURL.curl_infotype.ssl_out
		    Return "SSL Out"
		  Case libcURL.curl_infotype.text
		    Return "Text"
		  Case libcURL.curl_infotype.RB_libcURL ' debug message from the wrapper
		    Return "RB-libcURL"
		  End Select
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_addpart Lib cURLLib (MIME As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_data Lib cURLLib (MIMEPart As Ptr, Data As Ptr, DataSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_data_cb Lib cURLLib (MIMEPart As Ptr, DataSize As Int64, ReadCallback As Ptr, SeekCallback As Ptr, FreeCallback As Ptr, UserData As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_encoder Lib cURLLib (MIMEPart As Ptr, Encoding As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_filedata Lib cURLLib (MIMEPart As Ptr, FilePath As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_filename Lib cURLLib (MIMEPart As Ptr, FileName As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_mime_free Lib cURLLib (MIME As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_headers Lib cURLLib (MIMEPart As Ptr, HeaderList As Integer, TakeOwnership As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_init Lib cURLLib (EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_name Lib cURLLib (MIMEPart As Ptr, Name As Ptr, NameSize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_subparts Lib cURLLib (MIMEPart As Ptr, SubParts As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_mime_type Lib cURLLib (MIMEPart As Ptr, Type As CString) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_add_handle Lib cURLLib (MultiHandle As Integer, EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_cleanup Lib cURLLib (MultiHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_info_read Lib cURLLib (MultiHandle As Integer, ByRef MsgCount As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_init Lib cURLLib () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_perform Lib cURLLib (MultiHandle As Integer, ByRef ActiveCount As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_remove_handle Lib cURLLib (MultiHandle As Integer, EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_setopt Lib cURLLib (MultiHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_strerror Lib cURLLib (errNo As Integer) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_timeout Lib cURLLib (MultiHandle As Integer, ByRef Timeout As timeval) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_cleanup Lib cURLLib (ShareHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_init Lib cURLLib () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_setopt Lib cURLLib (ShareHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_strerror Lib cURLLib (errNo As Integer) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_slist_append Lib cURLLib (sList As Ptr, Data As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_slist_free_all Lib cURLLib (sList As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_version Lib cURLLib () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_version_info Lib cURLLib (Version As Integer) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function Default_CA_File() As FolderItem
		  ' For SSL/TLS connections we must specify a file with a list of acceptable certificate authorities to verify the peer with.
		  ' This method dumps the default CA list for Mozilla products (included as DEFAULT_CA_INFO_PEM) into a temp file and
		  ' returns it. The DEFAULT_CA_INFO_PEM file is subject to the terms of the Mozilla Public License 2.0
		  '
		  ' To generate an updated CA file use one of these two scripts:
		  '    VBScript: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.vbs
		  '        perl: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.pl
		  
		  Static CA_File As FolderItem
		  If CA_File = Nil Then
		    CA_File = GetTemporaryFolderItem()
		    Dim bs As BinaryStream = BinaryStream.Open(CA_File, True)
		    bs.Write(DEFAULT_CA_INFO_PEM)
		    bs.Close
		  End If
		  Return CA_File
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatError(cURLError As Integer, Encoding As TextEncoding = Nil) As String
		  ' Translates libcurl error numbers to messages
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_strerror.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatError
		  
		  If Not libcURL.IsAvailable Then Return "libcURL is not available or is an unsupported version."
		  Dim msg As String = curl_easy_strerror(cURLError)
		  If Encoding <> Nil Then
		    Return ConvertEncoding(msg, Encoding)
		  Else
		    Return DefineEncoding(msg, Encodings.ASCII)
		  End If
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatMultiError(cURLMultiError As Integer, Encoding As TextEncoding = Nil) As String
		  ' Translates libcurl multi error numbers to messages
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_strerror.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatMultiError
		  
		  If Not libcURL.IsAvailable Then Return "libcURL is not available or is an unsupported version."
		  Dim msg As String = curl_multi_strerror(cURLMultiError)
		  If Encoding <> Nil Then
		    Return ConvertEncoding(msg, Encoding)
		  Else
		    Return DefineEncoding(msg, Encodings.ASCII)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormatShareError(cURLShareError As Integer, Encoding As TextEncoding = Nil) As String
		  ' Translates libcurl share error numbers to messages
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_share_strerror.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatShareError
		  
		  If Not libcURL.IsAvailable Then Return "libcURL is not available or is an unsupported version."
		  Dim msg As String = curl_share_strerror(cURLShareError)
		  If Encoding <> Nil Then
		    Return ConvertEncoding(msg, Encoding)
		  Else
		    Return DefineEncoding(msg, Encodings.ASCII)
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  ' Returns True if libcURL is available and at least version 7.15.2. Prior versions require that curl_global_init and
		  ' curl_global_cleanup be called only once each, which we aren't doing.
		  Const MinMajor = 7
		  Const MinMinor = 15
		  Const MinPatch = 2
		  
		  Static available As Boolean = libcURL.Version.IsAtLeast(MinMajor, MinMinor, MinPatch)
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDate(DateItem As Date) As String
		  ' Returns an RFC 1123-compliant timestamp for the specified Date
		  
		  Dim dt As String
		  DateItem.GMTOffset = 0
		  Select Case DateItem.DayOfWeek
		  Case 1
		    dt = dt + "Sun, "
		  Case 2
		    dt = dt + "Mon, "
		  Case 3
		    dt = dt + "Tue, "
		  Case 4
		    dt = dt + "Wed, "
		  Case 5
		    dt = dt + "Thu, "
		  Case 6
		    dt = dt + "Fri, "
		  Case 7
		    dt = dt + "Sat, "
		  End Select
		  
		  dt = dt  + Str(DateItem.Day, "00") + " "
		  
		  Select Case DateItem.Month
		  Case 1
		    dt = dt + "Jan "
		  Case 2
		    dt = dt + "Feb "
		  Case 3
		    dt = dt + "Mar "
		  Case 4
		    dt = dt + "Apr "
		  Case 5
		    dt = dt + "May "
		  Case 6
		    dt = dt + "Jun "
		  Case 7
		    dt = dt + "Jul "
		  Case 8
		    dt = dt + "Aug "
		  Case 9
		    dt = dt + "Sep "
		  Case 10
		    dt = dt + "Oct "
		  Case 11
		    dt = dt + "Nov "
		  Case 12
		    dt = dt + "Dec "
		  End Select
		  
		  dt = dt  + Str(DateItem.Year, "0000") + " " + Str(DateItem.Hour, "00") + ":" + Str(DateItem.Minute, "00") + ":" + Str(DateItem.Second, "00") + " GMT"
		  Return dt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDate(RawDate As String, ByRef Parsed As Date) As Boolean
		  ' Parses the passed date string into the referenced Date object.
		  ' If parsing was successful, returns True and instantiates the passed date reference; else, returns false.
		  ' Valid for dates between 1 Jan 1970 00:00:00 GMT and 19 Jan 2038 03:14:07 GMT
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_getdate.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.ParseDate
		  
		  If Not libcURL.IsAvailable Then Return False
		  Dim count As Integer = curl_getdate(RawDate, Nil)
		  If count > -1 Then
		    Parsed = New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		    Parsed.TotalSeconds = Parsed.TotalSeconds + count
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLDecode(Data As String, Optional EasyItem As libcURL.EasyHandle) As String
		  ' Returns the decoded Data using percent encoding as defined in rfc2396
		  ' curl_easy_unescape needs a curl_easy handle to decode data. If EasyItem 
		  ' is not Nil, then the EasyItem is used; otherwise a new EasyHandle is constructed.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_unescape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.URLDecode
		  
		  If Data = "" Then Return ""
		  If EasyItem = Nil Then EasyItem = New libcURL.EasyHandle
		  If Not libcURL.Version.IsAtLeast(7, 15, 4) Then
		    Errorsetter(EasyItem).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(EasyItem)
		  End If
		  
		  Dim output As MemoryBlock
		  Dim ret As String
		  Dim input As MemoryBlock = Data
		  Dim outlen As Integer
		  output = curl_easy_unescape(EasyItem.Handle, input, input.Size, outlen)
		  Try
		    ret = output.StringValue(0, outlen)
		  Finally
		    If output <> Nil Then curl_free(output)
		  End Try
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLEncode(Data As String, Optional EasyItem As libcURL.EasyHandle) As String
		  ' Returns the Data encoded using percent encoding as defined in rfc2396
		  ' curl_easy_escape needs a curl_easy handle to encode data. If EasyItem
		  ' is not Nil, then the EasyItem is used; otherwise a new EasyHandle is constructed.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_escape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.URLEncode
		  
		  If Data = "" Then Return ""
		  If EasyItem = Nil Then EasyItem = New libcURL.EasyHandle
		  If Not libcURL.Version.IsAtLeast(7, 15, 4) Then
		    Errorsetter(EasyItem).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(EasyItem)
		  End If
		  
		  Dim ret As String
		  Dim output As MemoryBlock
		  Dim input As MemoryBlock = Data
		  output = curl_easy_escape(EasyItem.Handle, input, input.Size)
		  Try
		    ret = output.CString(0)
		  Finally
		    If output <> Nil Then curl_free(output)
		  End Try
		  Return ret
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Copying
		RB-libcURL (https://github.com/charonn0/RB-libcURL)
		Copyright (c)2014-17 Andrew Lambert, all rights reserved.
		
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
		
		----
		License for the DEFAULT_CA_INFO_PEM file:
		
		  This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. 
		  If a copy of the MPL was not distributed with this file, You can obtain one at 
		  https://mozilla.org/MPL/2.0/.
	#tag EndNote


	#tag Constant, Name = cURLLib, Type = String, Dynamic = False, Default = \"libcurl", Scope = Private
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"libcurl.4.dylib"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"libcurl.dll"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"libcurl"
	#tag EndConstant

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

	#tag Constant, Name = CURL_WRITEFUNC_PAUSE, Type = Double, Dynamic = False, Default = \"CURL_READFUNC_PAUSE", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = curl_httppost, Flags = &h21
		NextItem As Ptr
		  Name As Ptr
		  NameLen As Integer
		  Contents As Ptr
		  ContentsLen As Integer
		  Buffer As Ptr
		  BufferLen As Integer
		  ContentType As Ptr
		  ContentHeader As Ptr
		  MoreFiles As Ptr
		  Flags As Integer
		  ShowFileName As Ptr
		  UserData As Ptr
		ContentsLenLarge As Int64
	#tag EndStructure

	#tag Structure, Name = timeval, Flags = &h21
		tv_sec As Integer
		tv_usec As Integer
	#tag EndStructure


	#tag Enum, Name = ConnectionType, Type = Integer, Flags = &h1
		NoSSL=0
		  AttemptSSL=1
		  SSLControlConnectionOnly
		SSLForceAll
	#tag EndEnum

	#tag Enum, Name = CURLAUTH, Type = Integer, Flags = &h1
		BASIC=1
		  DIGEST=2
		  DIGEST_IE=16
		  NEGOTIATE=4
		  NTLM=8
		  NTLM_WB=32
		ANY=&hFFFFFFFF
	#tag EndEnum

	#tag Enum, Name = curl_infotype, Flags = &h1
		text
		  header_in
		  header_out
		  data_in
		  data_out
		  ssl_in
		  ssl_out
		  info_end
		RB_libcURL
	#tag EndEnum

	#tag Enum, Name = CWDMethod, Type = Integer, Flags = &h1
		Multi=1
		  None
		Single
	#tag EndEnum

	#tag Enum, Name = FormElementType, Flags = &h1
		MemoryBlock
		  Stream
		  String
		  File
		FileArray
	#tag EndEnum

	#tag Enum, Name = HTTPVersion, Type = Integer, Flags = &h1
		None=0
		  HTTP1_0=1
		  HTTP1_1=2
		HTTP2=3
	#tag EndEnum

	#tag Enum, Name = IPVersion, Type = Integer, Flags = &h1
		Whatever=0
		  V4=1
		V6=2
	#tag EndEnum

	#tag Enum, Name = MIMEPartType, Type = Integer, Flags = &h1
		None
		  Data
		  File
		  Callback
		Multipart
	#tag EndEnum

	#tag Enum, Name = ProxyType, Type = Integer, Flags = &h1
		HTTP=0
		  HTTP1_0=1
		  SOCKS4=4
		  SOCKS4A=6
		  SOCKS5=5
		SOCKS5_HOSTNAME=7
	#tag EndEnum

	#tag Enum, Name = SSLVersion, Type = Integer, Flags = &h1
		Default=0
		  TLSv1=1
		  SSLv2=2
		  SSLv3=3
		  TLSv1_0=4
		  TLSv1_1=5
		TLSv1_2=6
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
