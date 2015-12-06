#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Open()
		  'Dim w As New WildCard
		  'w.LocalRoot = SpecialFolder.Desktop.Child("Test_Destination")
		  ''AddHandler w.QueueFile, WeakAddressOf QueueFileHandler
		  ''AddHandler w.PatternMatch, WeakAddressOf PatternMatchHandler
		  ''AddHandler w.DataAvailable, WeakAddressOf DataAvailableHandler
		  'Dim c As New cURLClient(w)
		  'If Not c.Get("ftp://test:pass@192.168.1.4/*.rb*") Then Raise new libcURL.cURLException(c.EasyItem)
		  ''Do Until UBound(Dirs) <= -1
		  ''Dim p As Pair = Dirs(0)
		  ''Dirs.Remove(0)
		  ''Dim a As New WildCard(w)
		  ''a.LocalRoot = p.Left
		  ''c = New cURLClient(a)
		  ''If Not c.Get("ftp://ftp.boredomsoft.org/test/" + p.Right + "/*") Then Raise new libcURL.cURLException(c.EasyItem)
		  ''Loop
		  'Break
		  DownloadMatching()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function DataAvailableHandler(Sender As WildCard, NewData As MemoryBlock) As Integer
		  Return NewData.Size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DownloadMatching()
		  Dim outputdir As FolderItem = SpecialFolder.Desktop.Child("Output")
		  If Not outputdir.Exists Then outputdir.CreateAsFolder
		  If Not outputdir.Directory Then Return
		  Dim w As New WildCard
		  AddHandler w.QueueFile, WeakAddressOf QueueFileHandler
		  w.LocalRoot = outputdir
		  Dim c As New cURLClient(w)
		  
		  
		  Dim url, path, pattern As String
		  url = "ftp://test:pass@192.168.1.4"
		  path = "/"
		  pattern = "*"'.rb*"
		  Do
		    If Not c.Get(url + path + pattern) Then
		      Exit Do
		    End If
		    If UBound(Dirs) > -1 Then
		      Dim p As Pair = Dirs(0)
		      Dirs.Remove(0)
		      Dim f As FolderItem = p.Left
		      Dim n As String = p.Right
		      path = "/"
		      
		      w.Reset
		      w.LocalRoot = f
		    Else
		      Exit Do
		    End If
		  Loop
		  Break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PatternMatchHandler(Sender As WildCard, Pattern As String, Filename As String) As Boolean
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function QueueFileHandler(Sender As WildCard, FileName As String, ByRef LocalFile As FolderItem, IsDirectory As Boolean, UnixPerms As Permissions) As Boolean
		  If IsDirectory Then
		    LocalFile.CreateAsFolder
		    Dirs.Append(LocalFile:FileName)
		  End If
		  list.Append(FileName)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Dirs() As Pair
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected list() As String
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
