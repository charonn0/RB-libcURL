#tag Module
Protected Module libcURL
	#tag Method, Flags = &h21
		Private Function cURLException(Err As Integer) As RuntimeException
		  Dim ex As New RuntimeException
		  ex.ErrorNumber = Err
		  ex.Message = FormatError(Err)
		  Return ex
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_easy_cleanup Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_duphandle Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_escape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_getinfo Lib "libcurl" (handle As Integer, infoCode As Integer, buffer As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_init Lib "libcurl" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_pause Lib "libcurl" (Handle As Integer, Mask As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_perform Lib "libcurl" (Handle As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_recv Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToRead As Integer, ByRef BytesRead As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_easy_reset Lib "libcurl" (Handle As Integer)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_send Lib "libcurl" (Handle As Integer, Buffer As Ptr, BytesToWrite As Integer, ByRef BytesWritten As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_setopt Lib "libcurl" (Handle As Integer, Option As Integer, Value As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_strerror Lib "libcurl" (errNo As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_easy_unescape Lib "libcurl" (cURL As Integer, char As Ptr, Length As Integer, ByRef OutLength As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_formadd Lib "libcurl" (ByRef FirstItem As Ptr, ByRef LastItem As Ptr, Option1 As Integer, Value1 As CString, Option2 As Integer, Value2 As CString, FinalOption As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_formfree Lib "libcurl" (curlform As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_free Lib "libcurl" (char As Ptr)
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_getdate Lib "libcurl" (sDate As CString, Reserved As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Sub curl_global_cleanup Lib "libcurl" ()
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_global_init Lib "libcurl" (flags As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_version Lib "libcurl" () As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h1
		Protected Soft Declare Function curl_version_info Lib "libcurl" (Version As Integer) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function FormatError(cURLError As Integer) As String
		  //Translates libcurl error numbers to messages
		  If libcURL.IsAvailable Then
		    Dim mb As MemoryBlock = curl_easy_strerror(cURLError)
		    Return mb.CString(0)
		  Else
		    Return "libcURL is not available."
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  Return System.IsFunctionAvailable("curl_easy_init", "libcurl")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseDate(RawDate As String, ByRef Parsed As Date) As Boolean
		  ' Parses the passed date string into the referenced Date object.
		  ' If parsing was successful, returns True and instantiates the passed date reference; else, returns false.
		  ' Valid for dates on or before December 31, 2037 23:59:59 GMT
		  
		  Dim count As Integer = curl_getdate(RawDate, Nil)
		  If count > -1 Then
		    Parsed = New Date(1970, 1, 1, 0, 0, 0, 0.0) 'UNIX epoch
		    Parsed.TotalSeconds = Parsed.TotalSeconds + count
		    Return True
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLDecode(Data As String) As String
		  If libcURL.IsAvailable Then
		    If curl_global_init(3) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim outlen As Integer
		        Dim p As Ptr = curl_easy_unescape(mHandle, InP, InP.Size, outlen)
		        InP = p
		        Dim ret As String = InP.StringValue(0, outlen)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function URLEncode(Data As String) As String
		  If libcURL.IsAvailable Then
		    If curl_global_init(3) = 0 Then
		      Dim mHandle As Integer = curl_easy_init()
		      If mHandle > 0 Then
		        Dim InP As MemoryBlock = Data
		        Dim p As Ptr = curl_easy_escape(mHandle, InP, InP.Size)
		        InP = p
		        Dim ret As String = InP.CString(0)
		        curl_free(p)
		        curl_easy_cleanup(mHandle)
		        Return ret
		      End If
		    End If
		  End If
		End Function
	#tag EndMethod


	#tag Note, Name = Copying
		libcURL Copyright (c) 1996 - 2014, Daniel Stenberg, <daniel@haxx.se>.
		RB-libcURL Copyright (c)2014 Andrew Lambert, <andrew@boredomsoft.org>.
		 
		All rights reserved.
		 
		Permission to use, copy, modify, and distribute this software for any purpose
		with or without fee is hereby granted, provided that the above copyright
		notice and this permission notice appear in all copies.
		 
		THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
		IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
		FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF THIRD PARTY RIGHTS. IN
		NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
		DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
		OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
		OR OTHER DEALINGS IN THE SOFTWARE.
		 
		Except as contained in this notice, the name of a copyright holder shall not
		be used in advertising or otherwise to promote the sale, use or other dealings
		in this Software without prior written authorization of the copyright holder.
	#tag EndNote


	#tag Constant, Name = CURLM_CALL_MULTI_PERFORM, Type = Double, Dynamic = False, Default = \"4294967295", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLVERSION_FOURTH, Type = Double, Dynamic = False, Default = \"3", Scope = Private
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_ALL, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_DEFAULT, Type = Double, Dynamic = False, Default = \"CURL_GLOBAL_ALL", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_NOTHING, Type = Double, Dynamic = False, Default = \"0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_SSL, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURL_GLOBAL_WIN32, Type = Double, Dynamic = False, Default = \"2", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_EFFECTIVE_URL, Type = Double, Dynamic = False, Default = \"1048577", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_LOCAL_IP, Type = Double, Dynamic = False, Default = \"1048617", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_LOCAL_PORT, Type = Double, Dynamic = False, Default = \"2097194", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_PRIMARY_IP, Type = Double, Dynamic = False, Default = \"1048608", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_PRIMARY_PORT, Type = Double, Dynamic = False, Default = \"2097192", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_REDIRECT_COUNT, Type = Double, Dynamic = False, Default = \"2097172", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_RESPONSE_CODE, Type = Double, Dynamic = False, Default = \"2097154", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_SIZE_DOWNLOAD, Type = Double, Dynamic = False, Default = \"3145736", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = INFO_SPEED_DOWNLOAD, Type = Double, Dynamic = False, Default = \"3145737", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = curl_infotype, Flags = &h1
		text
		  header_in
		  header_out
		  data_in
		  data_out
		  ssl_in
		  ssl_out
		info_end
	#tag EndEnum


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
End Module
#tag EndModule
