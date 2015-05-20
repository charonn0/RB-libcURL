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
		  Me.UploadMode = False
		  If Not Me.SetOption(libcURL.Opts.HTTPGET, True) Then Raise New libcURL.cURLException(mEasyItem)
		  mUpload = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mEasyItem = New libcURL.cURLItem
		  AddHandler mEasyItem.CreateSocket, WeakAddressOf CreateSocketHandler
		  AddHandler mEasyItem.DataAvailable, WeakAddressOf DataAvailableHandler
		  AddHandler mEasyItem.DataNeeded, WeakAddressOf DataNeededHandler
		  AddHandler mEasyItem.DebugMessage, WeakAddressOf DebugMessageHandler
		  AddHandler mEasyItem.Disconnected, WeakAddressOf DisconnectedHandler
		  AddHandler mEasyItem.HeaderReceived, WeakAddressOf HeaderReceivedHandler
		  AddHandler mEasyItem.Progress, WeakAddressOf ProgressHandler
		  
		  mMultiItem = New libcURL.cURLMulti
		  AddHandler mMultiItem.TransferComplete, WeakAddressOf TransferCompleteHandler
		  mEasyItem.UserAgent = libcURL.Version.Name
		  mEasyItem.CA_ListFile = libcURL.Default_CA_File
		  mEasyItem.FailOnServerError = True
		  mEasyItem.FollowRedirects = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateSocketHandler(Sender As libcURL.cURLItem, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataAvailableHandler(Sender As libcURL.cURLItem, NewData As String)
		  #pragma Unused Sender
		  If mDownload = Nil Then
		    mDownloadMB = New MemoryBlock(0)
		    mDownload = New BinaryStream(mDownloadMB)
		  End If
		  mDownload.Write(NewData)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DataNeededHandler(Sender As libcURL.cURLItem, Buffer As MemoryBlock) As Integer
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
		Private Sub DebugMessageHandler(Sender As libcURL.cURLItem, MessageType As libcURL.curl_infotype, data As String)
		  #pragma Unused Sender
		  RaiseEvent DebugMessage(MessageType, data)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  mMultiItem = Nil
		  mEasyItem = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisconnectedHandler(Sender As libcURL.cURLItem, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
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

	#tag Method, Flags = &h21
		Private Sub HeaderReceivedHandler(Sender As libcURL.cURLItem, HeaderLine As String)
		  #pragma Unused Sender
		  If mHeaders = Nil Then mHeaders = New InternetHeaders
		  mHeaders.AppendHeader(NthField(HeaderLine, ": ", 1), NthField(HeaderLine, ": ", 2))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mEasyItem.LastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable)
		  ' Perform the transfer on the main thread/event loop.
		  
		  mEasyItem.URL = URL
		  mHeaders = Nil
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mUpload = ReadFrom
		  If s_list <> Nil Then
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, s_list) Then Raise New libcURL.cURLException(mEasyItem)
		  End If
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  
		  mMultiItem.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable) As Boolean
		  ' Perform the transfer on the calling thread.
		  
		  mEasyItem.URL = URL
		  mHeaders = Nil
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mUpload = ReadFrom
		  If s_list <> Nil Then
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, s_list) Then Raise New libcURL.cURLException(mEasyItem)
		  End If
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  
		  While mMultiItem.PerformOnce()
		    App.YieldToNextThread
		  Wend
		  Return mEasyItem.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProgressHandler(Sender As libcURL.cURLItem, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  #pragma Unused Sender
		  'If ulnow > 0 or ultotal > 0 Then Break
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetFormData(FormData As Dictionary)
		  mForm = New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not mForm.AddElement(item, FormData.Value(item)) Then Raise New libcURL.cURLException(mForm)
		  Next
		  If Not Me.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(mEasyItem)
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
		    If mRequestHeaders = Nil Then mRequestHeaders = New libcURL.curl_slist
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
		Private Sub TransferCompleteHandler(Sender As libcURL.cURLMulti, Item As libcURL.cURLItem)
		  #pragma Unused Sender
		  If mDownload <> Nil And mDownload IsA BinaryStream And mDownloadMB <> Nil Then BinaryStream(mDownload).Close
		  Dim status As Integer = Item.LastError
		  If status <> 0 Then
		    RaiseEvent Error(status)
		  Else
		    RaiseEvent TransferComplete(Me.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value, Me.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value)
		  End If
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

	#tag Property, Flags = &h21
		Private mDownload As Writeable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadMB As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEasyItem As libcURL.cURLItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mErrorBuffer As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mForm As libcURL.Form
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMultiItem As libcURL.cURLMulti
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRequestHeaders As libcURL.curl_slist
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
			
			Dim curl As New libcURL.cURLItem
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

	#tag Property, Flags = &h21
		Private s_list As libcURL.curl_slist
	#tag EndProperty

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
End Class
#tag EndClass
