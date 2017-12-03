#tag Class
Protected Class MIMEMessagePart
	#tag Method, Flags = &h0
		Sub Constructor(ItemStruct As Ptr, Owner As libcURL.MIMEMessage)
		  mOwner = Owner
		  mStruct = ItemStruct
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherMIMEPart As libcURL.MIMEMessagePart) As Integer
		  If OtherMIMEPart Is Nil Then Return 1
		  Return Sign(Integer(mStruct) - Integer(OtherMIMEPart.mStruct))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.MIMEType
			  If mb <> Nil Then Return mb.CString(0)
			End Get
		#tag EndGetter
		ContentType As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Me.Type = MIMEPartType.Callback Then Return "" ' callbacks doesn't store the contents
			  Dim mb As MemoryBlock = Struct.Data
			  If mb <> Nil Then
			    If Struct.DataSize > 0 Then
			      Return mb.StringValue(0, Struct.DataSize)
			    Else
			      Return mb.CString(0)
			    End If
			  End If
			End Get
		#tag EndGetter
		Data As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Struct.DataSize
			End Get
		#tag EndGetter
		DataSize As UInt32
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.FileName
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

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mHeaders = Nil Then
			    Dim p As Ptr = Struct.Headers
			    If p <> Nil Then mHeaders = New ListPtr(p, mOwner.Flags)
			  End If
			  Return mHeaders
			End Get
		#tag EndGetter
		Headers As libcURL.ListPtr
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As libcURL.MIMEMessage
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStruct As Ptr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserHeaders As libcURL.ListPtr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = Struct.Name
			  If mb <> Nil Then 
			    If Struct.NameSize > 0 Then
			      Return mb.StringValue(0, Struct.NameSize)
			    Else
			      Return mb.CString(0)
			    End If
			  End If
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim p As Ptr = Struct.NextPart
			  If p <> Nil Then Return New MIMEMessagePart(p, mOwner)
			End Get
		#tag EndGetter
		NextPart As libcURL.MIMEMessagePart
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  '' Holds a reference to the Readable object from which the form element contents will be read when
			  '' the form is actually posted to a server. If the element Type is not FormElementType.Stream then
			  '' this will be Nil.
			  ''
			  '' See:
			  '' https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultipartFormElement.Stream
			  '
			  'If Struct.UserData <> Nil Then Return FormStreamGetter(mOwner).GetStream(Struct.UserData)
			End Get
		#tag EndGetter
		Stream As Readable
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mStruct <> Nil Then Return mStruct.curl_mimepart
			End Get
		#tag EndGetter
		Protected Struct As curl_mimepart
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  '' If the element contains several file parts then this method returns the first extra file. Use the
			  '' NextElement property of the returned MultipartFormElement to iterate over the file list.
			  ''
			  '' See:
			  '' https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultipartFormElement.MoreFiles
			  '
			  'Dim p As Ptr = Struct.MoreFiles
			  'If p = Nil Then Return Nil
			  'Return New MIMEMessagePart(p, mOwner)
			End Get
		#tag EndGetter
		SubPart As libcURL.MIMEMessagePart
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return MIMEPartType(Struct.Kind)
			End Get
		#tag EndGetter
		Type As libcURL.MIMEPartType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mUserHeaders = Nil Then
			    Dim p As Ptr = Struct.UserHeaders
			    If p <> Nil Then mUserHeaders = New ListPtr(p, mOwner.Flags)
			  End If
			  Return mUserHeaders
			End Get
		#tag EndGetter
		UserHeaders As libcURL.ListPtr
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Contents"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ContentType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Flags"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
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
