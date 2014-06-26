#tag Class
Protected Class cURLException
Inherits RuntimeException
	#tag Method, Flags = &h1000
		Sub Constructor(Err As Integer, MultiError As Boolean = False)
		  ' Returns a RuntimeException populated with the error message for the passed curl error code.
		  Me.ErrorNumber = Err
		  If Not MultiError Then
		    Me.Message = FormatError(Err)
		  Else
		    Me.Message = FormatMultiError(Err)
		  End If
		End Sub
	#tag EndMethod


End Class
#tag EndClass
