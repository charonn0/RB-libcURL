#tag Class
Protected Class ResponseHeaderEngine
	#tag Method, Flags = &h1
		Protected Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count(Name As String = "", Origin As libcURL.HeaderOriginType = libcURL.HeaderOriginType.Any, RequestIndex As Integer = - 1) As Integer
		  Dim ori As UInt32 = CType(Origin, UInt32)
		  Dim this As Ptr = curl_easy_nextheader(Owner.Handle, ori, RequestIndex, Nil)
		  Dim c As Integer
		  Do Until this = Nil
		    Dim header As New ResponseHeaderCreator(Owner, this.curl_header(0))
		    If Name = "" Or Name = header.Name Then c = c + 1
		    this = curl_easy_nextheader(Owner.Handle, ori, RequestIndex, this)
		  Loop
		  
		  Return c
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeader(Name As String, Index As Integer = 0, Origin As libcURL.HeaderOriginType = libcURL.HeaderOriginType.Any, RequestIndex As Integer = - 1) As libcURL.ResponseHeader
		  Const CURLHE_BADINDEX = 1
		  Const CURLHE_BAD_ARGUMENT = 6
		  Const CURLHE_MISSING = 2
		  Const CURLHE_NOHEADERS = 3
		  Const CURLHE_NOREQUEST = 4
		  Const CURLHE_NOT_BUILT_IN = 7
		  Const CURLHE_OK = 0
		  Const CURLHE_OUT_OF_MEMORY = 5
		  
		  Dim struct As Ptr
		  Dim o As UInt32 = CType(Origin, UInt32)
		  mLastError = curl_easy_header(Owner.Handle, Name, Index, o, RequestIndex, struct)
		  Select Case mLastError
		  Case CURLHE_OK
		    Dim p As Ptr = struct.Ptr(0)
		    Return New ResponseHeaderCreator(Owner, p.curl_header(0))
		    
		  Case CURLHE_MISSING, CURLHE_NOHEADERS, CURLHE_NOREQUEST ' no such header
		    Return Nil
		    
		  Case CURLHE_BADINDEX ' there aren't that many headers with that name
		    ErrorSetter(Owner).LastError = libcURL.Errors.HEADER_INDEX_OUT_OF_BOUNDS
		    Raise New cURLException(Owner)
		    
		  Case CURLHE_BAD_ARGUMENT ' !!
		    ErrorSetter(Owner).LastError = libcURL.Errors.BAD_FUNCTION_ARGUMENT
		    Raise New cURLException(Owner)
		    
		  Case CURLHE_NOT_BUILT_IN ' feature was disabled
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Owner)
		    
		  Case CURLHE_OUT_OF_MEMORY ' halt and catch fire
		    Raise New OutOfMemoryException
		    
		  Else
		    Raise New cURLException(Owner)
		  End Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeaders(Name As String = "", Origin As libcURL.HeaderOriginType = libcURL.HeaderOriginType.Any, RequestIndex As Integer = - 1) As libcURL.ResponseHeader()
		  Dim ori As UInt32 = CType(Origin, UInt32)
		  Dim this As Ptr = curl_easy_nextheader(Owner.Handle, ori, RequestIndex, Nil)
		  Dim h() As ResponseHeader
		  Do Until this = Nil
		    Dim header As New ResponseHeaderCreator(Owner, this.curl_header(0))
		    If Name = "" Or Name = header.Name Then h.Append(header)
		    this = curl_easy_nextheader(Owner.Handle, ori, RequestIndex, this)
		  Loop
		  
		  Return h
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasHeader(Name As String, Origin As libcURL.HeaderOriginType = libcURL.HeaderOriginType.Any, RequestIndex As Integer = - 1) As Boolean
		  Dim h() As ResponseHeader = GetHeaders(Name, Origin, RequestIndex)
		  Return UBound(h) > -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And Not (mOwner.Value Is Nil) And mOwner.Value IsA libcURL.EasyHandle Then
		    Return libcURL.EasyHandle(mOwner.Value)
		  End If
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLastError
			End Get
		#tag EndGetter
		LastError As Int32
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mLastError As Int32
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
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
