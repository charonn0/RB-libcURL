#tag Class
Protected Class OptionIterator
	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not libcURL.IsAvailable Then Raise New PlatformNotSupportedException
		  If Not libcURL.Version.IsAtLeast(7, 73, 0) Then
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
		Function MoveNext() As Boolean
		  mPrev = curl_easy_option_next(mPrev)
		  Return mPrev <> Nil
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
			  If mPrev <> Nil Then
			    Dim opt As curl_easyoption = mPrev.curl_easyoption
			    Return New OptionInfo(opt)
			  End If
			End Get
		#tag EndGetter
		CurrentOption As libcURL.Opts.OptionInfo
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrev As Ptr
	#tag EndProperty


End Class
#tag EndClass
