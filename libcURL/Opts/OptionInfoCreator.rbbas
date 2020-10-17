#tag Class
Private Class OptionInfoCreator
Inherits libcURL.Opts.OptionInfo
	#tag Method, Flags = &h0
		Sub Constructor(Option As curl_easyoption)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(Option)
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="BindingAlias"
			Group="Behavior"
			Type="String"
			InheritedFrom="libcURL.Opts.OptionInfo"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DocumentationURL"
			Group="Behavior"
			Type="String"
			InheritedFrom="libcURL.Opts.OptionInfo"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDeprecated"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="libcURL.Opts.OptionInfo"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LibraryAlias"
			Group="Behavior"
			Type="String"
			InheritedFrom="libcURL.Opts.OptionInfo"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OptionNumber"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="libcURL.Opts.OptionInfo"
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
