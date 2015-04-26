#tag Class
Protected Class cURLMulti
Inherits libcURL.cURLHandle
Implements ErrorHandler
	#tag Method, Flags = &h0
		Function AddItem(Item As libcURL.cURLItem) As Boolean
		  ' Add a cURLItem to the multistack. The cURLItem should have all of its options already set and ready to go.
		  ' You may not add an item while a call to PerformOnce has not yet returned. Doing so will raise an IllegalLockingException.
		  ' A cURLItem may belong to only one cURLMulti object at a time. Passing an owned cURLItem will raise an exception.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_add_handle.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.AddItem
		  
		  If mEasyHandles.IndexOf(Item.Handle) > -1 Then
		    mLastError = libcURL.Errors.ALREADY_ADDED
		    Raise New cURLException(Me)
		  End If
		  
		  StackLock.Signal
		  Try
		    mLastError = curl_multi_add_handle(mHandle, Item.Handle)
		    If mLastError = 0 Then
		      Instances.Value(Item.Handle) = Item
		    End If
		  Finally
		    StackLock.Release
		  End Try
		  mEasyHandles.Append(Item.Handle)
		  Return True
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
		Sub Constructor(GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_DEFAULT)
		  ' Creates a new multi stack
		  
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_global_init.html
		  ' http://curl.haxx.se/libcurl/c/curl_multi_init.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Constructor
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(GlobalInitFlags As Integer) -- From libcURL.cURLHandle
		  Super.Constructor(GlobalInitFlags)
		  If mLastError <> 0 Then Raise New cURLException(Me)
		  
		  mHandle = curl_multi_init()
		  If mHandle <= 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		  Instances = New Dictionary
		  StackLock = New Semaphore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
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
		Function HasItem(EasyItem As libcURL.cURLItem) As Boolean
		  Return Instances.HasKey(EasyItem.Handle)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Perform()
		  ' Calling this method will activate a timer which calls PerformOnce on the multistack until the last item is Removed.
		  ' If the stack is not being processed, begins processing the stack. If the stack is already being processed, updates the PerformTimer
		  ' period with libcURL's best estimate of an optimum interval.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Perform
		  
		  If PerformTimer = Nil Then
		    PerformTimer = New Timer
		    AddHandler PerformTimer.Action, WeakAddressOf PerformTimerHandler
		  End If
		  Dim i As Integer = QueryInterval
		  If i > 0 Then
		    PerformTimer.Period = i
		  ElseIf i = 0 Then
		    PerformTimer.Period = 1 ' immediately
		  Else ' error
		    Return
		  End If
		  PerformTimer.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformOnce() As Boolean
		  ' Calling this method will call curl_multi_perform on the multistack once and read all messages emitted by libcURL during that operation.
		  ' The TransferComplete event will be raised for any completed easy handles. This method must be called repeatedly until libcURL indicates
		  ' that all transfers have completed. PerformOnce will return True until all transfers have completed.
		  '
		  ' Unlike cURLMulti.Perform, this method will run the transfers and raise events on the calling thread instead of always on the main thread.
		  '
		  ' Calling this method again before a previous call to it has returned will raise an IllegalLockingException.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_perform.html
		  ' http://curl.haxx.se/libcurl/c/curl_multi_info_read.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.PerformOnce
		  
		  StackLock.Signal
		  Try
		    Dim c As Integer
		    mLastError = curl_multi_perform(mHandle, c) ' on exit, 'c' will contain the number of easy handles with unfinished business.
		    If (mLastError = 0 Or mLastError = CURLM_CALL_MULTI_PERFORM) And (LastCount <> c Or c <> Instances.Count) Then
		      LastCount = c
		      Do
		        Dim msg As CURLMsg = ReadNextMsg(c) ' on exit, 'c' will contain the number of messages remaining
		        If c > -1 Then
		          Dim curl As cURLItem = Instances.Value(msg.easy_handle)
		          
		          Call Me.RemoveItem(curl)
		          
		          'msg.Data is the last error code for the easy handle
		          ErrorHandler(curl).LastError = Integer(msg.Data)
		          RaiseEvent TransferComplete(curl)
		          
		        End If
		      Loop Until c <= 0
		    End If
		  Finally
		    StackLock.Release
		  End Try
		  Return (mLastError = 0 And Instances.Count > 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PerformTimerHandler(Sender As Timer)
		  ' This method handles the PerformTimer.Action event. It calls PerformOnce on the main thread until PerformOnce returns False.
		  
		  If Not Me.PerformOnce() Then Sender.Mode = Timer.ModeOff
		  
		Exception Err As RuntimeException
		  If Err IsA EndException Or Err IsA ThreadEndException Then Raise Err
		  If Sender <> Nil Then Sender.Mode = Timer.ModeOff
		  Raise Err
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QueryInterval() As Integer
		  ' Returns libcURL's best estimate for an optimum interval, in milliseconds, between calls to PerformOnce. An interval of 0 means
		  ' that PerformOnce may be called immediately.
		  ' http://curl.haxx.se/libcurl/c/curl_multi_timeout.html
		  Dim i As Integer
		  mLastError = curl_multi_timeout(mHandle, i)
		  If mLastError = 0 Then
		    Return i
		  Else
		    Return -1
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ReadNextMsg(ByRef MsgsRemaining As Integer) As CURLMsg
		  Dim mb As MemoryBlock = curl_multi_info_read(mHandle, MsgsRemaining)
		  If mb <> Nil Then
		    Dim msg As CURLMsg
		    msg.StringValue(TargetLittleEndian) = mb.StringValue(0, msg.Size)
		    Return msg
		  ElseIf MsgsRemaining = 0 Then
		    MsgsRemaining = -1
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveItem(Item As libcURL.cURLItem) As Boolean
		  ' Removes the passed cURLItem from the multistack. If there no more cURLItems then turns off the PerformTimer.
		  ' You may not remove an item while a call to PerformOnce has not yet returned. Doing so will raise an IllegalLockingException.
		  '
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_multi_remove_handle.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.RemoveItem
		  
		  StackLock.Signal
		  Try
		    mLastError = curl_multi_remove_handle(mHandle, Item.Handle)
		    If Instances.HasKey(Item.Handle) Then
		      Instances.Remove(Item.Handle)
		    End If
		    If Instances.Count = 0 And PerformTimer <> Nil Then PerformTimer.Mode = Timer.ModeOff
		  Finally
		    StackLock.Release
		  End Try
		  Dim h As Integer = mEasyHandles.IndexOf(Item.Handle)
		  If h > -1 Then mEasyHandles.Remove(h)
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
		Event TransferComplete(easyitem As libcURL.cURLItem)
	#tag EndHook


	#tag Note, Name = Using this class
		This class implements the curl_multi interface of libcURL. A cURLMulti instance can manage one or more cURLItems. 
		See: http://curl.haxx.se/libcurl/c/libcurl-multi.html
		
		Using cURLMulti allows us to use the cURLItem class asynchronously, either automatically on the main thread or 'manually' 
		on a RB thread.
		
		cURLItems may be added to the stack at any time. Once added, cURLMulti will maintain a (RB) reference to the cURLItem.
		You should not call any methods/set any properties on the cURLItem until you receive its reference as the parameter to the 
		TransferComplete event.
		
		Once all desired cURLItems have been added, you may call Perform or PerformOnce to begin the transfer(s). 
		
		Calling PerformOnce executes curl_multi_perform once and processes all completed cURLItems. All cURLItem and cURLMulti events will be 
		raised on the thread which calls PerformOnce. PerformOnce will not return until all event handlers have returned.
		
		Calling Perform will activate a timer which calls PerformOnce on the main thread until there are no more items. Perform returns immediately.
	#tag EndNote


	#tag Property, Flags = &h1
		Protected Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastCount As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mEasyHandles() As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHandle As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PerformTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StackLock As Semaphore
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
