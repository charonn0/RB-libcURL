#tag Class
Class cURLClient
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
		  If Not Me.SetOption(libcURL.Opts.FOLLOWLOCATION, True) Then Raise New libcURL.cURLException(mEasyItem) ' Follow redirects automatically
		  If Not Me.SetOption(libcURL.Opts.FAILONERROR, True) Then Raise New libcURL.cURLException(mEasyItem) ' fail on server errors
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
		Sub Get(URL As String, WriteTo As Writeable = Nil)
		  ' Asynchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  
		  mEasyItem.URL = URL
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(URL As String, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  
		  mEasyItem.URL = URL
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mUpload = Nil
		  Return Me.Perform
		  
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

	#tag Method, Flags = &h1
		Protected Function GetInfo(InfoType As Integer) As Variant
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
		Protected Sub Perform()
		  ' Perform the transfer on the main thread/event loop.
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  mHeaders = Nil
		  If s_list <> Nil Then
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, s_list) Then Raise New libcURL.cURLException(mEasyItem)
		  End If
		  mMultiItem.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Perform() As Boolean
		  ' Perform the transfer on the calling thread.
		  
		  If Not mMultiItem.AddItem(mEasyItem) Then Raise New libcURL.cURLException(mMultiItem)
		  mHeaders = Nil
		  If s_list <> Nil Then
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, s_list) Then Raise New libcURL.cURLException(mEasyItem)
		  End If
		  While mMultiItem.PerformOnce()
		    App.YieldToNextThread
		  Wend
		  Return mEasyItem.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, FormData As Dictionary, WriteTo As Writeable = Nil)
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem.
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mEasyItem.URL = URL
		  mForm = New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not mForm.AddElement(item, FormData.Value(item)) Then Raise New libcURL.cURLException(mForm)
		  Next
		  If Not Me.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(mEasyItem)
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As String, FormData As Dictionary, WriteTo As Writeable = Nil) As Boolean
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTML form elements. NAME is a string containing the form-element name; VALUE
		  ' may be a string or a FolderItem.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  mUpload = Nil
		  mForm = Nil
		  
		  mEasyItem.URL = URL
		  mForm = New libcURL.Form
		  For Each item As String In FormData.Keys
		    If Not mForm.AddElement(item, FormData.Value(item)) Then Raise New libcURL.cURLException(mForm)
		  Next
		  If Not Me.SetOption(libcURL.Opts.HTTPPOST, mForm) Then Raise New libcURL.cURLException(mEasyItem)
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
		Sub Put(URL As String, Data As MemoryBlock, WriteTo As Writeable = Nil)
		  Dim bs As New BinaryStream(Data)
		  Me.Put(URL, bs, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, Data As MemoryBlock, WriteTo As Writeable = Nil) As Boolean
		  Dim bs As New BinaryStream(Data)
		  Return Me.Put(URL, bs, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As String, ReadFrom As Readable, WriteTo As Writeable = Nil)
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses. The
		  ' path part of the URL specifies the remote directory and file name to store the file under.
		  ' ReadFrom is an object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be
		  ' read from this object.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  
		  mEasyItem.URL = URL
		  If Not Me.SetOption(libcURL.Opts.UPLOAD, True) Then Raise New libcURL.cURLException(mEasyItem)
		  mUpload = ReadFrom
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  Me.Perform()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, ReadFrom As Readable, WriteTo As Writeable = Nil) As Boolean
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  
		  mEasyItem.URL = URL
		  If Not Me.SetOption(libcURL.Opts.UPLOAD, True) Then Raise New libcURL.cURLException(mEasyItem)
		  mUpload = ReadFrom
		  mDownload = WriteTo
		  mDownloadMB = Nil
		  Return Me.Perform
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  If mEasyItem <> Nil Then Return mEasyItem.SetOption(OptionNumber, NewValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRequestHeaders(Headers As InternetHeaders)
		  If Headers <> Nil Then
		    If s_list = Nil Then s_list = New libcURL.curl_slist
		    For i As Integer = 0 To Headers.Count - 1
		      Call s_list.Append(Headers.Name(i) + ": " + Headers.Value(Headers.Name(i)))
		    Next
		  Else
		    If Not Me.SetOption(libcURL.Opts.HTTPHEADER, Nil) Then Raise New libcURL.cURLException(mEasyItem)
		    s_list = Nil
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
		    If mForm <> Nil Then
		      RaiseEvent POSTComplete()
		    Else
		      Dim ulsize As Integer = Me.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value
		      Dim dlsize As Integer = Me.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value
		      If ulsize > 0 Then RaiseEvent UploadComplete(ulsize)
		      If dlsize > 0 Then RaiseEvent DownloadComplete(dlsize)
		    End If
		  End If
		  
		  'clean up
		  mForm = Nil
		  mUpload = Nil
		  
		  If Not Me.SetOption(libcURL.Opts.UPLOAD, False) Then Raise New libcURL.cURLException(mEasyItem)
		  If Not Me.SetOption(libcURL.Opts.HTTPGET, True) Then Raise New libcURL.cURLException(mEasyItem)
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DebugMessage(MessageType As libcURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadComplete(BytesRead As Integer)
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
		Event UploadComplete(BytesWritten As Integer)
	#tag EndHook


	#tag Note, Name = Using this class
		This class provides synchronous and asynchronous transfers with full support for RB/Xojo threads. Transfers are initiated
		by calling one of the transfer methods: Get, Post, and Put. Despite the HTTP-specific names, Get and Put can be used to tranfer 
		files over any protocol libcURL supports.
		
		There are two versions of each method: synchronous and asynchronous. When dealing with libcURL and REALbasic, a major issue
		comes up with threading. RB/Xojo threads, being platform-generic abstractions, are not the sort of threads that libcURL understands. 
		What's more, the sort of threads that libcURL does understand happens to be the only such thread in any RB application: the main
		thread itself. The practical upshot being that using libcURL on a RB thread wasn't very useful, and using libcURL at all meant
		that your entire application stopped responding for the duration of the transfer. This class is a solution to this problem.
		
		The synchronous versions of the transfer methods will perform the entire transfer on the calling thread, and then return a
		Boolean indicating success (True) or failure (False). The asynchronous versions will activate a Timer that performs a little
		bit of the transfer on every run of the event loop. Both versions will raise events, and both versions can ignore the events
		by using the GetDownloadedData, GetResponseHeaders, and GetStatusCode methods.
	#tag EndNote


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
		Private mForm As libcURL.Form
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMultiItem As libcURL.cURLMulti
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUpload As Readable
	#tag EndProperty

	#tag Property, Flags = &h21
		Private s_list As libcURL.curl_slist
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
