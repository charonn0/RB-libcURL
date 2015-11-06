#tag Class
Protected Class HTTPAuthMethods
	#tag Method, Flags = &h1
		Protected Sub Constructor(Mask As Integer)
		  Basic = (BitAnd(Mask, Integer(CURLAUTH.BASIC)) = Integer(CURLAUTH.BASIC))
		  Digest = (BitAnd(Mask, Integer(CURLAUTH.DIGEST)) = Integer(CURLAUTH.DIGEST))
		  Digest_IE = (BitAnd(Mask, Integer(CURLAUTH.DIGEST_IE)) = Integer(CURLAUTH.DIGEST_IE))
		  Negotiate = (BitAnd(Mask, Integer(CURLAUTH.NEGOTIATE)) = Integer(CURLAUTH.NEGOTIATE))
		  NTLM = (BitAnd(Mask, Integer(CURLAUTH.NTLM)) = Integer(CURLAUTH.NTLM))
		  NTLM_WB = (BitAnd(Mask, Integer(CURLAUTH.NTLM_WB)) = Integer(CURLAUTH.NTLM_WB))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Mask() As Integer
		  Dim m As Integer
		  If Basic Then m = Integer(CURLAUTH.BASIC)
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
		  Me.Constructor(FromMask)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAll()
		  SetSafe()
		  Basic = True
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetOnly(AuthMethod As libcURL.CURLAUTH)
		  Me.Operator_Convert(0)
		  Select Case AuthMethod
		  Case CURLAUTH.BASIC
		    Basic = True
		    
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
		  Digest = True
		  Digest_IE = True
		  Negotiate = True
		  NTLM = True
		  NTLM_WB = True
		  
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mBasic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mBasic = value
			End Set
		#tag EndSetter
		Basic As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDigest
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDigest = value
			End Set
		#tag EndSetter
		Digest As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDigest_IE
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If libcURL.Version.IsAtLeast(7, 19, 3) Then
			    mDigest_IE = value
			  Else
			    mDigest_IE = False
			  End If
			End Set
		#tag EndSetter
		Digest_IE As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBasic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDigest As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDigest_IE As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNegotiate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNTLM As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNTLM_WB As Boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNegotiate
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNegotiate = value
			End Set
		#tag EndSetter
		Negotiate As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNTLM
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNTLM = value
			End Set
		#tag EndSetter
		NTLM As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNTLM_WB
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If libcURL.Version.IsAtLeast(7, 22, 0) Then
			    mNTLM_WB = value
			  Else
			    mNTLM_WB = False
			  End If
			End Set
		#tag EndSetter
		NTLM_WB As Boolean
	#tag EndComputedProperty


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
