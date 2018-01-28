#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'Dim e1 As New libcURL.EasyHandle
		  'Dim m As New libcURL.MIMEMessage(e1)
		  'Call m.AddElement("U", "A")
		  'Call m.AddElement("P", "S")
		  'Call m.AddElement("F", "H")
		  '
		  'e1 = New libcURL.EasyHandle
		  'Dim c As New cURLClient(e1)
		  'e1.UseErrorBuffer = True
		  'If Not c.Post("htftp://192.168.1.4:8080/", m) Then Raise New libcURL.cURLException(e1)
		  'Break
		  
		  Dim parts() As libcURL.MIMEMessagePart
		  Dim form As libcURL.MIMEMessage ' assume a valid form object
		  Dim e As libcURL.MIMEMessagePart = form.GetElement(0) ' get the first element
		  Do Until e = Nil
		    parts.Append(e)
		    e = e.NextPart
		  Loop
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
