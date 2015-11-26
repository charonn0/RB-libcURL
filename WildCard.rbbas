#tag Class
Protected Class WildCard
	#tag Method, Flags = &h21
		Private Shared Function ChunkBeginCallback(TransferInfo As Ptr, UserData As Integer, Remaining As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		  If Instances = Nil Then Return 0
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil And curl.Value <> Nil And curl.Value IsA WildCard Then
		    Dim info As FileInfo
		    Dim mb As MemoryBlock = TransferInfo.Ptr(0)
		    info.StringValue(TargetLittleEndian) = mb.StringValue(0, info.Size)
		    Return WildCard(curl.Value)._curlChunkBegin(info, Remaining)
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
		Sub Constructor(Owner As libcURL.EasyHandle)
		  If Not libcURL.Version.IsAtLeast(7, 21, 0) Then
		    Raise New PlatformNotSupportedException
		  End If
		  mOwner = Owner
		  If Not mOwner.SetOption(WILDCARDMATCH, True) Then Raise New libcURL.cURLException(mOwner)
		  If Not mOwner.SetOptionPtr(CHUNK_BGN_FUNCTION, AddressOf ChunkBeginCallback) Then Raise New libcURL.cURLException(mOwner)
		  If Not mOwner.SetOptionPtr(CHUNK_END_FUNCTION, AddressOf ChunkEndCallback) Then Raise New libcURL.cURLException(mOwner)
		  If Not mOwner.SetOption(CHUNK_DATA, mOwner.Handle) Then Raise New libcURL.cURLException(mOwner)
		  If Instances = Nil Then Instances = New Dictionary
		  Instances.Value(mOwner.Handle) = New WeakRef(mOwner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _curlChunkBegin(Info As FileInfo, Remaining As Integer) As Integer
		  mLastFile = Info
		  mRemaining = Remaining
		  Dim skip As Boolean
		  mOwner.DownloadStream = RaiseEvent GetStream(mLastFile.FileName.CString(0), skip)
		  If skip Then Return CURL_CHUNK_BGN_FUNC_SKIP
		  If mOwner.DownloadStream <> Nil Then Return CURL_CHUNK_BGN_FUNC_OK
		  Return CURL_CHUNK_BGN_FUNC_FAIL
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _curlChunkEnd() As Integer
		  RaiseEvent FinishStream(mLastFile.FileName.CString(0))
		  Return CURL_CHUNK_END_FUNC_OK
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FinishStream(FileName As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event GetStream(FileName As String, ByRef Skip As Boolean) As Writeable
	#tag EndHook


	#tag Property, Flags = &h21
		Private Shared Instances As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFile As FileInfo
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mOwner As libcURL.EasyHandle
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRemaining As Integer
	#tag EndProperty


	#tag Constant, Name = CHUNK_BGN_FUNCTION, Type = Double, Dynamic = False, Default = \"20198", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHUNK_DATA, Type = Double, Dynamic = False, Default = \"10201", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHUNK_END_FUNCTION, Type = Double, Dynamic = False, Default = \"20199", Scope = Protected
	#tag EndConstant

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

	#tag Constant, Name = WILDCARDMATCH, Type = Double, Dynamic = False, Default = \"197", Scope = Protected
	#tag EndConstant


	#tag Structure, Name = FileInfo, Flags = &h1
		FileName As Ptr
		  FileType As Int16
		  Time As Integer
		  Perm As UInt32
		  UID As Integer
		  GID As Integer
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
