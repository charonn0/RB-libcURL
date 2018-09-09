#tag Class
Protected Class URL
Inherits libcURL.cURLHandle
	#tag Method, Flags = &h0
		Sub AppendArgument(Name As String, Value As String)
		  Dim data As MemoryBlock = Name
		  If Value <> "" Then data = data + "=" + Value
		  data = data + Chr(0)
		  mLastError = curl_url_set(mHandle, URLPart.Query, data, CURLU_APPENDQUERY Or CURLU_URLENCODE)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(CopyURL As libcURL.URL)
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.cURLHandle
		  Super.Constructor(CopyURL.Flags)
		  Me.AnyScheme = CopyURL.AnyScheme
		  
		  mHandle = curl_url_dup(CopyURL.Handle)
		  If mHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(InitialURL As String = "", GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_DEFAULT)
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.cURLHandle
		  Super.Constructor(GlobalInitFlags)
		  
		  If Not libcURL.Version.IsAtLeast(7, 62, 0) Then
		    mLastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Me)
		  End If
		  
		  mHandle = curl_url()
		  If mHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		  
		  If InitialURL <> "" Then
		    Dim flag As Integer
		    If AnyScheme Then flag = CURLU_NON_SUPPORT_SCHEME
		    If InStr(InitialURL, "://") = 0 Then InitialURL = "http://" + InitialURL ' assume HTTP
		    If Not Me.SetPartContent(URLPart.All, InitialURL, flag) Then Raise New cURLException(Me)
		  End If 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mHandle <> 0 Then curl_url_cleanup(mHandle)
		  mHandle = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetPartContent(Part As libcURL.URLPart, Flags As Integer) As String
		  Dim contents As Ptr
		  Dim ret As String
		  mLastError = curl_url_get(mHandle, Part, contents, Flags)
		  If contents <> Nil Then
		    Try
		      Dim mb As MemoryBlock = contents
		      ret = mb.CString(0)
		    Finally
		      curl_free(contents)
		      contents = Nil
		    End Try
		  End If
		  Return ret
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherURL As libcURL.URL) As Integer
		  ' Overloads the comparison operator(=), permitting direct comparisons between references to URLs
		  
		  Dim i As Integer = Super.Operator_Compare(OtherURL)
		  If i = 0 Then i = Sign(mHandle - OtherURL.Handle)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartContent(Part As libcURL.URLPart, Contents As String, Flags As Integer) As Boolean
		  Dim data As MemoryBlock = Contents + Chr(0)
		  mLastError = curl_url_set(mHandle, Part, data, Flags)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue() As String
		  Return Me.GetPartContent(URLPart.All, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StringValue(Assigns FromString As String)
		  If Not Me.SetPartContent(URLPart.All, FromString, 0) Then Raise New cURLException(Me)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AnyScheme As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Query, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Query, value, 0) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Arguments As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Fragment, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Fragment, value, CURLU_URLENCODE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Fragment As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Host, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Host, value, CURLU_URLENCODE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Hostname As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Password, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Password, value, CURLU_URLENCODE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Password As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Path, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Path, value, 0) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Path As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Val(Me.GetPartContent(URLPart.Host, CURLU_DEFAULT_PORT))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.Host, Str(value, "####0"), 0) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.Scheme, CURLU_DEFAULT_SCHEME)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim flag As Integer
			  If AnyScheme Then flag = CURLU_NON_SUPPORT_SCHEME 
			  If Not Me.SetPartContent(URLPart.Scheme, value, flag) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Scheme As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.GetPartContent(URLPart.User, CURLU_URLDECODE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Me.SetPartContent(URLPart.User, value, CURLU_URLENCODE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty


	#tag Constant, Name = CURLUE_BAD_HANDLE, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_BAD_PARTPOINTER, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_BAD_PORT_NUMBER, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_MALFORMED_INPUT, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_FRAGMENT, Type = Double, Dynamic = False, Default = \"18", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_HOST, Type = Double, Dynamic = False, Default = \"14", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_OPTIONS, Type = Double, Dynamic = False, Default = \"13", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_PASSWORD, Type = Double, Dynamic = False, Default = \"12", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_PATH, Type = Double, Dynamic = False, Default = \"16", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_PORT, Type = Double, Dynamic = False, Default = \"15", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_QUERY, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_SCHEME, Type = Double, Dynamic = False, Default = \"10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_NO_USER, Type = Double, Dynamic = False, Default = \"11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_OUT_OF_MEMORY, Type = Double, Dynamic = False, Default = \"19", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_RELATIVE, Type = Double, Dynamic = False, Default = \"7", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_UNKNOWN_PART, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_UNSUPPORTED_SCHEME, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_URLDECODE, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLUE_USER_NOT_ALLOWED, Type = Double, Dynamic = False, Default = \"8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CURLU_APPENDQUERY, Type = Double, Dynamic = False, Default = \"256", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_DEFAULT_PORT, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_DEFAULT_SCHEME, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_DISALLOW_USER, Type = Double, Dynamic = False, Default = \"32", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_NON_SUPPORT_SCHEME, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_NO_DEFAULT_PORT, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_PATH_AS_IS, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_URLDECODE, Type = Double, Dynamic = False, Default = \"64", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU_URLENCODE, Type = Double, Dynamic = False, Default = \"128", Scope = Protected
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
