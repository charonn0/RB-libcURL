#tag Class
Class cURLItem
	#tag Method, Flags = &h0
		Sub Close()
		  ' cleans up the instance.
		  ' called automatically by the class destructor.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_cleanup.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Close
		  
		  If Not libcURL.IsAvailable Then Return
		  If mHandle <> 0 Then
		    curl_easy_cleanup(mHandle)
		    Instances.Remove(mHandle)
		  End If
		  mHandle = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CloseCallback(UserData As Integer, Socket As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  #pragma Unused Socket ' socket is an OS socket reference
		  If Instances = Nil Then Return 0
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl = Nil Then
		    Break ' UserData does not refer to a valid instance!
		    Return 1
		  End If
		  cURLItem(curl.Value).curlClose
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Initializes libcURL if necessary and creates a new curl_easy handle
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_global_init.html
		  ' http://curl.haxx.se/libcurl/c/curl_easy_init.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Constructor
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(mLastError)
		  
		  If Instances = Nil Then
		    mLastError = curl_global_init(CURL_GLOBAL_DEFAULT)
		    If mLastError = 0 Then
		      Instances = New Dictionary
		    Else
		      Raise New cURLException(mLastError)
		    End If
		  End If
		  
		  mHandle = curl_easy_init()
		  If mHandle > 0 Then
		    Instances.Value(mHandle) = New WeakRef(Me)
		    InitCallbacks(Me)
		  Else
		    Raise New cURLException(libcURL.Errors.INIT_FAILED)
		  End If
		  
		  ' by default, only raise the DebugMessage event if we're debugging
		  #If DebugBuild Then
		    Me.Verbose = True
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(CopyOpts As libcURL.cURLItem)
		  ' Creates a new curl_easy handle by cloning the passed handle. The clone is independent of the original.
		  ' This method does not initialize libcURL as it is assumed to have been initialized in CopyOpts.Constructor()
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_duphandle.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Constructor
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(mLastError)
		  If CopyOpts <> Nil And CopyOpts.Handle > 0 Then
		    mHandle = curl_easy_duphandle(CopyOpts.Handle)
		    If mHandle > 0 Then
		      Instances.Value(mHandle) = New WeakRef(Me)
		      InitCallbacks(Me)
		    Else
		      Raise New cURLException(mLastError) ' Note that this is not the actual error number (there is none for this function)
		    End If
		  Else
		    Raise New NilObjectException
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub curlClose()
		  ' This method is the intermediary between CloseCallback and the Disconnected event.
		  ' DO NOT CALL THIS METHOD
		  RaiseEvent Disconnected()
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLCloseCallback(UserData As Integer, cURLSocket As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlDebug(info As curl_infotype, data As Ptr, Size As Integer) As Integer
		  ' This method is the intermediary between DebugCallback and the DebugMessage event.
		  ' DO NOT CALL THIS METHOD
		  Dim mb As MemoryBlock = data
		  Dim s As String = mb.StringValue(0, size)
		  RaiseEvent DebugMessage(info, s)
		  Return size
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLDebugCallback(Handle As Integer, info As curl_infotype, data As Ptr, size As Integer, UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlHeader(char As Ptr, size As Integer, nmemb As Integer) As Integer
		  ' This method is the intermediary between HeaderCallback and the HeaderReceived event.
		  ' DO NOT CALL THIS METHOD
		  
		  Dim sz As Integer = nmemb * size
		  Dim data As MemoryBlock = char
		  Dim s As String = data.StringValue(0, sz)
		  RaiseEvent HeaderReceived(s)
		  Return sz
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function curlOpen(SocketType As Integer, Socket As Ptr) As Ptr
		  ' This method is the intermediary between OpenCallback and the CreateSocket event.
		  ' DO NOT CALL THIS METHOD
		  
		  #pragma Warning "Fix Me"
		  ' This method is called whenever libcURL needs to create a new socket and gives
		  ' us an opportunity to tinker with the raw socketry. However, we must return a
		  ' valid OS-level socket descriptor otherwise nothing works. So, OpenCallback is
		  ' not initialized at this time, this method is not executed and the CreateSocket
		  ' event is not raised.
		  
		  Dim p As Ptr = RaiseEvent CreateSocket(SocketType, Socket)
		  Return p
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLOpenCallback(UserData As Integer, SocketType As Integer, Socket As Ptr) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlProgress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  ' This method is the intermediary between ProgressCallback and the Progress event.
		  ' DO NOT CALL THIS METHOD
		  
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLProgressCallback(UserData As Integer, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlRead(char As Ptr, size As Integer, nmemb As Integer) As Integer
		  ' This method is the intermediary between ReadCallback and the DataNeeded event.
		  ' DO NOT CALL THIS METHOD
		  
		  Dim sz As Integer = nmemb * size
		  Dim data As String = RaiseEvent DataNeeded(sz)
		  If data.LenB <= sz Then
		    Dim mb As MemoryBlock = char
		    mb.StringValue(0, sz) = LeftB(data, sz)
		    Return data.LenB
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function curlSSLInit(SSLCTX As Ptr) As Integer
		  ' This method is the intermediary between InitSSLCallback and the SSLInit event.
		  ' DO NOT CALL THIS METHOD
		  
		  Return RaiseEvent SSLInit(SSLCTX)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLSSLInitCallback(Handle As Integer, SSLCTXStruct As Ptr, UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlWrite(char As Ptr, size As Integer, nmemb As Integer) As Integer
		  ' This method is the intermediary between WriteCallback and the DataAvailable event.
		  ' DO NOT CALL THIS METHOD
		  
		  Dim mb As MemoryBlock = char
		  Dim s As String = mb.StringValue(0, nmemb * size)
		  RaiseEvent DataAvailable(s)
		  Return nmemb * size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DebugCallback(Handle As Integer, info As curl_infotype, data As Ptr, size As Integer, UserData As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  #pragma Unused Handle ' handle is the cURL handle of the instance
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLItem(curl.Value).curlDebug(info, data, size)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  ' Closes the instance and, if no more instances, cleans up libcURL
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_global_cleanup.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Destructor
		  
		  Me.Close()
		  If Instances = Nil Or Instances.Count = 0 Then
		    If libcURL.IsAvailable Then curl_global_cleanup()
		    Instances = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfo(InfoType As Integer) As Variant
		  ' Calls curl_easy_getinfo. Returns a Variant suitable to contain the InfoType requested. If the InfoType is not
		  ' among the values marshalled below, a TypeMismatchException will be raised.
		  ' This method returns various data about the most recently completed connection (successful or not.)
		  ' As such, it is not useful to call this method before the first connection attempt.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_getinfo.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.GetInfo
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(0)
		  Dim mb As MemoryBlock
		  
		  Select Case InfoType
		  Case libcURL.Info.EFFECTIVE_URL, libcURL.Info.REDIRECT_URL, libcURL.Info.CONTENT_TYPE, libcURL.Info.PRIVATE_, libcURL.Info.PRIMARY_IP, _
		    libcURL.Info.LOCAL_IP, libcURL.Info.FTP_ENTRY_PATH, libcURL.Info.RTSP_SESSION_ID
		    mb = New MemoryBlock(4)
		    mLastError = curl_easy_getinfo(mHandle, InfoType, mb)
		    If mLastError = 0 Then
		      mb = mb.Ptr(0)
		      If mb <> Nil Then Return mb.CString(0)
		    End If
		    
		  Case libcURL.Info.RESPONSE_CODE, libcURL.Info.HTTP_CONNECTCODE, libcURL.Info.FILETIME, libcURL.Info.REDIRECT_COUNT, libcURL.Info.HEADER_SIZE, _
		    libcURL.Info.REQUEST_SIZE, libcURL.Info.SSL_VERIFYRESULT, libcURL.Info.HTTPAUTH_AVAIL, libcURL.Info.OS_ERRNO, libcURL.Info.NUM_CONNECTS, _
		    libcURL.Info.PRIMARY_PORT, libcURL.Info.LOCAL_PORT, libcURL.Info.LASTSOCKET, libcURL.Info.CONDITION_UNMET, libcURL.Info.RTSP_CLIENT_CSEQ, _
		    libcURL.Info.RTSP_SERVER_CSEQ, libcURL.Info.RTSP_CSEQ_RECV
		    mb = New MemoryBlock(4)
		    mLastError = curl_easy_getinfo(mHandle, InfoType, mb)
		    If mLastError = 0 Then Return mb.Int32Value(0)
		    
		  Case libcURL.Info.TOTAL_TIME, libcURL.Info.NAMELOOKUP_TIME, libcURL.Info.CONNECT_TIME, libcURL.Info.APPCONNECT_TIME, libcURL.Info.PRETRANSFER_TIME, _
		    libcURL.Info.STARTTRANSFER_TIME, libcURL.Info.REDIRECT_TIME, libcURL.Info.SIZE_DOWNLOAD, libcURL.Info.SIZE_UPLOAD, libcURL.Info.SPEED_DOWNLOAD, _
		    libcURL.Info.SPEED_UPLOAD, libcURL.Info.CONTENT_LENGTH_UPLOAD, libcURL.Info.CONTENT_LENGTH_DOWNLOAD
		    mb = New MemoryBlock(8)
		    mLastError = curl_easy_getinfo(mHandle, InfoType, mb)
		    If mLastError = 0 Then Return mb.DoubleValue(0)
		    
		  Case libcURL.Info.SSL_ENGINES, libcURL.Info.COOKIELIST
		    Dim lst As New libcURL.curl_slist
		    mb = lst.Handle
		    mLastError = curl_easy_getinfo(mHandle, InfoType, mb)
		    If mLastError = 0 Then Return lst
		    
		  Else
		    Dim err As New TypeMismatchException
		    err.Message = "0x" + Left(Hex(InfoType) + "00000000", 8) + " is not a known InfoType."
		    err.ErrorNumber = InfoType
		    Raise err
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  ' The curl_easy handle.
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function HeaderCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLItem(curl.Value).curlHeader(char, size, nmemb)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Sub InitCallbacks(Sender As libcURL.cURLItem)
		  ' This method sets up the callback functions for the passed instance of cURLItem
		  
		  //If Not Sender.SetOption(libcURL.Opts.OPENSOCKETDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  //If Not Sender.SetOption(libcURL.Opts.OPENSOCKETFUNCTION, AddressOf OpenCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If libcURL.Version.SSL Then
		    If Not Sender.SetOption(libcURL.Opts.SSL_CTX_DATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		    If Not Sender.SetOption(libcURL.Opts.SSL_CTX_FUNCTION, AddressOf SSLInitCallback) Then Raise New cURLException(Sender.LastError)
		  End If
		  
		  If Not Sender.SetOption(libcURL.Opts.CLOSESOCKETDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.CLOSESOCKETFUNCTION, AddressOf CloseCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If Not Sender.SetOption(libcURL.Opts.WRITEDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.WRITEFUNCTION, AddressOf WriteCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If Not Sender.SetOption(libcURL.Opts.READDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.READFUNCTION, AddressOf ReadCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If Not Sender.SetOption(libcURL.Opts.NOPROGRESS, False) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.PROGRESSDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.PROGRESSFUNCTION, AddressOf ProgressCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If Not Sender.SetOption(libcURL.Opts.HEADERDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.HEADERFUNCTION, AddressOf HeaderCallback) Then Raise New cURLException(Sender.LastError)
		  
		  If Not Sender.SetOption(libcURL.Opts.DEBUGDATA, Sender.Handle) Then Raise New cURLException(Sender.LastError)
		  If Not Sender.SetOption(libcURL.Opts.DEBUGFUNCTION, AddressOf DebugCallback) Then Raise New cURLException(Sender.LastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  ' All calls into libcURL that return an error code will update LastError
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.Errors
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatError
		  
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function OpenCallback(UserData As Integer, SocketType As Integer, Socket As Ptr) As Ptr
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl = Nil Then Return Nil
		  Return cURLItem(curl.Value).curlOpen(SocketType, Socket)
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pause(PauseUpload As Boolean = True, PauseDownload As Boolean = True) As Boolean
		  ' Pauses or unpauses uploads and/or downloads
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_pause.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Pause
		  
		  If Not libcURL.IsAvailable Then Return False
		  
		  Dim pU, pD As Integer
		  pU = ShiftLeft(1, 2)
		  pD = ShiftLeft(0, 1)
		  
		  Dim mask As Integer
		  If PauseUpload And PauseDownload Then
		    mask = pU Or pD
		  ElseIf PauseUpload Xor PauseDownload Then
		    If PauseUpload Then
		      mask = pU
		    Else
		      mask = pD
		    End If
		  End If
		  
		  mLastError = curl_easy_pause(mHandle, mask)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Perform(URL As String = "", Timeout As Integer = 0) As Boolean
		  ' Tells libcURL to perform the transer. Pass a URL if you have not specified one already using cURLItem.URL.
		  ' Pass an integer representing how long libcURL should wait, in seconds, before giving up the connection
		  ' attempt. The default is to wait forever.
		  '
		  ' This method is a blocking function: it will not return (and your application will stop responding) until the
		  ' transfer completes. For non-blocking transfers use the cURLMulti class to manage the cURLItem.
		  '
		  ' If this method returns true the transfer completed without error. Otherwise, check cURLItem.LastError for the
		  ' error code.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_perform.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Perform
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(mLastError)
		  If URL <> "" Then
		    If Not SetOption(libcURL.Opts.URL, URL) Then Raise New cURLException(mLastError)
		  End If
		  If Timeout > 0 Then
		    If Not SetOption(libcURL.Opts.TIMEOUT, Timeout) Then Raise New cURLException(mLastError)
		  End If
		  mLastError = curl_easy_perform(mHandle)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ProgressCallback(UserData As Integer, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLItem(curl.Value).curlProgress(dlTotal, dlnow, ultotal, ulnow)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  ' Only available after calling SetOption(libcURL.Opts.CONNECT_ONLY, True)
		  ' Once Perform returns you may Read from the easy_handle by calling this method
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_recv.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Read
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(mLastError)
		  
		  Dim mb As New MemoryBlock(Count)
		  Dim i As Integer
		  mLastError = curl_easy_recv(mHandle, mb, mb.Size, i)
		  If mLastError = 0 Then
		    Dim s As String
		    If encoding <> Nil Then
		      s = DefineEncoding(mb.StringValue(0, i), encoding)
		    Else
		      s = mb.StringValue(0, i)
		    End If
		    Return s
		  Else
		    Dim err As New IOException
		    err.ErrorNumber = mLastError
		    err.Message = libcURL.FormatError(mLastError)
		    Raise err
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ReadCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  // called when data is needed
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLItem(curl.Value).curlRead(char, size, nmemb)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  ' Resets the curl_easy handle to a pristine state. You may reuse the handle immediately.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_reset.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Reset
		  
		  If Not libcURL.IsAvailable Then Return
		  curl_easy_reset(mHandle)
		  mLastError = 0
		  InitCallbacks(Me)
		  Me.Verbose = mVerbose
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  ' SetOption is the primary interface to the easy_handle. Call this method with a curl option number
		  ' and a value that is acceptable for that option. SetOption does not check that a value is valid for
		  ' a particular option (except Nil,) however it does enforce type safety of the value and will raise
		  ' an exception if an unsupported type is passed.
		  
		  ' NewValue may be a Boolean, Integer, Ptr, String, MemoryBlock, FolderItem, libcURL.Form, libcURL.Headers,
		  ' or a Delegate matching cURLCallback, cURLCloseCallback, cURLDebugCallback, cURLOpenCallback, cURLProgressCallback,
		  ' or cURLSSLInitCallback. Passing a Nil object will raise an exception unless the option explicitly accepts NULL.
		  
		  ' If the option was set this method returns True. If it returns False the option was not set and the
		  ' curl error number is stored in cURLItem.LastError.
		  
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_setopt.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.SetOption
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.Opts
		  
		  If Not libcURL.IsAvailable Then Return False
		  
		  Dim MarshalledValue As Ptr
		  Dim mb As MemoryBlock
		  Dim ValueType As Integer = VarType(NewValue)
		  Select Case ValueType
		  Case Variant.TypeNil
		    ' Sometimes Nil is an error; sometimes not
		    Select Case OptionNumber
		    Case libcURL.Opts.POSTFIELDS, libcURL.Opts.HTTPHEADER, libcURL.Opts.PROXYHEADER, libcURL.Opts.FTPPORT, libcURL.Opts.QUOTE, _
		      libcURL.Opts.POSTQUOTE, libcURL.Opts.PREQUOTE, libcURL.Opts.FTP_ACCOUNT, libcURL.Opts.RTSP_SESSION_ID, libcURL.Opts.RANGE, _
		      libcURL.Opts.CUSTOMREQUEST, libcURL.Opts.DNS_INTERFACE, libcURL.Opts.DNS_LOCAL_IP4, libcURL.Opts.DNS_LOCAL_IP6, libcURL.Opts.KRBLEVEL, _
		      libcURL.Opts.CLOSESOCKETFUNCTION, libcURL.Opts.DEBUGFUNCTION, libcURL.Opts.HEADERFUNCTION, libcURL.Opts.OPENSOCKETFUNCTION, _
		      libcURL.Opts.PROGRESSFUNCTION, libcURL.Opts.READFUNCTION, libcURL.Opts.SSL_CTX_FUNCTION, libcURL.Opts.WRITEFUNCTION
		      ' These option numbers explicitly accept NULL. Refer to the curl documentation on the individual option numbers for details.
		      MarshalledValue = Nil
		    Else
		      ' for all other option numbers reject NULL values.
		      Raise New NilObjectException
		    End Select
		    
		  Case Variant.TypeBoolean
		    mb = New MemoryBlock(1)
		    mb.BooleanValue(0) = NewValue.BooleanValue
		    MarshalledValue = mb
		    
		  Case Variant.TypePtr, Variant.TypeInteger
		    MarshalledValue = NewValue.PtrValue
		    
		  Case Variant.TypeString
		    ' COPY the string to a new buffer so there's no weirdness if libcURL releases the memory.
		    mb = NewValue.CStringValue + Chr(0)
		    MarshalledValue = mb
		    
		  Case Variant.TypeObject
		    ' To add support for a custom object type, add a block to this Select statement that stores the object in MarshalledValue
		    Select Case NewValue
		    Case IsA MemoryBlock
		      MarshalledValue = NewValue.PtrValue
		      
		    Case IsA FolderItem
		      mb = FolderItem(NewValue).AbsolutePath + Chr(0)
		      MarshalledValue = mb
		      
		    Case IsA libcURL.Form
		      Dim f As libcURL.Form = NewValue
		      MarshalledValue = f.Handle
		      
		    Case IsA libcURL.curl_slist
		      Dim f As libcURL.curl_slist = NewValue
		      MarshalledValue = f.Handle
		      
		    Case IsA cURLProgressCallback
		      Dim p As cURLProgressCallback = NewValue
		      MarshalledValue = p
		      
		    Case IsA cURLCallback
		      Dim p As cURLCallback = NewValue
		      MarshalledValue = p
		      
		    Case IsA cURLDebugCallback
		      Dim p As cURLDebugCallback = NewValue
		      MarshalledValue = p
		      
		    Case IsA cURLCloseCallback
		      Dim p As cURLCloseCallback = NewValue
		      MarshalledValue = p
		      
		    Case IsA cURLOpenCallback
		      Dim p As cURLOpenCallback = NewValue
		      MarshalledValue = p
		      
		    Case IsA cURLSSLInitCallback
		      Dim p As cURLSSLInitCallback = NewValue
		      MarshalledValue = p
		      
		    Else
		      Dim err As New TypeMismatchException
		      err.Message = "NewValue is of unsupported type: " + Introspection.GetType(NewValue).Name
		      Raise err
		      
		    End Select
		    
		  Else
		    Dim err As New TypeMismatchException
		    err.Message = "NewValue is of unsupported vartype: " + Str(ValueType)
		    Raise err
		    
		  End Select
		  
		  mLastError = curl_easy_setopt(mHandle, OptionNumber, MarshalledValue)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SSLInitCallback(Handle As Integer, SSLCTXStruct As Ptr, UserData As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  #pragma Unused Handle ' Handle is the handle to the instance
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  Dim data As SSL_CTX
		  Dim mb As MemoryBlock = SSLCTXStruct
		  data.StringValue(TargetLittleEndian) = mb.StringValue(0, SSL_CTX.Size)
		  If curl = Nil Then
		    Break ' UserData does not refer to a valid instance!
		    Return 1
		  End If
		  Return cURLItem(curl.Value).curlSSLInit(SSLCTXStruct)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Verbose() As Boolean
		  Return mVerbose
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Verbose(Assigns Verbosity As Boolean)
		  ' Pass True to receive the DebugMessage event. The default is False
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTVERBOSE
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Verbose
		  
		  If Not Me.SetOption(libcURL.Opts.VERBOSE, Verbosity) Then Raise New cURLException(mLastError)
		  mVerbose = Verbosity
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Write(Text As String) As Integer
		  ' Only available after calling SetOption(CURLOPT_CONNECT_ONLY, True)
		  ' Once Perform returns you may Write to the easy_handle by calling this method
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_easy_send.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Write
		  
		  If Not libcURL.IsAvailable Then Raise New cURLException(mLastError)
		  
		  Dim byteswritten As Integer
		  Dim mb As MemoryBlock = Text
		  mLastError = curl_easy_send(mHandle, mb, mb.Size, byteswritten)
		  If mLastError = 0 Then
		    Return byteswritten
		  Else
		    Dim err As New IOException
		    err.ErrorNumber = mLastError
		    err.Message = libcURL.FormatError(mLastError)
		    Raise err
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function WriteCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  ' This method is invoked by libcURL. DO NOT CALL THIS METHOD
		  
		  // Called when data is available
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLItem(curl.Value).curlWrite(char, size, nmemb)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event CreateSocket(SocketType As Integer, Address As Ptr) As Ptr
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataAvailable(NewData As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataNeeded(MaximumLen As Integer) As String
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DebugMessage(MessageType As libcURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Disconnected()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HeaderReceived(HeaderLine As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SSLInit(SSLCTX As Ptr) As Integer
	#tag EndHook


	#tag Note, Name = Using this class
		This class provides basic access to the curl_easy API.
		
		Create a new instance, then use the SetOption method to define what cURL will be doing.
		
		For example, setting the user-agent string:
		
		   Dim mcURL As New libcURL.cURLItem
		   If Not mcURL.SetOption(libcURL.Opts.USERAGENT, "Bob's download manager/5.1") Then
		      MsgBox("cURL error: " + Str(mcURL.LastError))
		   End If
		
		SetOption accepts a Variant as the option value, but only Integers, Strings, and Booleans should be
		used. SetOption will also accept the cURL delegates as new values but that is intended for internal use
		only. Setting an option value to an unsupported type will raise a TypeMismatchException.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Note
			Sets the PEM file containing one or more certificate authorities libcURL should trust to verify the peer with.
			The included DEFAULT_CA_INFO_PEM file contains the default CA list for Mozilla products.
			
			To generate an updated Mozilla CA file use one of these two scripts
			
			VBScript: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.vbs
			Perl: https://github.com/bagder/curl/blob/master/lib/mk-ca-bundle.pl
		#tag EndNote
		#tag Getter
			Get
			  return mCA_ListFile
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCA_ListFile = value
			  If Not Me.SetOption(libcURL.Opts.CAINFO, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		CA_ListFile As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private Shared Instances As Dictionary
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  //The local port used to make the connection. This is decided upon by libcurl and the OS's network stack
			  
			  Return Me.GetInfo(libcURL.Info.LOCAL_PORT)
			  'Dim mb As New MemoryBlock(4)
			  'Me.GetInfo(libcURL.Info.LOCAL_PORT, mb)
			  'If mLastError = 0 Then
			  'Return mb.Int32Value(0)
			  'End If
			End Get
		#tag EndGetter
		LocalPort As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCA_ListFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVerbose As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			SocketCore.NetworkInterface workalike.
			See: http://docs.realsoftware.com/index.php/SocketCore.NetworkInterface
			
			For example:
			
			Dim curl As New cURLItem
			curl.NetworkInterface = System.GetNetworkInterface(0)
			MsgBox(curl.NetworkInterface.IPAddress))
		#tag EndNote
		#tag Getter
			Get
			  Dim ip As String = Me.GetInfo(libcURL.Info.LOCAL_IP)
			  If mLastError <> 0 Then Return Nil
			  For i As Integer = 0 To System.NetworkInterfaceCount - 1
			    Dim iface As NetworkInterface = System.GetNetworkInterface(i)
			    If iface.IPAddress = ip Then
			      Return iface
			    End If
			  Next
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetOption(libcURL.Opts.NETINTERFACE, value.IPAddress) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		NetworkInterface As NetworkInterface
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The password to be supplied to the remote host if the underlying protocol requires/allows users to log on.
		#tag EndNote
		#tag Setter
			Set
			  //If the server will require a password, set it here. If the server doesn't require one, this property is ignored
			  If Not Me.SetOption(libcURL.Opts.PASSWORD, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		Password As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			SocketCore.Port workalike.
			See: See: http://docs.realsoftware.com/index.php/SocketCore.Port
			
			Prior to connecting, you may set this value to the remote port to connect to. If the port is not specified
			libcURL will select the default port for the inferred protocol (e.g. HTTP=80; HTTPS=443)
			
			Once connected, you may get this value to read the actual remote port number that is connected to.
		#tag EndNote
		#tag Getter
			Get
			  //Remote port
			  Return Me.GetInfo(libcURL.Info.PRIMARY_PORT)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //remote port.
			  If Not Me.SetOption(libcURL.Opts.PORT, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Prior to connecting this value will be empty. Once connected, this value will contain the
			  ' IP address of the remote server.
			  
			  Return Me.GetInfo(libcURL.Info.PRIMARY_IP)
			End Get
		#tag EndGetter
		RemoteIP As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns the last effective URL, if any
			  
			  Return Me.GetInfo(libcURL.Info.EFFECTIVE_URL)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the URL for the next request.
			  ' See: http://curl.haxx.se/libcurl/c/curl_easy_setopt.html#CURLOPTURL
			  
			  If Not SetOption(libcURL.Opts.URL, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		URL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  //Set your application's UserAgent string for protocols that support/require such. The default will be the output of cURLversion()
			  
			  If Not Me.SetOption(libcURL.Opts.USERAGENT, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		UserAgent As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The username to be supplied to the remote host if the underlying protocol requires/allows users to log on.
		#tag EndNote
		#tag Setter
			Set
			  //If the server will require a username, set it here. If the server doesn't require one, this property is ignored
			  If Not Me.SetOption(libcURL.Opts.USERNAME, value) Then Raise New cURLException(mLastError)
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty


	#tag Constant, Name = GNUTLS_MAX_ALGORITHM_NUM, Type = Double, Dynamic = False, Default = \"16", Scope = Private
	#tag EndConstant


	#tag Structure, Name = SSL_CTX, Flags = &h21
		Method As SSL_METHOD
		  certfile As Ptr
		  certfile_type As Integer
		  keyfile As Ptr
		  keyfile_type As Integer
		  options As UInt32
		  verifycallbackORX509_STORE_CTX As Ptr
		verify_mode As Integer
	#tag EndStructure

	#tag Structure, Name = SSL_METHOD, Flags = &h21
		protocol_priority As Integer
		  cipher_priority As Integer
		  comp_priority As Integer
		  kx_priority As Integer
		  mac_priority As Integer
		connend As UInt32
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="LocalPort"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteIP"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
