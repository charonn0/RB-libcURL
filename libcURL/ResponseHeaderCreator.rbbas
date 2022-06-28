#tag Class
Private Class ResponseHeaderCreator
Inherits libcURL.ResponseHeader
	#tag Method, Flags = &h0
		Sub Constructor(Owner As libcURL.EasyHandle, Header As curl_header)
		  ' This class exists solely to protect the superclass Constructor from being called
		  ' from outside the libcURL module.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(Owner As libcURL.EasyHandle, Header As curl_header) -- From ResponseHeader
		  Super.Constructor(Owner, Header)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Owner As libcURL.EasyHandle, Name As String, Value As String, NameIndex As Integer, NameCount As Integer)
		  Dim h As curl_header
		  h.Amount = NameCount
		  h.Index = NameIndex
		  h.Origin = CType(HeaderOriginType.Header, UInt32)
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(Owner As libcURL.EasyHandle, Header As curl_header) -- From ResponseHeader
		  Super.Constructor(Owner, h)
		  
		  mName = Name
		  mValue = Value
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Amount"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libcURL.ResponseHeader"
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
		#tag ViewProperty
			Name="Value"
			Group="Behavior"
			Type="String"
			InheritedFrom="libcURL.ResponseHeader"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
