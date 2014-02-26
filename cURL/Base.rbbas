#tag Class
Protected Class Base
	#tag Method, Flags = &h0
		Sub Close()
		  If Not cURL.IsAvailable Then Return
		  cURL.curl_easy_cleanup(Me.Handle)
		  Instances.Remove(InstanceRef)
		  If Instances.Count = 0 Then
		    cURL.curl_global_cleanup()
		    Instances = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
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
		    
		    If Not SetOption(CURLOPT_WRITEDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(CURLOPT_WRITEFUNCTION, AddressOf WriteCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(CURLOPT_READDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(CURLOPT_READFUNCTION, AddressOf ReadCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(CURLOPT_NOPROGRESS, False) Then Raise cURLException(Me.LastError)
		    If Not SetOption(CURLOPT_PROGRESSDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(CURLOPT_PROGRESSFUNCTION, AddressOf ProgressCallback) Then Raise cURLException(Me.LastError)
		    
		    If Not SetOption(CURLOPT_HEADERDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		    If Not SetOption(CURLOPT_HEADERFUNCTION, AddressOf HeaderCallback) Then Raise cURLException(Me.LastError)
		    
		    #If DebugBuild Then
		      If Not SetOption(CURLOPT_VERBOSE, True) Then Raise cURLException(Me.LastError)
		      If Not SetOption(CURLOPT_DEBUGDATA, InstanceRef) Then Raise cURLException(Me.LastError)
		      If Not SetOption(CURLOPT_DEBUGFUNCTION, AddressOf DebugCallback) Then Raise cURLException(Me.LastError)
		    #endif
		    
		    
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(CopyOpts As cURL.Base)
		  If Not cURL.IsAvailable Then Raise cURLException(0)
		  mHandle = curl_easy_duphandle(CopyOpts.Handle)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlDebug(info As curl_infotype, data As Ptr, Size As Integer) As Integer
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
		  Dim sz As Integer = nmemb * size
		  Dim data As MemoryBlock = char
		  Dim s As String = data.StringValue(0, sz)
		  Dim n, v As String
		  n = NthField(s, ":", 1)
		  v = Replace(s, n + ":", "")
		  If mHeaderBuffer = Nil Then mHeaderBuffer = New InternetHeaders
		  mHeaderBuffer.AppendHeader(n, v)
		  Return sz
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function curlProgress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  Return RaiseEvent Progress(dlTotal, dlnow, ultotal, ulnow)
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLProgressCallback(client As Ptr, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Function curlRead(char As Ptr, size As Integer, nmemb As Integer) As Integer
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
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return Base(curl).curlDebug(info, data, size)
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
		    Return Base(curl).curlHeader(char, size, nmemb)
		  End If
		  
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
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
		    Return Base(curl).curlProgress(dlTotal, dlnow, ultotal, ulnow)
		  End If
		  
		  Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ReadCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  // called when data is needed
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return Base(curl).curlRead(char, size, nmemb)
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

	#tag Method, Flags = &h21
		Private Shared Function WriteCallback(char As Ptr, size As Integer, nmemb As Integer, UserData As Integer) As Integer
		  // Called when data is available
		  Dim curl As Object = Instances.Lookup(UserData, Nil)
		  If curl <> Nil Then
		    Return Base(curl).curlWrite(char, size, nmemb)
		  End If
		  
		  Break
		End Function
	#tag EndMethod


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


	#tag Constant, Name = CURLOPT_DEBUGDATA, Type = Double, Dynamic = False, Default = \"10095", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_DEBUGFUNCTION, Type = Double, Dynamic = False, Default = \"20094", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_HEADERDATA, Type = Double, Dynamic = False, Default = \"10029", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_HEADERFUNCTION, Type = Double, Dynamic = False, Default = \"20079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_NOPROGRESS, Type = Double, Dynamic = False, Default = \"43", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_PROGRESSDATA, Type = Double, Dynamic = False, Default = \"10057", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_PROGRESSFUNCTION, Type = Double, Dynamic = False, Default = \"20056", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_READDATA, Type = Double, Dynamic = False, Default = \"10009", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_READFUNCTION, Type = Double, Dynamic = False, Default = \"20012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_VERBOSE, Type = Double, Dynamic = False, Default = \"41", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_WRITEDATA, Type = Double, Dynamic = False, Default = \"10001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLOPT_WRITEFUNCTION, Type = Double, Dynamic = False, Default = \"20011", Scope = Protected
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
