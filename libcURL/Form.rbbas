#tag Class
Protected Class Form
	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As Variant) As Boolean
		  If Not libcURL.IsAvailable Then Return False
		  Dim Contents, type, filename, nm As String
		  nm = Name + Chr(0)
		  Dim ValueType As Integer = VarType(Value)
		  Select Case ValueType
		  Case Variant.TypeObject
		    If Value IsA FolderItem Then
		      Dim f As FolderItem = Value
		      If f.Exists And Not f.Directory Then
		        Dim bs As BinaryStream = BinaryStream.Open(f)
		        Contents = New MemoryBlock(bs.Length)
		        Contents = bs.Read(bs.Length)
		        filename = f.Name
		        type = "application/octet-stream"
		        Call Me.FormAdd(Name, f)
		        Return mLastError = 0
		        'mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, nm, CURLFORM_COPYCONTENTS, Contents, CURLFORM_FILE, filename, CURLFORM_FILECONTENT, f.AbsolutePath, CURLFORM_END)
		        'TypeOption As Integer, Type As CString, FileNameOption As Integer, FileName As CString
		      End If
		    Else
		      Dim err As New TypeMismatchException
		      err.Message = "Value is of unsupported type: " + Introspection.GetType(Value).Name
		      Raise err
		    End If
		    
		  Case Variant.TypeInteger
		    Contents = Str(Value.IntegerValue) + Chr(0)
		    
		  Case Variant.TypeString
		    Contents = Value.StringValue + Chr(0)
		    
		  Else
		    Dim err As New TypeMismatchException
		    err.Message = "Value is of unsupported type: " + Introspection.GetType(Value).Name
		    Raise err
		    
		  End Select
		  'mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, nm, CURLFORM_COPYCONTENTS, Contents, CURLFORM_END)
		  Call Me.FormAdd(Name, Value.StringValue)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not libcURL.IsAvailable Or curl_global_init(CURL_GLOBAL_DEFAULT) <> 0 Then Raise cURLException(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If FirstItem <> Nil Then libcURL.curl_formfree(FirstItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormAdd(Name As String, Value As FolderItem) As Boolean
		  mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, Name, CURLFORM_FILE, Value.AbsolutePath, CURLFORM_END)
		  'TypeOption As Integer, Type As CString, FileNameOption As Integer, FileName As CString
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FormAdd(Name As String, Value As String) As Boolean
		  mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, Name, CURLFORM_COPYCONTENTS, Value, CURLFORM_END)
		  Return mLastError = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  Return FirstItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FirstItem As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastItem As Ptr
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLastError As Integer
	#tag EndProperty


	#tag Constant, Name = CURLFORM_COPYCONTENTS, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLFORM_COPYNAME, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLFORM_END, Type = Double, Dynamic = False, Default = \"17", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLFORM_FILE, Type = Double, Dynamic = False, Default = \"10", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLFORM_FILECONTENT, Type = Double, Dynamic = False, Default = \"7", Scope = Protected
	#tag EndConstant


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
End Class
#tag EndClass
