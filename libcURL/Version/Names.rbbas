#tag Module
Protected Module Names
	#tag Method, Flags = &h1
		Protected Function LibZ() As String
		  Dim data As MemoryBlock = Struct.libzVersion
		  If data <> Nil Then Return data.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Platform() As String
		  Dim data As MemoryBlock = Struct.HostString
		  If data <> Nil Then Return data.CString(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SSL() As String
		  Dim data As MemoryBlock = Struct.SSLVersionString
		  If data <> Nil Then Return data.CString(0)
		End Function
	#tag EndMethod


End Module
#tag EndModule
