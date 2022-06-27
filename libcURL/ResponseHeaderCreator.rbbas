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
