#tag Class
Protected Class cURLBase
	#tag Method, Flags = &h0
		Sub Close()
		  // This method cleans up the instance
		  // This class will not automatically destruct! 
		  // You MUST call this method to destroy the instance
		  // If no more instances, cleans up libcurl completely
		  
		  If Not cURL.IsAvailable Then Return
		  cURL.curl_easy_cleanup(Me.Handle)
		  Instances.Remove(InstanceRef)
		  If Instances.Count = 0 Then
		    cURL.curl_global_cleanup()
		    Instances = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function CloseCallback(UserData As Ptr, Socket As Integer) As Integer
		  #pragma Unused Socket ' socket is an OS socket reference
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl = Nil Then Return 1
		  cURLBase(curl).curlClose
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Creates a new instance, sets up the callback functions
		  
		  If Not cURL.IsAvailable Then Raise cURLException(0)
		  
		  If Instances = Nil Then
		    mLastError = curl_global_init(3)
		    If Me.LastError = 0 Then Instances = New Dictionary
		  End If
		  
		  mHandle = curl_easy_init()
		  If mHandle > 0 Then
		    Dim mb As New MemoryBlock(4)
		    mb.Int32Value(0) = mHandle
		    InstanceRef = mb
		    Instances.Value(InstanceRef) = Me
		    
		    'If Not SetOption(OPT_OPENSOCKETDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    'If Not SetOption(OPT_OPENSOCKETFUNCTION, AddressOf OpenCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(OPT_WRITEDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_WRITEFUNCTION, AddressOf WriteCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(OPT_READDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_READFUNCTION, AddressOf ReadCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(OPT_NOPROGRESS, False) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_PROGRESSDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_PROGRESSFUNCTION, AddressOf ProgressCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(OPT_HEADERDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_HEADERFUNCTION, AddressOf HeaderCallback) Then Raise cURLException(Me.LastError)
		    
		    #If DebugBuild Then
		      If Not SetOption(OPT_VERBOSE, True) Then Raise cURLException(Me.LastError)
		      If Not SetOption(OPT_DEBUGDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		      If Not SetOption(OPT_DEBUGFUNCTION, AddressOf DebugCallback) Then Raise cURLException(Me.LastError)
		    #endif
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(CopyOpts As cURL.cURLBase)
		  // creates a new instance by cloning the passed instance
		  If Not cURL.IsAvailable Then Raise cURLException(0)
		  If CopyOpts <> Nil And CopyOpts.Handle > 0 Then
		    mHandle = curl_easy_duphandle(CopyOpts.Handle)
		    Dim mb As New MemoryBlock(4)
		    mb.Int32Value(0) = mHandle
		    InstanceRef = mb
		    Instances.Value(InstanceRef) = Me
		    
		    If Not SetOption(OPT_WRITEDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_READDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_PROGRESSDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(OPT_HEADERDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    #If DebugBuild Then
		      If Not SetOption(OPT_DEBUGDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    #endif
		  End If
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub curlClose()
		  // called by CloseCallback
		  RaiseEvent Disconnected()
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLCloseCallback(UserData As Ptr, cURLSocket As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlDebug(info As curl_infotype, data As Ptr, Size As Integer) As Integer
		  // called by DebugCallback
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
		  // called by HeaderCallback
		  Dim sz As Integer = nmemb * size
		  Dim data As MemoryBlock = char
		  Dim s As String = data.StringValue(0, sz)
		  Dim n, v As String
		  If InStr(s, ":") > 1 Then
		    n = NthField(s, ":", 1)
		    v = Replace(s, n + ":", "")
		  Else
		    n = s.Trim
		  End If
		  If mHeaderBuffer = Nil Then mHeaderBuffer = New InternetHeaders
		  mHeaderBuffer.AppendHeader(n, v)
		  Return sz
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function curlOpen(SocketType As Integer, Socket As Ptr) As Ptr
		  // called by OpenCallback
		  #pragma Warning "Fix Me"
		  Dim p As Ptr = RaiseEvent CreateSocket(SocketType, Socket)
		  Return p
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLOpenCallback(UserData As Ptr, SocketType As Integer, Socket As Ptr) As Ptr
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlProgress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  // called by ProgressCallback
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLProgressCallback(client As Ptr, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlRead(char As Ptr, size As Integer, nmemb As Integer) As Integer
		  // called by ReadCallback
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
		Private Function curlWrite(char As Ptr, size As Integer, nmemb As Integer) As Integer
		  // called by WriteCallback
		  ' data available
		  If mHeaderBuffer <> Nil Then RaiseEvent HeadersReceived(mheaderBuffer)
		  mHeaderBuffer = Nil
		  Dim mb As MemoryBlock = char
		  Dim s As String = mb.StringValue(0, nmemb * size)
		  RaiseEvent DataAvailable(s)
		  Return nmemb * size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function DebugCallback(Handle As Integer, info As curl_infotype, data As Ptr, size As Integer, UserData As Integer) As Integer
		  #pragma Unused Handle ' handle is the cURL handle of the instance
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLBase(curl).curlDebug(info, data, size)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub GetInfo(InfoType As Integer, Buffer As Ptr)
		  If Not cURL.IsAvailable Then Return
		  mLastError = curl_easy_getinfo(Me.Handle, InfoType, Buffer)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function HeaderCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLBase(curl).curlHeader(char, size, nmemb)
		  End If
		  
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function OpenCallback(UserData As Ptr, SocketType As Integer, Socket As Ptr) As Ptr
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl = Nil Then Return Nil
		  Return cURLBase(curl).curlOpen(SocketType, Socket)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pause(PauseUpload As Boolean = True, PauseDownload As Boolean = True) As Boolean
		  If Not cURL.IsAvailable Then Return False
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
		  
		  mLastError = curl_easy_pause(Me.Handle, mask)
		  Return Me.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Perform() As Boolean
		  If Not cURL.IsAvailable Then Return False
		  mLastError = curl_easy_perform(Me.Handle)
		  Return Me.LastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ProgressCallback(client As Ptr, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  Dim data As Integer = client.Int32
		  Dim curl As Object = Instances.Lookup(data, Nil)
		  If curl <> Nil Then
		    Return cURLBase(curl).curlProgress(dlTotal, dlnow, ultotal, ulnow)
		  End If
		  
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  Dim mb As New MemoryBlock(Count)
		  Dim i As Integer
		  mLastError = curl_easy_recv(Me.Handle, mb, mb.Size, i)
		  If Me.LastError = 0 Then
		    Dim s As String
		    If encoding <> Nil Then
		      s = DefineEncoding(mb.StringValue(0, i), encoding)
		    Else
		      s = mb.StringValue(0, i)
		    End If
		    Return s
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ReadCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  // called when data is needed
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLBase(curl).curlRead(char, size, nmemb)
		  End If
		  
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  If Not cURL.IsAvailable Then Return
		  curl_easy_reset(Me.Handle)
		  mLastError = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewOption As Variant) As Boolean
		  // This method marshals the NewOption into a Ptr then calls curl_easy-setopt
		  
		  If Not cURL.IsAvailable Then Return False
		  Dim mb As MemoryBlock
		  Dim i As Integer = VarType(NewOption)
		  Select Case i
		  Case Variant.TypeBoolean
		    mb = New MemoryBlock(1)
		    mb.BooleanValue(0) = NewOption.BooleanValue
		  Case Variant.TypeInteger
		    mb = New MemoryBlock(4)
		    mb.Int32Value(0) = NewOption.Int32Value
		  Case Variant.TypePtr
		    mb = NewOption.PtrValue
		  Case Variant.TypeString
		    mb = NewOption.StringValue + Chr(0)
		  Case Variant.TypeObject
		    
		    Select Case NewOption
		    Case IsA cURLProgressCallback
		      Dim p As cURLProgressCallback = NewOption
		      mb = p
		      
		    Case IsA cURLCallback
		      Dim p As cURLCallback = NewOption
		      mb = p
		      
		    Case IsA cURLDebugCallback
		      Dim p As cURLDebugCallback = NewOption
		      mb = p
		      
		    Case IsA cURLCloseCallback
		      Dim p As cURLCloseCallback = NewOption
		      mb = p
		      
		    Case IsA cURLOpenCallback
		      Dim p As cURLOpenCallback = NewOption
		      mb = p
		      
		    Else
		      Break
		    End Select
		    
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		  
		  mLastError = curl_easy_setopt(Me.Handle, OptionNumber, mb)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserAgent(Assigns AgentString As String)
		  Call Me.SetOption(OPT_USERAGENT, AgentString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Write(Text As String) As Integer
		  Dim byteswritten As Integer
		  Dim mb As MemoryBlock = Text
		  mLastError = curl_easy_send(Me.Handle, mb, mb.Size, byteswritten)
		  If mLastError = 0 Then Return byteswritten
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function WriteCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  // Called when data is available
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return cURLBase(curl).curlWrite(char, size, nmemb)
		  End If
		  
		  Break
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
		Event DebugMessage(info As cURL.curl_infotype, data As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Disconnected()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HeadersReceived(Headers As InternetHeaders)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
	#tag EndHook


	#tag Property, Flags = &h21
		Private InstanceRef As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaderBuffer As InternetHeaders
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty


	#tag Constant, Name = INFO_EFFECTIVE_URL, Type = Double, Dynamic = False, Default = \"1048577", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_LOCAL_IP, Type = Double, Dynamic = False, Default = \"1048617", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_LOCAL_PORT, Type = Double, Dynamic = False, Default = \"2097194", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_PRIMARY_IP, Type = Double, Dynamic = False, Default = \"1048608", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_PRIMARY_PORT, Type = Double, Dynamic = False, Default = \"2097192", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_REDIRECT_COUNT, Type = Double, Dynamic = False, Default = \"2097172", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_RESPONSE_CODE, Type = Double, Dynamic = False, Default = \"2097154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_SIZE_DOWNLOAD, Type = Double, Dynamic = False, Default = \"3145736", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_SPEED_DOWNLOAD, Type = Double, Dynamic = False, Default = \"3145737", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_CLOSESOCKETDATA, Type = Double, Dynamic = False, Default = \"10209", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_CLOSESOCKETFUNCTION, Type = Double, Dynamic = False, Default = \"20208", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_CONNECT_ONLY, Type = Double, Dynamic = False, Default = \"141", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_DEBUGDATA, Type = Double, Dynamic = False, Default = \"10095", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_DEBUGFUNCTION, Type = Double, Dynamic = False, Default = \"20094", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_DIRLISTONLY, Type = Double, Dynamic = False, Default = \"48", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_HEADERDATA, Type = Double, Dynamic = False, Default = \"10029", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_HEADERFUNCTION, Type = Double, Dynamic = False, Default = \"20079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_HTTPGET, Type = Double, Dynamic = False, Default = \"80", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_NOPROGRESS, Type = Double, Dynamic = False, Default = \"43", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_OPENSOCKETDATA, Type = Double, Dynamic = False, Default = \"10164", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_OPENSOCKETFUNCTION, Type = Double, Dynamic = False, Default = \"20163", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_PASSWORD, Type = Double, Dynamic = False, Default = \"10174", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_PORT, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_PROGRESSDATA, Type = Double, Dynamic = False, Default = \"10057", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_PROGRESSFUNCTION, Type = Double, Dynamic = False, Default = \"20056", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_READDATA, Type = Double, Dynamic = False, Default = \"10009", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_READFUNCTION, Type = Double, Dynamic = False, Default = \"20012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_SEEKFUNCTION, Type = Double, Dynamic = False, Default = \"20167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_UPLOAD, Type = Double, Dynamic = False, Default = \"46", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_URL, Type = Double, Dynamic = False, Default = \"10002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_USERAGENT, Type = Double, Dynamic = False, Default = \"10018", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_USERNAME, Type = Double, Dynamic = False, Default = \"10173", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_VERBOSE, Type = Double, Dynamic = False, Default = \"41", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_WRITEDATA, Type = Double, Dynamic = False, Default = \"10001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPT_WRITEFUNCTION, Type = Double, Dynamic = False, Default = \"20011", Scope = Protected
	#tag EndConstant


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
