#tag Class
Protected Class cURLManager
	#tag Method, Flags = &h0
		Sub Close()
		  mMultiItem = Nil
		  mEasyItem = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  If mEasyItem = Nil Then
		    mEasyItem = New libcURL.EasyHandle
		    mEasyItem.UserAgent = libcURL.Version.Name
		    mEasyItem.Secure = True
		    mEasyItem.CA_ListFile = libcURL.Default_CA_File
		    mEasyItem.FailOnServerError = True
		    mEasyItem.FollowRedirects = True
		    mEasyItem.AutoReferer = True
		    mEasyItem.HTTPCompression = True
		  End If
		  AddHandler mEasyItem.CreateSocket, WeakAddressOf _CreateSocketHandler
		  'AddHandler mEasyItem.DataAvailable, WeakAddressOf _DataAvailableHandler
		  'AddHandler mEasyItem.DataNeeded, WeakAddressOf _DataNeededHandler
		  AddHandler mEasyItem.DebugMessage, WeakAddressOf _DebugMessageHandler
		  AddHandler mEasyItem.Disconnected, WeakAddressOf _DisconnectedHandler
		  AddHandler mEasyItem.HeaderReceived, WeakAddressOf _HeaderReceivedHandler
		  AddHandler mEasyItem.Progress, WeakAddressOf _ProgressHandler
		  'AddHandler mEasyItem.SeekStream, WeakAddressOf _SeekStreamHandler
		  
		  mMultiItem = New libcURL.MultiHandle
		  AddHandler mMultiItem.TransferComplete, WeakAddressOf _TransferCompleteHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(CopyOpts As libcURL.cURLManager)
		  mEasyItem = New libcURL.EasyHandle(CopyOpts.EasyItem)
		  Me.Constructor()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cookies() As libcURL.CookieEngine
		  Return mEasyItem.CookieEngine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EasyItem() As libcURL.EasyHandle
		  Return mEasyItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCookie(Name As String, Domain As String) As String
		  Dim index As Integer = mEasyItem.CookieEngine.Lookup(Name, Domain)
		  If index > -1 Then Return mEasyItem.CookieEngine.Value(index)
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
		  If mEasyItem.DownloadStream = Nil Or Not mEasyItem.DownloadStream IsA BinaryStream Then Return data
		  Dim bs As BinaryStream = BinaryStream(mEasyItem.DownloadStream)
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

	#tag Method, Flags = &h0
		Sub Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable)
		  ' Perform the transfer on the main thread/event loop.
		  
		  QueueTransfer(URL, ReadFrom, WriteTo)
		  mMultiItem.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Perform(URL As String, ReadFrom As Readable, WriteTo As Writeable) As Boolean
		  ' Perform the transfer on the calling thread.
		  
		  Dim QueryInterval As Integer
		  
		  QueueTransfer(URL, ReadFrom, WriteTo)
		  While mMultiItem.PerformOnce()
		    QueryInterval = mMultiItem.QueryInterval()
		    If QueryInterval > 1 And App.CurrentThread <> Nil Then
		      System.DebugLog("Sleep for " + Format(QueryInterval, "############0") + " ms")
		      App.SleepCurrentThread(QueryInterval)
		    Else
		      System.DebugLog("Yielding.")
		      App.YieldToNextThread
		    End If
		  Wend
		  Return mEasyItem.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Proxy() As libcURL.ProxyEngine
		  Return mEasyItem.ProxyEngine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub QueueTransfer(URL As String, ReadFrom As Readable, WriteTo As Writeable)
		  mIsTransferComplete = False
		  If URL.Trim <> "" Then mEasyItem.URL = URL
		  mHeaders = Nil
		  If WriteTo = Nil Then
		    mDownloadMB = New MemoryBlock(0)
		    WriteTo = New BinaryStream(mDownloadMB)
		  Else
		    mDownloadMB = Nil
		  End If
		  mEasyItem.DownloadStream = WriteTo
		  mEasyItem.UploadStream = ReadFrom
		  If mEasyItem.UseErrorBuffer Then mEasyItem.UseErrorBuffer = True ' clears the previous buffer, if any
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCookie(Name As String, Value As String, Domain As String, Expires As Date = Nil, Path As String = "", HTTPOnly As Boolean = False) As Boolean
		  Return mEasyItem.CookieEngine.SetCookie(Name, Value, Domain, Expires, Path, HTTPOnly)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  If mEasyItem <> Nil Then Return mEasyItem.SetOption(OptionNumber, NewValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetRequestHeader(Name As String, Value As String) As Boolean
		  ' Subsequent calls to this method will append the headers to the previously set headers. Headers will persist from transfer
		  ' to transfer. Pass an empty value to clear the named header. Pass an empty name to clear all headers.
		  
		  mRequestHeaders = mEasyItem.SetRequestHeader(mRequestHeaders, Name, Value)
		  Return (mRequestHeaders <> Nil Or Name = "")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _CreateSocketHandler(Sender As libcURL.EasyHandle, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
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
		  If HeaderLine.Trim = "" Then Return
		  mHeaders.AppendHeader(NthField(HeaderLine, ": ", 1), NthField(HeaderLine, ": ", 2))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _ProgressHandler(Sender As libcURL.EasyHandle, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  #pragma Unused Sender
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _TransferCompleteHandler(Sender As libcURL.MultiHandle, Item As libcURL.EasyHandle)
		  #pragma Unused Sender
		  If mEasyItem.DownloadStream <> Nil And mEasyItem.DownloadStream IsA BinaryStream And mDownloadMB <> Nil Then BinaryStream(mEasyItem.DownloadStream).Close
		  Dim status As Integer = Item.LastError
		  If status <> 0 Then
		    RaiseEvent Error(status)
		  Else
		    RaiseEvent TransferComplete(Me.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value, Me.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value)
		  End If
		  mIsTransferComplete = True
		  mEasyItem.ClearFormData()
		  If Item.LastError <> status Then ErrorSetter(Item).LastError = status
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


	#tag Property, Flags = &h21
		Private mDownloadMB As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEasyItem As libcURL.EasyHandle
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
