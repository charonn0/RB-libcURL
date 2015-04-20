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

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  If OptionNumber = libcURL.Opts.SHARE Then
		    mLastError = curl_share_setopt(mShareHandle, OptionNumber, NewValue.PtrValue)
		    Return mLastError = 0
		  End If
		  Return Super.SetOption(OptionNumber, NewValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ShareHandle() As Integer
		  Return mShareHandle
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mShareHandle As Integer
	#tag EndProperty


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
