#tag Class
Class cURLClient
	#tag Method, Flags = &h0
		Sub Constructor()
		  EasyItem = New libcURL.cURLItem
		  AddHandler EasyItem.CreateSocket, WeakAddressOf CreateSocketHandler
		  AddHandler EasyItem.DataAvailable, WeakAddressOf DataAvailableHandler
		  AddHandler EasyItem.DataNeeded, WeakAddressOf DataNeededHandler
		  AddHandler EasyItem.DebugMessage, WeakAddressOf DebugMessageHandler
		  AddHandler EasyItem.Disconnected, WeakAddressOf DisconnectedHandler
		  AddHandler EasyItem.HeaderReceived, WeakAddressOf HeaderReceivedHandler
		  AddHandler EasyItem.Progress, WeakAddressOf ProgressHandler
		  
		  MultiItem = New libcURL.cURLMulti
		  AddHandler MultiItem.TransferComplete, WeakAddressOf TransferCompleteHandler
		  
		  EasyItem.UserAgent = libcURL.Version.Name
		  EasyItem.CA_ListFile = libcURL.Default_CA_File
		  If Not EasyItem.SetOption(libcURL.Opts.FOLLOWLOCATION, True) Then Raise New libcURL.cURLException(EasyItem) ' Follow redirects automatically
		  If Not EasyItem.SetOption(libcURL.Opts.FAILONERROR, True) Then Raise New libcURL.cURLException(EasyItem) ' fail on server errors
		  If Not MultiItem.AddItem(EasyItem) Then Raise New libcURL.cURLException(MultiItem)
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
		  If mDownload <> Nil Then mDownload.Write(NewData)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DataNeededHandler(Sender As libcURL.cURLItem, Buffer As MemoryBlock) As Integer
		  #pragma Unused Sender
		  If mUpload = Nil Then Return libcURL.CURL_READFUNC_ABORT
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
		  MultiItem = Nil
		  EasyItem = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisconnectedHandler(Sender As libcURL.cURLItem, Socket As Integer)
		  #pragma Unused Sender
		  #pragma Unused Socket
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(URL As String, WriteTo As Writeable)
		  EasyItem.URL = URL
		  mDownload = WriteTo
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(URL As String, WriteTo As Writeable) As Integer
		  Dim code As Integer
		  mHeaders = New InternetHeaders
		  WriteTo.Write(libcURL.Get(URL, 5, mHeaders, code))
		  Return code
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResponseHeaders() As InternetHeaders
		  Return mHeaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HeaderReceivedHandler(Sender As libcURL.cURLItem, HeaderLine As String)
		  #pragma Unused Sender
		  If mHeaders = Nil Then mHeaders = New InternetHeaders
		  mHeaders.AppendHeader(NthField(HeaderLine, ": ", 1), NthField(HeaderLine, ": ", 2))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Perform()
		  If Not MultiItem.AddItem(EasyItem) Then Raise New libcURL.cURLException(MultiItem)
		  MultiItem.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, FormData As Dictionary)
		  EasyItem.URL = URL
		  mForm = New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not mForm.AddElement(item, FormData.Value(item)) Then Raise New libcURL.cURLException(mForm)
		  Next
		  If Not EasyItem.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(EasyItem)
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As String, FormData As Dictionary, WriteTo As Writeable) As Integer
		  Dim code As Integer
		  mHeaders = New InternetHeaders
		  WriteTo.Write(libcURL.Post(FormData, URL, 5, mHeaders, code))
		  Return code
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProgressHandler(Sender As libcURL.cURLItem, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  #pragma Unused Sender
		  'If ulnow > 0 or ultotal > 0 Then Break
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As String, ReadFrom As Readable)
		  EasyItem.URL = URL
		  If Not EasyItem.SetOption(libcURL.Opts.UPLOAD, True) Then Raise New libcURL.cURLException(EasyItem)
		  mUpload = ReadFrom
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRequestHeaders(Headers As InternetHeaders)
		  Dim h As libcURL.curl_slist
		  If Headers <> Nil Then
		    h = New libcURL.curl_slist
		    For i As Integer = 0 To Headers.Count - 1
		      Call h.Append(Headers.Name(i) + ": " + Headers.Value(Headers.Name(i)))
		    Next
		    ms_lists.Append(h)
		  End If
		  If Not EasyItem.SetOption(libcURL.Opts.HTTPHEADER, h) Then Raise New libcURL.cURLException(EasyItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferCompleteHandler(Sender As libcURL.cURLMulti, Item As libcURL.cURLItem)
		  #pragma Unused Sender
		  Dim status As Integer = Item.LastError
		  If status <> 0 Then
		    RaiseEvent Error(status)
		  Else
		    Dim ulsize As Integer = easyitem.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value
		    Dim dlsize As Integer = easyitem.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value
		    If ulsize > 0 Then RaiseEvent UploadComplete(mUpload)
		    If dlsize > 0 Then RaiseEvent DownloadComplete(mDownload)
		  End If
		  ReDim ms_lists(-1) ' clean up any lists
		  mForm = Nil '  clean up the form
		  mHeaders = Nil '  clean up the headers
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DebugMessage(MessageType As libcURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadComplete(WrittenTo As Writeable)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(cURLCode As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UploadComplete(ReadFrom As Readable)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected EasyItem As libcURL.cURLItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActive As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownload As Writeable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mForm As libcURL.Form
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ms_lists() As libcURL.curl_slist
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected MultiItem As libcURL.cURLMulti
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpload As Readable
	#tag EndProperty


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
