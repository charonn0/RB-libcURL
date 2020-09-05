#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  #If TargetWin32 Then
		    Declare Function SetDllDirectoryW Lib "Kernel32" (PathName As WString) As Boolean
		    Call SetDllDirectoryW(App.ExecutableFile.Parent.Child("_x86dlls").AbsolutePath)
		  #endif
		  
		  Dim c As New cURLClient(New libcURL.Protocols.FTPWildCard)
		  c.EasyItem.NetworkInterface = System.GetNetworkInterface(0)
		  Dim iter As New libcURL.Opts.OptionIterator(c.EasyItem)
		  Dim opts() As libcURL.Opts.OptionInfo
		  Do
		    opts.Append(iter.CurrentOption)
		  Loop Until Not iter.MoveNext()
		  'Dim backs() As libcURL.SSLBackend = libcURL.EnumSSLBackends()
		  
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
