#tag Interface
Private Interface ErrorHandler
	#tag Method, Flags = &h0
		Function LastError() As Integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LastError(Assigns NewError As Integer)
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About this Interface
		This Interface is only accessible to code within the libcURL module. It allows code within the module (even other classes) to 
		alter the internal LastError variable of an implementor object while preventing code from outside the module from tampering 
		with things it oughtn't.
		
		It also allows a libcURL.cURLException to be constructed from the implementor object.
	#tag EndNote


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
End Interface
#tag EndInterface
