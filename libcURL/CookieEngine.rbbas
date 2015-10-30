#tag Class
Protected Class CookieEngine
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  ' Returns the number of unexpired cookies currently collected. 
		  
		  Dim cookies As libcURL.ListPtr = Owner.GetInfo(libcURL.Info.COOKIELIST)
		  If cookies = Nil Then Return 0
		  Return cookies.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteAll() As Boolean
		  ' Clears all cookies.
		  Return Owner.SetOption(libcURL.Opts.COOKIELIST, "ALL")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteSession() As Boolean
		  ' Deletes all session cookies. Session cookies are those without an explicit expiration date.
		  
		  If libcURL.Version.IsAtLeast(7, 17, 1) Then
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
		  
		  Return NthField(Me.StringValue(Index), Chr(9), 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Expiry(Index As Integer) As Date
		  ' Returns the expiration date for the cookie at Index. If the cookie is a session cookie
		  ' then the return value will be Nil.
		  
		  Dim d As Date
		  If libcURL.ParseDate(NthField(Me.StringValue(Index), Chr(9), 5), d) Then Return d
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
		  If libcURL.Version.IsAtLeast(7, 17, 1) Then
		    Dim OK As Boolean
		    If CookieJar <> Nil Then
		      Dim tmp As FolderItem = Me.CookieJar
		      Me.CookieJar = CookieJar
		      OK = Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		      Me.CookieJar = tmp
		    End If
		    Return Owner.SetOption(libcURL.Opts.COOKIELIST, "FLUSH")
		  Else
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lookup(CookieName As String, CookieDomain As String, StartWith As Integer = 0) As Integer
		  ' Locates the index of the cookie matching the CookieName and CookieDomain parameters.
		  ' If CookieDomain is "" then all domains match.
		  
		  Dim c As Integer = Me.Count
		  For i As Integer = StartWith To c - 1
		    Dim n As String = Me.Name(i)
		    If n = CookieName Then
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
		    Return OK
		  Else
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetCookie(Name As String, Value As String, Domain As String, Expires As Date = Nil, Path As String = "") As Boolean
		  Dim c As String = "Set-Cookie: " + Name + "=" + Value
		  If Domain <> "" Then c = c + "; Domain=" + Domain
		  If Path <> "" Then c = c + "; path=" + Path
		  If Expires <> Nil Then c = c + "; Expires=" + libcURL.ParseDate(Expires)
		  Return Owner.SetOption(libcURL.Opts.COOKIELIST, c)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Index As Integer) As String
		  Dim cookies As libcURL.ListPtr = Owner.GetInfo(libcURL.Info.COOKIELIST)
		  If cookies = Nil Then Raise New NilObjectException
		  Return cookies.Item(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As String
		  Return NthField(Me.StringValue(Index), Chr(9), 7)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Index As Integer, Assigns NewValue As String)
		  If Not Me.SetCookie(Me.Name(Index), NewValue, Me.Domain(Index), Me.Expiry(Index), Me.Path(Index)) Then Raise New libcURL.cURLException(Owner)
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
		Private mEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty


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
