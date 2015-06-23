#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'Dim c As New cURLClient
		  'Dim root As FolderItem = SpecialFolder.Desktop.Child("Test_Source")
		  'Dim err As Integer = FTPUpload(c, root, "ftp://charonn0:ohYZWitedJ4sn8S@ftp.sonic.net/public_html/Test/")
		  'If err <> 0 Then MsgBox(libcURL.FormatError(err))
		  'Quit
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function FTPUpload(cURL As cURLClient, Directory As FolderItem, FTPURL As String) As Integer
		  If Right(FTPURL, 1) <> "/" Then FTPURL = FTPURL + "/"
		  Dim c As Integer = Directory.Count
		  Dim err As Integer
		  Call cURL.SetOption(libcURL.Opts.FTP_CREATE_MISSING_DIRS, True)
		  
		  For i As Integer = 1 To c
		    Dim item As FolderItem = Directory.Item(i)
		    If Not item.Directory Then
		      Dim bs As BinaryStream = BinaryStream.Open(item)
		      If Not cURL.Put(FTPURL + item.Name, bs) Then err = cURL.LastError
		      bs.Close
		      
		    Else
		      If cURL.Head(FTPURL) Then ' create the directory
		        err = FTPUpload(cURL, item, FTPURL + item.Name + "/") ' Recurse into it
		      Else
		        err = cURL.LastError
		      End If
		    End If
		    If err <> 0 Then Exit For
		  Next
		  
		  Return err
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
