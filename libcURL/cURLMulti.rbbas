#tag Class
Protected Class cURLMulti
	#tag Method, Flags = &h0
		Sub AddInstance(newcurl As libcURL.cURLItem)
		  mLastError = curl_multi_add_handle(Me.Handle, newcurl.Handle)
		  If mLastError = 0 Then
		    cURLHandles.Append(newcurl)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  For Each cURL As cURLItem In cURLHandles
		    cURL.Close
		  Next
		  mLastError = curl_multi_cleanup(Me.Handle)
		  ReDim cURLHandles(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mHandle = curl_multi_init()
		  If Me.Handle <= 0 Then Raise cURLException(Me.LastError)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  Me.Close()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Integer
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function NextMessage() As Integer
		  Dim msg As curl_multi_msg
		  Dim msgsleft As Integer
		  Dim p As Ptr = cURL_multi_info_read(Me.Handle, msgsleft)
		  If p <> Nil Then
		    Dim mb As MemoryBlock = p
		    msg.StringValue(TargetLittleEndian) = mb.StringValue(0, msg.Size)
		    Dim ihandle As Integer = msg.Handle
		    Dim instance As cURLItem
		    For i As Integer = 0 To UBound(cURLHandles)
		      If cURLHandles(i).Handle = ihandle Then
		        instance = cURLHandles(i)
		        Exit For
		      End If
		    Next
		    If instance <> Nil Then
		      RaiseEvent cURLEvent(instance, Msg.Msg, Ptr(Msg.MsgCode))
		    End If
		    
		    Return msgsleft
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Perform() As Integer
		  Dim active As Integer
		  mLastError = curl_multi_perform(Me.Handle, active)
		  If Me.LastError = 0 Then Return active
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveInstance(cURL As Integer)
		  For i As Integer = UBound(cURLHandles) DownTo 0
		    If cURLHandles(i) <> Nil And cURLHandles(i).Handle = cURL Then
		      mLastError = curl_multi_remove_handle(Me.Handle, cURL)
		      If Me.LastError <> 0 Then Exit For
		      cURLHandles.Remove(i)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  // This method marshals the NewValue into a Ptr then calls curl_multi_setopt
		  
		  If Not libcURL.IsAvailable Then Return False
		  Dim mb As MemoryBlock
		  Dim ValueType As Integer = VarType(NewValue)
		  Select Case ValueType
		  Case Variant.TypeNil
		    Raise New NilObjectException
		  Case Variant.TypeBoolean
		    mb = New MemoryBlock(1)
		    mb.BooleanValue(0) = NewValue.BooleanValue
		  Case Variant.TypeInteger
		    mb = New MemoryBlock(4)
		    mb.Int32Value(0) = NewValue.Int32Value
		  Case Variant.TypePtr
		    mb = NewValue.PtrValue
		  Case Variant.TypeString
		    mb = NewValue.StringValue + Chr(0)
		    'Case Variant.TypeObject
		    'Select Case NewValue
		    'Case IsA cURLProgressCallback
		    'Dim p As cURLProgressCallback = NewValue
		    'mb = p
		    '
		    'Case IsA cURLCallback
		    'Dim p As cURLCallback = NewValue
		    'mb = p
		    '
		    'Case IsA cURLDebugCallback
		    'Dim p As cURLDebugCallback = NewValue
		    'mb = p
		    '
		    'Case IsA cURLCloseCallback
		    'Dim p As cURLCloseCallback = NewValue
		    'mb = p
		    '
		    'Case IsA cURLOpenCallback
		    'Dim p As cURLOpenCallback = NewValue
		    'mb = p
		    '
		    'Else
		    'Dim err As New TypeMismatchException
		    'err.Message = "NewValue is of unsupported type: " + Introspection.GetType(NewValue).Name
		    'Raise err
		    'End Select
		    
		  Else
		    Dim err As New TypeMismatchException
		    err.Message = "NewValue is of unsupported vartype: " + Str(ValueType)
		    Raise err
		  End Select
		  
		  mLastError = curl_multi_setopt(Me.Handle, OptionNumber, mb)
		  Return mLastError = 0
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event cURLEvent(ByRef Instance As libcURL.cURLItem, Msg As Integer, Data As Ptr)
	#tag EndHook


	#tag Property, Flags = &h21
		Private cURLHandles() As cURLItem
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mLastError As Integer
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
			Name="mLastError"
			Group="Behavior"
			Type="Integer"
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
