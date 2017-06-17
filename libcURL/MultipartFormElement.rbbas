#tag Class
Protected Class MultipartFormElement
	#tag Method, Flags = &h0
		Sub Constructor(ItemStruct As Ptr, Owner As libcURL.MultipartForm)
		  mOwner = Owner
		  mStruct = ItemStruct
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherFormElement As libcURL.MultipartFormElement) As Integer
		  ' Overloads the comparison operator(=), permitting direct comparisons between instances of MultipartFormElement.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultipartFormElement.Operator_Compare
		  
		  If OtherFormElement Is Nil Then Return 1
		  Dim i As Integer = mOwner.Operator_Compare(OtherFormElement.mOwner)
		  If i = 0 Then i = Sign(Integer(mStruct) - Integer(OtherFormElement.mStruct))
		  Return i
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Struct.Buffer <> Nil Then Return Struct.Buffer
			End Get
		#tag EndGetter
		Buffer As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Struct.BufferLen
			End Get
		#tag EndGetter
		BufferSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mContentHeaders = Nil Then
			    Dim p As Ptr = Struct.ContentHeader
			    If p <> Nil Then mContentHeaders = New ListPtr(p, mOwner.Flags)
			  End If
			  Return mContentHeaders
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> Nil Then
			    Dim p As Ptr = Ptr(value.Handle)
			    Struct.ContentHeader = p
			  Else
			    Struct.ContentHeader = Nil
			  End If
			  mContentHeaders = value
			End Set
		#tag EndSetter
		ContentHeaders As libcURL.ListPtr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Struct.ContentsLen
			End Get
		#tag EndGetter
		ContentLen As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Struct.UserData <> Nil Then Return "" ' CURLFORM_STREAM doesn't store the contents
			  Dim mb As MemoryBlock = Struct.Contents
			  If mb <> Nil Then
			    If Struct.ContentsLen > 0 Then
			      Return mb.StringValue(0, Struct.ContentsLen)
			    Else
			      Return mb.CString(0)
			    End If
			  End If
			End Get
		#tag EndGetter
		Contents As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.ContentType
			  If mb <> Nil Then Return mb.CString(0)
			End Get
		#tag EndGetter
		ContentType As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.ShowFileName
			  If mb <> Nil Then Return mb.CString(0)
			End Get
		#tag EndGetter
		FileName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Struct.Flags
			End Get
		#tag EndGetter
		Flags As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mContentHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim p As Ptr = Struct.MoreFiles
			  If p = Nil Then Return Nil
			  Return New MultipartFormElement(p, mOwner)
			End Get
		#tag EndGetter
		MoreFiles As libcURL.MultipartFormElement
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOwner As libcURL.MultipartForm
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStruct As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.Name
			  If mb <> Nil Then Return mb.StringValue(0, Struct.NameLen)
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a reference to the next element in the form. If there are no more
			  ' elements then this returns Nil. Use MultipartForm.FirstElement to get a
			  ' reference to the first element in a form.
			  
			  Dim p As Ptr = Struct.NextItem
			  If p <> Nil Then Return New MultipartFormElement(p, mOwner)
			End Get
		#tag EndGetter
		NextElement As libcURL.MultipartFormElement
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Struct.UserData <> Nil Then Return FormStreamGetter(mOwner).GetStream(Struct.UserData)
			End Get
		#tag EndGetter
		Stream As Readable
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mStruct <> Nil Then Return mStruct.curl_httppost
			End Get
		#tag EndGetter
		Protected Struct As curl_httppost
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Select Case True
			  Case Struct.Buffer <> Nil
			    Return FormElementType.MemoryBlock
			    
			  Case Struct.UserData <> Nil
			    Return FormElementType.Stream
			    
			  Case Struct.ShowFileName <> Nil, Struct.MoreFiles <> Nil
			    Return FormElementType.File
			    
			  Else
			    Return FormElementType.String
			    
			  End Select
			End Get
		#tag EndGetter
		Type As libcURL.FormElementType
	#tag EndComputedProperty


	#tag Constant, Name = CURL_HTTPPOST_BUFFER, Type = Double, Dynamic = False, Default = \"16", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_CALLBACK, Type = Double, Dynamic = False, Default = \"64", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_FILENAME, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_LARGE, Type = Double, Dynamic = False, Default = \"128", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_PTRBUFFER, Type = Double, Dynamic = False, Default = \"32", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_PTRCONTENTS, Type = Double, Dynamic = False, Default = \"8", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_PTRNAME, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_HTTPPOST_READFILE, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant


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
