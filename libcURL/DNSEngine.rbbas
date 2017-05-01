#tag Class
Protected Class DNSEngine
	#tag Method, Flags = &h0
		Function AddOverride(Hostname As String, PortNumber As Integer, OverrideResult As String) As Boolean
		  Dim d As Dictionary = mOverrides.Lookup(Hostname, New Dictionary)
		  d.Value(PortNumber) = OverrideResult
		  
		  'Dim c As New cURLClient
		  'Dim l As libcURL.ListPtr = Array("www.google.com:80:192.168.1.4")
		  'If Not c.SetOption(libcURL.Opts.RESOLVE, l) Then Break
		  'If Not c.Get("http://www.google.com/") Then Break
		  'Break
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle)
		  mOwner = New WeakRef(Owner)
		  mOverrideList = New ListPtr(Nil, Owner.Flags)
		  mOverrides = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsOverridden(Hostname As String, PortNumber As Integer) As Boolean
		  
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
		Function RemoveOverride(Hostname As String, PortNumber As Integer) As Boolean
		  
		End Function
	#tag EndMethod


	#tag Note, Name = About this class
		This class provides accessor methods to specify a proxy server for use with some or
		all transfers performed with a particular EasyHandle.
	#tag EndNote


	#tag Property, Flags = &h21
		Private mOverrideList As libcURL.ListPtr
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOverrides As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOwner As WeakRef
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResolver As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mResolver
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mResolver = value
			End Set
		#tag EndSetter
		Resolver As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPTunnel"
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
			Name="Password"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ServiceName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="UnifiedHeaders"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Username"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
