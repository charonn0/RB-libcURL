#tag Class
Protected Class OptionInfo
	#tag Method, Flags = &h0
		Sub Constructor(Option As curl_easyoption)
		  mOpt = Option
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mOpt As curl_easyoption
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mOpt.Name
			  Return mb.CString(0)
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOpt.Type
			End Get
		#tag EndGetter
		Type As libcURL.Opts.curl_easytype
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOpt.Option
			End Get
		#tag EndGetter
		Value As Integer
	#tag EndComputedProperty


End Class
#tag EndClass
