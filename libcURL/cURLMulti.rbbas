#tag Class
Class cURLMulti
	#tag Method, Flags = &h0
		Function AddItem(Item As cURLItem) As Boolean
		  ' Add a cURLItem to the multistack. The cURLItem should have all of its options already set and ready to go.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_add_handle.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.AddItem
		  
		  mLastError = curl_multi_add_handle(mHandle, Item.Handle)
		  If mLastError = 0 Then
		    'If Instances.Count > 0 Then PerformTimer.Mode = Timer.ModeMultiple
		    Instances.Value(Item.Handle) = Item
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  ' Removes all remaining cURLItems from the stack and then destroys the stack.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_cleanup.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Close
		  
		  If libcURL.IsAvailable Then
		    For Each h As Integer In Instances.Keys
		      Call Me.RemoveItem(Instances.Value(h))
		    Next
		    If mHandle <> 0 Then mLastError = curl_multi_cleanup(mHandle)
		  End If
		  mHandle = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' Creates a new multi stack
		  
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_global_init.html
		  ' http://curl.haxx.se/libcurl/c/curl_multi_init.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Constructor
		  
		  If Not libcURL.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "libcURL is not available."
		    Raise err
		  End If
		  
		  mLastError = curl_global_init(CURL_GLOBAL_DEFAULT)
		  If Me.LastError <> 0 Then Raise New cURLException(Me.LastError, True)
		  
		  mHandle = curl_multi_init()
		  If mHandle <= 0 Then
		    Raise New cURLException(libcURL.Errors.FAILED_INIT, True)
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
		  ' the multi handle
		  Return mHandle
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  ' Returns the most recent curl error code for the multistack (but not for any cURLItems managed by the stack.)
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform()
		  ' Calling this method will activate a timer which calls curl_multi_perform on the multistack until the last item is Removed.
		  ' If the stack is not being processed, begins processing the stack. If the stack is already being processed, updates the PerformTimer
		  ' period with libcURL's best estimate of an optimum interval.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_timeout.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Perform
		  
		  Dim i As Integer
		  mLastError = curl_multi_timeout(mHandle, i)
		  If mLastError = 0 And i > 0 Then
		    PerformTimer.Period = i
		  Else
		    PerformTimer.Period = 1
		  End If
		  PerformTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformTimerHandler(Sender As Timer)
		  ' This method handles the PerformTimer.Action event.
		  ' On each run of the timer, checks to see whether any cURLItems have finished and calls the TransferComplete event if needed.
		  ' Call cURLMulti.Perform to start the timer or update its interval.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_perform.html
		  ' http://curl.haxx.se/libcurl/c/curl_multi_info_read.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.TransferComplete
		  
		  #pragma Unused Sender
		  Dim c As Integer
		  mLastError = curl_multi_perform(mHandle, c) ' on exit, 'c' will contain the number of easy handles with unfinished business.
		  If (mLastError = 0 Or mLastError = CURLM_CALL_MULTI_PERFORM) And (LastCount <> c Or c <> Instances.Count) Then
		    LastCount = c
		    Do
		      Dim mb As MemoryBlock = curl_multi_info_read(mHandle, c) ' on exit, 'c' will contain the number of messages remaining.
		      If mb <> Nil Then
		        Dim msg As CURLMsg
		        msg.StringValue(TargetLittleEndian) = mb.StringValue(0, msg.Size)
		        Dim curl As cURLItem = Instances.Value(msg.easy_handle)
		        
		        Call Me.RemoveItem(curl)
		        
		        'msg.Data is the last error code for the easy handle
		        Dim oi() As Introspection.PropertyInfo = Introspection.GetType(curl).GetProperties
		        For x As Integer = 0 To UBound(oi)
		          If oi(x).Name = "mLastError" Then oi(x).Value(curl) = Integer(msg.Data)
		        Next
		        
		        RaiseEvent TransferComplete(curl)
		        
		      End If
		    Loop Until c = 0
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As cURLItem) As Boolean
		  ' Removes the passed cURLItem from the multistack. If there no more cURLItems then turns off the PerformTimer.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_remove_handle.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.RemoveItem
		  
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
		  ' SetOption is the primary interface to the multistack. Call this method with a curlmulti option number
		  ' and a value that is acceptable for that option. SetOption does not check that a value is valid for
		  ' a particular option (except Nil,) however it does enforce type safety of the value and will raise
		  ' an exception if an unsupported type is passed.
		  
		  ' NewValue may be a Boolean, Integer, Ptr, String, or MemoryBlock. Passing a Nil object will raise an
		  ' exception unless the option explicitly accepts NULL.
		  
		  ' If the option was set this method returns True. If it returns False the option was not set and the
		  ' curl error number is stored in cURLMulti.LastError.
		  
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_setopt.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.SetOption
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.Opts
		  
		  Dim MarshalledValue As MemoryBlock
		  Dim ValueType As Integer = VarType(NewValue)
		  Select Case ValueType
		  Case Variant.TypeNil
		    ' Sometimes Nil is an error; sometimes not
		    Select Case OptionNumber
		    Case libcURL.Opts.PIPELINING_SITE_BL, libcURL.Opts.PIPELINING_SERVER_BL
		      ' These option numbers explicitly accept NULL. Refer to the curl documentation on the individual option numbers for details.
		      MarshalledValue = Nil
		    Else
		      ' for all other option numbers reject NULL values.
		      Dim err As New NilObjectException
		      err.Message = "cURL option number 0x" + Hex(OptionNumber) + " may not be set to null."
		      Raise err
		    End Select
		    
		  Case Variant.TypeBoolean
		    If NewValue.BooleanValue Then
		      Return Me.SetOption(OptionNumber, 1)
		    Else
		      Return Me.SetOption(OptionNumber, 0)
		    End If
		    
		  Case Variant.TypePtr, Variant.TypeInteger
		    MarshalledValue = NewValue.PtrValue
		    
		  Case Variant.TypeString
		    MarshalledValue = NewValue.StringValue + Chr(0)
		    
		  Case Variant.TypeObject
		    Select Case NewValue
		    Case IsA MemoryBlock
		      MarshalledValue = NewValue.PtrValue
		      
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
		  
		  mLastError = curl_multi_setopt(Me.Handle, OptionNumber, MarshalledValue)
		  Return mLastError = 0
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event TransferComplete(easyitem As cURLItem)
	#tag EndHook


	#tag Note, Name = Using this class
		This class implements the curl_multi interface of libcURL. A curl_multi "stack" can manage 1 or more
		cURLItems. Once all desired cURLItems have been added, you may call cURLMulti.Perform to begin the
		transfer.
		
		Calling cURLMulti.Perform will activate a timer which calls curl_multi_perform on the multistack until
		there are no more items (i.e. all calls to AddItem must have a matching call to RemoveItem, for example 
		in the TransferComplete event.)
		
		cURLItems may be added and removed from the stack at any time. Once added, cURLMulti will maintain a (RB) 
		reference to the cURLItem and you should not call any methods/set any properties on the cURLItem until
		after removing it from the multistack with the RemoveItem method.
		
		A cURLItem added to a multistack will behave exactly as it would had it not been added, including raising
		events in response to libcURL callback functions.
		
		If the stack is not being processed, calling Perform will begin processing the stack. If the stack is already 
		being processed calling Perform will update the PerformTimer period with libcURL's best estimate of an optimum interval. 
		
		Using a multistack allows single-threaded apps (like RB apps) to use libcURL in a non-blocking manner.
	#tag EndNote


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
