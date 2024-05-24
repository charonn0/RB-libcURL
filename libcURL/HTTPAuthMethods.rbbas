#tag Class
Protected Class HTTPAuthMethods
	#tag Method, Flags = &h1
		Protected Sub Constructor(Mask As Integer)
		  Basic = (BitAnd(Mask, Integer(CURLAUTH.BASIC)) = Integer(CURLAUTH.BASIC))
		  Bearer = (BitAnd(Mask, Integer(CURLAUTH.BEARER)) = Integer(CURLAUTH.BEARER))
		  Digest = (BitAnd(Mask, Integer(CURLAUTH.DIGEST)) = Integer(CURLAUTH.DIGEST))
		  Digest_IE = (BitAnd(Mask, Integer(CURLAUTH.DIGEST_IE)) = Integer(CURLAUTH.DIGEST_IE))
		  Negotiate = (BitAnd(Mask, Integer(CURLAUTH.NEGOTIATE)) = Integer(CURLAUTH.NEGOTIATE))
		  NTLM = (BitAnd(Mask, Integer(CURLAUTH.NTLM)) = Integer(CURLAUTH.NTLM))
		  NTLM_WB = (BitAnd(Mask, Integer(CURLAUTH.NTLM_WB)) = Integer(CURLAUTH.NTLM_WB))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mask() As Integer
		  ' Returns a bitmask corresponding to the currently enabled authentication methods.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.Mask
		  
		  Dim m As Integer
		  If Basic Then m = Integer(CURLAUTH.BASIC)
		  If Bearer Then m = m Or Integer(CURLAUTH.BEARER)
		  If Digest Then m = m Or Integer(CURLAUTH.DIGEST)
		  If Digest_IE Then m = m Or Integer(CURLAUTH.DIGEST_IE)
		  If Negotiate Then m = m Or Integer(CURLAUTH.NEGOTIATE)
		  If NTLM Then m = m Or Integer(CURLAUTH.NTLM)
		  If NTLM_WB Then m = m Or Integer(CURLAUTH.NTLM_WB)
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromMask As Integer)
		  ' Constructs a new instance, or updates an existing instance, with the bitmask specified 
		  ' as FromMask.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.Operator_Convert
		  
		  Me.Constructor(FromMask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(FromEnum As libcURL.CURLAUTH)
		  ' Constructs a new instance, or updates an existing instance, with the method specified as FromEnum.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.Operator_Convert
		  
		  SetOnly(FromEnum)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAll()
		  ' A convenience method that enables all authentication methods.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.SetAll
		  
		  SetSafe()
		  Basic = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOnly(AuthMethod As libcURL.CURLAUTH)
		  ' A convenience method that enables only the specified authentication method; all others are disabled.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.SetOnly
		  
		  Me.Operator_Convert(0)
		  Select Case AuthMethod
		  Case CURLAUTH.BASIC
		    Basic = True
		    
		  Case CURLAUTH.BEARER
		    Bearer = True
		    
		  Case CURLAUTH.DIGEST
		    Digest = True
		    
		  Case CURLAUTH.DIGEST_IE
		    Digest_IE = True
		    
		  Case CURLAUTH.NEGOTIATE
		    Negotiate = True
		    
		  Case CURLAUTH.NTLM
		    NTLM = True
		    
		  Case CURLAUTH.NTLM_WB
		    NTLM_WB = True
		    
		  Case CURLAUTH.ANY
		    SetAll()
		    Return
		  End Select
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSafe()
		  ' A convenience method that enables only "safe" authentication methods (i.e., everything but Basic.)
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.HTTPAuthMethods.SetSafe
		  
		  Bearer = True
		  Digest = True
		  Digest_IE = True
		  Negotiate = True
		  NTLM = True
		  NTLM_WB = True
		End Sub
	#tag EndMethod


	#tag Note, Name = Using this class
		This class represents a bitmask of available or permitted HTTP and proxy authentication methods. You can enable and disable
		individual authentication methods by assigning True or False to the corresponding class property. Enabling or disabling an
		authentication method sets or clears the corresponding bit in the value returned from the Mask() method.
		
		This class cannot be instantiated using the New keyword. You must assign an integer or CURLAUTH value to a reference to create
		a new instance.
		
		Set the authentication method before a request:
		
		  Dim curl As New cURLClient
		  curl.HTTPAuthenticationMethod = libcURL.CURLAUTH.BEARER
		  curl.HTTPAuthenticationMethod.Digest = True
		
		Or, get the available authentication methods after a failed request:
		
		  Dim curl As New cURLClient
		  If Not curl.Get("https://private.example.com/file.txt") Then
		    Dim availmethods As libcURL.HTTPAuthMethods = curl.HTTPAuthenticationMethod
		  End If
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		Basic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Bearer As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Digest As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Digest_IE As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Negotiate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NTLM As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NTLM_WB As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Basic"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Digest"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Digest_IE"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="Negotiate"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NTLM"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NTLM_WB"
			Group="Behavior"
			Type="Boolean"
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
