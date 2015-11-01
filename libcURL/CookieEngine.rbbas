#tag Class
Protected Class CookieEngine
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		  mDirty = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  ' Returns the number of unexpired cookies currently collected.
		  
		  Return CookieList.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteAll() As Boolean
		  ' Clears all cookies.
		  
		  mDirty = True
		  Return Owner.SetOption(libcURL.Opts.COOKIELIST, "ALL")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteSession() As Boolean
		  ' Deletes all session cookies. Session cookies are those without an explicit expiration date.
		  
		  If libcURL.Version.IsAtLeast(7, 17, 1) Then
		    mDirty = True
		    Return Owner.SetOption(libcURL.Opts.COOKIELIST, "SESS")
		  Else
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Return False
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Domain(Index As Integer) As String
		  ' Returns the domain for the cookie at Index. If the domain is empty then the
		  ' cookie is sent to all hosts.
		  
		  Const HTTPONLY = "#HttpOnly_"
		  Static sz As Integer = HTTPONLY.Len
		  Dim dm As String = NthField(Me.StringValue(Index), Chr(9), 1)
		  
		  If Left(dm, sz) = HTTPONLY Then dm = Right(dm, dm.Len - sz)
		  If Left(dm, sz + 1) = "." + HTTPONLY Then dm = Right(dm, dm.Len - (sz + 1))
		  Return dm
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expiry(Index As Integer) As Date
		  ' Returns the expiration date for the cookie at Index. If the cookie is a session cookie
		  ' then the return value will be Nil.
		  
		  Dim d As New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		  Dim count As Integer = Val(NthField(Me.StringValue(Index), Chr(9), 5))
		  If count > 0 Then
		    d.TotalSeconds = d.TotalSeconds + count
		    Return d
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Expiry(Index As Integer, Assigns NewExpiry As Date)
		  ' Sets the expiration date for the cookie at Index
		  If Not Me.SetCookie(Me.Name(Index), Me.Value(Index), Me.Domain(Index), NewExpiry, Me.Path(Index), Me.HTTPOnly(Index)) Then 
		    Raise New libcURL.cURLException(Owner)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Flush(CookieJar As FolderItem = Nil) As Boolean
		  If libcURL.Version.IsAtLeast(7, 17, 1) Then
		    Dim OK As Boolean
		    If CookieJar <> Nil Then
		      Dim tmp As FolderItem = Me.CookieJar
		      Me.CookieJar = CookieJar
		      OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		      Me.CookieJar = tmp
		    End If
		    mDirty = True
		    Return Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		  Else
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HTTPOnly(Index As Integer) As Boolean
		  ' Returns the domain for the cookie at Index. If the domain is empty then the
		  ' cookie is sent to all hosts.
		  
		  Const HTTPONLY = "#HttpOnly_"
		  Static sz As Integer = HTTPONLY.Len
		  Dim dm As String = NthField(Me.StringValue(Index), Chr(9), 1)
		  
		  Return (Left(dm, sz) = HTTPONLY) Or Left(dm, sz + 1) = "." + HTTPONLY
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(CookieName As String, CookieDomain As String, StartWith As Integer = 0) As Integer
		  ' Locates the index of the cookie matching the CookieName and CookieDomain parameters.
		  ' If CookieDomain is "" then all domains match.
		  
		  Dim c As Integer = Me.Count
		  For i As Integer = StartWith To c - 1
		    If CookieName = "" Or Me.Name(i) = CookieName Then
		      If CookieDomain = "" Or CookieDomain = Me.Domain(i) Then
		        Return i
		      End If
		    End If
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name(Index As Integer) As String
		  ' Returns the name of the Cookie at Index
		  Return NthField(Me.StringValue(Index), Chr(9), 6)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewSession() As Boolean
		  ' Ignores but does not delete all existing cookies which do not have an explicit expiration date.
		  
		  mDirty = True
		  Return Owner.SetOption(libcURL.Opts.COOKIESESSION, True)
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
		  ' Returns the cookie's path parameter
		  
		  Return NthField(Me.StringValue(Index), Chr(9), 3)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reload(CookieJar As FolderItem = Nil) As Boolean
		  If libcURL.Version.IsAtLeast(7, 17, 1) Then
		    Dim OK As Boolean
		    If CookieJar <> Nil Then
		      Dim tmp As FolderItem = Me.CookieJar
		      Me.CookieJar = CookieJar
		      OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "RELOAD")
		      Me.CookieJar = tmp
		    ElseIf Me.CookieJar <> Nil Then
		      OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "RELOAD")
		    End If
		    mDirty = True
		    Return OK
		  Else
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCookie(Name As String, Value As String, Domain As String, Expires As Date = Nil, Path As String = "", HTTPOnly As Boolean = False) As Boolean
		  Dim c As String = "Set-Cookie: " + Name + "=" + Value
		  If Domain <> "" Then c = c + "; Domain=" + Domain
		  If Path <> "" Then c = c + "; path=" + Path
		  If Expires <> Nil Then c = c + "; Expires=" + libcURL.ParseDate(Expires)
		  If HTTPOnly Then c = c + "; httpOnly"
		  mDirty = True
		  Return Owner.SetOption(libcURL.Opts.COOKIELIST, c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Index As Integer, StringFormat As Integer = libcURL.CookieEngine.FORMAT_NETSCAPE) As String
		  Select Case StringFormat
		  Case FORMAT_NETSCAPE
		    Return CookieList.Item(Index)
		    
		  Case FORMAT_HTTP
		    Dim c As String = "Set-Cookie: " + Me.Name(Index) + "=" + Me.Value(Index)
		    If Me.Domain(Index) <> "" Then c = c + "; Domain=" + Me.Domain(Index)
		    If Me.Path(Index) <> "" Then c = c + "; path=" + Me.Path(Index)
		    If Me.Expiry(Index) <> Nil Then c = c + "; Expires=" + libcURL.ParseDate(Me.Expiry(Index))
		    If Me.HTTPOnly(Index) Then c = c + "; httpOnly"
		    Return c
		    
		  Else
		    Raise New UnsupportedFormatException
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As String
		  Return NthField(Me.StringValue(Index), Chr(9), 7)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Index As Integer, Assigns NewValue As String)
		  If Not Me.SetCookie(Me.Name(Index), NewValue, Me.Domain(Index), Me.Expiry(Index), Me.Path(Index), Me.HTTPOnly(Index)) Then 
		    Raise New libcURL.cURLException(Owner)
		  End If
		End Sub
	#tag EndMethod


	#tag Note, Name = About this class
		This class provides accessor methods to control libcurl's internal cookie engine.
		The cookie engine works much like that of a web browser, automatically collecting
		cookies when they are received and sending them back when appropriate.
		
		The cookie engine indexes cookies by cookie name and by domain name. Cookies are
		only sent if the remote host matches the domain. 
		
		You may set/update cookies by calling the SetCookie method. If you are connecting to 
		multiple servers then you should always specify a domain name when setting cookies.
		Cookies without a domain ("") will be sent to ALL hosts, will not be updated
		if a remote host uses the Set-Cookie header, and will be sent in addition to any
		same-named cookies which do specify a domain.
	#tag EndNote


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
			    mEnabled = False
			  Else
			    If Not Owner.SetOption(libcURL.Opts.COOKIEFILE, value) Then Raise New cURLException(Owner)
			    If Not Owner.SetOption(libcURL.Opts.COOKIEJAR, value) Then Raise New cURLException(Owner)
			    mEnabled = True
			  End If
			  
			  mCookieJar = value
			  
			End Set
		#tag EndSetter
		CookieJar As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  If mDirty Or mCookieList = Nil Then 
			    mCookieList = Owner.GetInfo(libcURL.Info.COOKIELIST)
			    mDirty = False
			  End If
			  return mCookieList
			End Get
		#tag EndGetter
		Protected CookieList As libcURL.ListPtr
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
			    CookieJar = Nil
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
		Private mCookieList As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDirty As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty


	#tag Constant, Name = FORMAT_HTTP, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FORMAT_NETSCAPE, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Enabled"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
End Class
#tag EndClass
