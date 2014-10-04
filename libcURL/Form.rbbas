#tag Class
Protected Class Form
	#tag Method, Flags = &h0
		Function AddElement(Name As String, Value As Variant) As Boolean
		  ' Adds the passed Value to the form using the specified name.
		  ' Value may be a String, FolderItem, or Integer. All other types,
		  ' including Nil, will raise an exception.
		  ' See:
		  ' http://curl.haxx.se/libcurl/c/curl_formadd.html
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.Form.AddElement
		  
		  Dim ValueType As Integer = VarType(Value)
		  Select Case ValueType ' marshal the value
		  Case Variant.TypeObject
		    Select Case Value
		    Case IsA FolderItem
		      Dim f As FolderItem = Value
		      If f.Exists And Not f.Directory Then
		        mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, Name, CURLFORM_FILE, f.AbsolutePath, CURLFORM_END)
		        Return mLastError = 0
		      End If
		    End Select
		  Case Variant.TypeInteger, Variant.TypeString
		    mLastError = curl_formadd(FirstItem, LastItem, CURLFORM_COPYNAME, Name, CURLFORM_COPYCONTENTS, Value.StringValue, CURLFORM_END)
		    Return mLastError = 0
		  End Select
		  
		  Dim err As RuntimeException
		  If Value IsA FolderItem Then
		    err = New IOException
		    err.Message = "Value does not exist or is a directory." ' bad file
		  Else
		    err = New TypeMismatchException
		    err.Message = "Value is of unsupported type: " + Introspection.GetType(Value).Name ' bad type
		  End If
		  Raise err
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  ' initialize libcURL just enough to handle form building
		  
		  If Not libcURL.IsAvailable Then
		    Dim err As New PlatformNotSupportedException
		    err.Message = "libcURL is not available."
		    Raise err
		  End If
		  
		  If curl_global_init(CURL_GLOBAL_NOTHING) <> 0 Then Raise New cURLException(libcURL.Errors.INIT_FAILED)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  If libcURL.IsAvailable Then
		    If FirstItem <> Nil Then libcURL.curl_formfree(FirstItem)
		    libcURL.curl_global_cleanup()
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Handle() As Ptr
		  ' This method returns a Ptr to the form structure which can be passed back to libcURL
		  Return FirstItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastError
		End Function
	#tag EndMethod


	#tag Note, Name = Using this class
		This class represents a linked list of form elements that are managed by libcURL.
		Use the AddElement method to add a form element to the form. Form elements may be
		either strings or folderitems (for uploading)
		
		Once the form is constructed you can pass it to the cURLItem.SetOption method using
		libcURL.Opts.HTTPPOST as the option number.
		
		e.g.
		
		  Dim frm As New libcURL.Form
		  Dim f FolderItem //assume a valid & extant file
		  Call frm.AddElement("file", f)
		  Call frm.AddElement("username", "AzureDiamond")
		  Call frm.AddElement("password", "hunter2")
		  Dim sock As New cURLItem
		  Call sock.SetOption(libcURL.Opts.HTTPPOST, frm)
		  Call sock.Perform("http://www.example.com/submit.php", 5)
	#tag EndNote


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
