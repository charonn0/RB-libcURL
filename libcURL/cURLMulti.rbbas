#tag Class
Class cURLMulti
	#tag Method, Flags = &h0
		Function AddItem(Item As cURLItem) As Boolean
		  mLastError = curl_multi_add_handle(mHandle, Item.Handle)
		  If mLastError = 0 Then
		    If Instances.Count > 0 Then PerformTimer.Mode = Timer.ModeMultiple
		    Instances.Value(Item.Handle) = Item
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  ' NOTE: this does not affect cURLItems that have been added to the multistack; they must be closed individually
		  For Each h As Integer In Instances.Keys
		    Call Me.RemoveItem(Instances.Value(h))
		  Next
		  mLastError = curl_multi_cleanup(mHandle)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Creates a new instance, sets up the callback functions
		  If Not libcURL.IsAvailable Then Raise cURLException(0)
		  mLastError = curl_global_init(CURL_GLOBAL_DEFAULT)
		  If Me.LastError <> 0 Then Raise cURLException(Me.LastError)
		  
		  mHandle = curl_multi_init()
		  If mHandle <= 0 Then
		    Raise cURLException(libcURL.Errors.FAILED_INIT)
		  End If
		  Instances = New Dictionary
		  PerformTimer = New Timer
		  AddHandler PerformTimer.Action, WeakAddressOf PerformTimerHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Destructor()
		  Me.Close
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

	#tag Method, Flags = &h0
		Sub Perform()
		  Dim i As Integer
		  mLastError = curl_multi_timeout(mHandle, i)
		  If mLastError = 0 And i > 0 Then
		    PerformTimer.Period = i
		  Else
		    PerformTimer.Period = 100
		  End If
		  PerformTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformTimerHandler(Sender As Timer)
		  #pragma Unused Sender
		  Dim c As Integer
		  mLastError = curl_multi_perform(mHandle, c)
		  If (mLastError = 0 Or mLastError = CURLM_CALL_MULTI_PERFORM) And (LastCount <> c Or c <> Instances.Count) Then
		    LastCount = c
		    Do
		      Dim mb As MemoryBlock = libcURL.curl_multi_info_read(mHandle, c)
		      If mb <> Nil Then
		        Dim msg As CURLMsg
		        msg.StringValue(TargetLittleEndian) = mb.StringValue(0, msg.Size)
		        RaiseEvent TransferComplete(Instances.Value(msg.easy_handle))
		      End If
		    Loop Until c = 0
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As cURLItem) As Boolean
		  mLastError = curl_multi_remove_handle(mHandle, Item.Handle)
		  If Instances.HasKey(Item.Handle) Then
		    Instances.Remove(Item.Handle)
		  End If
		  If Instances.Count = 0 Then PerformTimer.Mode = Timer.ModeOff
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  // This method marshals the NewValue into a Ptr then calls curl_easy-setopt
		  
		  If Not libcURL.IsAvailable Then Return False
		  Dim mb As MemoryBlock
		  Dim ValueType As Integer = VarType(NewValue)
		  Select Case ValueType
		  Case Variant.TypeNil
		    Raise New NilObjectException
		    
		  Case Variant.TypeBoolean
		    mb = New MemoryBlock(1)
		    mb.BooleanValue(0) = NewValue.BooleanValue
		    
		  Case Variant.TypePtr, Variant.TypeInteger
		    mb = NewValue.PtrValue
		    
		  Case Variant.TypeString
		    mb = NewValue.StringValue + Chr(0)
		    
		  Case Variant.TypeObject
		    Select Case NewValue
		    Case IsA MemoryBlock
		      mb = NewValue.PtrValue
		      
		    Else
		      Dim err As New TypeMismatchException
		      err.Message = "NewValue is of unsupported type: " + Introspection.GetType(NewValue).Name
		      Raise err
		      
		    End Select
		    
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
		Event TransferComplete(easyitem As cURLItem)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastCount As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PerformTimer As Timer
	#tag EndProperty


	#tag Constant, Name = CURLM_CALL_MULTI_PERFORM, Type = Double, Dynamic = False, Default = \"-1", Scope = Private
	#tag EndConstant


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
