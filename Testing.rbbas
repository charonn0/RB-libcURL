#tag Module
Protected Module Testing
	#tag Method, Flags = &h21
		Private Sub Assert(b As Boolean)
		  If Not b Then Raise New RuntimeException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RunTests() As Boolean
		  Try
		    TestEasyHandle()
		  Catch
		    Return False
		  End Try
		  
		  Try
		    TestListPtr()
		  Catch
		    Return False
		  End Try
		  
		  Try
		    TestMultiForm()
		  Catch
		    Return False
		  End Try
		  
		  Try
		    TestMultiHandle()
		  Catch
		    Return False
		  End Try
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestEasyHandle()
		  Dim c As New libcURL.EasyHandle
		  Assert(c <> Nil)
		  Assert(c.Handle <> 0)
		  c.AutoDisconnect = True
		  c.CA_ListFile = libcURL.Default_CA_File
		  c.ConnectionTimeout = 304
		  c.ConnectionType = libcURL.Opts.USE_SSL_TRY
		  c.CookieJar = GetTemporaryFolderItem
		  c.FailOnServerError = True
		  c.FollowRedirects = True
		  c.HTTPVersion = c.HTTP_VERSION_1_0
		  c.LocalPort = 99
		  'Assert(c.LocalPort = 99)
		  c.NetworkInterface = System.GetNetworkInterface(0)
		  'Assert(c.NetworkInterface = System.GetNetworkInterface(0))
		  c.Password = "password"
		  Assert(c.Password = "password")
		  c.Port = 98
		  'Assert(c.Port = 98)
		  c.Secure = True
		  Assert(c.Secure = True)
		  c.TimeOut = 1001
		  Assert(c.TimeOut = 1001)
		  c.UploadMode = True
		  Assert(c.UploadMode = True)
		  c.URL = "www.example.net/"
		  Assert(c.URL = "www.example.net/")
		  c.UseErrorBuffer = True
		  Assert(c.UseErrorBuffer = True)
		  c.UserAgent = "Test agent"
		  Assert(c.UserAgent = "Test agent")
		  c.Username = "Testy"
		  Assert(c.Username = "Testy")
		  c.Verbose = True
		  Assert(c.Verbose = True)
		  
		  Dim c2 As New libcURL.EasyHandle(c)
		  Assert(c2 <> Nil)
		  Assert(c2.Handle <> 0)
		  Assert(c.AutoDisconnect = c2.AutoDisconnect)
		  Assert(c.CA_ListFile = c2.CA_ListFile)
		  Assert(c.ConnectionTimeout = c2.ConnectionTimeout)
		  Assert(c.ConnectionType = c2.ConnectionType)
		  Assert(c.CookieJar = c2.CookieJar)
		  Assert(c.FailOnServerError = c2.FailOnServerError)
		  Assert(c.FollowRedirects = c2.FollowRedirects)
		  Assert(c.HTTPVersion = c2.HTTPVersion)
		  Assert(c.LocalPort = c2.LocalPort)
		  Assert(c.NetworkInterface = c2.NetworkInterface)
		  Assert(c.Password = c2.Password)
		  Assert(c.Port = c2.Port)
		  Assert(c.Secure = c2.Secure)
		  Assert(c.TimeOut = c2.TimeOut)
		  Assert(c.UploadMode = c2.UploadMode)
		  Assert(c.URL = c2.URL)
		  Assert(c.UseErrorBuffer = c2.UseErrorBuffer)
		  Assert(c.UserAgent = c2.UserAgent)
		  Assert(c.Username = c2.Username)
		  Assert(c.Verbose = c2.Verbose)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestListPtr()
		  Dim l As New libcURL.ListPtr
		  Assert(l <> Nil)
		  If Not l.Append("Hello") Then Raise New libcURL.cURLException(l)
		  If Not l.Append("World") Then Raise New libcURL.cURLException(l)
		  If Not l.Append("!!") Then Raise New libcURL.cURLException(l)
		  
		  Assert(l.Handle <> 0)
		  Assert(l.Count = 3)
		  Assert(l.Item(0) = "Hello")
		  Assert(l.Item(1) = "World")
		  Assert(l.Item(2) = "!!")
		  
		  l.Free
		  Assert(l.Count = 0)
		  l = Split("This is a test string", " ")
		  Assert(l.Item(0) = "This")
		  Assert(l.Item(1) = "is")
		  Assert(l.Item(2) = "a")
		  Assert(l.Item(3) = "test")
		  Assert(l.Item(4) = "string")
		  Dim s() As String = l
		  Assert(UBound(s) + 1 = l.Count)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestMultiForm()
		  Dim m As New libcURL.MultipartForm
		  Assert(m <> Nil)
		  If Not m.AddElement("TestString", "Test Value1") Then Raise New libcURL.cURLException(m)
		  If Not m.AddElement("TestString", "Test Value2") Then Raise New libcURL.cURLException(m)
		  If Not m.AddElement("TestFile1", App.ExecutableFile) Then Raise New libcURL.cURLException(m)
		  If Not m.AddElement("TestFile2", App.ExecutableFile, "application/sgml") Then Raise New libcURL.cURLException(m)
		  Dim data As MemoryBlock = m.Serialize()
		  Assert(data <> Nil)
		  Assert(data.Size > App.ExecutableFile.Length)
		  
		  Dim m2 As libcURL.MultipartForm = New Dictionary("TestString":"Test Value1", "TestString":"Test Value2", "TestFile1":App.ExecutableFile)
		  data = m2.Serialize()
		  Assert(data <> Nil)
		  Assert(data.Size > App.ExecutableFile.Length)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestMultiHandle()
		  Dim m As New libcURL.MultiHandle
		  Assert(m <> Nil)
		  Dim c As New libcURL.EasyHandle
		  c.URL = "http://www.example.net/"
		  Dim data As New MemoryBlock(0)
		  Dim downstream As New BinaryStream(data)
		  c.DownloadStream = downstream
		  If Not m.AddItem(c) Then Raise New libcURL.cURLException(m)
		  Assert(m.HasItem(c))
		  
		  While m.PerformOnce
		    App.YieldToNextThread
		  Wend
		  downstream.Close
		  Assert(Not m.HasItem(c))
		  Assert(c.GetInfo(libcURL.Info.RESPONSE_CODE) = 200)
		  Assert(data.Size > 0)
		  Assert(data.Size = c.GetInfo(libcURL.Info.SIZE_DOWNLOAD))
		End Sub
	#tag EndMethod


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
End Module
#tag EndModule
