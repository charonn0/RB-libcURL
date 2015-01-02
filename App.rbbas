#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim code As Integer
		  Dim h As New InternetHeaders
		  Dim form As New Dictionary
		  form.Value("name") = "User1"
		  form.Value("file") = GetOpenFolderItem("")
		  Dim data As MemoryBlock = libcURL.Post(form, "http://192.168.1.4:8080/Create", 5, h, code)
		  Break
		End Sub
	#tag EndEvent


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
