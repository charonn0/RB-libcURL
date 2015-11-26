#tag Class
Protected Class WildCard
Inherits libcURL.EasyHandle
	#tag Method, Flags = &h21
		Private Shared Function ChunkBeginCallback(ByRef TransferInfo As FileInfo, UserData As Integer, Remaining As Integer) As Integer
		  #pragma X86CallingConvention CDecl
		  
		  If Instances = Nil Then Return 0
		  Dim curl As WeakRef = Instances.Lookup(UserData, Nil)
		  If curl <> Nil And curl.Value <> Nil And curl.Value IsA WildCard Then
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

	#tag Method, Flags = &h1000
		Sub Constructor(CopyOpts As libcURL.EasyHandle)
		  // Calling the overridden superclass constructor.
		  // Constructor(CopyOpts As libcURL.EasyHandle) -- From EasyHandle
		  Super.Constructor(CopyOpts)
		  If Not libcURL.Version.IsAtLeast(7, 21, 0) Then
		    Raise New PlatformNotSupportedException
		  End If
		  
		  If CopyOpts IsA WildCard Then Me.LocalRoot = WildCard(CopyOpts).LocalRoot
		  If Not Me.SetOption(libcURL.Opts.WILDCARDMATCH, True) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_BGN_FUNCTION, AddressOf ChunkBeginCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_END_FUNCTION, AddressOf ChunkEndCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_DATA, mHandle) Then Raise New libcURL.cURLException(Me)
		End Sub
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLChunkBegin(ByRef TransferInfo As FileInfo, UserData As Integer, Remaining As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag DelegateDeclaration, Flags = &h21
		Private Delegate Function cURLChunkEnd(UserData As Integer) As Integer
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function Remaining() As Integer
		  Return mRemaining
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Super.Reset
		  If Not Me.SetOption(libcURL.Opts.WILDCARDMATCH, True) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_BGN_FUNCTION, AddressOf ChunkBeginCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_END_FUNCTION, AddressOf ChunkEndCallback) Then Raise New libcURL.cURLException(Me)
		  If Not Me.SetOption(libcURL.Opts.CHUNK_DATA, mHandle) Then Raise New libcURL.cURLException(Me)
		End Sub
	#tag EndMethod

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
		  If mLastFileName = "." Or mLastFileName = ".." Then Return CURL_CHUNK_BGN_FUNC_SKIP
		  If mLastFile = Nil And LocalRoot <> Nil Then mLastFile = LocalRoot.Child(mLastFileName)
		  
		  Dim p As New Permissions(Info.Perm)
		  Select Case Info.FileType
		  Case FILETYPE_FILE
		    Me.DownloadStream = Nil
		    If RaiseEvent QueueFile(mLastFileName, mLastFile, False, p) Then Return CURL_CHUNK_BGN_FUNC_SKIP
		    If mLastFile = Nil Then Return CURL_CHUNK_BGN_FUNC_OK ' the dataavailable event will be raised
		    Try
		      Me.DownloadStream = BinaryStream.Create(mLastFile, False)
		      Return CURL_CHUNK_BGN_FUNC_OK
		    Catch Err As IOException
		      Return CURL_CHUNK_BGN_FUNC_FAIL
		    End Try
		    
		  Case FILETYPE_DIR
		    Me.DownloadStream = Nil
		    If RaiseEvent QueueFile(mLastFileName, mLastFile, True, p) Then Return CURL_CHUNK_BGN_FUNC_SKIP
		    Return CURL_CHUNK_BGN_FUNC_OK
		    
		  Else
		    Break
		  End Select
		  
		  Return CURL_CHUNK_BGN_FUNC_FAIL
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function _curlChunkEnd() As Integer
		  mLastFileName = ""
		  mLastFile = Nil
		  If Me.DownloadStream <> Nil And Me.DownloadStream IsA BinaryStream Then BinaryStream(Me.DownloadStream).Close
		  Me.DownloadStream = Nil
		  Return CURL_CHUNK_END_FUNC_OK
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event QueueFile(RemoteName As String, ByRef LocalFile As FolderItem, IsDirectory As Boolean, UnixPerms As Permissions) As Boolean
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


	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_FAIL, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_BGN_FUNC_SKIP, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_END_FUNC_FAIL, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_CHUNK_END_FUNC_OK, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_FNMATCHFUNC_FAIL, Type = Double, Dynamic = False, Default = \"2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_FNMATCHFUNC_MATCH, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_FNMATCHFUNC_NOMATCH, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_BLOCK, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_CHAR, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_DIR, Type = Double, Dynamic = False, Default = \"1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_FILE, Type = Double, Dynamic = False, Default = \"0", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_PIPE, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_SOCKET, Type = Double, Dynamic = False, Default = \"5", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FILETYPE_SYM, Type = Double, Dynamic = False, Default = \"2", Scope = Private
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
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RemoteIP"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Secure"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeOut"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UploadMode"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="URL"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseErrorBuffer"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserAgent"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Verbose"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.EasyHandle"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
