#tag Class
Protected Class curl_slist
Inherits libcURL.cURLHandle
Implements ErrorHandler
	#tag Method, Flags = &h0
		Function Append(s As String) As Boolean
		  ' Appends the passed string to the list. If the List is NULL it will be created.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_slist_append.html
		  
		  Dim p As Ptr = curl_slist_append(List, s)
		  If p <> Nil Then
		    List = p
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ListPtr As Ptr = Nil, GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_NOTHING)
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.cURLHandle
		  Super.Constructor(GlobalInitFlags)
		  If mLastError <> 0 Then Raise New cURLException(Me)
		  
		  List = ListPtr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If libcURL.IsAvailable And List <> Nil Then libcURL.curl_slist_free_all(List)
		  List = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  ' This method returns a Ptr to the header list which can be passed back to libcURL
		  Return List
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected List As Ptr
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
