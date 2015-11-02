#tag Class
Protected Class ProxyEngine
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExcludeHost(Hostname As String) As Boolean
		  If mExclusions.IndexOf(Hostname) = -1 Then mExclusions.Append(Hostname)
		  Return Owner.SetOption(libcURL.Opts.NOPROXY, Join(mExclusions, ","))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IncludeHost(Hostname As String) As Boolean
		  Dim i As Integer
		  Do
		    i = mExclusions.IndexOf(Hostname)
		    If i <> -1 Then mExclusions.Remove(i)
		  Loop Until i < 0
		  Return Owner.SetOption(libcURL.Opts.NOPROXY, Join(mExclusions, ","))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And Not (mOwner.Value Is Nil) And mOwner.Value IsA libcURL.EasyHandle Then
		    Return libcURL.EasyHandle(mOwner.Value)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetProxyHeader(HeaderName As String, HeaderValue As String) As Boolean
		  ' Subsequent calls to this method will append the headers to the previously set headers. Headers will persist from transfer
		  ' to transfer. Pass an empty value to clear the named header. Pass an empty name to clear all headers.
		  
		  If Not libcURL.Version.IsAtLeast(7, 37, 0) Then
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Return False
		  End If
		  
		  If mHeaders = Nil And HeaderName <> "" Then ' Add first header
		    mHeaders = Array(HeaderName + ": " + HeaderValue) ' array converts to ListPtr
		    
		  ElseIf HeaderName <> "" Then ' append another header
		    Dim s() As String = mHeaders
		    If Not Owner.SetOption(libcURL.Opts.PROXYHEADER, Nil) Then Raise New cURLException(Owner)
		    If HeaderName = "" And HeaderValue = "" Then Return True ' deleted headers
		    For i As Integer = UBound(s) DownTo 0
		      If NthField(s(i), ":", 1).Trim = HeaderName Then s.Remove(i)
		    Next
		    mHeaders = s
		    If Not mHeaders.Append(HeaderName + ": " + HeaderValue) Then Raise New cURLException(mHeaders)
		    
		  Else' clear all headers
		    mHeaders = Nil
		    
		  End If
		  
		  If Not Owner.SetOption(libcURL.Opts.PROXYHEADER, mHeaders) Then Raise New cURLException(Owner)
		  Return mHeaders <> Nil
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAddress
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXY, value) Then Raise New libcURL.cURLException(Owner)
			  mAddress = value
			End Set
		#tag EndSetter
		Address As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mAuthMethods = Nil Then mAuthMethods = Owner.GetInfo(libcURL.Info.PROXYAUTH_AVAIL)
			  return mAuthMethods
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXYAUTH, value.Mask) Then Raise New libcURL.cURLException(Owner)
			  mAuthMethods = value.Mask
			End Set
		#tag EndSetter
		AuthMethods As libcURL.HTTPAuthMethods
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHTTPTunnel
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.HTTPPROXYTUNNEL, value) Then Raise New libcURL.cURLException(Owner)
			  mHTTPTunnel = value
			End Set
		#tag EndSetter
		HTTPTunnel As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAddress As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAuthMethods As libcURL.HTTPAuthMethods
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExclusions() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHTTPTunnel As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPassword As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPort As Integer = 1080
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mServiceName As String = "HTTP"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As libcURL.ProxyType = libcURL.ProxyType.HTTP
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUsername As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPassword
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXYUSERPWD, Me.Username + ":" + value) Then Raise New libcURL.cURLException(Owner)
			  mPassword = value
			End Set
		#tag EndSetter
		Password As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPort
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXYPORT, value) Then Raise New libcURL.cURLException(Owner)
			  mPort = value
			End Set
		#tag EndSetter
		Port As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mServiceName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If libcURL.Version.IsAtLeast(7, 43, 0) Then
			    If Not Owner.SetOption(libcURL.Opts.PROXY_SERVICE_NAME, value) Then Raise New libcURL.cURLException(Owner)
			    mServiceName = value
			  Else
			    ErrorSetter(Me.Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
			  End If
			End Set
		#tag EndSetter
		ServiceName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXYTYPE, Integer(value)) Then Raise New libcURL.cURLException(Owner)
			  mType = value
			End Set
		#tag EndSetter
		Type As libcURL.ProxyType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUsername
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If Not Owner.SetOption(libcURL.Opts.PROXYUSERPWD, value + ":" + Me.Password) Then Raise New libcURL.cURLException(Owner)
			  mUsername = value
			End Set
		#tag EndSetter
		Username As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPTunnel"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServiceName"
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
			Name="Username"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
