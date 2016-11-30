#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim c As New cURLClient
		  c.HTTP2Push = True
		  c.HTTPVersion = libcURL.HTTPVersion.HTTP2
		  AddHandler c.AcceptServerPush, WeakAddressOf PushHandler
		  If Not c.Get("https://http2.akamai.com/demo/h2_demo_frame.html") Then Raise New libcURL.cURLException(c.EasyItem)
		  Break
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function PushHandler(Sender As libcURL.cURLClient, PushConnection As libcURL.EasyHandle, PushHeaders As InternetHeaders) As Boolean
		  
		End Function
	#tag EndMethod


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
