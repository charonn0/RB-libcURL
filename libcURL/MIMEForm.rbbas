#tag Class
Protected Class MIMEForm
Inherits libcURL.cURLHandle
	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As FolderItem, ContentType As String = "", AdditionalHeaders As libcURL.ListPtr = Nil) As Boolean
		  Dim element As Ptr = AddPart()
		  If element = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(element, Name) Then Return False
		  If Not SetPartFile(element, Value) Then Return False
		  If ContentType <> "" Then 
		    If Not SetPartType(element, ContentType) Then Return False
		  End If
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(element, AdditionalHeaders, False) Then Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddElement(Name As String, ValueStream As Readable, ValueSize As Integer, Filename As String = "", ContentType As String = "", AdditionalHeaders As libcURL.ListPtr = Nil) As Boolean
		  Dim element As Ptr = AddPart()
		  If element = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(element, Name) Then Return False
		  If Filename <> "" Then
		    If Not SetPartFileName(element, Filename + Chr(0)) Then Return False
		  End If
		  If ContentType <> "" Then
		    If Not SetPartType(element, ContentType) Then Return False
		  End If
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(element, AdditionalHeaders, False) Then Return False
		  End If
		  If PartStreams = Nil Then PartStreams = New Dictionary
		  PartStreams.Value(element) = ValueStream
		  If Not SetPartCallbacks(element, ValueSize, AddressOf ReadCallback, AddressOf SeekCallback, AddressOf FreeCallback, element) Then Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As String, AdditionalHeaders As libcURL.ListPtr = Nil) As Boolean
		  Dim element As Ptr = AddPart()
		  If element = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(element, Name) Then Return False
		  If Not SetPartData(element, Value) Then Return False
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(element, AdditionalHeaders, False) Then Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function AddPart() As Ptr
		  Return curl_mime_addpart(mHandle)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  Super.Constructor(Owner.Flags)
		  mHandle = curl_mime_init(Owner.Handle)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Sub cURLFreeCallback(UserData As Ptr)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function cURLReadCallback(Buffer As Ptr, Size As Integer, NumItems As Integer, UserData As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h1
		Protected Delegate Function cURLSeekCallback(UserData As Ptr, Offset As Integer, Origin As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  If mHandle <> 0 Then curl_mime_free(mHandle)
		  mHandle = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub FreeCallback(UserData As Ptr)
		  #pragma X86CallingConvention CDecl
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ReadCallback(Buffer As Ptr, Size As Integer, NumItems As Integer, UserData As Ptr) As Integer
		  #pragma X86CallingConvention CDecl
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SeekCallback(UserData As Ptr, Offset As Integer, Origin As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartCallbacks(Part As Ptr, ReadLength As Integer, ReadFunction As cURLReadCallback, SeekFunction As cURLSeekCallback, FreeFunction As cURLFreeCallback, UserData As Ptr) As Boolean
		  mLastError = curl_mime_data_cb(Part, ReadLength, ReadFunction, SeekFunction, FreeFunction, UserData)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartData(Part As Ptr, Data As MemoryBlock, DataLength As Integer = -1) As Boolean
		  If DataLength = -1 Then DataLength = Data.Size
		  mLastError = curl_mime_data(Part, Data, DataLength)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartFile(Part As Ptr, File As FolderItem) As Boolean
		  Dim mb As MemoryBlock = File.AbsolutePath + Chr(0)
		  mLastError = curl_mime_filedata(Part, mb)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartFileName(Part As Ptr, Filename As String) As Boolean
		  Dim mb As MemoryBlock = Filename + Chr(0)
		  mLastError = curl_mime_filename(Part, mb)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartHeaders(Part As Ptr, Headers As libcURL.ListPtr, TakeOwnerShip As Boolean) As Boolean
		  Dim own As Integer
		  If TakeOwnerShip Then own = 1
		  mLastError = curl_mime_headers(Part, Headers.Handle, own)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartName(Part As Ptr, Name As String) As Boolean
		  Dim mb As MemoryBlock = Name
		  mLastError = curl_mime_name(Part, mb, mb.Size)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartSubparts(Part As Ptr, Subparts As Ptr) As Boolean
		  mLastError = curl_mime_subparts(Part, Subparts)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartType(Part As Ptr, MIMEType As String) As Boolean
		  Dim mb As MemoryBlock = MIMEType + Chr(0)
		  mLastError = curl_mime_type(Part, mb)
		  Return mLastError = 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared PartStreams As Dictionary
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
