#tag Class
Private Class MIMEMessagePartCreator
Inherits libcURL.MIMEMessagePart
	#tag Method, Flags = &h0
		Sub Constructor(ItemStruct As Ptr, Owner As libcURL.MIMEMessage)
		  ' This class exists solely to protect the superclass Constructor from being called
		  ' from outside the libcURL module.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(ItemStruct As Ptr, Owner As libcURL.MIMEMessage) -- From MIMEMessagePart
		  Super.Constructor(ItemStruct, Owner)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
