#tag Class
Protected Class ShareHandle
Inherits libcURL.MultiHandle
	#tag Method, Flags = &h0
		Function AddItem(Item As libcURL.cURLItem) As Boolean
		  ' Add an easy handle to share handle, then call the overridden AddItem method.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/CURLOPT_SHARE.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/ShareHandle.AddItem
		  
		  If Not Item.SetOption(libcURL.Opts.SHARE, Me) Then Raise New cURLException(Item)
		  Return Super.AddItem(Item)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  ' Calls the overridden Close method, and then cleans up the share handle.
		  ' Called automatically by the superclass destructor.
		  
		  Super.Close
		  If mShareHandle <> 0 Then mLastError = curl_share_cleanup(mShareHandle)
		  If mShareHandle <> 0 And mLastError = 0 Then mShareHandle = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_DEFAULT)
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.MultiHandle
		  Super.Constructor(GlobalInitFlags)
		  mShareHandle = curl_share_init()
		  If mShareHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As libcURL.cURLItem) As Boolean
		  ' Remove an easy handle from share handle, then call the overridden RemoveItem method.
		  ' See: http://curl.haxx.se/libcurl/c/CURLOPT_SHARE.html
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
		Function SharedHandle() As Integer
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
			  Call Me.SetShareOption(shareoption, CURL_LOCK_DATA_COOKIE)
			End Set
		#tag EndSetter
		ShareCookies As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mShareDNSCache
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mShareDNSCache = value
			  Dim shareoption As Integer
			  If mShareDNSCache Then shareoption = CURLSHOPT_SHARE Else shareoption = CURLSHOPT_UNSHARE
			  Call Me.SetShareOption(shareoption, CURL_LOCK_DATA_DNS)
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
			  Call Me.SetShareOption(shareoption, CURL_LOCK_DATA_SSL_SESSION)
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
			Name="ShareCookies"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShareDNSCache"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShareSSL"
			Group="Behavior"
			Type="Boolean"
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
