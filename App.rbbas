#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  Dim c As New cURLClient
		  Dim form As New Dictionary
		  form.Value("Username") = "andrew"
		  form.Value("Password") = "sekrit"
		  form.Value("CAPTCHA") = "dfe3aa"
		  c.SetFormData(form, False)
		  If Not c.Post("http://192.168.1.4:8080/", Nil) Then
		    Break
		  End If
		  Break
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function ToString(Form As Dictionary) As String
		  Dim data() As String
		  For Each key As String in Form.Keys
		    data.Append(EncodeURLComponent(Key) + "=" + EncodeURLComponent(Form.Value(key)))
		  Next
		  Return Join(data, "&")
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
