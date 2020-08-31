#tag Class
Protected Class OptionInfo
	#tag Method, Flags = &h0
		Sub Constructor(Option As curl_easyoption)
		  mOpt = Option
		  mBindingAlias = GetOptionName(mOpt.Option)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Integer
		  Return Me.Value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(OptionID As Integer)
		  If Not libcURL.IsAvailable Then Raise New PlatformNotSupportedException
		  If libcURL.Version.IsAtLeast(7, 73, 0) Then
		    Dim opt As Ptr = curl_easy_option_by_id(OptionID)
		    If opt <> Nil Then Me.Constructor(opt.curl_easyoption)
		  Else
		    mOpt.Option = OptionID
		    mOpt.Type = curl_easytype.Unknown
		  End If
		  mBindingAlias = GetOptionName(OptionID)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(Name As String)
		  If Not libcURL.IsAvailable Then Raise New PlatformNotSupportedException
		  If libcURL.Version.IsAtLeast(7, 73, 0) Then
		    Dim opt As Ptr = curl_easy_option_by_name(Name)
		    If opt <> Nil Then Me.Constructor(opt.curl_easyoption)
		  Else
		    mOpt.Option = GetOptionByName(Uppercase(Name))
		    mOpt.Type = curl_easytype.Unknown
		  End If
		  mBindingAlias = GetOptionName(Me.Value)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBindingAlias As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOpt As curl_easyoption
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mOpt.Name
			  If mb <> Nil Then
			    Return mb.CString(0)
			  Else
			    Return mBindingAlias
			  End If
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
