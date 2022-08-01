#tag Module
Protected Module LiveTests
	#tag Method, Flags = &h1
		Protected Function RunTests() As Boolean
		  mSession = New cURLClient
		  mSession.EasyHandle.Verbose = True
		  mSession.EasyHandle.UseErrorBuffer = True
		  TestResult = 0
		  
		  Try
		    TestHeaderGet()
		  Catch
		    TestResult = 11
		    Return False
		  End Try
		  
		  Try
		    TestCookieGet()
		  Catch
		    TestResult = 12
		    Return False
		  End Try
		  
		  Try
		    TestCookieSet
		  Catch
		    TestResult = 13
		    Return False
		  End Try
		  
		  Try
		    TestHeaderSet()
		  Catch
		    TestResult = 14
		    Return False
		  End Try
		  
		  Try
		    TestRedirect()
		  Catch
		    TestResult = 15
		    Return False
		  End Try
		  
		  Try
		    TestFormPost()
		  Catch
		    TestResult = 16
		    Return False
		  End Try
		  
		  Try
		    TestMIMEPost()
		  Catch
		    TestResult = 17
		    Return False
		  End Try
		  
		  mSession = Nil
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCookieGet()
		  mSession.Cookies.Enabled = True
		  If Not mSession.Get("https://nghttp2.org/httpbin/cookies/set?k2=v2&k1=v1") Then Return
		  Assert(mSession.IsSSLCertOK)
		  Assert(mSession.Cookies.Count = 2)
		  Assert(mSession.GetCookie("k2", "nghttp2.org") = "v2")
		  Assert(mSession.GetCookie("k1", "nghttp2.org") = "v1")
		  Assert(mSession.GetCookie("k2", "") = "v2")
		  Assert(mSession.GetCookie("k1", "") = "v1")
		  Assert(mSession.GetCookie("invalid", "nghttp2.org") = "")
		  Assert(mSession.GetCookie("invalid", "") = "")
		  
		  Dim d As New Dictionary
		  Dim i As Integer = -1
		  Do
		    i = mSession.Cookies.Lookup("", "nghttp2.org", i + 1)
		    If i > -1 Then
		      d.Value(mSession.Cookies.Name(i)) = mSession.Cookies.Value(i)
		    End If
		  Loop Until i < 0
		  
		  Assert(d.Count = 2)
		  Assert(d.Value("k2") = "v2")
		  Assert(d.Value("k1") = "v1")
		  
		  d = New Dictionary
		  i = -1
		  Do
		    i = mSession.Cookies.Lookup("", "", i + 1)
		    If i > -1 Then
		      d.Value(mSession.Cookies.Name(i)) = mSession.Cookies.Value(i)
		    End If
		  Loop Until i < 0
		  
		  Assert(d.Count = 2)
		  Assert(d.Value("k2") = "v2")
		  Assert(d.Value("k1") = "v1")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestCookieSet()
		  mSession.Cookies.Enabled = True
		  Assert(mSession.Cookies.SetCookie("TestCookie", "TestValue", "nghttp2.org"))
		  Assert(mSession.Get("https://nghttp2.org/httpbin/cookies"))
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  Assert(js.HasName("cookies"))
		  js = js.Value("cookies")
		  Assert(js.Value("TestCookie") = "TestValue")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestFormPost()
		  Dim form As New Dictionary
		  form.Value("user") = "bob"
		  form.Value("password") = "seekrit"
		  Dim tmp As FolderItem = GetTemporaryFolderItem
		  Dim bs As BinaryStream = BinaryStream.Open(tmp, True)
		  bs.Write("Hello, world!")
		  bs.Close
		  form.Value("upload") = tmp
		  Assert(mSession.Post("https://nghttp2.org/httpbin/post", form))
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  Dim files As JSONItem = js.Value("files")
		  Assert(files.Count = 1)
		  Assert(files.Value("upload") = "Hello, world!")
		  'Assert(files.Value(tmp.Name) = tmp.Length)
		  
		  files = js.Value("form")
		  Assert(files.Value("user") = "bob")
		  Assert(files.Value("password") = "seekrit")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestHeaderGet()
		  If Not mSession.Get("https://nghttp2.org/httpbin/response-headers?X-Test-Header=Test%20Value") Then Return
		  Dim h As InternetHeaders = mSession.ResponseHeaders
		  Assert(h.CommaSeparatedValues("X-Test-Header").Trim = "Test Value")
		  
		  If Not mSession.Get("https://nghttp2.org/httpbin/redirect/4") Then Return
		  If libcURL.Version.IsAtLeast(7, 84, 0) Then Assert(mSession.ResponseHeaders.RequestCount = 5)
		  
		  Dim tmp() As libcURL.ResponseHeader = mSession.ResponseHeaders.GetHeaders("", libcURL.HeaderOriginType.Any, -2)
		  Dim cnt As Integer = mSession.ResponseHeaders.Count("", libcURL.HeaderOriginType.Any, -2)
		  Assert(UBound(tmp) + 1 = cnt)
		  Dim header As libcURL.ResponseHeader = mSession.ResponseHeaders.GetHeader(tmp(UBound(tmp)).Name)
		  Assert(header <> Nil)
		  header = mSession.ResponseHeaders.GetHeader(header.Name, header.Index, header.Origin, header.RequestIndex)
		  Assert(header <> Nil)
		  Assert(mSession.ResponseHeaders.HasHeader(header.Name))
		  
		  Dim totl As Integer
		  For i As Integer = 0 To mSession.ResponseHeaders.RequestCount - 1
		    tmp = mSession.ResponseHeaders.GetHeaders("", libcURL.HeaderOriginType.Any, i)
		    Dim c As Integer = mSession.ResponseHeaders.Count("", libcURL.HeaderOriginType.Any, i)
		    Assert(UBound(tmp) + 1 = c)
		    totl = totl + c
		  Next
		  Assert(totl = cnt)
		  
		  
		  Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestHeaderSet()
		  mSession.RequestHeaders.SetHeader("X-Test-Header1", "TestValue1")
		  mSession.RequestHeaders.SetHeader("X-Test-Header2", "TestValue2")
		  mSession.RequestHeaders.SetHeader("X-Test-Header3", "TestValue3")
		  mSession.RequestHeaders.SetHeader("X-Test-Header4", "TestValue4")
		  Assert(mSession.Get("https://nghttp2.org/httpbin/headers"))
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  js = js.Value("headers")
		  
		  Assert(js.HasName("X-Test-Header1"))
		  Assert(js.Value("X-Test-Header1") = "TestValue1")
		  
		  Assert(js.HasName("X-Test-Header2"))
		  Assert(js.Value("X-Test-Header2") = "TestValue2")
		  
		  Assert(js.HasName("X-Test-Header3"))
		  Assert(js.Value("X-Test-Header3") = "TestValue3")
		  
		  Assert(js.HasName("X-Test-Header4"))
		  Assert(js.Value("X-Test-Header4") = "TestValue4")
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestMIMEPost()
		  If Not libcURL.Version.IsAtLeast(7, 56, 0) Then Return
		  Dim form As New libcURL.MIMEMessage(mSession.EasyHandle)
		  Assert(form.AddElement("user", "bob"))
		  Assert(form.AddElement("password", "seekrit"))
		  Dim tmp As FolderItem = GetTemporaryFolderItem
		  Dim bs As BinaryStream = BinaryStream.Open(tmp, True)
		  bs.Write("Hello, world!")
		  bs.Close
		  Assert(form.AddElement("upload", tmp))
		  bs = BinaryStream.Open(tmp)
		  Assert(form.AddElement("stream", bs, bs.Length, "stream.txt", ""))
		  Assert(mSession.Post("https://nghttp2.org/httpbin/post", form))
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  Dim files As JSONItem = js.Value("files")
		  Assert(files.Count = 2)
		  Assert(files.Value("upload") = "Hello, world!")
		  Assert(files.Value("stream") = "Hello, world!")
		  
		  files = js.Value("form")
		  Assert(files.Value("user") = "bob")
		  Assert(files.Value("password") = "seekrit")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestRedirect()
		  mSession.EasyHandle.MaxRedirects = 6
		  Assert(mSession.Get("https://nghttp2.org/httpbin/redirect/6"))
		  Assert(mSession.EasyHandle.URL = "https://nghttp2.org/httpbin/get")
		  Assert(Not mSession.Get("https://nghttp2.org/httpbin/redirect/7"))
		  Assert(mSession.LastError = libcURL.Errors.TOO_MANY_REDIRECTS)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSession As cURLClient
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
End Module
#tag EndModule
