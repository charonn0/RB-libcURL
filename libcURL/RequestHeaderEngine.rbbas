#tag Class
Protected Class RequestHeaderEngine
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  ' Creates a new instance of RequestHeaderEngine for the EasyHandle whose request headers are to be manipulated
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.RequestHeaderEngine.Constructor
		  
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  If mHeaders <> Nil Then Return mHeaders.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeader(Name As String) As String
		  Dim c As Integer = Me.Count
		  For i As Integer = 0 To c - 1
		    If Me.Name(i) = Name Then Return Me.Value(i)
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasHeader(Name As String) As Boolean
		  Return Me.GetHeader(Name) <> ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  If mHeaders = Nil Then Return ""
		  Return NthField(mHeaders.Item(Index), ":", 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And mOwner.Value <> Nil And mOwner.Value IsA libcURL.EasyHandle Then
		    Return libcURL.EasyHandle(mOwner.Value)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveHeader(Name As String)
		  ' Removes the named request header.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.RequestHeaderEngine.SetHeader
		  
		  If Me.HasHeader(Name) Then Me.SetHeader(Name, "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Me.SetHeader("", "")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHeader(Name As String, Value As String)
		  ' Adds, updates, or removes the named request header. Headers will persist until removed or reset.
		  ' Pass an empty value to remove the named header. Pass an empty name and an empty value to reset.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.RequestHeaderEngine.SetHeader
		  
		  mHeaders = Owner.SetRequestHeader(mHeaders, Name, Value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As String
		  If mHeaders = Nil Then Return ""
		  Dim header As String = mHeaders.Item(Index)
		  Dim nm As String = Me.Name(Index)
		  Return Replace(header, nm + ":", "").Trim
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
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
