#tag Class
Protected Class ValueInfo
Inherits libcURL.Opts.OptionInfo
	#tag Method, Flags = &h1021
		Private Sub Constructor(Option As curl_easyoption)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(Option)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Option As Integer, Value As Variant)
		  Super.Operator_Convert(Option)
		  mValue = Value
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mValue As Variant
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mValue
			End Get
		#tag EndGetter
		Value As Variant
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="Value"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libcURL.Opts.OptionInfo"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
