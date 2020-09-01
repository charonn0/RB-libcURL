#tag Class
Protected Class OptionIterator
	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not IsAvailable() Then
		    Dim err As New cURLException(Nil)
		    err.ErrorNumber = libcURL.Errors.FEATURE_UNAVAILABLE
		    err.Message = FormatError(err.ErrorNumber)
		    Raise err
		  End If
		  
		  mPrev = curl_easy_option_next(Nil)
		  If mPrev = Nil Then
		    Dim err As New cURLException(Nil)
		    err.ErrorNumber = libcURL.Errors.INIT_FAILED
		    err.Message = libcURL.FormatError(libcURL.Errors.INIT_FAILED)
		    Raise err
		  End If
		  mIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Session As libcURL.EasyHandle)
		  OptionDumper(Session).Dump(mDataStore)
		  mIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsAvailable() As Boolean
		  Return libcURL.Version.IsAtLeast(7, 73, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  If mDataStore = Nil Then
		    mPrev = curl_easy_option_next(mPrev)
		    If mPrev <> Nil Then
		      mIndex = mIndex + 1
		      Return True
		    End If
		    
		  Else
		    If mIndex >= mDataStore.Count - 1 Then Return False
		    mIndex = mIndex + 1
		    Return True
		    
		  End If
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndex
			End Get
		#tag EndGetter
		CurrentIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDataStore <> Nil Then
			    Dim optnum As Integer = mDataStore.Key(mIndex)
			    Return optnum
			  ElseIf mPrev <> Nil Then
			    Dim opt As curl_easyoption = mPrev.curl_easyoption
			    Return New OptionInfo(opt)
			  End If
			End Get
		#tag EndGetter
		CurrentOption As libcURL.Opts.OptionInfo
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDataStore As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrev As Ptr
	#tag EndProperty


End Class
#tag EndClass
