#tag Class
Protected Class cURLManager
	#tag Method, Flags = &h1
		Protected Sub CleanUp()
		  ' Call this method before setting any options for the next transfer
		  ' e.g.
		  ' Me.CleanUp()
		  ' Me.SetOption(...)
		  ' Me.SetOption(...)
		  ' Me.Perform
		  
		  mIsTransferComplete = False
		  Me.UploadMode = False
		  If Not Me.SetOption(libcURL.Opts.HTTPGET, True) Then Raise New libcURL.cURLException(mEasyItem)
		  mUpload = Nil
		  Me.SetFormData(Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  mMultiItem = Nil
		  mEasyItem = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mEasyItem = New libcURL.EasyHandle
		  AddHandler mEasyItem.CreateSocket, WeakAddressOf _CreateSocketHandler
		  AddHandler mEasyItem.DataAvailable, WeakAddressOf _DataAvailableHandler
		  AddHandler mEasyItem.DataNeeded, WeakAddressOf _DataNeededHandler
		  AddHandler mEasyItem.DebugMessage, WeakAddressOf _DebugMessageHandler
		  AddHandler mEasyItem.Disconnected, WeakAddressOf _DisconnectedHandler
		  AddHandler mEasyItem.HeaderReceived, WeakAddressOf _HeaderReceivedHandler
		  AddHandler mEasyItem.Progress, WeakAddressOf _ProgressHandler
		  AddHandler mEasyItem.SeekStream, WeakAddressOf _SeekStreamHandler
		  
		  mMultiItem = New libcURL.MultiHandle
		  AddHandler mMultiItem.TransferComplete, WeakAddressOf _TransferCompleteHandler
		  mEasyItem.UserAgent = libcURL.Version.Name
		  mEasyItem.Secure = True
		  mEasyItem.FailOnServerError = True
		  mEasyItem.FollowRedirects = True
		  If libcURL.Version.LibZ.IsAvailable Then
		    If Not mEasyItem.SetOption(libcURL.Opts.ACCEPT_ENCODING, "") Then Raise New cURLException(mEasyItem)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorBuffer() As String
		  Return mEasyItem.ErrorBuffer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDownloadedData() As MemoryBlock
		  ' Returns a MemoryBlock containing all data which was downloaded during the most recent transfer.
		  ' If you passed a Writeable object to any of the transfer methods (get, post, put) then this
		  ' method will return an empty MemoryBlock (not Nil) as the data will have been downloaded into
		  ' the Writeable object directly.
		  
		  If mDownloadMB <> Nil Then Return mDownloadMB
		  Dim data As New MemoryBlock(0)
		  If mDownload = Nil Or Not mDownload IsA BinaryStream Then Return data
		  Dim bs As BinaryStream = BinaryStream(mDownload)
		  bs.Position = 0
		  Dim out As New BinaryStream(data)
		  While Not bs.EOF
		    out.Write(bs.Read(1024))
		  Wend
		  out.Close
		  bs.Position = bs.Length
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetInfo(InfoType As Integer) As Variant
		  If mEasyItem <> Nil Then Return mEasyItem.GetInfo(InfoType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResponseHeaders() As InternetHeaders
		  ' Returns an InternetHeaders object containing all protocol headers received from the server
		  ' during the most recent transfer. If no headers were received, returns Nil.
		  
		  Return mHeaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStatusCode() As Integer
		  ' Returns a protocol-specific status code for the most recent transfer. If the transfer
		  ' involved several status codes (FTP anything, HTTP redirects, etc.) then only the most
		  ' recent code is returned.
		  Return Me.GetInfo(libcURL.Info.RESPONSE_CODE).Int32Value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsTransferComplete() As Boolean
		  Return mIsTransferComplete
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mEasyItem.LastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable)
		  ' Perform the transfer on the main thread/event loop.
		  
		  QueueTransfer(URL, ReadFrom, WriteTo)
		  mMultiItem.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable) As Boolean
		  ' Perform the transfer on the calling thread.
		  
		  QueueTransfer(URL, ReadFrom, WriteTo)
		  While mMultiItem.PerformOnce()
		    App.YieldToNextThread
		  Wend
		  Return mEasyItem.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub QueueTransfer(URL As String, ReadFrom As Readable, WriteTo As Writeable)
		  mEasyItem.URL = URL
		  mHeaders = Nil
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mUpload = ReadFrom
		  If mRequestHeaders <> Nil Then
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, mRequestHeaders) Then Raise New libcURL.cURLException(mEasyItem)
		  End If
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetForm(FormData As libcURL.MultipartForm)
		  If FormData = Nil Then
		    If mForm <> Nil Then
		      If Not Me.SetOption(libcURL.Opts.HTTPPOST, Nil) Then Raise New libcURL.cURLException(mEasyItem)
		      mForm = Nil
		    End If
		  Else
		    If Not Me.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(mEasyItem)
		    mForm = New libcURL.MultipartForm
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFormData(FormData As Dictionary)
		  If FormData = Nil Then
		    Me.SetForm(Nil)
		    
		  Else
		    Dim data() As String
		    For Each key As String in FormData.Keys
		      data.Append(URLEncode(Key) + "=" + URLEncode(FormData.Value(key)))
		    Next
		    If Not mEasyItem.SetOption(libcURL.Opts.COPYPOSTFIELDS, Join(data, "&")) Then Raise New libcURL.cURLException(mEasyItem)
		    
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  If mEasyItem <> Nil Then Return mEasyItem.SetOption(OptionNumber, NewValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRequestHeaders(Headers As InternetHeaders)
		  If Headers <> Nil Then
		    If mRequestHeaders = Nil Then mRequestHeaders = New libcURL.ListPtr
		    For i As Integer = 0 To Headers.Count - 1
		      Call mRequestHeaders.Append(Headers.Name(i) + ": " + Headers.Value(Headers.Name(i)))
		    Next
		  Else
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, Nil) Then Raise New libcURL.cURLException(mEasyItem)
		    mRequestHeaders = Nil
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _CreateSocketHandler(Sender As libcURL.EasyHandle, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _DataAvailableHandler(Sender As libcURL.EasyHandle, NewData As String) As Integer
		  #pragma Unused Sender
		  If mDownload = Nil Then
		    mDownloadMB = New MemoryBlock(0)
		    mDownload = New BinaryStream(mDownloadMB)
		  End If
		  mDownload.Write(NewData)
		  Return NewData.LenB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _DataNeededHandler(Sender As libcURL.EasyHandle, Buffer As MemoryBlock) As Integer
		  #pragma Unused Sender
		  If mUpload = Nil Then
		    Return libcURL.CURL_READFUNC_ABORT
		  End If
		  Dim data As MemoryBlock = mUpload.Read(Buffer.Size)
		  Buffer.StringValue(0, data.Size) = data
		  Return data.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _DebugMessageHandler(Sender As libcURL.EasyHandle, MessageType As libcURL.curl_infotype, data As String)
		  #pragma Unused Sender
		  RaiseEvent DebugMessage(MessageType, data)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _DisconnectedHandler(Sender As libcURL.EasyHandle, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _HeaderReceivedHandler(Sender As libcURL.EasyHandle, HeaderLine As String)
		  #pragma Unused Sender
		  If mHeaders = Nil Then mHeaders = New InternetHeaders
		  mHeaders.AppendHeader(NthField(HeaderLine, ": ", 1), NthField(HeaderLine, ": ", 2))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _ProgressHandler(Sender As libcURL.EasyHandle, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  #pragma Unused Sender
		  'If ulnow > 0 or ultotal > 0 Then Break
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _SeekStreamHandler(Sender As libcURL.EasyHandle, Offset As Integer, Origin As Integer) As Boolean
		  #pragma Unused Sender
		  #pragma Unused Origin
		  If mUpload <> Nil And mUpload IsA BinaryStream Then
		    Dim bs As BinaryStream = BinaryStream(mUpload)
		    If bs.Length <= Offset And Offset > 0 Then
		      bs.Position = Offset
		      Return bs.Position = Offset
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _TransferCompleteHandler(Sender As libcURL.MultiHandle, Item As libcURL.EasyHandle)
		  #pragma Unused Sender
		  
		  If mDownload <> Nil And mDownload IsA BinaryStream And mDownloadMB <> Nil Then BinaryStream(mDownload).Close
		  Dim status As Integer = Item.LastError
		  If status <> 0 Then
		    RaiseEvent Error(status)
		  Else
		    RaiseEvent TransferComplete(Me.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value, Me.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value)
		  End If
		  mIsTransferComplete = True
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DebugMessage(MessageType As libcURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(cURLCode As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TransferComplete(BytesRead As Integer, BytesWritten As Integer)
	#tag EndHook


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
			  return mEasyItem.CA_ListFile
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEasyItem.CA_ListFile = value
			End Set
		#tag EndSetter
		CA_ListFile As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEasyItem.CookieJar
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEasyItem.CookieJar = value
			End Set
		#tag EndSetter
		CookieJar As FolderItem
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDownload As Writeable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadMB As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEasyItem As libcURL.EasyHandle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mForm As libcURL.MultipartForm
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsTransferComplete As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMultiItem As libcURL.MultiHandle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequestHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpload As Readable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUploadMode As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			SocketCore.NetworkInterface workalike.
			See: http://docs.realsoftware.com/index.php/SocketCore.NetworkInterface
			
			For example:
			
			Dim curl As New libcURL.EasyHandle
			curl.NetworkInterface = System.GetNetworkInterface(0)
			MsgBox(curl.NetworkInterface.IPAddress))
		#tag EndNote
		#tag Getter
			Get
			  Return mEasyItem.NetworkInterface
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEasyItem.NetworkInterface = value
			End Set
		#tag EndSetter
		NetworkInterface As NetworkInterface
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The password to be supplied to the remote host if the underlying protocol requires/allows users to log on.
		#tag EndNote
		#tag Getter
			Get
			  Return mEasyItem.Password
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEasyItem.Password = value
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
			  Return mEasyItem.Port
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //remote port.
			  mEasyItem.Port = value
			End Set
		#tag EndSetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Prior to connecting this value will be empty. Once connected, this value will contain the
			  ' IP address of the remote server.
			  
			  Return mEasyItem.RemoteIP
			End Get
		#tag EndGetter
		RemoteIP As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUploadMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetOption(libcURL.Opts.UPLOAD, value) Then Raise New libcURL.cURLException(mEasyItem)
			  mUploadMode = value
			End Set
		#tag EndSetter
		UploadMode As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mEasyItem.UseErrorBuffer
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEasyItem.UseErrorBuffer = value
			End Set
		#tag EndSetter
		UseErrorBuffer As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			The username to be supplied to the remote host if the underlying protocol requires/allows users to log on.
		#tag EndNote
		#tag Getter
			Get
			  Return mEasyItem.Username
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  //If the server will require a username, set it here. If the server doesn't require one, this property is ignored
			  mEasyItem.Username = value
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty


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
			Name="UploadMode"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseErrorBuffer"
			Group="Behavior"
			Type="Boolean"
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
