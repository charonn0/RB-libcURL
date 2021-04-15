#tag Class
Private Class MultipartFormElementCreator
Inherits libcURL.MultipartFormElement
	#tag Method, Flags = &h0
		Sub Constructor(ItemStruct As Ptr, Owner As libcURL.MultipartForm)
		  ' This class exists solely to protect the superclass Constructor from being called
		  ' from outside the libcURL module.
		  
		  // Calling the overridden superclass constructor.
		  // Constructor(ItemStruct As Ptr, Owner As libcURL.MultipartForm) -- From MultipartFormElement
		  Super.Constructor(ItemStruct, Owner)
		End Sub
	#tag EndMethod


End Class
#tag EndClass
