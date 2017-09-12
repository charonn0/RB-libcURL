#tag Class
Protected Class MIMEMessage
Inherits libcURL.cURLHandle
	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As FolderItem, ContentType As String = "", AdditionalHeaders As libcURL.ListPtr = Nil, Encoding As libcURL.MIMEMessage.TransferEncoding = libcURL.MIMEMessage.TransferEncoding.Binary) As Boolean
		  Dim part As Ptr = AddPart()
		  If part = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(part, Name) Then Return False
		  If Not SetPartFile(part, Value) Then Return False
		  If ContentType <> "" Then
		    If Not SetPartType(part, ContentType) Then Return False
		  End If
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(part, AdditionalHeaders, False) Then Return False
		  End If
		  If Encoding <> TransferEncoding.Binary Then
		    If Not SetPartEncoding(part, encoding) Then Return False
		  End If
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As libcURL.MIMEMessage, AdditionalHeaders As libcURL.ListPtr = Nil) As Boolean
		  If Value Is Me Then
		    mLastError = libcURL.Errors.CALL_LOOP_DETECTED
		    Raise New cURLException(Me)
		  End If
		  
		  Dim part As Ptr = AddPart()
		  If part = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(part, Name) Then Return False
		  If Not SetPartSubparts(part, Value) Then Return False
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(part, AdditionalHeaders, False) Then Return False
		  End If
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddElement(Name As String, ValueStream As Readable, ValueSize As Integer, Filename As String = "", ContentType As String = "", AdditionalHeaders As libcURL.ListPtr = Nil, Encoding As libcURL.MIMEMessage.TransferEncoding = libcURL.MIMEMessage.TransferEncoding.Binary) As Boolean
		  Dim part As Ptr = AddPart()
		  If part = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(part, Name) Then Return False
		  If Filename <> "" Then
		    If Not SetPartFileName(part, Filename + Chr(0)) Then Return False
		  End If
		  If ContentType <> "" Then
		    If Not SetPartType(part, ContentType) Then Return False
		  End If
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(part, AdditionalHeaders, False) Then Return False
		  End If
		  If Encoding <> TransferEncoding.Binary Then
		    If Not SetPartEncoding(part, encoding) Then Return False
		  End If
		  If PartStreams = Nil Then PartStreams = New Dictionary
		  PartStreams.Value(part) = ValueStream
		  If ValueStream IsA BinaryStream Then ' seekable
		    If Not SetPartCallbacks(part, ValueSize, AddressOf ReadCallback, AddressOf SeekCallback, AddressOf FreeCallback, part) Then Return False
		  Else
		    If Not SetPartCallbacks(part, ValueSize, AddressOf ReadCallback, Nil, AddressOf FreeCallback, part) Then Return False
		  End If
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As String, AdditionalHeaders As libcURL.ListPtr = Nil, Encoding As libcURL.MIMEMessage.TransferEncoding = libcURL.MIMEMessage.TransferEncoding.Binary) As Boolean
		  Dim part As Ptr = AddPart()
		  If part = Nil Then
		    mLastError = libcURL.Errors.MIME_ADD_FAILED
		    Return False
		  End If
		  If Not SetPartName(part, Name) Then Return False
		  If Not SetPartData(part, Value) Then Return False
		  If Encoding <> TransferEncoding.Binary Then
		    If Not SetPartEncoding(part, encoding) Then Return False
		  End If
		  If AdditionalHeaders <> Nil Then
		    If Not SetPartHeaders(part, AdditionalHeaders, False) Then Return False
		  End If
		  Return mLastError = 0
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
		  If Not System.IsFunctionAvailable("curl_mime_init", "libcurl") Then
		    mLastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Me)
		  End If
		  
		  mHandle = curl_mime_init(Owner.Handle)
		  If mHandle = 0 Then
		    mLastError = libcURL.Errors.INIT_FAILED
		    Raise New cURLException(Me)
		  End If
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Sub cURLFreeCallback(UserData As Ptr)
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLReadCallback(Buffer As MemoryBlock, Size As Integer, NumItems As Integer, UserData As Ptr) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLSeekCallback(UserData As Ptr, Offset As Integer, Origin As Integer) As Integer
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
		  If PartStreams <> Nil And PartStreams.HasKey(UserData) Then PartStreams.Remove(UserData)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And mOwner.Value <> Nil And mOwner.Value IsA EasyHandle Then Return EasyHandle(mOwner.Value)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ReadCallback(Buffer As MemoryBlock, Size As Integer, NumItems As Integer, UserData As Ptr) As Integer
		  #pragma X86CallingConvention CDecl
		  
		  Dim r As Readable = PartStreams.Lookup(UserData, Nil)
		  If r = Nil Then Return 0 ' fail read
		  Dim sz As Integer = NumItems * Size
		  Dim mb As MemoryBlock = r.Read(sz)
		  If mb.Size > 0 Then Buffer.StringValue(0, mb.Size) = mb.StringValue(0, mb.Size)
		  Return mb.Size
		  
		Exception Err As RuntimeException
		  If Err IsA ThreadEndException Or Err IsA EndException Then Raise Err
		  Return CURL_READFUNC_ABORT
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SeekCallback(UserData As Ptr, Offset As Integer, Origin As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		  #pragma Unused Origin
		  
		  Dim r As Readable = PartStreams.Lookup(UserData, Nil)
		  If r = Nil Then Return 1 ' fail seek
		  If Not r IsA BinaryStream Then Return 2 ' fail seek but libcURL can try to work around it
		  Dim ps As BinaryStream = BinaryStream(r)
		  If ps.Length < Offset Then Return 2 ' fail seek but libcURL can try to work around it
		  ps.Position = Offset
		  Return 0 ' OK
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartCallbacks(Part As Ptr, ReadLength As Integer, ReadFunction As cURLReadCallback, SeekFunction As cURLSeekCallback, FreeFunction As cURLFreeCallback, UserData As Ptr) As Boolean
		  mLastError = curl_mime_data_cb(Part, ReadLength, ReadFunction, SeekFunction, FreeFunction, UserData)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartData(Part As Ptr, Data As MemoryBlock, DataLength As Integer = - 1) As Boolean
		  If DataLength = -1 Then DataLength = Data.Size
		  mLastError = curl_mime_data(Part, Data, DataLength)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SetPartEncoding(Part As Ptr, Encoding As TransferEncoding) As Boolean
		  Dim mb As MemoryBlock
		  Select Case Encoding
		  Case TransferEncoding.Binary
		    mb = "binary" + Chr(0)
		  Case TransferEncoding.SevenBit
		    mb = "7bit" + Chr(0)
		  Case TransferEncoding.EightBit
		    mb = "8bit" + Chr(0)
		  Case TransferEncoding.Base64
		    mb = "base64" + Chr(0)
		  Case TransferEncoding.QuotedPrintable
		    mb = "quoted-printable" + Chr(0)
		  End Select
		  
		  mLastError = curl_mime_encoder(Part, mb)
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
		Protected Function SetPartSubparts(Part As Ptr, Subparts As libcURL.MIMEMessage) As Boolean
		  mLastError = curl_mime_subparts(Part, Subparts.Handle)
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


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim List As Ptr = Ptr(Me.Handle)
			  If List <> Nil Then 
			    Dim m As curl_mime = List.curl_mime
			    Return New MIMEMessagePart(m.FirstPart, Me)
			  End If
			End Get
		#tag EndGetter
		FirstElement As libcURL.MIMEMessagePart
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared PartStreams As Dictionary
	#tag EndProperty


	#tag Enum, Name = TransferEncoding, Type = Integer, Flags = &h0
		Binary
		  SevenBit
		  EightBit
		  Base64
		QuotedPrintable
	#tag EndEnum


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
