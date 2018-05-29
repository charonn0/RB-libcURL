#tag Module
Protected Module Testing
	#tag Method, Flags = &h21
		Private Sub Assert(b As Boolean)
		  If Not b Then Raise New RuntimeException
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function RunTests() As Boolean
		  TestResult = 0
		  Try
		    TestEasyHandle()
		  Catch
		    TestResult = 1
		    Return False
		  End Try
		  
		  Try
		    TestListPtr()
		  Catch
		    TestResult = 2
		    Return False
		  End Try
		  
		  Try
		    TestMultiForm()
		  Catch
		    TestResult = 3
		    Return False
		  End Try
		  
		  Try
		    TestMultiHandle()
		  Catch
		    TestResult = 4
		    Return False
		  End Try
		  
		  Try
		    TestCookieEngine()
		  Catch
		    TestResult = 5
		    Return False
		  End Try
		  
		  Try
		    TestDateParse()
		  Catch
		    TestResult = 6
		    Return False
		  End Try
		  
		  Try
		    TestMIMEMessage()
		  Catch
		    TestResult = 7
		    Return False
		  End Try
		  
		  Try
		    TestShareHandle()
		  Catch
		    TestResult = 8
		    Return False
		  End Try
		  
		  Try
		    TestRequestHeaderEngine()
		  Catch
		    TestResult = 9
		    Return False
		  End Try
		  
		  #If RunLiveTests Then
		    Return Testing.LiveTests.RunTests()
		  #else
		    Return True
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCookieEngine()
		  Dim c As New cURLClient
		  c.Cookies.Enabled = True
		  
		  Dim expiry As Date
		  Assert(libcURL.ParseDate("Wed, 21 Apr 2021 02:55:26 GMT", expiry))
		  
		  Assert(c.SetCookie("test1", "value1", "www.example.com", Nil, "", True))
		  Assert(c.SetCookie("test2", "value2", "api.example.com", expiry))
		  Assert(c.SetCookie("test3", "value3", "example.com", Nil, "/bin"))
		  Assert(c.SetCookie("test4", "value4", ".example.com"))
		  Assert(c.SetCookie("test5", "value5", "example.net", expiry))
		  
		  Assert(c.Cookies.Count = 5)
		  
		  Dim index As Integer
		  Do Until index = -1
		    index = c.Cookies.Lookup("test1", "www.example.com", index)
		    If index > -1 Then
		      Assert(c.Cookies.HTTPOnly(index))
		      Assert(c.Cookies.Expiry(index) = Nil)
		      Assert(c.Cookies.Name(index) = "test1")
		      Assert(c.Cookies.Value(index) = "value1")
		      Assert(c.Cookies.Domain(index) = ".www.example.com")
		      Assert(c.Cookies.Path(index) = "/")
		      index = index + 1
		    End If
		  Loop
		  
		  index = 0
		  
		  Do Until index = -1
		    index = c.Cookies.Lookup("test2", "api.example.com", index)
		    If index > -1 Then
		      Assert(Not c.Cookies.HTTPOnly(index))
		      Dim d As Date = c.Cookies.Expiry(index)
		      Assert(d.Day = expiry.Day And d.Month = expiry.Month And d.Year = expiry.Year And d.Hour = expiry.Hour And d.Minute = expiry.Minute And d.Second = expiry.Second)
		      Assert(c.Cookies.Name(index) = "test2")
		      Assert(c.Cookies.Value(index) = "value2")
		      Assert(c.Cookies.Domain(index) = ".api.example.com")
		      Assert(c.Cookies.Path(index) = "/")
		      index = index + 1
		    End If
		  Loop
		  
		  index = 0
		  index = c.Cookies.Lookup("test3", "example.com", index)
		  
		  If index > -1 Then
		    Assert(Not c.Cookies.HTTPOnly(index))
		    Assert(c.Cookies.Expiry(index) = Nil)
		    Assert(c.Cookies.Name(index) = "test3")
		    Assert(c.Cookies.Value(index) = "value3")
		    Assert(c.Cookies.Domain(index) = ".example.com")
		    Assert(c.Cookies.Path(index) = "/bin")
		  End If
		  
		  index = 0
		  index = c.Cookies.Lookup("test4", ".example.com", 3)
		  
		  If index > -1 Then
		    Assert(Not c.Cookies.HTTPOnly(index))
		    Assert(c.Cookies.Expiry(index) = Nil)
		    Assert(c.Cookies.Name(index) = "test4")
		    Assert(c.Cookies.Value(index) = "value4")
		    Assert(c.Cookies.Domain(index) = ".example.com")
		    Assert(c.Cookies.Path(index) = "/")
		  End If
		  
		  index = 0
		  index = c.Cookies.Lookup("test5", "", index)
		  
		  If index > -1 Then
		    Assert(Not c.Cookies.HTTPOnly(index))
		    Dim d As Date = c.Cookies.Expiry(index)
		    Assert(d.Day = expiry.Day And d.Month = expiry.Month And d.Year = expiry.Year And d.Hour = expiry.Hour And d.Minute = expiry.Minute And d.Second = expiry.Second)
		    Assert(c.Cookies.Name(index) = "test5")
		    Assert(c.Cookies.Value(index) = "value5")
		    Assert(c.Cookies.Domain(index) = ".example.net")
		    Assert(c.Cookies.Path(index) = "/")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestDateParse()
		  Dim expiry As Date
		  Assert(libcURL.ParseDate("Wed, 21 Apr 2021 02:55:26 GMT", expiry))
		  Assert(expiry.DayOfWeek = 4) ' wed
		  Assert(expiry.GMTOffset = 0)
		  Assert(expiry.Hour = 2)
		  Assert(expiry.Minute = 55)
		  Assert(expiry.Second = 26)
		  Assert(expiry.Month = 4) ' april
		  Assert(expiry.Day = 21)
		  
		  Assert(libcURL.ParseDate("Sun, 06 Nov 1994 08:49:37 CET", expiry))
		  Assert(expiry.DayOfWeek = 1) ' sun
		  Assert(expiry.GMTOffset = 0)
		  Assert(expiry.Hour = 7)
		  Assert(expiry.Minute = 49)
		  Assert(expiry.Second = 37)
		  Assert(expiry.Month = 11) ' nov
		  Assert(expiry.Day = 6)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestEasyHandle()
		  Dim c As New libcURL.EasyHandle
		  Assert(c <> Nil)
		  Assert(c.Handle <> 0)
		  c.AutoDisconnect = True
		  c.CA_ListFile = libcURL.Default_CA_File
		  c.ConnectionTimeout = 304
		  If libcURL.Version.SSL Then c.ConnectionType = libcURL.ConnectionType.AttemptSSL
		  'c.CookieJar = GetTemporaryFolderItem
		  c.FailOnServerError = True
		  c.FollowRedirects = True
		  c.HTTPVersion = libcURL.HTTPVersion.HTTP1_0
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
		  'Assert(c.CookieJar = c2.CookieJar)
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
		  Assert(l.Count = 0)
		  Dim l2 As New libcURL.ListPtr
		  Assert(l = l2)
		  l2 = New libcURL.ListPtr(Nil, libcURL.CURL_GLOBAL_WIN32)
		  Assert(l <> l2)
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
		  Assert(l.Handle = 0)
		  
		  l = Split("This is a test string", " ")
		  Assert(l.Handle <> 0)
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
		Private Sub TestMIMEMessage()
		  If Not libcURL.Version.IsAtLeast(7, 56, 0) Then Return
		  Dim e As New libcURL.EasyHandle
		  Dim m As New libcURL.MIMEMessage(e)
		  Assert(m <> Nil)
		  Assert(m.AddElement("TestString", "Test Value1"))
		  Assert(m.AddElement("TestString", "Test Value2"))
		  Assert(m.AddElement("TestFile1", App.ExecutableFile))
		  Assert(m.AddElement("TestFile2", App.ExecutableFile, "application/sgml"))
		  Dim test As MemoryBlock = "This is a test string!"
		  Dim bs1 As New BinaryStream(test)
		  Dim bs2 As New BinaryStream(test)
		  Assert(m.AddElement("TestStream1", bs1, test.Size, "file1.name", "application/sgml"))
		  Assert(m.AddElement("TestStream2", bs2, test.Size, "file2.name", "application/xml"))
		  
		  Assert(m.GetElement(0).Name = "TestString")
		  Assert(m.GetElement(0).Data = "Test Value1")
		  Assert(m.GetElement(0).Type = libcURL.MIMEPartType.Data)
		  
		  Assert(m.GetElement(1).Name = "TestString")
		  Assert(m.GetElement(1).Data = "Test Value2")
		  Assert(m.GetElement(1).Type = libcURL.MIMEPartType.Data)
		  
		  Assert(m.GetElement(2).Name = "TestFile1")
		  Assert(m.GetElement(2).Data = App.ExecutableFile.AbsolutePath)
		  #If TargetWin32 Then
		    Assert(m.GetElement(2).ContentType = "application/x-msdownload")
		  #endif
		  Assert(m.GetElement(2).Type = libcURL.MIMEPartType.File)
		  
		  Assert(m.GetElement(3).Name = "TestFile2")
		  Assert(m.GetElement(3).Data = App.ExecutableFile.AbsolutePath)
		  Assert(m.GetElement(3).ContentType = "application/sgml")
		  Assert(m.GetElement(3).Type = libcURL.MIMEPartType.File)
		  
		  Assert(m.GetElement(4).Name = "TestStream1")
		  Assert(m.GetElement(4).Stream Is bs1)
		  Assert(m.GetElement(4).ContentType = "application/sgml")
		  Assert(m.GetElement(4).Type = libcURL.MIMEPartType.Callback)
		  
		  Assert(m.GetElement(5).Name = "TestStream2")
		  Assert(m.GetElement(5).Stream Is bs2)
		  Assert(m.GetElement(5).ContentType = "application/xml")
		  Assert(m.GetElement(5).Type = libcURL.MIMEPartType.Callback)
		  
		  
		  Dim outer As New libcURL.MIMEMessage(m.Owner)
		  Call outer.AddElement("Outer Message", m)
		  
		  Assert(outer.GetElement(0).Name = "Outer Message")
		  Assert(outer.GetElement(0).SubPart.GetElement(0).Name = "TestString")
		  Assert(outer.GetElement(0).SubPart.GetElement(0).Data = "Test Value1")
		  Assert(outer.GetElement(0).SubPart.GetElement(0).Type = libcURL.MIMEPartType.Data)
		  
		  Assert(outer.GetElement(0).SubPart.GetElement(1).Name = "TestString")
		  Assert(outer.GetElement(0).SubPart.GetElement(1).Data = "Test Value2")
		  Assert(outer.GetElement(0).SubPart.GetElement(1).Type = libcURL.MIMEPartType.Data)
		  
		  Assert(outer.GetElement(0).SubPart.GetElement(2).Name = "TestFile1")
		  Assert(outer.GetElement(0).SubPart.GetElement(2).Data = App.ExecutableFile.AbsolutePath)
		  #If TargetWin32 Then
		    Assert(outer.GetElement(0).SubPart.GetElement(2).ContentType = "application/x-msdownload")
		  #endif
		  Assert(outer.GetElement(0).SubPart.GetElement(2).Type = libcURL.MIMEPartType.File)
		  
		  Assert(outer.GetElement(0).SubPart.GetElement(3).Name = "TestFile2")
		  Assert(outer.GetElement(0).SubPart.GetElement(3).Data = App.ExecutableFile.AbsolutePath)
		  Assert(outer.GetElement(0).SubPart.GetElement(3).ContentType = "application/sgml")
		  Assert(outer.GetElement(0).SubPart.GetElement(3).Type = libcURL.MIMEPartType.File)
		  
		  Assert(outer.GetElement(0).SubPart.GetElement(4).Name = "TestStream1")
		  Assert(outer.GetElement(0).SubPart.GetElement(4).Stream Is bs1)
		  Assert(outer.GetElement(0).SubPart.GetElement(4).ContentType = "application/sgml")
		  Assert(outer.GetElement(0).SubPart.GetElement(4).Type = libcURL.MIMEPartType.Callback)
		  
		  Assert(outer.GetElement(0).SubPart.GetElement(5).Name = "TestStream2")
		  Assert(outer.GetElement(0).SubPart.GetElement(5).Stream Is bs2)
		  Assert(outer.GetElement(0).SubPart.GetElement(5).ContentType = "application/xml")
		  Assert(outer.GetElement(0).SubPart.GetElement(5).Type = libcURL.MIMEPartType.Callback)
		  
		  e = Nil
		  #pragma BreakOnExceptions Off
		  Try
		    Call m.AddElement("This should", "raise an exception")
		    Assert(False) ' It didn't!
		  Catch err As libcURL.cURLException
		    Assert(err.ErrorNumber = libcURL.Errors.MIME_OWNER_MISSING)
		  End Try
		  
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
		  Dim test As MemoryBlock = "This is a test string!"
		  Dim bs1 As New BinaryStream(test)
		  Dim bs2 As New BinaryStream(test)
		  If Not m.AddElement("TestStream1", bs1, test.Size, "file1.name", "application/sgml") Then Raise New libcURL.cURLException(m)
		  If Not m.AddElement("TestStream2", bs2, test.Size, "file2.name", "application/xml") Then Raise New libcURL.cURLException(m)
		  Dim tmp1, tmp2 As FolderItem
		  tmp1 = GetTemporaryFolderItem()
		  tmp2 = GetTemporaryFolderItem()
		  Dim bs As BinaryStream = BinaryStream.Open(tmp1, True)
		  bs.Write("This is test file #1.")
		  bs.Close
		  bs = BinaryStream.Open(tmp2, True)
		  bs.Write("This is test file #2.")
		  bs.Close
		  If Not m.AddElement("TestArray", Array(tmp1, tmp2)) Then Raise New libcURL.cURLException(m)
		  
		  
		  Dim data As MemoryBlock = m.Serialize()
		  Assert(data <> Nil)
		  Assert(data.Size > App.ExecutableFile.Length)
		  
		  Assert(m.GetElement(0).Name = "TestString")
		  Assert(m.GetElement(0).Contents = "Test Value1")
		  Assert(m.GetElement(0).Type = libcURL.FormElementType.String)
		  
		  Assert(m.GetElement(1).Name = "TestString")
		  Assert(m.GetElement(1).Contents = "Test Value2")
		  Assert(m.GetElement(1).Type = libcURL.FormElementType.String)
		  
		  Assert(m.GetElement(2).Name = "TestFile1")
		  Assert(m.GetElement(2).Contents = App.ExecutableFile.ShellPath)
		  #If TargetWin32 Then
		    Assert(m.GetElement(2).ContentType = "application/x-msdownload")
		  #endif
		  Assert(m.GetElement(2).Type = libcURL.FormElementType.File)
		  
		  Assert(m.GetElement(3).Name = "TestFile2")
		  Assert(m.GetElement(3).Contents = App.ExecutableFile.ShellPath)
		  Assert(m.GetElement(3).ContentType = "application/sgml")
		  Assert(m.GetElement(3).Type = libcURL.FormElementType.File)
		  
		  Assert(m.GetElement(4).Name = "TestStream1")
		  Assert(m.GetElement(4).Stream Is bs1)
		  Assert(m.GetElement(4).ContentType = "application/sgml")
		  Assert(m.GetElement(4).Type = libcURL.FormElementType.Stream)
		  
		  Assert(m.GetElement(5).Name = "TestStream2")
		  Assert(m.GetElement(5).Stream Is bs2)
		  Assert(m.GetElement(5).ContentType = "application/xml")
		  Assert(m.GetElement(5).Type = libcURL.FormElementType.Stream)
		  
		  Assert(m.GetElement(6).Name = "TestArray")
		  Dim mpe As libcURL.MultipartFormElement = m.GetElement(6).MoreFiles
		  Assert(mpe <> Nil)
		  Assert(mpe.MoreFiles = Nil)
		  Assert(m.GetElement(6).Type = libcURL.FormElementType.FileArray)
		  
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

	#tag Method, Flags = &h21
		Private Sub TestRequestHeaderEngine()
		  Dim c As New cURLClient
		  
		  Assert(c.RequestHeaders.Count = 0)
		  
		  c.RequestHeaders.SetHeader("X-Test-Header1", "TestValue1")
		  Assert(c.RequestHeaders.Count = 1)
		  Assert(c.RequestHeaders.Name(0) = "X-Test-Header1")
		  Assert(c.RequestHeaders.Value(0) = "TestValue1")
		  Assert(c.RequestHeaders.HasHeader("X-Test-Header1"))
		  Assert(c.RequestHeaders.GetHeader("X-Test-Header1") = "TestValue1")
		  
		  c.RequestHeaders.SetHeader("X-Test-Header2", "TestValue2")
		  Assert(c.RequestHeaders.Count = 2)
		  Assert(c.RequestHeaders.Name(1) = "X-Test-Header2")
		  Assert(c.RequestHeaders.Value(1) = "TestValue2")
		  Assert(c.RequestHeaders.HasHeader("X-Test-Header2"))
		  Assert(c.RequestHeaders.GetHeader("X-Test-Header2") = "TestValue2")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestShareHandle()
		  Dim s As New libcURL.ShareHandle
		  Assert(s <> Nil)
		  
		  s.ShareCookies = True
		  s.ShareDNSCache = True
		  s.ShareSSL = True
		  If libcURL.Version.IsAtLeast(7, 57, 0) Then
		    s.ShareConnections = True
		  End If
		  
		  Dim c1 As New libcURL.EasyHandle
		  c1.URL = "http://www.example.net/"
		  Dim data1 As New MemoryBlock(0)
		  Dim downstream1 As New BinaryStream(data1)
		  c1.DownloadStream = downstream1
		  If Not s.AddItem(c1) Then Raise New libcURL.cURLException(s)
		  Assert(s.HasItem(c1))
		  
		  Dim c2 As New libcURL.EasyHandle
		  c2.URL = "http://www.example.net/"
		  Dim data2 As New MemoryBlock(0)
		  Dim downstream2 As New BinaryStream(data2)
		  c2.DownloadStream = downstream2
		  If Not s.AddItem(c2) Then Raise New libcURL.cURLException(s)
		  Assert(s.HasItem(c2))
		  
		  Assert(Not s.AddItem(c1)) ' already added
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected TestResult As Integer
	#tag EndProperty


	#tag Constant, Name = RunLiveTests, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant


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
