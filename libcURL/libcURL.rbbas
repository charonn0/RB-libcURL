#tag Module
Protected Module libcURL
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_cleanup Lib "libcurl" (EasyHandle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_duphandle Lib "libcurl" (EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_escape Lib "libcurl" (EasyHandle As Integer, CharBuffer As Ptr, Length As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_getinfo Lib "libcurl" (EasyHandle As Integer, InfoCode As Integer, Buffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_pause Lib "libcurl" (EasyHandle As Integer, Mask As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_perform Lib "libcurl" (EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_recv Lib "libcurl" (EasyHandle As Integer, Buffer As Ptr, BytesToRead As Integer, ByRef BytesRead As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_easy_reset Lib "libcurl" (EasyHandle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_send Lib "libcurl" (EasyHandle As Integer, Buffer As Ptr, BytesToWrite As Integer, ByRef BytesWritten As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_setopt Lib "libcurl" (EasyHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_strerror Lib "libcurl" (EasyError As Integer) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_unescape Lib "libcurl" (EasyHandle As Integer, char As Ptr, Length As Integer, ByRef OutLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_formadd Lib "libcurl" (ByRef FirstItem As Integer, ByRef LastItem As Ptr, Option1 As Integer, Value1 As CString, Option2 As Integer, Value2 As CString, Option3 As Integer, Value3 As CString, Option4 As Integer, Value4 As CString, Option5 As Integer, Value5 As CString, FinalOption As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Sub curl_formfree Lib "libcurl" (curlform As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_formget Lib "libcurl" (First As Integer, UserData As Integer, Callback As Ptr) As Integer
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

	#tag Method, Flags = &h1
		Protected Function curl_infoname(MessageType As libcURL.curl_infotype) As String
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
		  Case libcURL.curl_infotype.RB_libcURL
		    Return "RB-libcURL"
		  End Select
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_add_handle Lib "libcurl" (MultiHandle As Integer, EasyHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_cleanup Lib "libcurl" (MultiHandle As Integer) As Integer
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
		Private Soft Declare Function curl_multi_strerror Lib "libcurl" (errNo As Integer) As CString
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_multi_timeout Lib "libcurl" (MultiHandle As Integer, ByRef Timeout As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_cleanup Lib "libcurl" (ShareHandle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_setopt Lib "libcurl" (ShareHandle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_share_strerror Lib "libcurl" (errNo As Integer) As CString
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
		Protected Function Default_CA_File() As FolderItem
		  ' For SSL/TLS connections we must specify a file with a list of acceptable certificate authorities to verify the peer with.
		  ' This method dumps the the default CA list for Mozilla products (included as DEFAULT_CA_INFO_PEM) into a temp file and
		  ' returns it. The DEFAULT_CA_INFO_PEM file is subject to the terms of the Mozilla Public License 1.1
		  '
		  ' To generate an updated CA file use one of these two scripts:
		  '    VBScript: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.vbs
		  '        perl: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.pl
		  
		  Static CA_File As FolderItem
		  If CA_File = Nil Then
		    CA_File = GetTemporaryFolderItem()
		    Dim bs As BinaryStream = BinaryStream.Create(CA_File, True)
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
		Attributes( deprecated = "libcURL.cURLClient.Get" ) Protected Function Get(URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' Pass a connection TimeOut interval (in seconds), or 0 to wait forever. Pass an InternetHeaders instance and
		  ' an Integer by reference to contain the response headers (if any) and final result code (if any). Headers and
		  ' StatusCode are mandatory and MUST NOT be Nil. Pass a username or password if a username and/or password will
		  ' be required to complete the transfer. Returns a MemoryBlock containing any downloaded data.
		  
		  Dim out As New MemoryBlock(0)
		  Dim outstream As New BinaryStream(out)
		  Dim c As libcURL.EasyHandle = libcURL.SynchronousHelpers.Get(URL, TimeOut, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  ' Returns True if libcURL is available and at least version 7.15.2. Prior versions require that curl_global_init and
		  ' curl_global_cleanup be called only once each, which we aren't doing.
		  Const MinMajor = 7
		  Const MinMinor = 15
		  Const MinPatch = 2
		  
		  Static available As Boolean
		  If Not available Then available = libcURL.Version.IsAtLeast(MinMajor, MinMinor, MinPatch)
		  Return available
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseCommandLine(cURLCommandLine As String, Client As libcURL.cURLClient) As Boolean
		  ' Parses a curl command line and sets the corresponding options on the passed instance of cURLClient.
		  ' If all arguments were processed successfully this method returns True
		  '
		  ' See:
		  ' http://curl.haxx.se/docs/manpage.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.ParseCommandLine
		  
		  Dim output() As String
		  Dim url As String
		  
		  Dim input As New BinaryStream(cURLCommandLine)
		  Dim tmp As String
		  Dim quote As Boolean
		  Dim frm As libcURL.MultipartForm
		  Do Until input.EOF
		    Dim char As String = input.Read(1)
		    Select Case char
		    Case " "
		      If quote Then
		        tmp = tmp + char
		      Else
		        output.Append(tmp)
		        tmp = ""
		      End If
		      
		    Case """"
		      quote = Not quote
		      
		    Else
		      tmp = tmp + char
		    End Select
		  Loop
		  If tmp.Trim <> "" Then output.Append(tmp)
		  input.Close
		  If Client = Nil Then Client = New cURLClient
		  Client.EasyItem.UserAgent = ""
		  Client.EasyItem.FailOnServerError = False
		  Client.EasyItem.FollowRedirects = False
		  Client.EasyItem.AutoReferer = False
		  Client.EasyItem.HTTPCompression = False
		  
		  For i As Integer = 0 To UBound(output)
		    Dim arg As String = output(i)
		    Select Case True
		    Case StrComp(arg, "-h", 1) = 0 ' help
		      Break
		    Case arg = "--header", StrComp(arg, "-H", 1) = 0 ' set header
		      Dim name, value As String
		      name = NthField(output(i + 1), ": ", 1)
		      value = Right(output(i + 1), output(i + 1).Len - (name.Len + 2))
		      Select Case name
		      Case "Cookie"
		        If Not Client.Cookies.Enabled Then Client.Cookies.Enabled = True
		        If Not Client.Cookies.SetCookie(output(i + 1)) Then
		          Break
		          Return False
		        End If
		        
		      Case "Connection"
		        Client.EasyItem.AutoDisconnect = (value = "close")
		        
		      Case "Referer"
		        Client.EasyItem.AutoReferer = True
		        If Not Client.SetRequestHeader(name, value) Then
		          Break
		          Return False
		        End If
		        
		      Case "User-Agent", "-A"
		        Client.EasyItem.UserAgent = value
		        
		      Else
		        If Not Client.SetRequestHeader(name, value) Then
		          Break
		          Return False
		        End If
		      End Select
		      i = i + 1
		      
		    Case arg = "--compressed"
		      Client.EasyItem.HTTPCompression = True
		      
		    Case arg = "--http1.0", arg = "-0"
		      Client.EasyItem.HTTPVersion = Client.EasyItem.HTTP_VERSION_1_0
		      
		    Case arg = "--http1.1"
		      Client.EasyItem.HTTPVersion = Client.EasyItem.HTTP_VERSION_1_1
		      
		    Case arg = "--http2"
		      Client.EasyItem.HTTPVersion = Client.EasyItem.HTTP_VERSION_2_0
		      
		    Case arg = "--tlsv1", arg = "-1"
		      Client.EasyItem.SSLVersion = libcURL.SSLVersion.TLSv1
		      
		    Case arg = "--sslv2", arg = "-2"
		      Client.EasyItem.SSLVersion = libcURL.SSLVersion.SSLv2
		      
		    Case arg = "--sslv3", arg = "-3"
		      Client.EasyItem.SSLVersion = libcURL.SSLVersion.SSLv3
		      
		    Case arg = "--form", StrComp(arg, "-F", 1) = 0
		      Dim name, value As String
		      name = NthField(output(i + 1), "=", 1)
		      value = Right(output(i + 1), output(i + 1).Len - (name.Len + 1))
		      If Left(value, 1) = "@" Then ' file
		        Dim type As String
		        If NthField(value, ";", 2) <> "" Then
		          type = NthField(value, ";", 2)
		          value = Replace(value, ";" + type, "")
		        End If
		        Dim f As FolderItem = GetFolderItem(Right(value, value.Len - 1))
		        If f <> Nil And f.Exists And Not f.Directory Then
		          If frm = Nil Then frm = New libcURL.MultipartForm
		          If Not frm.AddElement(name, f, type) Then
		            Break
		            Return False
		          End If
		        Else
		          Return False
		        End If
		      Else
		        If frm = Nil Then frm = New libcURL.MultipartForm
		        If Not frm.AddElement(name, value) Then
		          Break
		          Return False
		        End If
		      End If
		      i = i + 1
		      
		    Case arg = "--ipv4", arg = "-4"
		      If Not Client.SetOption(libcURL.Opts.DNS_LOCAL_IP4, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--ipv6", arg = "-6"
		      If Not Client.SetOption(libcURL.Opts.DNS_LOCAL_IP6, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--connect-timeout"
		      Client.EasyItem.ConnectionTimeout = Val(output(i + 1))
		      i = i + 1
		      
		    Case arg = "--cookie", StrComp("-b", arg, 1) = 0
		      If Not Client.Cookies.Enabled Then Client.Cookies.Enabled = True
		      If Not Client.Cookies.SetCookie("Set-Cookie: " + output(i + 1)) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--cookie-jar", StrComp("-c", arg, 1) = 0
		      Client.Cookies.CookieJar = GetFolderItem(output(i + 1))
		      i = i + 1
		      
		    Case arg = "--head", StrComp("-I", arg, 1) = 0
		      If Not Client.SetOption(libcURL.Opts.NOBODY, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--append", StrComp("-a", arg, 1) = 0
		      If Not Client.SetOption(libcURL.Opts.APPEND, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--continue-at", StrComp("-C", arg, 1) = 0
		      If Not Client.SetOption(libcURL.Opts.RESUME_FROM, Val(output(i + 1))) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--referer", StrComp("-e", arg, 1) = 0
		      Client.EasyItem.AutoReferer = True
		      If Not Client.SetRequestHeader("Referer", output(i + 1)) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--noproxy"
		      For Each host As String In Split(output(i + 1), ",")
		        If Not Client.Proxy.ExcludeHost(host) Then
		          Break
		          Return False
		        End If
		      Next
		      i = i + 1
		      
		    Case arg = "--proxy-header"
		      Dim name, value As String
		      name = NthField(output(i + 1), ": ", 1)
		      value = Right(output(i + 1), output(i + 1).Len - (name.Len + 2))
		      If Not Client.Proxy.SetProxyHeader(name, value) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--insecure", StrComp("-k", arg, 1) = 0
		      Client.EasyItem.Secure = False
		      
		    Case arg = "--no-npn"
		      If Not Client.SetOption(libcURL.Opts.SSL_ENABLE_NPN, False) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--no-alpn"
		      If Not Client.SetOption(libcURL.Opts.SSL_ENABLE_ALPN, False) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--ftp-create-dirs"
		      If Not Client.SetOption(libcURL.Opts.FTP_CREATE_MISSING_DIRS, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--fail", StrComp("-f", arg, 1) = 0
		      Client.EasyItem.FailOnServerError = True
		      
		    Case arg = "--include", StrComp("-i", arg, 1) = 0
		      If Not Client.SetOption(libcURL.Opts.HEADER, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--crlf"
		      If Not Client.SetOption(libcURL.Opts.CRLF, True) Then
		        Break
		        Return False
		      End If
		      
		    Case arg = "--crlfile"
		      Dim f As FolderItem = GetFolderItem(output(i + 1))
		      If f = Nil Or Not f.Exists Or f.Directory Then 
		        Break
		        Return False
		      End If
		      If Not Client.EasyItem.SetOption(libcURL.Opts.CRLFILE, f) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--proxytunnel", StrComp("-p", arg, 1) = 0
		      Client.Proxy.HTTPTunnel = True
		      
		    Case arg = "--quote", StrComp("-Q", arg, 1) = 0
		      Dim l As libcURL.ListPtr = Split(output(i + 1), ",")
		      If Not Client.EasyItem.SetOption(libcURL.Opts.QUOTE, l) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--user", StrComp("-u", arg, 1) = 0
		      Client.EasyItem.Username = NthField(output(i + 1), ":", 1)
		      Client.EasyItem.Password = NthField(output(i + 1), ":", 2)
		      i = i + 1
		      
		    Case arg = "--proxy-user", StrComp("-U", arg, 1) = 0
		      Client.Proxy.Username = NthField(output(i + 1), ":", 1)
		      Client.Proxy.Password = NthField(output(i + 1), ":", 2)
		      i = i + 1
		      
		    Case arg = "--upload-file", StrComp("-T", arg, 1) = 0
		      Dim file As String = output(i + 1)
		      If file = "-" Then
		        #If Not TargetHasGUI Then
		          Client.EasyItem.UploadStream = stdin
		        #Else
		          Return False
		        #endif
		      ElseIf file <> "-" Then
		        Dim f As FolderItem = GetFolderItem(file)
		        If f <> Nil And f.Exists And Not f.Directory Then Client.EasyItem.UploadStream = BinaryStream.Open(f) Else Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--request", StrComp("-X", arg, 1) = 0
		      If Not Client.SetHTTPRequestMethod(output(i + 1)) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--proxy", StrComp("-x", arg, 1) = 0
		      Client.Proxy.Address = output(i + 1)
		      i = i + 1
		      
		    Case arg = "--range", StrComp("-r", arg, 1) = 0
		      If Not Client.SetOption(libcURL.Opts.RANGE, output(i + 1)) Then
		        Break
		        Return False
		      End If
		      i = i + 1
		      
		    Case arg = "--location", StrComp("-L", arg, 1) = 0
		      Client.EasyItem.FollowRedirects = True
		      
		    Case arg = "--verbose", StrComp("-v", arg, 1) = 0
		      Client.EasyItem.Verbose = True
		      
		    Case arg = "curl", arg = "curl.exe"
		      Continue
		      
		    Case arg = "--url"
		      url = output(i + 1)
		      i = i + 1
		      
		    Else
		      If url = "" Then
		        url = output(i)
		      Else
		        System.DebugLog("Unknown curl command-line option '" + output(i) + "'")
		        Return False
		      End If
		    End Select
		  Next
		  If frm <> Nil Then Client.EasyItem.SetFormData(frm)
		  If url.Trim <> "" Then Client.EasyItem.URL = url
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDate(DateItem As Date) As String
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
		  
		  dt = dt  + Format(DateItem.Day, "00") + " "
		  
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
		  
		  dt = dt  + Format(DateItem.Year, "0000") + " " + Format(DateItem.Hour, "00") + ":" + Format(DateItem.Minute, "00") + ":" + Format(DateItem.Second, "00") + " GMT"
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
		Attributes( deprecated = "libcURL.cURLClient.Post" ) Protected Function Post(FormData As Dictionary, URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
		  ' Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem. Pass a connection TimeOut interval (in seconds), or 0 to wait forever. Pass an
		  ' InternetHeaders instance and an Integer by reference to contain the response headers (if any) and final result
		  ' code (if any). Headers and StatusCode are mandatory and MUST NOT be Nil. Pass a username or password if a username
		  ' and/or password will be required to complete the transfer. Returns a MemoryBlock containing any downloaded data.
		  
		  Dim out As New MemoryBlock(0)
		  Dim outstream As New BinaryStream(out)
		  Dim c As libcURL.EasyHandle = libcURL.SynchronousHelpers.Post(FormData, URL, TimeOut, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Attributes( deprecated = "libcURL.cURLClient.Put" ) Protected Function Put(File As FolderItem, URL As String, TimeOut As Integer, ByRef Headers As InternetHeaders, ByRef StatusCode As Integer, Username As String = "", Password As String = "") As MemoryBlock
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
		  
		  Dim c As libcURL.EasyHandle = libcURL.SynchronousHelpers.Put(URL, TimeOut, instream, outstream, Headers, Username, Password)
		  StatusCode = c.LastError
		  outstream.Close
		  instream.Close
		  Return out
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLDecode(Data As String, Optional EasyItem As libcURL.EasyHandle) As String
		  ' Returns the decoded Data using percent encoding as defined in rfc2396
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_unescape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.URLDecode
		  
		  If EasyItem = Nil Then EasyItem = New libcURL.EasyHandle
		  If Not libcURL.Version.IsAtLeast(7, 15, 4) Then
		    Errorsetter(EasyItem).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(EasyItem)
		  End If
		  
		  Dim InP As MemoryBlock = Data
		  Dim outlen As Integer
		  Dim p As Ptr = curl_easy_unescape(EasyItem.Handle, InP, InP.Size, outlen)
		  InP = p
		  Dim ret As String = InP.StringValue(0, outlen)
		  curl_free(p)
		  Return ret
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLEncode(Data As String, Optional EasyItem As libcURL.EasyHandle) As String
		  ' Returns the Data encoded using percent encoding as defined in rfc2396
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_escape.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/URLEncode
		  
		  If EasyItem = Nil Then EasyItem = New libcURL.EasyHandle
		  If Not libcURL.Version.IsAtLeast(7, 15, 4) Then
		    Errorsetter(EasyItem).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(EasyItem)
		  End If
		  
		  Dim InP As MemoryBlock = Data
		  Dim p As Ptr = curl_easy_escape(EasyItem.Handle, InP, InP.Size)
		  InP = p
		  Dim ret As String = InP.CString(0)
		  curl_free(p)
		  Return ret
		  
		End Function
	#tag EndMethod


	#tag Note, Name = Copying
		libcURL Copyright (c) 1996 - 2015, Daniel Stenberg, <daniel@haxx.se>.
		RB-libcURL Copyright (c)2014-15 Andrew Lambert, <andrew@boredomsoft.org>.
		 
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

	#tag Constant, Name = CURL_WRITEFUNC_PAUSE, Type = Double, Dynamic = False, Default = \"CURL_READFUNC_PAUSE", Scope = Protected
	#tag EndConstant


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
