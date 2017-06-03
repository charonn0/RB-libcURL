#tag Class
Protected Class MultipartFormElement
Inherits libcURL.cURLHandle
	#tag Method, Flags = &h0
		Sub Constructor(ItemStruct As curl_httppost, Owner As libcURL.MultipartForm, Prev As libcURL.MultipartFormElement)
		  Super.Constructor(Owner.Flags)
		  mOwner = Owner
		  mStruct = ItemStruct
		  If Prev <> Nil Then mPrevElement = New WeakRef(Prev)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Handle() As Integer
		  Return 0
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mStruct.Buffer <> Nil Then Return mStruct.Buffer
			End Get
		#tag EndGetter
		Buffer As MemoryBlock
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStruct.BufferLen
			End Get
		#tag EndGetter
		BufferSize As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mContentHeaders = Nil Then
			    Dim p As Ptr = mStruct.ContentHeader
			    If p <> Nil Then mContentHeaders = New ListPtr(p)
			  End If
			  Return mContentHeaders
			End Get
		#tag EndGetter
		ContentHeaders As libcURL.ListPtr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStruct.ContentsLen
			End Get
		#tag EndGetter
		ContentLen As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mStruct.UserData <> Nil Then Return "" ' CURLFORM_STREAM doesn't store the contents
			  Dim mb As MemoryBlock = mStruct.Contents
			  If mb <> Nil Then 
			    If mStruct.ContentsLen > 0 Then
			      Return mb.StringValue(0, mStruct.ContentsLen)
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
			  Dim mb As MemoryBlock = mStruct.ContentType
			  If mb <> Nil Then Return mb.CString(0)
			End Get
		#tag EndGetter
		ContentType As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mStruct.ShowFileName
			  If mb <> Nil Then Return mb.CString(0)
			End Get
		#tag EndGetter
		FileName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mStruct.Flags
			End Get
		#tag EndGetter
		Flags As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mContentHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNextElement As libcURL.MultipartFormElement
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim p As Ptr = mStruct.MoreFiles
			  If p = Nil Then Return Nil
			  Return New MultipartFormElement(p.curl_httppost, mOwner, Nil)
			End Get
		#tag EndGetter
		MoreFiles As libcURL.MultipartFormElement
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOwner As libcURL.MultipartForm
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrevElement As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStruct As curl_httppost
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mStruct.Name
			  If mb <> Nil Then Return mb.StringValue(0, mStruct.NameLen)
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
			  
			  If mNextElement = Nil Then
			    Dim p As Ptr = mStruct.NextItem
			    If p <> Nil Then mNextElement = New MultipartFormElement(p.curl_httppost(0), mOwner, Me)
			  End If
			  Return mNextElement
			End Get
		#tag EndGetter
		NextElement As libcURL.MultipartFormElement
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Returns a reference to the previous element in the form. If there are no previous
			  ' elements then this returns Nil. Use MultipartForm.FirstElement to get a reference
			  ' to the first element in a form.
			  
			  If mPrevElement <> Nil And mPrevElement.Value IsA MultipartFormElement Then
			    Return MultipartFormElement(mPrevElement.Value)
			  End If
			End Get
		#tag EndGetter
		PrevElement As libcURL.MultipartFormElement
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim p As Ptr = mStruct.UserData
			  If p = Nil Then Return Nil
			  Return EasyHandle.QueryHandle(p)
			End Get
		#tag EndGetter
		StreamHandler As libcURL.EasyHandle
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
