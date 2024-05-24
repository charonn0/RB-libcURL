#tag Class
Class cURLClient
Inherits libcURL.cURLSession
	#tag Method, Flags = &h0
		Sub Get(URL As libcURL.URLParser, WriteTo As Writeable = Nil)
		  ' Asynchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Get
		  
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(URL As libcURL.URLParser, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Get
		  
		  Return Me.Perform(URL, Nil, WriteTo)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get(URL As String, WriteTo As Writeable = Nil)
		  ' Asynchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Get
		  
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get(URL As String, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously performs a retrieval using protocol-appropriate semantics (http GET, ftp RETR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Get
		  
		  Return Me.Perform(URL, Nil, WriteTo)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Head(URL As libcURL.URLParser)
		  ' Asynchronously performs a headers-only operation using protocol-appropriate semantics (http HEAD, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Head
		  
		  Call Me.SetOption(libcURL.Opts.NOBODY, True)
		  Me.Perform(URL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Head(URL As libcURL.URLParser) As Boolean
		  ' Synchronously performs a headers-only operation using protocol-appropriate semantics (http HEAD, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Head
		  
		  Call Me.SetOption(libcURL.Opts.NOBODY, True)
		  Return Me.Perform(URL, Nil, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Head(URL As String)
		  ' Asynchronously performs a headers-only operation using protocol-appropriate semantics (http HEAD, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Head
		  
		  Call Me.SetOption(libcURL.Opts.NOBODY, True)
		  Me.Perform(URL, Nil, Nil)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Head(URL As String) As Boolean
		  ' Synchronously performs a headers-only operation using protocol-appropriate semantics (http HEAD, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Head
		  
		  Call Me.SetOption(libcURL.Opts.NOBODY, True)
		  Return Me.Perform(URL, Nil, Nil)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As libcURL.URLParser, FormData As libcurl.MIMEMessage, WriteTo As Writeable = Nil)
		  ' (libcURL 7.56.0 or greater) Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As libcURL.URLParser, FormData As libcurl.MIMEMessage, WriteTo As Writeable = Nil) As Boolean
		  ' (libcURL 7.56.0 or greater) Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As libcURL.URLParser, FormData As libcurl.MultipartForm, WriteTo As Writeable = Nil)
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData parameter
		  ' may be an instace of MultipartForm, or a Dictionary of NAME:VALUE pairs comprising HTTP form elements: NAME is
		  ' a string containing the form-element name; VALUE may be a string or a FolderItem. WriteTo is an optional
		  ' Writeable object (e.g. BinaryStream); downloaded data will be written to this object directly. If WriteTo is
		  ' Nil then use the GetDownloadedData method to get any downloaded data. The transfer will be performed on the
		  ' event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As libcURL.URLParser, FormData As libcurl.MultipartForm, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData parameter
		  ' may be an instace of MultipartForm, or a Dictionary of NAME:VALUE pairs comprising HTTP form elements: NAME is
		  ' a string containing the form-element name; VALUE may be a string or a FolderItem. WriteTo is an optional Writeable
		  ' object (e.g. BinaryStream); downloaded data will be written to this object directly. If WriteTo is Nil then use
		  ' the GetDownloadedData method to get any downloaded data. This method will block the calling thread until the
		  ' transfer completes. All events will be raised on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As libcURL.URLParser, PostFields() As String, WriteTo As Writeable = Nil)
		  ' Asynchronously POST the passed FormData via HTTP(S) using application/x-www-form-urlencoded. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTTP form elements. NAME is a string containing the form-element name; VALUE
		  ' is a string containing the form-element value.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(PostFields)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As libcURL.URLParser, PostFields() As String, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously POST the passed PostFields via HTTP(S) using application/x-www-form-urlencoded. The PostFields array
		  ' contains "NAME=VALUE" strings comprising HTTP form elements.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(PostFields)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, FormData As libcurl.MIMEMessage, WriteTo As Writeable = Nil)
		  ' (libcURL 7.56.0 or greater) Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As String, FormData As libcurl.MIMEMessage, WriteTo As Writeable = Nil) As Boolean
		  ' (libcURL 7.56.0 or greater) Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. 
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, FormData As libcurl.MultipartForm, WriteTo As Writeable = Nil)
		  ' Asynchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData parameter
		  ' may be an instace of MultipartForm, or a Dictionary of NAME:VALUE pairs comprising HTTP form elements: NAME is
		  ' a string containing the form-element name; VALUE may be a string or a FolderItem. WriteTo is an optional
		  ' Writeable object (e.g. BinaryStream); downloaded data will be written to this object directly. If WriteTo is
		  ' Nil then use the GetDownloadedData method to get any downloaded data. The transfer will be performed on the
		  ' event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As String, FormData As libcurl.MultipartForm, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously POST the passed FormData via HTTP(S) using multipart/form-data encoding. The FormData parameter
		  ' may be an instace of MultipartForm, or a Dictionary of NAME:VALUE pairs comprising HTTP form elements: NAME is
		  ' a string containing the form-element name; VALUE may be a string or a FolderItem. WriteTo is an optional Writeable
		  ' object (e.g. BinaryStream); downloaded data will be written to this object directly. If WriteTo is Nil then use
		  ' the GetDownloadedData method to get any downloaded data. This method will block the calling thread until the 
		  ' transfer completes. All events will be raised on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(FormData)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(URL As String, PostFields() As String, WriteTo As Writeable = Nil)
		  ' Asynchronously POST the passed FormData via HTTP(S) using application/x-www-form-urlencoded. The FormData dictionary
		  ' contains NAME:VALUE pairs comprising HTTP form elements. NAME is a string containing the form-element name; VALUE
		  ' is a string containing the form-element value.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(PostFields)
		  Me.Perform(URL, Nil, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(URL As String, PostFields() As String, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously POST the passed PostFields via HTTP(S) using application/x-www-form-urlencoded. The PostFields array
		  ' contains "NAME=VALUE" strings comprising HTTP form elements.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Post
		  
		  Me.EasyHandle.SetFormData(PostFields)
		  Return Me.Perform(URL, Nil, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As libcURL.URLParser, Data As MemoryBlock, WriteTo As Writeable = Nil)
		  ' Asynchronously uploads the Data MemoryBlock using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Dim bs As New BinaryStream(Data)
		  Me.Put(URL, bs, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As libcURL.URLParser, Data As MemoryBlock, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously uploads the Data MemoryBlock using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Dim bs As New BinaryStream(Data)
		  Return Me.Put(URL, bs, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As libcURL.URLParser, ReadFrom As Readable, WriteTo As Writeable = Nil)
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses. The
		  ' path part of the URL specifies the remote directory and file name to store the file under.
		  ' ReadFrom is an object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be
		  ' read from this object. WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be
		  ' written to this object directly. If WriteTo is Nil then use the GetDownloadedData method to get any
		  ' downloaded data. The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Me.EasyHandle.UploadMode = True
		  Me.Perform(URL, ReadFrom, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As libcURL.URLParser, ReadFrom As Readable, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' ReadFrom is an object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be
		  ' read from this object. WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be
		  ' written to this object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded
		  ' data. This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Me.EasyHandle.UploadMode = True
		  Return Me.Perform(URL, ReadFrom, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As String, Data As MemoryBlock, WriteTo As Writeable = Nil)
		  ' Asynchronously uploads the Data MemoryBlock using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Dim bs As New BinaryStream(Data)
		  Me.Put(URL, bs, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, Data As MemoryBlock, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously uploads the Data MemoryBlock using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be written to this
		  ' object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded data.
		  ' This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Dim bs As New BinaryStream(Data)
		  Return Me.Put(URL, bs, WriteTo)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Put(URL As String, ReadFrom As Readable, WriteTo As Writeable = Nil)
		  ' Asynchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses. The
		  ' path part of the URL specifies the remote directory and file name to store the file under.
		  ' ReadFrom is an object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be
		  ' read from this object. WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be
		  ' written to this object directly. If WriteTo is Nil then use the GetDownloadedData method to get any
		  ' downloaded data. The transfer will be performed on the event loop (main thread).
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Me.EasyHandle.UploadMode = True
		  Me.Perform(URL, ReadFrom, WriteTo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Put(URL As String, ReadFrom As Readable, WriteTo As Writeable = Nil) As Boolean
		  ' Synchronously performs an upload using protocol-appropriate semantics (http PUT, ftp STOR, etc.)
		  ' The protocol is inferred from the URL; explictly specify the protocol in the URL to avoid bad guesses.
		  ' ReadFrom is an object that implements the Readable interface (e.g. BinaryStream). The uploaded data will be
		  ' read from this object. WriteTo is an optional Writeable object (e.g. BinaryStream); downloaded data will be 
		  ' written to this object directly. If WriteTo is Nil then use the GetDownloadedData method to get any downloaded
		  ' data. This method will block the calling thread until the transfer completes. All events will be raised
		  ' on the calling thread.
		  '
		  ' See:
		  ' https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient.Put
		  
		  Me.EasyHandle.UploadMode = True
		  Return Me.Perform(URL, ReadFrom, WriteTo)
		End Function
	#tag EndMethod


	#tag Note, Name = Using this class
		This class is a general purpose libcURL client derived from the slightly-less user-friendly cURLSession class. 
		You may use an instance of cURLClient anywhere a cURLSession is expected.
		
		An instance of cURLClient is a self-contained "session". It maintains its own caches, options, connections, 
		cookies, etc., and can operate on one URL at a time. No previous experience with libcURL is necessary to use this
		class. Transfers are initiated by calling one of the overloaded request methods:
		
		    Get() for downloading
		    Put() for uploading
		    Head() for a headers-only operation
		    Post() for HTTP forms.
		
		The names of these methods are borrowed from HTTP but do not imply HTTP as the protocol (except Post. See also: cURLClient.Perform).
		That being said, HTTP is assumed unless the URL or other options indicate a different protocol. You should always
		specify the protocol in the URL to avoid confusion.
		
		This class can perform both synchronous and asynchronous transfers, depending on which version of a method is 
		called: synchronous versions return True on success; asynchronous versions do not return a value.
		
		Synchronous requests will be performed on the calling thread and will occasionally explicitly yield to allow other 
		threads to run. Asynchronous requests will be performed on the main event loop; in console applications this means 
		you must pump the event loop manually.
		
		Each instance of cURLClient can process one transfer at a time. Attempting to initiate a new transfer before the 
		previous transfer completes will raise a cURLException with error number CURLM_ADDED_ALREADY(7).
		
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
