#tag Class
Private Class MIMEMessageCreator
Inherits libcURL.MIMEMessage
	#tag Method, Flags = &h1000
		Sub Constructor(MessagePtr As Ptr, ParentMessage As libcURL.MIMEMessage)
		  ' This class exists solely to protect the superclass Constructor from being called
		  ' from outside the libcURL module.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(MessagePtr As Ptr, ParentMessage As libcURL.MIMEMessage) -- From MIMEMessage
		  Super.Constructor(MessagePtr, ParentMessage)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
