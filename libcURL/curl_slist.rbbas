#tag Class
Protected Class curl_slist
	#tag Method, Flags = &h0
		Function Append(s As String) As Boolean
		  ' Appends the passed string to the list. If the List is NULL it will be created.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_slist_append.html
		  
		  List = curl_slist_append(List, s)
		  Return List <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr = Nil)
		  ' initialize libcURL just enough to handle list building
		  
		  If Not libcURL.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "libcURL is not available."
		    Raise err
		  End If
		  
		  If curl_global_init(CURL_GLOBAL_NOTHING) <> 0 Then Raise New cURLException(libcURL.Errors.INIT_FAILED)
		  List = ListPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If libcURL.IsAvailable Then
		    If List <> Nil Then libcURL.curl_slist_free_all(List)
		    libcURL.curl_global_cleanup()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  ' This method returns a Ptr to the header list which can be passed back to libcURL
		  Return List
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected List As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty


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
