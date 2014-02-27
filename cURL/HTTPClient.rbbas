#tag Class
Protected Class HTTPClient
Inherits cURL.cURLBase
	#tag Method, Flags = &h0
		Sub Get(URL As String)
		  Me.URL = URL
		  Call Me.SetOption(cURL.Opts.HTTPGET, True)
		  Call Me.Perform()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, Form As Dictionary)
		  'Me.URL = URL
		  'Call Me.SetOption(cURL.Opts.HTTPPOST, True)
		  'Call Me.Perform()
		  '
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResponseCode() As Integer
		  //The URL libcURL is using, or it's most recently used
		  Dim buffer As New MemoryBlock(4)
		  Me.GetInfo(INFO_RESPONSE_CODE, buffer)
		  If Me.LastError = 0 Then
		    Return buffer.Int32Value(0)
		  Else
		    Raise New RuntimeException
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function URL() As String
		  //The URL libcURL is using, or it's most recently used
		  Dim buffer As New MemoryBlock(512)
		  Me.GetInfo(INFO_EFFECTIVE_URL, buffer)
		  If Me.LastError = 0 Then
		    Return buffer.CString(0)
		  Else
		    Raise New RuntimeException
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub URL(Assigns NewURL As String)
		  //The fully qualified absolute URL you are connecting to. MUST include the protocol, domain, path, AND the remote file name,
		  // e.g: ftp://example.com/files/stuff/myFile.zip
		  If NewURL <> "" Then
		    If Not SetOption(cURL.Opts.URL, NewURL) Then
		      Raise New RuntimeException
		    End If
		  End If
		End Sub
	#tag EndMethod


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
