#tag Class
Protected Class cURLShare
Inherits libcURL.cURLMulti
	#tag Method, Flags = &h0
		Function AddItem(Item As libcURL.cURLItem) As Boolean
		  If Not Item.SetOption(libcURL.Opts.SHARE, Me) Then Raise New cURLException(Item)
		  Return Super.AddItem(Item)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  If mShareHandle <> 0 Then mLastError = curl_share_cleanup(mShareHandle)
		  If mShareHandle <> 0 And mLastError = 0 Then mShareHandle = 0
		  Super.Close
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  // Constructor() -- From cURLMulti
		  Super.Constructor()
		  mShareHandle = curl_share_init()
		  If mShareHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As libcURL.cURLItem) As Boolean
		  If Not Item.SetOption(libcURL.Opts.SHARE, Nil) Then Raise New cURLException(Item)
		  Return Super.RemoveItem(Item)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetShareOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  mLastError = curl_share_setopt(mShareHandle, OptionNumber, NewValue.PtrValue)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShareHandle() As Integer
		  Return mShareHandle
		End Function
	#tag EndMethod


	#tag Note, Name = About this class
		
		s
	#tag EndNote


	#tag Property, Flags = &h21
		Private mShareCookies As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShareDNSCache As Boolean
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mShareHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShareSSL As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShareCookies
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShareCookies = value
			  Dim shareoption As Integer
			  If mShareCookies Then shareoption = CURLSHOPT_SHARE Else shareoption = CURLSHOPT_UNSHARE 
			  If Not Me.SetShareOption(shareoption, CURL_LOCK_DATA_COOKIE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		ShareCookies As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ShareDNSCache
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShareDNSCache = value
			  Dim shareoption As Integer
			  If mShareDNSCache Then shareoption = CURLSHOPT_SHARE Else shareoption = CURLSHOPT_UNSHARE
			  If Not Me.SetShareOption(shareoption, CURL_LOCK_DATA_DNS) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		ShareDNSCache As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShareSSL
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShareSSL = value
			  Dim shareoption As Integer
			  If mShareSSL Then shareoption = CURLSHOPT_SHARE Else shareoption = CURLSHOPT_UNSHARE
			  If Not Me.SetShareOption(shareoption, CURL_LOCK_DATA_SSL_SESSION) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		ShareSSL As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = CURLSHOPT_SHARE, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURLSHOPT_UNSHARE, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_LOCK_DATA_COOKIE, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_LOCK_DATA_DNS, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_LOCK_DATA_SSL_SESSION, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant


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
