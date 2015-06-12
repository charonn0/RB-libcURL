#tag Class
Protected Class ShareHandle
Inherits libcURL.cURLHandle
	#tag Method, Flags = &h0
		Function AddItem(Item As libcURL.EasyHandle) As Boolean
		  ' Add an easy handle to share handle
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/CURLOPT_SHARE.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.ShareHandle.AddItem
		  
		  If Not SharedHandles.HasKey(Item.Handle) And Item.SetOption(libcURL.Opts.SHARE, Me) Then
		    SharedHandles.Value(Item.Handle) = Item
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  ' Removes all EasyHandles from the share
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.ShareHandle.Close
		  
		  If SharedHandles <> Nil And libcURL.IsAvailable Then
		    For Each h As Integer In SharedHandles.Keys
		      Call Me.RemoveItem(SharedHandles.Value(h))
		    Next
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_DEFAULT)
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.cURLHandle
		  Super.Constructor(GlobalInitFlags)
		  mHandle = curl_share_init()
		  If mHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		  SharedHandles = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  Me.Close
		  If mHandle <> 0 Then mLastError = curl_share_cleanup(mHandle)
		  If mHandle <> 0 And mLastError = 0 Then mHandle = 0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherShare As libcURL.ShareHandle) As Integer
		  Dim i As Integer = Super.Operator_Compare(OtherShare)
		  If i = 0 Then Return Sign(mHandle - OtherShare.Handle)
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As libcURL.EasyHandle) As Boolean
		  ' Remove an easy handle from share handle.
		  ' See: http://curl.haxx.se/libcurl/c/CURLOPT_SHARE.html
		  
		  If SharedHandles.HasKey(Item.Handle) And Item.SetOption(libcURL.Opts.SHARE, Nil) Then
		    SharedHandles.Remove(Item.Handle)
		    Return True
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  mLastError = curl_share_setopt(mHandle, OptionNumber, NewValue.PtrValue)
		  Return mLastError = 0
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
			  If Not Me.SetOption(shareoption, CURL_LOCK_DATA_COOKIE) Then Raise New cURLException(Me)
			End Set
		#tag EndSetter
		ShareCookies As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SharedHandles As Dictionary
	#tag EndProperty

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
			  If Not Me.SetOption(shareoption, CURL_LOCK_DATA_DNS) Then Raise New cURLException(Me)
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
			  If Not Me.SetOption(shareoption, CURL_LOCK_DATA_SSL_SESSION) Then Raise New cURLException(Me)
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
