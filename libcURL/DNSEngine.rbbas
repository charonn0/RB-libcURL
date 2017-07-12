#tag Class
Protected Class DNSEngine
	#tag Method, Flags = &h0
		Sub AddOverride(Hostname As String, PortNumber As Integer, OverrideResult As String)
		  ' Override the DNS result for the specified hostname and port number.
		  
		  If Not libcURL.Version.IsAtLeast(7, 21, 3) Then
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Owner)
		  End If
		  Dim i As Integer = GetOverrideIndex(Hostname, PortNumber)
		  If i > -1 Then RemoveOverrideAtIndex(i)
		  If mOverrideList = Nil Then mOverrideList = New ListPtr(Nil, Owner.Flags)
		  If Not mOverrideList.Append(Hostname + ":" + Str(PortNumber, "####0") + ":" + OverrideResult) Then Raise New cURLException(mOverrideList)
		  Me.FlushOverrides()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddResolver(ServerIP As String)
		  ' Add the specified DNS server to the list of preferred resolvers.
		  ' This feature is available only if libcURL was built with c-ares
		  ' as the DNS backend.
		  
		  If Not libcURL.Version.IsAtLeast(7, 24, 0) Then
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Owner)
		  End If
		  
		  If mResolvers.IndexOf(ServerIP) = -1 Then
		    mResolvers.Append(ServerIP)
		    Me.FlushResolvers
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FlushOverrides()
		  If Not Owner.SetOption(libcURL.Opts.RESOLVE, mOverrideList) Then Raise New cURLException(Owner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FlushResolvers()
		  If UBound(mResolvers) > -1 Then
		    If Not Owner.SetOption(libcURL.Opts.DNS_SERVERS, Join(mResolvers, ",")) Then Raise New cURLException(Owner)
		  Else
		    If Not Owner.SetOption(libcURL.Opts.DNS_SERVERS, Nil) Then Raise New cURLException(Owner)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetOverride(Hostname As String, PortNumber As Integer) As String
		  ' If Hostname:PortNumber has been overridden then this returns the override address.
		  
		  If Hostname = "" Or PortNumber <= 0 Then Return ""
		  
		  Dim i As Integer = GetOverrideIndex(Hostname, PortNumber)
		  If i > -1 Then Return NthField(mOverrideList.Item(i), ":", 3)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOverrideIndex(Hostname As String, PortNumber As Integer) As Integer
		  If Hostname = "" Or PortNumber <= 0 Or mOverrideList = Nil Then Return -1
		  
		  Dim c As Integer = mOverrideList.Count
		  For i As Integer = 0 To c - 1
		    Dim h, p, tmp As String
		    tmp = mOverrideList.Item(i)
		    h = NthField(tmp, ":", 1)
		    p = NthField(tmp, ":", 2)
		    If Val(p) = PortNumber And CompareDomains(Hostname, h) Then Return i
		  Next
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Owner() As libcURL.EasyHandle
		  If mOwner <> Nil And Not (mOwner.Value Is Nil) And mOwner.Value IsA libcURL.EasyHandle Then
		    Return libcURL.EasyHandle(mOwner.Value)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveOverride(Hostname As String, PortNumber As Integer)
		  ' Return to normal DNS lookups for the specified hostname and port number.
		  
		  If Not libcURL.Version.IsAtLeast(7, 42, 0) Then
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Owner)
		  End If
		  Dim i As Integer = GetOverrideIndex(Hostname, PortNumber)
		  If i <= -1 Then Return
		  RemoveOverrideAtIndex(i)
		  If mOverrideList = Nil Then mOverrideList = New ListPtr(Nil, Owner.Flags)
		  If Not mOverrideList.Append("-" + Hostname + ":" + Str(PortNumber, "####0")) Then Raise New cURLException(mOverrideList)
		  Me.FlushOverrides()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveOverrideAtIndex(Index As Integer)
		  If Index > -1 Then
		    Dim s() As String = mOverrideList
		    s.Remove(Index)
		    If UBound(s) > -1 Then mOverrideList = s Else mOverrideList = New ListPtr(Nil, Owner.Flags)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveResolver(ServerIP As String)
		  ' Remove the specified DNS server from the list of preferred resolvers.
		  
		  If Not libcURL.Version.IsAtLeast(7, 24, 0) Then
		    ErrorSetter(Owner).LastError = libcURL.Errors.FEATURE_UNAVAILABLE
		    Raise New cURLException(Owner)
		  End If
		  
		  Dim i As Integer = mResolvers.IndexOf(ServerIP)
		  If i = -1 Then Return
		  mResolvers.Remove(i)
		  Me.FlushResolvers()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  ' Reset all DNS overrides and server lists to default.
		  
		  ReDim mResolvers(-1)
		  Me.FlushResolvers
		  
		  If mOverrideList = Nil Then mOverrideList = New ListPtr(Nil, Owner.Flags)
		  Dim l As New ListPtr(Nil, Owner.Flags)
		  Dim s() As String = mOverrideList
		  For Each h As String In s
		    If Left(h, 1) <> "-" Then h = "-" + NthField(h, ":", 1) + ":" + NthField(h, ":", 2)
		    If Not l.Append(h) Then Raise New cURLException(l)
		  Next
		  mOverrideList = l
		  Me.FlushOverrides()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resolvers() As String()
		  ' Returns an array of preferred DNS server addresses.
		  
		  Return mResolvers()
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mOverrideList As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResolvers() As String
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Resolver"
			Group="Behavior"
			Type="String"
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
