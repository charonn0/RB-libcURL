#tag Module
Protected Module LiveTests
	#tag Method, Flags = &h1
		Protected Function RunTests() As Boolean
		  mSession = New cURLClient
		  mSession.EasyItem.Verbose = True
		  mSession.EasyItem.UseErrorBuffer = True
		  AddHandler mSession.DebugMessage, AddressOf _DebugMessageHandler
		  TestResult = 0
		  Try
		    TestCookieGet()
		  Catch
		    TestResult = 6
		    Return False
		  End Try
		  
		  Try
		    TestCookieSet
		  Catch
		    TestResult = 7
		    Return False
		  End Try
		  
		  Try
		    TestHeaderGet()
		  Catch
		    TestResult = 8
		    Return False
		  End Try
		  
		  Try
		    TestHeaderSet()
		  Catch
		    TestResult = 9
		    Return False
		  End Try
		  
		  Try
		    TestRedirect()
		  Catch
		    TestResult = 10
		    Return False
		  End Try
		  
		  Try
		    TestFormPost()
		  Catch
		    TestResult = 11
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
		  If Not mSession.Get("https://nghttp2.org/httpbin/cookies") Then Return
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  If Not js.HasName("cookies") Then Return
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
		  'Assert(files.HasName(tmp.Name))
		  'Assert(files.Value(tmp.Name) = tmp.Length)
		  
		  files = js.Value("form")
		  Assert(files.Value("user") = "bob")
		  Assert(files.Value("password") = "seekrit")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestHeaderGet()
		  If Not mSession.Get("https://nghttp2.org/httpbin/response-headers?X-Test-Header=Test%20Value") Then Return
		  Dim h As InternetHeaders = mSession.GetResponseHeaders
		  Assert(h.CommaSeparatedValues("X-Test-Header").Trim = "Test Value")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestHeaderSet()
		  If Not mSession.SetRequestHeader("X-Test-Header", "TestValue") Then Raise New libcURL.cURLException(mSession.EasyItem)
		  If Not mSession.Get("https://nghttp2.org/httpbin/headers") Then Return
		  Dim js As New JSONItem(mSession.GetDownloadedData)
		  js = js.Value("headers")
		  Assert(js.HasName("X-Test-Header"))
		  Assert(js.Value("X-Test-Header") = "TestValue")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TestRedirect()
		  mSession.EasyItem.MaxRedirects = 6
		  If Not mSession.Get("https://nghttp2.org/httpbin/redirect/6") Then Return
		  Assert(mSession.EasyItem.URL = "https://nghttp2.org/httpbin/get")
		  Assert(Not mSession.Get("https://nghttp2.org/httpbin/redirect/7"))
		  Assert(mSession.LastError = libcURL.Errors.TOO_MANY_REDIRECTS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub _DebugMessageHandler(Sender As libcURL.cURLClient, MessageType As libcURL.curl_infotype, data As String)
		  #pragma Unused Sender
		  Select Case MessageType
		  Case libcURL.curl_infotype.data_in, libcURL.curl_infotype.data_out, libcURL.curl_infotype.ssl_in, libcURL.curl_infotype.ssl_out
		    Return
		  End Select
		  System.DebugLog(libcURL.curl_infoname(MessageType) + ": " + data.Trim)
		  
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
