#tag Class
Private Class HTTP2PushedConnection
Inherits libcURL.EasyHandle
	#tag Method, Flags = &h0
		Sub Constructor(ParentHandle As libcURL.EasyHandle, PushedHandle As Integer)
		  mHandle = PushedHandle
		  If Instances = Nil Then Instances = New Dictionary
		  Instances.Value(mHandle) = New WeakRef(Me)
		  mOptions = New Dictionary
		  CopyOpts(ParentHandle)
		  InitCallbacks()
		  
		End Sub
	#tag EndMethod


End Class
#tag EndClass
