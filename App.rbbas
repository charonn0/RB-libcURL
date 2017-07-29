#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'Dim c As New cURLClient
		  'c.HTTP2Push = True
		  'c.HTTPVersion = libcURL.HTTPVersion.HTTP2
		  'AddHandler c.AcceptServerPush, WeakAddressOf PushHandler
		  'AddHandler c.TransferComplete, WeakAddressOf TransferCompleteHandler
		  'If Not c.Get("https://http2.akamai.com/demo/h2_demo_frame.html") Then Raise New libcURL.cURLException(c.EasyItem)
		  'Break
		  
		  Dim e As New libcURL.EasyHandle
		  Dim m As New libcURL.MultiHandle
		  AddHandler m.ServerPush, WeakAddressOf PushHandler1
		  e.URL = "https://http2.akamai.com/demo/h2_demo_frame.html"
		  Dim mb As New MemoryBlock(0)
		  Dim bs As New BinaryStream(mb)
		  e.DownloadStream = bs
		  e.HTTPVersion = libcURL.HTTPVersion.HTTP2
		  m.HTTPMultiplexing = True
		  m.HTTP2Push = True
		  e.CA_ListFile = libcURL.Default_CA_File
		  Call m.AddItem(e)
		  
		  Do Until Not m.PerformOnce()
		    
		  Loop
		  bs.Close
		  If mChild <> Nil Then BinaryStream(mChild.DownloadStream).Close
		  Break
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function PushHandler(Sender As libcURL.cURLClient, PushConnection As libcURL.EasyHandle, PushHeaders As InternetHeaders) As Boolean
		  Dim scheme, host, path As String
		  scheme = PushHeaders.CommaSeparatedValues(":scheme")
		  host = PushHeaders.CommaSeparatedValues(":authority")
		  path = PushHeaders.CommaSeparatedValues(":path")
		  PushConnection.URL = scheme + "://" + host + path
		  Dim bs As BinaryStream = BinaryStream.Create(SpecialFolder.Desktop.Child(EncodeURLComponent(path)), True)
		  PushConnection.DownloadStream = bs
		  mChild = PushConnection
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PushHandler1(Sender As libcURL.MultiHandle, ParentConnection As libcURL.EasyHandle, NewConnection As libcURL.EasyHandle, PushHeaders As InternetHeaders) As Boolean
		  Dim scheme, host, path As String
		  scheme = PushHeaders.CommaSeparatedValues(":scheme")
		  host = PushHeaders.CommaSeparatedValues(":authority")
		  path = PushHeaders.CommaSeparatedValues(":path")
		  NewConnection.URL = scheme + "://" + host + path
		  Dim bs As BinaryStream = BinaryStream.Create(SpecialFolder.Desktop.Child(EncodeURLComponent(path)), True)
		  NewConnection.DownloadStream = bs
		  mChild = NewConnection
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferCompleteHandler(Sender As libcURL.cURLClient, Connection As libcURL.EasyHandle)
		  If Connection = mChild Then BinaryStream(mChild.DownloadStream).Close
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mChild As libcURL.EasyHandle
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
