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
		Function Get(URL As String) As Boolean
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' This method is synchronous in that it will not return until the transfer completes, but is asynchronous
		  ' in that only the calling thread is blocked.
		  
		  EasyItem.URL = URL
		  mDownload = Nil
		  mDownloadMB = Nil
		  mUpload = Nil
		  Return Me.Perform
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(URL As String, WriteTo As Writeable = Nil)
		  ' Asynchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an object that implements the Writeable interface (e.g. BinaryStream). The downloaded data
		  ' will be written to this object. When the download is complete, a reference to this object will be passed
		  ' to the DownloadComplete event.
		  
		  EasyItem.URL = URL
		  mDownload = WriteTo
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDownloadedData() As MemoryBlock
		  If mDownloadMB <> Nil Then Return mDownloadMB
		  Dim data As New MemoryBlock(0)
		  If mDownload = Nil Or Not mDownload IsA BinaryStream Then Return data
		  Dim bs As BinaryStream = BinaryStream(mDownload)
		  bs.Position = 0
		  Dim out As New BinaryStream(data)
		  While Not bs.EOF
		    out.Write(bs.Read(64))
		  Wend
		  out.Close
		  bs.Position = bs.Length
		  Return data
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResponseHeaders() As InternetHeaders
		  Return mHeaders
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStatusCode() As Integer
		  Return Easyitem.GetInfo(libcURL.Info.RESPONSE_CODE).Int32Value
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
		  Return EasyItem.LastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Perform()
		  If mPerforming Then Raise New IllegalLockingException Else mPerforming = True
		  mHeaders = Nil
		  Try
		    If Not MultiItem.AddItem(EasyItem) Then Raise New libcURL.cURLException(MultiItem)
		    MultiItem.Perform()
		  Finally
		    mPerforming = False
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Perform() As Boolean
		  If mPerforming Then Raise New IllegalLockingException Else mPerforming = True
		  mHeaders = Nil
		  Try
		    If Not MultiItem.AddItem(EasyItem) Then Raise New libcURL.cURLException(MultiItem)
		    While MultiItem.PerformOnce()
		      App.YieldToNextThread
		    Wend
		  Finally
		    mPerforming = False
		  End Try
		  Return EasyItem.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, FormData As Dictionary)
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem.
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  
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
		Function Post(URL As String, FormData As Dictionary) As Boolean
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem.
		  ' This method is synchronous in that it will not return until the transfer completes, but is asynchronous
		  ' in that only the calling thread is blocked.
		  
		  mDownload = Nil
		  mDownloadMB = Nil
		  mUpload = Nil
		  mForm = Nil
		  
		  EasyItem.URL = URL
		  mForm = New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not mForm.AddElement(item, FormData.Value(item)) Then Raise New libcURL.cURLException(mForm)
		  Next
		  If Not EasyItem.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(EasyItem)
		  Return Me.Perform
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
		Sub Put(URL As String, Data As MemoryBlock)
		  Dim bs As New BinaryStream(Data)
		  Me.Put(URL, bs)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, Data As MemoryBlock) As Boolean
		  Dim bs As New BinaryStream(Data)
		  Return Me.Put(URL, bs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As String, ReadFrom As Readable)
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses. The
		  ' path part of the URL specifies the remote directory and file name to store the file under. ReadFrom is an
		  ' object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be read from this
		  ' object. When the upload is complete, a reference to this object will be passed to the UploadComplete event.
		  
		  EasyItem.URL = URL
		  If Not EasyItem.SetOption(libcURL.Opts.UPLOAD, True) Then Raise New libcURL.cURLException(EasyItem)
		  mUpload = ReadFrom
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, ReadFrom As Readable) As Boolean
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' This method is synchronous in that it will not return until the transfer completes, but is asynchronous
		  ' in that only the calling thread is blocked.
		  
		  mDownload = Nil
		  mDownloadMB = Nil
		  
		  EasyItem.URL = URL
		  If Not EasyItem.SetOption(libcURL.Opts.UPLOAD, True) Then Raise New libcURL.cURLException(EasyItem)
		  mUpload = ReadFrom
		  Return Me.Perform
		End Function
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
		  If mDownload <> Nil And mDownload IsA BinaryStream And mDownloadMB <> Nil Then BinaryStream(mDownload).Close
		  Dim status As Integer = Item.LastError
		  If status <> 0 Then
		    RaiseEvent Error(status)
		  Else
		    Dim ulsize As Integer = easyitem.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value
		    Dim dlsize As Integer = easyitem.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value
		    If mForm <> Nil Then
		      RaiseEvent POSTComplete()
		    Else
		      If ulsize > 0 Then RaiseEvent UploadComplete()
		      If dlsize > 0 Then RaiseEvent DownloadComplete()
		    End If
		  End If
		  
		  'clean up
		  ReDim ms_lists(-1)
		  mForm = Nil
		  mUpload = Nil
		  mDownload = Nil
		  If Not EasyItem.SetOption(libcURL.Opts.UPLOAD, False) Then Raise New libcURL.cURLException(EasyItem)
		  If Not EasyItem.SetOption(libcURL.Opts.HTTPGET, True) Then Raise New libcURL.cURLException(EasyItem)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DebugMessage(MessageType As libcURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadComplete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Error(cURLCode As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event POSTComplete()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UploadComplete()
	#tag EndHook


	#tag Property, Flags = &h1
		Protected EasyItem As libcURL.cURLItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownload As Writeable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDownloadMB As MemoryBlock
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mForm As libcURL.Form
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPerforming As Boolean
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
