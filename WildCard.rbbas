#tag Class
Protected Class WildCard
Inherits libcURL.EasyHandle
	#tag Event
		Function DataAvailable(NewData As MemoryBlock) As Integer
		  #pragma Unused NewData
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Function DataNeeded(Buffer As MemoryBlock, MaxLength As Integer) As Integer
		  #pragma Unused Buffer
		  #pragma Unused MaxLength
		  Break
		End Function
	#tag EndEvent

	#tag Event
		Function SeekStream(Offset As Integer, Origin As Integer) As Boolean
		  #pragma Unused Offset
		  #pragma Unused Origin
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Shared Function ChunkBeginCallback(ByRef TransferInfo As FileInfo, UserData As Integer, Remaining As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		  If Instances = Nil Then Return 0
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil And curl.Value <> Nil And curl.Value IsA WildCard Then
		    'Dim info As FileInfo
		    'Dim mb As MemoryBlock = TransferInfo'.Ptr(0)
		    'info.StringValue(TargetLittleEndian) = mb.StringValue(0, info.Size)
		    Return WildCard(curl.Value)._curlChunkBegin(TransferInfo, Remaining)
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		  Return CURL_CHUNK_BGN_FUNC_FAIL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ChunkEndCallback(UserData As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		  If Instances = Nil Then Return 0
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil And curl.Value <> Nil And curl.Value IsA WildCard Then
		    Return WildCard(curl.Value)._curlChunkEnd()
		  End If
		  
		  Break ' UserData does not refer to a valid instance!
		  Return CURL_CHUNK_END_FUNC_FAIL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(GlobalInitFlags As Integer = libcURL.CURL_GLOBAL_DEFAULT)
		  Super.Constructor(GlobalInitFlags)
		  If Not libcURL.Version.IsAtLeast(7, 21, 0) Then
		    Raise New PlatformNotSupportedException
		  End If
		  
		  If Not Me.SetOption(libcURL.Opts.WILDCARDMATCH, True) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_BGN_FUNCTION, AddressOf ChunkBeginCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_END_FUNCTION, AddressOf ChunkEndCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_DATA, mHandle) Then Raise New libcURL.cURLException(Me)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLChunkBegin(TransferInfo As FileInfo, UserData As Integer, Remaining As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLChunkEnd(UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function SetOption(OptionNumber As Integer, NewValue As Variant) As Boolean
		  If NewValue IsA cURLChunkBegin Then
		    Dim p As cURLChunkBegin = NewValue
		    Return Me.SetOptionPtr(OptionNumber, p)
		  ElseIf NewValue IsA cURLChunkEnd Then
		    Dim p As cURLChunkEnd = NewValue
		    Return Me.SetOptionPtr(OptionNumber, p)
		  End If
		  
		  Return Super.SetOption(OptionNumber, NewValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _curlChunkBegin(Info As FileInfo, Remaining As Integer) As Integer
		  mRemaining = Remaining
		  Dim mb As MemoryBlock = Info.FileName
		  mLastFileName = mb.CString(0)
		  mLastFile = LocalRoot.Child(mLastFileName)
		  
		  If RaiseEvent BeginTransfer(mLastFileName, mLastFile) Then Return CURL_CHUNK_BGN_FUNC_SKIP
		  If mLastFile <> Nil Then
		    Me.DownloadStream = BinaryStream.Create(mLastFile, False)
		  Else
		    Return CURL_CHUNK_BGN_FUNC_FAIL
		  End If
		  If Me.DownloadStream <> Nil Then Return CURL_CHUNK_BGN_FUNC_OK
		  Return CURL_CHUNK_BGN_FUNC_FAIL
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _curlChunkEnd() As Integer
		  If RaiseEvent FinishTransfer(mLastFileName, mLastFile) Then Return CURL_CHUNK_END_FUNC_FAIL ' return true to fail/abort
		  mLastFileName = ""
		  mLastFile = Nil
		  If Me.DownloadStream <> Nil And Me.DownloadStream IsA BinaryStream Then BinaryStream(Me.DownloadStream).Close
		  Me.DownloadStream = Nil
		  Return CURL_CHUNK_END_FUNC_OK
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event BeginTransfer(FileName As String, ByRef LocalFile As FolderItem) As Boolean
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FinishTransfer(FileName As String, LocalFile As FolderItem) As Boolean
	#tag EndHook


	#tag Property, Flags = &h0
		LocalRoot As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFile As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFileName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRemaining As Integer
	#tag EndProperty


	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_FAIL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_SKIP, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_END_FUNC_FAIL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_END_FUNC_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = FileInfo, Flags = &h1
		FileName As Ptr
		  FileType As UInt32
		  Time As UInt32
		  Perm As UInt32
		  UID As Int32
		  GID As Int32
		  FileSize As Integer
		HardLinks As Integer
	#tag EndStructure


	#tag Enum, Name = FileTypes, Type = Integer, Flags = &h1
		File
		  Directory
		  Symlink
		  BlockDevice
		  CharacterDevice
		  NamedPipe
		Socket
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
