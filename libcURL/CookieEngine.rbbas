#tag Class
Protected Class CookieEngine
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  ' Returns the number of cookies currently collected. This number includes
		  ' expired cookies.
		  
		  Dim cookies As libcURL.ListPtr = Owner.GetInfo(libcURL.Info.COOKIELIST)
		  If cookies = Nil Then Return 0
		  Return cookies.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain(Index As Integer) As String
		  ' Returns the domain for the cookie at Index. If the domain is empty then the
		  ' cookie is sent to all hosts.
		  
		  Return NthField(Me.Item(Index), Chr(9), 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expiry(Index As Integer) As Date
		  ' Returns the expiration date for the cookie at Index. If the cookie is a session cookie
		  ' then the return value will be Nil.
		  
		  Dim d As Date
		  If libcURL.ParseDate(NthField(Me.Item(Index), Chr(9), 5), d) Then Return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expiry(Index As Integer, Assigns NewExpiry As Date)
		  ' Sets the expiration date for the cookie at Index
		  If Not Me.SetCookie(Me.Name(Index), Me.Value(Index), Me.Domain(Index), NewExpiry, Me.Path(Index)) Then Raise New libcURL.cURLException(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush(CookieJar As FolderItem = Nil) As Boolean
		  Dim OK As Boolean
		  If CookieJar <> Nil Then
		    Dim tmp As FolderItem = Me.CookieJar
		    Me.CookieJar = CookieJar
		    OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		    Me.CookieJar = tmp
		  ElseIf Me.CookieJar <> Nil Then
		    OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		  End If
		  Return OK
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Item(Index As Integer) As String
		  Dim cookies As libcURL.ListPtr = Owner.GetInfo(libcURL.Info.COOKIELIST)
		  If cookies = Nil Then Raise New NilObjectException
		  If Index < 0 Or Index > cookies.Count - 1 Then Raise New OutOfBoundsException
		  Return cookies.Item(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(CookieName As String, CookieDomain As String = "", StartWith As Integer = 0) As Integer
		  Dim c As Integer = Me.Count
		  For i As Integer = StartWith To c - 1
		    If Me.Name(i) = CookieName And CookieDomain <> "" And CookieDomain = Me.Domain(i) Then Return i
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  Return NthField(Me.Item(Index), Chr(9), 6)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And mOwner.Value <> Nil And mOwner.Value IsA libcURL.EasyHandle Then
		    Return libcURL.EasyHandle(mOwner.Value)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path(Index As Integer) As String
		  Return NthField(Me.Item(Index), Chr(9), 3)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCookie(Name As String, Value As String, Domain As String, Expires As Date = Nil, Path As String = "") As Boolean
		  If Name <> "" And Value = "" Then Expires = New Date(1970, 1, 1)  ' effectively deletes the cookie
		  Dim c As String = "Set-Cookie: " + Name + "=" + Value + "; Domain=" + Domain
		  If Path <> "" Then c = c + "; path=" + Path
		  If Expires <> Nil Then c = c + "; Expires=" + libcURL.ParseDate(Expires)
		  Return Owner.SetOption(libcURL.Opts.COOKIELIST, c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As String
		  Return NthField(Me.Item(Index), Chr(9), 7)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Index As Integer, Assigns NewValue As String)
		  If Not Me.SetCookie(Me.Name(Index), NewValue, Me.Domain(Index), Me.Expiry(Index), Me.Path(Index)) Then Raise New libcURL.cURLException(Owner)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  ' Gets the local file to be used as cookie storage. If no file/folder is specified (default) then returns Nil.
			  
			  return mCookieJar
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  ' Sets the local file to be used as cookie storage.
			  '
			  ' See:
			  ' http://curl.haxx.se/libcurl/c/CURLOPT_COOKIEJAR.html
			  ' http://curl.haxx.se/libcurl/c/CURLOPT_COOKIEFILE.html
			  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.CookieJar
			  
			  If value = Nil Or value.Directory Then
			    If Not Owner.SetOption(libcURL.Opts.COOKIEFILE, Nil) Then Raise New cURLException(Owner)
			    If Not Owner.SetOption(libcURL.Opts.COOKIEJAR, Nil) Then Raise New cURLException(Owner)
			  Else
			    If Not Owner.SetOption(libcURL.Opts.COOKIEFILE, value) Then Raise New cURLException(Owner)
			    If Not Owner.SetOption(libcURL.Opts.COOKIEJAR, value) Then Raise New cURLException(Owner)
			  End If
			  
			  mCookieJar = value
			End Set
		#tag EndSetter
		CookieJar As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnabled Or mCookieJar <> Nil
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    If Not Owner.SetOption(libcURL.Opts.COOKIEFILE, "") Then Raise New cURLException(Owner)
			  Else
			    If Not Owner.SetOption(libcURL.Opts.COOKIEFILE, Nil) Then Raise New cURLException(Owner)
			  End If
			  mEnabled = value
			End Set
		#tag EndSetter
		Enabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCookieJar As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty


End Class
#tag EndClass
