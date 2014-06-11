#tag Class
Protected Class curl_slist
	#tag Method, Flags = &h1
		Protected Function Append(s As String) As Boolean
		  ' Appends the passed string to the list.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_slist_append.html
		  
		  If Not libcURL.IsAvailable Then Return False
		  List = curl_slist_append(List, s)
		  Return List <> Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' initialize libcURL just enough to handle list building
		  If Not libcURL.IsAvailable Or curl_global_init(CURL_GLOBAL_NOTHING) <> 0 Then Raise cURLException(mLastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If List <> Nil Then libcURL.curl_slist_free_all(List)
		  libcURL.curl_global_cleanup()
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
