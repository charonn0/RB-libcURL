#tag Class
Protected Class Socket
Inherits cURL.Base
	#tag Method, Flags = &h0
		Function Read(Count As Integer, encoding As TextEncoding = Nil) As String
		  // Part of the Readable interface.
		  Dim mb As New MemoryBlock(Count)
		  Dim i As Integer
		  mLastError = curl_easy_recv(Me.Handle, mb, mb.Size, i)
		  If Me.LastError = 0 Then 
		    Dim s As String
		    If encoding <> Nil Then
		      s = DefineEncoding(mb.StringValue(0, i), encoding)
		    Else
		      s = mb.StringValue(0, i)
		    End If
		    Return s
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
		    If Not SetOption(OPT_URL, NewURL) Then
		      Raise New RuntimeException
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(Text As String)
		  Dim i As Integer
		  Dim mb As MemoryBlock = Text
		  mLastError = curl_easy_send(Me.Handle, mb, mb.Size, i)
		  
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
