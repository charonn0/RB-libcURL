#tag Class
Protected Class cURLHandle
	#tag Method, Flags = &h1
		Protected Sub Constructor(Flags As Integer)
		  If Not libcURL.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "libcURL is not available or is an unsupported version."
		    Raise err
		  End If
		  
		  Select Case Flags
		  Case CURL_GLOBAL_ALL
		    If Not Win32Init Or Not SSLInit Then
		      mLastError = curl_global_init(Flags)
		      If mLastError <> 0 Then Return
		      Win32Init = True
		      SSLInit = True
		      mInitCount = mInitCount + 1
		    End If
		     
		  Case CURL_GLOBAL_WIN32
		    If Not Win32Init Then
		      mLastError = curl_global_init(Flags)
		      If mLastError <> 0 Then Return
		      Win32Init = True
		      mInitCount = mInitCount + 1
		    End If
		    
		  Case CURL_GLOBAL_SSL
		    If Not SSLInit Then
		      mLastError = curl_global_init(Flags)
		      If mLastError <> 0 Then Return
		      SSLInit = True
		      mInitCount = mInitCount + 1
		    End If
		    
		  Case CURL_GLOBAL_NOTHING
		    If mInitCount = 0 Then
		      mLastError = curl_global_init(Flags)
		      If mLastError <> 0 Then Return
		      mInitCount = mInitCount + 1
		    End If
		    
		  End Select
		  
		  If mLastError = 0 Then mRefCount = mRefCount + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mInitCount > 0 Then mRefCount = mRefCount - 1
		  If mRefCount <= 0 Then 
		    For i As Integer = 0 To mInitCount
		      If libcURL.IsAvailable Then curl_global_cleanup()
		      'mInitCount = Max(mInitCount - 1, 0)
		    Next
		    Win32Init = False
		    SSLInit = False
		    NothingInit = False
		    mInitCount = 0
		    mRefCount = 0
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  // Part of the libcURL.ErrorHandler interface.
		  ' All calls into libcURL that return an error code will update LastError
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.Errors
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.FormatError
		  
		  Return mLastError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub LastError(Assigns NewError As Integer)
		  // Part of the libcURL.ErrorHandler interface.
		  mLastError = NewError
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInitCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mRefCount As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared NothingInit As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared SSLInit As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared Win32Init As Boolean
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
