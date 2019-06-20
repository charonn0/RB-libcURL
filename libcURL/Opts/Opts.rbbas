#tag Module
Protected Module Opts
	#tag Method, Flags = &h1
		Protected Function OptName(OptionNumber As Integer) As String
		  Select Case OptionNumber
		  Case libcURL.Opts.ACCEPT_ENCODING
		    Return "libcURL.Opts.ACCEPT_ENCODING"
		  Case libcURL.Opts.APPEND
		    Return "libcURL.Opts.APPEND"
		  Case libcURL.Opts.AUTOREFERER
		    Return "libcURL.Opts.AUTOREFERER"
		  Case libcURL.Opts.BUFFERSIZE
		    Return "libcURL.Opts.BUFFERSIZE"
		  Case libcURL.Opts.CAINFO
		    Return "libcURL.Opts.CAINFO"
		  Case libcURL.Opts.CAPATH
		    Return "libcURL.Opts.CAPATH"
		  Case libcURL.Opts.CERTINFO
		    Return "libcURL.Opts.CERTINFO"
		  Case libcURL.Opts.CHUNK_BGN_FUNCTION
		    Return "libcURL.Opts.CHUNK_BGN_FUNCTION"
		  Case libcURL.Opts.CHUNK_DATA
		    Return "libcURL.Opts.CHUNK_DATA"
		  Case libcURL.Opts.CHUNK_END_FUNCTION
		    Return "libcURL.Opts.CHUNK_END_FUNCTION"
		  Case libcURL.Opts.CLOSESOCKETDATA
		    Return "libcURL.Opts.CLOSESOCKETDATA"
		  Case libcURL.Opts.CLOSESOCKETFUNCTION
		    Return "libcURL.Opts.CLOSESOCKETFUNCTION"
		  Case libcURL.Opts.CONNECTTIMEOUT
		    Return "libcURL.Opts.CONNECTTIMEOUT"
		  Case libcURL.Opts.CONNECT_ONLY
		    Return "libcURL.Opts.CONNECT_ONLY"
		  Case libcURL.Opts.COOKIE
		    Return "libcURL.Opts.COOKIE"
		  Case libcURL.Opts.COOKIEFILE
		    Return "libcURL.Opts.COOKIEFILE"
		  Case libcURL.Opts.COOKIEJAR
		    Return "libcURL.Opts.COOKIEJAR"
		  Case libcURL.Opts.COOKIELIST
		    Return "libcURL.Opts.COOKIELIST"
		  Case libcURL.Opts.COOKIESESSION
		    Return "libcURL.Opts.COOKIESESSION"
		  Case libcURL.Opts.COPYPOSTFIELDS
		    Return "libcURL.Opts.COPYPOSTFIELDS"
		  Case libcURL.Opts.CRLF
		    Return "libcURL.Opts.CRLF"
		  Case libcURL.Opts.CRLFILE
		    Return "libcURL.Opts.CRLFILE"
		  Case libcURL.Opts.CURLU
		    Return "libcURL.Opts.CURLU"
		  Case libcURL.Opts.CUSTOMREQUEST
		    Return "libcURL.Opts.CUSTOMREQUEST"
		  Case libcURL.Opts.DEBUGDATA
		    Return "libcURL.Opts.DEBUGDATA"
		  Case libcURL.Opts.DEBUGFUNCTION
		    Return "libcURL.Opts.DEBUGFUNCTION"
		  Case libcURL.Opts.DEFAULT_PROTOCOL
		    Return "libcURL.Opts.DEFAULT_PROTOCOL"
		  Case libcURL.Opts.DIRLISTONLY
		    Return "libcURL.Opts.DIRLISTONLY"
		  Case libcURL.Opts.DISALLOW_USERNAME_IN_URL
		    Return "libcURL.Opts.DISALLOW_USERNAME_IN_URL"
		  Case libcURL.Opts.DNS_CACHE_TIMEOUT
		    Return "libcURL.Opts.DNS_CACHE_TIMEOUT"
		  Case libcURL.Opts.DNS_INTERFACE
		    Return "libcURL.Opts.DNS_INTERFACE"
		  Case libcURL.Opts.DNS_LOCAL_IP4
		    Return "libcURL.Opts.DNS_LOCAL_IP4"
		  Case libcURL.Opts.DNS_LOCAL_IP6
		    Return "libcURL.Opts.DNS_LOCAL_IP6"
		  Case libcURL.Opts.DNS_SERVERS
		    Return "libcURL.Opts.DNS_SERVERS"
		  Case libcURL.Opts.DNS_SHUFFLE_ADDRESSES
		    Return "libcURL.Opts.DNS_SHUFFLE_ADDRESSES"
		  Case libcURL.Opts.EGDSOCKET
		    Return "libcURL.Opts.EGDSOCKET"
		  Case libcURL.Opts.ERRORBUFFER
		    Return "libcURL.Opts.ERRORBUFFER"
		  Case libcURL.Opts.EXPECT_100_TIMEOUT_MS
		    Return "libcURL.Opts.EXPECT_100_TIMEOUT_MS"
		  Case libcURL.Opts.FAILONERROR
		    Return "libcURL.Opts.FAILONERROR"
		  Case libcURL.Opts.FILETIME
		    Return "libcURL.Opts.FILETIME"
		  Case libcURL.Opts.FNMATCH_DATA
		    Return "libcURL.Opts.FNMATCH_DATA"
		  Case libcURL.Opts.FNMATCH_FUNCTION
		    Return "libcURL.Opts.FNMATCH_FUNCTION"
		  Case libcURL.Opts.FOLLOWLOCATION
		    Return "libcURL.Opts.FOLLOWLOCATION"
		  Case libcURL.Opts.FORBID_REUSE
		    Return "libcURL.Opts.FORBID_REUSE"
		  Case libcURL.Opts.FRESH_CONNECT
		    Return "libcURL.Opts.FRESH_CONNECT"
		  Case libcURL.Opts.FTPPORT
		    Return "libcURL.Opts.FTPPORT"
		  Case libcURL.Opts.FTP_ACCOUNT
		    Return "libcURL.Opts.FTP_ACCOUNT"
		  Case libcURL.Opts.FTP_ALTERNATIVE_TO_USER
		    Return "libcURL.Opts.FTP_ALTERNATIVE_TO_USER"
		  Case libcURL.Opts.FTP_CREATE_MISSING_DIRS
		    Return "libcURL.Opts.FTP_CREATE_MISSING_DIRS"
		  Case libcURL.Opts.FTP_FILEMETHOD
		    Return "libcURL.Opts.FTP_FILEMETHOD"
		  Case libcURL.Opts.HAPROXYPROTOCOL
		    Return "libcURL.Opts.HAPROXYPROTOCOL"
		  Case libcURL.Opts.HEADER
		    Return "libcURL.Opts.HEADER"
		  Case libcURL.Opts.HEADERDATA
		    Return "libcURL.Opts.HEADERDATA"
		  Case libcURL.Opts.HEADERFUNCTION
		    Return "libcURL.Opts.HEADERFUNCTION"
		  Case libcURL.Opts.HEADEROPT
		    Return "libcURL.Opts.HEADEROPT"
		  Case libcURL.Opts.HTTP200ALIASES
		    Return "libcURL.Opts.HTTP200ALIASES"
		  Case libcURL.Opts.HTTPAUTH
		    Return "libcURL.Opts.HTTPAUTH"
		  Case libcURL.Opts.HTTPGET
		    Return "libcURL.Opts.HTTPGET"
		  Case libcURL.Opts.HTTPHEADER
		    Return "libcURL.Opts.HTTPHEADER"
		  Case libcURL.Opts.HTTPPOST
		    Return "libcURL.Opts.HTTPPOST"
		  Case libcURL.Opts.HTTPPROXYTUNNEL
		    Return "libcURL.Opts.HTTPPROXYTUNNEL"
		  Case libcURL.Opts.HTTPVERSION
		    Return "libcURL.Opts.HTTPVERSION"
		  Case libcURL.Opts.HTTP_CONTENT_DECODING
		    Return "libcURL.Opts.HTTP_CONTENT_DECODING"
		  Case libcURL.Opts.HTTP_TRANSFER_DECODING
		    Return "libcURL.Opts.HTTP_TRANSFER_DECODING"
		  Case libcURL.Opts.IGNORE_CONTENT_LENGTH
		    Return "libcURL.Opts.IGNORE_CONTENT_LENGTH"
		  Case libcURL.Opts.IPRESOLVE
		    Return "libcURL.Opts.IPRESOLVE"
		  Case libcURL.Opts.ISSUERCERT
		    Return "libcURL.Opts.ISSUERCERT"
		  Case libcURL.Opts.KEYPASSWD
		    Return "libcURL.Opts.KEYPASSWD"
		  Case libcURL.Opts.KRBLEVEL
		    Return "libcURL.Opts.KRBLEVEL"
		  Case libcURL.Opts.LOCALPORT
		    Return "libcURL.Opts.LOCALPORT"
		  Case libcURL.Opts.LOCALPORTRANGE
		    Return "libcURL.Opts.LOCALPORTRANGE"
		  Case libcURL.Opts.LOW_SPEED_LIMIT
		    Return "libcURL.Opts.LOW_SPEED_LIMIT"
		  Case libcURL.Opts.LOW_SPEED_TIME
		    Return "libcURL.Opts.LOW_SPEED_TIME"
		  Case libcURL.Opts.MAIL_FROM
		    Return "libcURL.Opts.MAIL_FROM"
		  Case libcURL.Opts.MAIL_RCPT
		    Return "libcURL.Opts.MAIL_RCPT"
		  Case libcURL.Opts.MAXREDIRS
		    Return "libcURL.Opts.MAXREDIRS"
		  Case libcURL.Opts.MIMEPOST
		    Return "libcURL.Opts.MIMEPOST"
		  Case libcURL.Opts.NETINTERFACE
		    Return "libcURL.Opts.NETINTERFACE"
		  Case libcURL.Opts.NETRC_FILE
		    Return "libcURL.Opts.NETRC_FILE"
		  Case libcURL.Opts.NOBODY
		    Return "libcURL.Opts.NOBODY"
		  Case libcURL.Opts.NOPROGRESS
		    Return "libcURL.Opts.NOPROGRESS"
		  Case libcURL.Opts.NOPROXY
		    Return "libcURL.Opts.NOPROXY"
		  Case libcURL.Opts.OPENSOCKETDATA
		    Return "libcURL.Opts.OPENSOCKETDATA"
		  Case libcURL.Opts.OPENSOCKETFUNCTION
		    Return "libcURL.Opts.OPENSOCKETFUNCTION"
		  Case libcURL.Opts.PASSWORD
		    Return "libcURL.Opts.PASSWORD"
		  Case libcURL.Opts.PATH_AS_IS
		    Return "libcURL.Opts.PATH_AS_IS"
		  Case libcURL.Opts.PIPELINING_SERVER_BL
		    Return "libcURL.Opts.PIPELINING_SERVER_BL"
		  Case libcURL.Opts.PIPELINING_SITE_BL
		    Return "libcURL.Opts.PIPELINING_SITE_BL"
		  Case libcURL.Opts.PIPEWAIT
		    Return "libcURL.Opts.PIPEWAIT"
		  Case libcURL.Opts.PORT
		    Return "libcURL.Opts.PORT"
		  Case libcURL.Opts.POSTFIELDS
		    Return "libcURL.Opts.POSTFIELDS"
		  Case libcURL.Opts.POSTFIELDSIZE
		    Return "libcURL.Opts.POSTFIELDSIZE"
		  Case libcURL.Opts.POSTQUOTE
		    Return "libcURL.Opts.POSTQUOTE"
		  Case libcURL.Opts.POSTREDIR
		    Return "libcURL.Opts.POSTREDIR"
		  Case libcURL.Opts.PREQUOTE
		    Return "libcURL.Opts.PREQUOTE"
		  Case libcURL.Opts.PRIVATE_
		    Return "libcURL.Opts.PRIVATE_"
		  Case libcURL.Opts.PROGRESSDATA
		    Return "libcURL.Opts.PROGRESSDATA"
		  Case libcURL.Opts.PROGRESSFUNCTION
		    Return "libcURL.Opts.PROGRESSFUNCTION"
		  Case libcURL.Opts.PROTOCOLS
		    Return "libcURL.Opts.PROTOCOLS"
		  Case libcURL.Opts.PROXY
		    Return "libcURL.Opts.PROXY"
		  Case libcURL.Opts.PROXYAUTH
		    Return "libcURL.Opts.PROXYAUTH"
		  Case libcURL.Opts.PROXYHEADER
		    Return "libcURL.Opts.PROXYHEADER"
		  Case libcURL.Opts.PROXYPASSWORD
		    Return "libcURL.Opts.PROXYPASSWORD"
		  Case libcURL.Opts.PROXYPORT
		    Return "libcURL.Opts.PROXYPORT"
		  Case libcURL.Opts.PROXYTYPE
		    Return "libcURL.Opts.PROXYTYPE"
		  Case libcURL.Opts.PROXYUSERNAME
		    Return "libcURL.Opts.PROXYUSERNAME"
		  Case libcURL.Opts.PROXYUSERPWD
		    Return "libcURL.Opts.PROXYUSERPWD"
		  Case libcURL.Opts.PROXY_SERVICE_NAME
		    Return "libcURL.Opts.PROXY_SERVICE_NAME"
		  Case libcURL.Opts.PUT
		    Return "libcURL.Opts.PUT"
		  Case libcURL.Opts.QUOTE
		    Return "libcURL.Opts.QUOTE"
		  Case libcURL.Opts.RANDOM_FILE
		    Return "libcURL.Opts.RANDOM_FILE"
		  Case libcURL.Opts.RANGE
		    Return "libcURL.Opts.RANGE"
		  Case libcURL.Opts.READDATA
		    Return "libcURL.Opts.READDATA"
		  Case libcURL.Opts.READFUNCTION
		    Return "libcURL.Opts.READFUNCTION"
		  Case libcURL.Opts.REDIR_PROTOCOLS
		    Return "libcURL.Opts.REDIR_PROTOCOLS"
		  Case libcURL.Opts.REFERER
		    Return "libcURL.Opts.REFERER"
		  Case libcURL.Opts.RESOLVE
		    Return "libcURL.Opts.RESOLVE"
		  Case libcURL.Opts.RESUME_FROM
		    Return "libcURL.Opts.RESUME_FROM"
		  Case libcURL.Opts.RTSP_SESSION_ID
		    Return "libcURL.Opts.RTSP_SESSION_ID"
		  Case libcURL.Opts.RTSP_STREAM_URI
		    Return "libcURL.Opts.RTSP_STREAM_URI"
		  Case libcURL.Opts.RTSP_TRANSPORT
		    Return "libcURL.Opts.RTSP_TRANSPORT"
		  Case libcURL.Opts.SEEKDATA
		    Return "libcURL.Opts.SEEKDATA"
		  Case libcURL.Opts.SEEKFUNCTION
		    Return "libcURL.Opts.SEEKFUNCTION"
		  Case libcURL.Opts.SHARE
		    Return "libcURL.Opts.SHARE"
		  Case libcURL.Opts.SHOPT_LOCKFUNC
		    Return "libcURL.Opts.SHOPT_LOCKFUNC"
		  Case libcURL.Opts.SHOPT_UNLOCKFUNC
		    Return "libcURL.Opts.SHOPT_UNLOCKFUNC"
		  Case libcURL.Opts.SHOPT_USERDATA
		    Return "libcURL.Opts.SHOPT_USERDATA"
		  Case libcURL.Opts.SOCKOPTDATA
		    Return "libcURL.Opts.SOCKOPTDATA"
		  Case libcURL.Opts.SOCKOPTFUNCTION
		    Return "libcURL.Opts.SOCKOPTFUNCTION"
		  Case libcURL.Opts.SOCKS5_GSSAPI_SERVICE
		    Return "libcURL.Opts.SOCKS5_GSSAPI_SERVICE"
		  Case libcURL.Opts.SSH_AUTH_TYPES
		    Return "libcURL.Opts.SSH_AUTH_TYPES"
		  Case libcURL.Opts.SSH_COMPRESSION
		    Return "libcURL.Opts.SSH_COMPRESSION"
		  Case libcURL.Opts.SSH_HOST_PUBLIC_KEY_MD5
		    Return "libcURL.Opts.SSH_HOST_PUBLIC_KEY_MD5"
		  Case libcURL.Opts.SSH_KNOWNHOSTS
		    Return "libcURL.Opts.SSH_KNOWNHOSTS"
		  Case libcURL.Opts.SSH_PRIVATE_KEYFILE
		    Return "libcURL.Opts.SSH_PRIVATE_KEYFILE"
		  Case libcURL.Opts.SSH_PUBLIC_KEYFILE
		    Return "libcURL.Opts.SSH_PUBLIC_KEYFILE"
		  Case libcURL.Opts.SSLCERT
		    Return "libcURL.Opts.SSLCERT"
		  Case libcURL.Opts.SSLCERTTYPE
		    Return "libcURL.Opts.SSLCERTTYPE"
		  Case libcURL.Opts.SSLENGINE
		    Return "libcURL.Opts.SSLENGINE"
		  Case libcURL.Opts.SSLKEY
		    Return "libcURL.Opts.SSLKEY"
		  Case libcURL.Opts.SSLKEYTYPE
		    Return "libcURL.Opts.SSLKEYTYPE"
		  Case libcURL.Opts.SSLVERSION
		    Return "libcURL.Opts.SSLVERSION"
		  Case libcURL.Opts.SSL_CIPHER_LIST
		    Return "libcURL.Opts.SSL_CIPHER_LIST"
		  Case libcURL.Opts.SSL_CTX_DATA
		    Return "libcURL.Opts.SSL_CTX_DATA"
		  Case libcURL.Opts.SSL_CTX_FUNCTION
		    Return "libcURL.Opts.SSL_CTX_FUNCTION"
		  Case libcURL.Opts.SSL_ENABLE_ALPN
		    Return "libcURL.Opts.SSL_ENABLE_ALPN"
		  Case libcURL.Opts.SSL_ENABLE_NPN
		    Return "libcURL.Opts.SSL_ENABLE_NPN"
		  Case libcURL.Opts.SSL_VERIFYHOST
		    Return "libcURL.Opts.SSL_VERIFYHOST"
		  Case libcURL.Opts.SSL_VERIFYPEER
		    Return "libcURL.Opts.SSL_VERIFYPEER"
		  Case libcURL.Opts.TIMEOUT
		    Return "libcURL.Opts.TIMEOUT"
		  Case libcURL.Opts.UPKEEP_INTERVAL_MS
		    Return "libcURL.Opts.UPKEEP_INTERVAL_MS"
		  Case libcURL.Opts.UPLOAD
		    Return "libcURL.Opts.UPLOAD"
		  Case libcURL.Opts.UPLOAD_BUFFERSIZE
		    Return "libcURL.Opts.UPLOAD_BUFFERSIZE"
		  Case libcURL.Opts.URL
		    Return "libcURL.Opts.URL"
		  Case libcURL.Opts.USERAGENT
		    Return "libcURL.Opts.USERAGENT"
		  Case libcURL.Opts.USERNAME
		    Return "libcURL.Opts.USERNAME"
		  Case libcURL.Opts.USE_SSL
		    Return "libcURL.Opts.USE_SSL"
		  Case libcURL.Opts.VERBOSE
		    Return "libcURL.Opts.VERBOSE"
		  Case libcURL.Opts.WILDCARDMATCH
		    Return "libcURL.Opts.WILDCARDMATCH"
		  Case libcURL.Opts.WRITEDATA
		    Return "libcURL.Opts.WRITEDATA"
		  Case libcURL.Opts.WRITEFUNCTION
		    Return "libcURL.Opts.WRITEFUNCTION"
		  Case libcURL.Opts.XFERINFODATA
		    Return "libcURL.Opts.XFERINFODATA"
		  Case libcURL.Opts.XFERINFOFUNCTION
		    Return "libcURL.Opts.XFERINFOFUNCTION"
		  Else
		    Return "Unknown option number"
		  End Select
		End Function
	#tag EndMethod


	#tag Constant, Name = ACCEPT_ENCODING, Type = Double, Dynamic = False, Default = \"10102", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = APPEND, Type = Double, Dynamic = False, Default = \"50", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = AUTOREFERER, Type = Double, Dynamic = False, Default = \"58", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = BUFFERSIZE, Type = Double, Dynamic = False, Default = \"98", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAINFO, Type = Double, Dynamic = False, Default = \"10065", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CAPATH, Type = Double, Dynamic = False, Default = \"10097", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CERTINFO, Type = Double, Dynamic = False, Default = \"172", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHUNK_BGN_FUNCTION, Type = Double, Dynamic = False, Default = \"20198", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHUNK_DATA, Type = Double, Dynamic = False, Default = \"10201", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CHUNK_END_FUNCTION, Type = Double, Dynamic = False, Default = \"20199", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLOSESOCKETDATA, Type = Double, Dynamic = False, Default = \"10209", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CLOSESOCKETFUNCTION, Type = Double, Dynamic = False, Default = \"20208", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CONNECTTIMEOUT, Type = Double, Dynamic = False, Default = \"78", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CONNECT_ONLY, Type = Double, Dynamic = False, Default = \"141", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COOKIE, Type = Double, Dynamic = False, Default = \"10022", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COOKIEFILE, Type = Double, Dynamic = False, Default = \"10031", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COOKIEJAR, Type = Double, Dynamic = False, Default = \"10082", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COOKIELIST, Type = Double, Dynamic = False, Default = \"10135", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COOKIESESSION, Type = Double, Dynamic = False, Default = \"96", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = COPYPOSTFIELDS, Type = Double, Dynamic = False, Default = \"10165", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CRLF, Type = Double, Dynamic = False, Default = \"27", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CRLFILE, Type = Double, Dynamic = False, Default = \"10169", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CURLU, Type = Double, Dynamic = False, Default = \"10282", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = CUSTOMREQUEST, Type = Double, Dynamic = False, Default = \"10036", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DEBUGDATA, Type = Double, Dynamic = False, Default = \"10095", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DEBUGFUNCTION, Type = Double, Dynamic = False, Default = \"20094", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DEFAULT_PROTOCOL, Type = Double, Dynamic = False, Default = \"10238", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DIRLISTONLY, Type = Double, Dynamic = False, Default = \"48", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DISALLOW_USERNAME_IN_URL, Type = Double, Dynamic = False, Default = \"278", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_CACHE_TIMEOUT, Type = Double, Dynamic = False, Default = \"92", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_INTERFACE, Type = Double, Dynamic = False, Default = \"10221", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_LOCAL_IP4, Type = Double, Dynamic = False, Default = \"10222", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_LOCAL_IP6, Type = Double, Dynamic = False, Default = \"10223", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_SERVERS, Type = Double, Dynamic = False, Default = \"10211", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = DNS_SHUFFLE_ADDRESSES, Type = Double, Dynamic = False, Default = \"275", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EGDSOCKET, Type = Double, Dynamic = False, Default = \"10077", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERRORBUFFER, Type = Double, Dynamic = False, Default = \"10010", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = EXPECT_100_TIMEOUT_MS, Type = Double, Dynamic = False, Default = \"227", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FAILONERROR, Type = Double, Dynamic = False, Default = \"45", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FILETIME, Type = Double, Dynamic = False, Default = \"69", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FNMATCH_DATA, Type = Double, Dynamic = False, Default = \"10202", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FNMATCH_FUNCTION, Type = Double, Dynamic = False, Default = \"20200", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FOLLOWLOCATION, Type = Double, Dynamic = False, Default = \"52", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FORBID_REUSE, Type = Double, Dynamic = False, Default = \"75", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FRESH_CONNECT, Type = Double, Dynamic = False, Default = \"74", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FTPPORT, Type = Double, Dynamic = False, Default = \"10017", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FTP_ACCOUNT, Type = Double, Dynamic = False, Default = \"10134", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FTP_ALTERNATIVE_TO_USER, Type = Double, Dynamic = False, Default = \"10147", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FTP_CREATE_MISSING_DIRS, Type = Double, Dynamic = False, Default = \"110", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FTP_FILEMETHOD, Type = Double, Dynamic = False, Default = \"138", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HAPROXYPROTOCOL, Type = Double, Dynamic = False, Default = \"274", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HEADER, Type = Double, Dynamic = False, Default = \"42", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HEADERDATA, Type = Double, Dynamic = False, Default = \"10029", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HEADERFUNCTION, Type = Double, Dynamic = False, Default = \"20079", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HEADEROPT, Type = Double, Dynamic = False, Default = \"229", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTP200ALIASES, Type = Double, Dynamic = False, Default = \"10104", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPAUTH, Type = Double, Dynamic = False, Default = \"107", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPGET, Type = Double, Dynamic = False, Default = \"80", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPHEADER, Type = Double, Dynamic = False, Default = \"10023", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPPOST, Type = Double, Dynamic = False, Default = \"10024", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPPROXYTUNNEL, Type = Double, Dynamic = False, Default = \"61", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTPVERSION, Type = Double, Dynamic = False, Default = \"84", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTP_CONTENT_DECODING, Type = Double, Dynamic = False, Default = \"158", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = HTTP_TRANSFER_DECODING, Type = Double, Dynamic = False, Default = \"157", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = IGNORE_CONTENT_LENGTH, Type = Double, Dynamic = False, Default = \"136", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = IPRESOLVE, Type = Double, Dynamic = False, Default = \"113", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ISSUERCERT, Type = Double, Dynamic = False, Default = \"10170", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = KEYPASSWD, Type = Double, Dynamic = False, Default = \"10026", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = KRBLEVEL, Type = Double, Dynamic = False, Default = \"10063", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOCALPORT, Type = Double, Dynamic = False, Default = \"139", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOCALPORTRANGE, Type = Double, Dynamic = False, Default = \"140", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOW_SPEED_LIMIT, Type = Double, Dynamic = False, Default = \"19", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = LOW_SPEED_TIME, Type = Double, Dynamic = False, Default = \"20", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAIL_FROM, Type = Double, Dynamic = False, Default = \"10186", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAIL_RCPT, Type = Double, Dynamic = False, Default = \"10187", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MAXREDIRS, Type = Double, Dynamic = False, Default = \"68", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = MIMEPOST, Type = Double, Dynamic = False, Default = \"10269", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NETINTERFACE, Type = Double, Dynamic = False, Default = \"10062", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NETRC_FILE, Type = Double, Dynamic = False, Default = \"10118", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NOBODY, Type = Double, Dynamic = False, Default = \"44", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NOPROGRESS, Type = Double, Dynamic = False, Default = \"43", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = NOPROXY, Type = Double, Dynamic = False, Default = \"10177", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPENSOCKETDATA, Type = Double, Dynamic = False, Default = \"10164", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = OPENSOCKETFUNCTION, Type = Double, Dynamic = False, Default = \"20163", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PASSWORD, Type = Double, Dynamic = False, Default = \"10174", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PATH_AS_IS, Type = Double, Dynamic = False, Default = \"234", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PIPELINING_SERVER_BL, Type = Double, Dynamic = False, Default = \"10012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PIPELINING_SITE_BL, Type = Double, Dynamic = False, Default = \"10011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PIPEWAIT, Type = Double, Dynamic = False, Default = \"237", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PORT, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSTFIELDS, Type = Double, Dynamic = False, Default = \"10015", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSTFIELDSIZE, Type = Double, Dynamic = False, Default = \"60", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSTQUOTE, Type = Double, Dynamic = False, Default = \"10039", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = POSTREDIR, Type = Double, Dynamic = False, Default = \"161", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PREQUOTE, Type = Double, Dynamic = False, Default = \"10093", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PRIVATE_, Type = Double, Dynamic = False, Default = \"10103", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROGRESSDATA, Type = Double, Dynamic = False, Default = \"10057", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROGRESSFUNCTION, Type = Double, Dynamic = False, Default = \"20056", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROTOCOLS, Type = Double, Dynamic = False, Default = \"181", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXY, Type = Double, Dynamic = False, Default = \"10004", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYAUTH, Type = Double, Dynamic = False, Default = \"111", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYHEADER, Type = Double, Dynamic = False, Default = \"10228", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYPASSWORD, Type = Double, Dynamic = False, Default = \"10176", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYPORT, Type = Double, Dynamic = False, Default = \"59", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYTYPE, Type = Double, Dynamic = False, Default = \"101", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYUSERNAME, Type = Double, Dynamic = False, Default = \"10175", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXYUSERPWD, Type = Double, Dynamic = False, Default = \"10006", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PROXY_SERVICE_NAME, Type = Double, Dynamic = False, Default = \"10235", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = PUT, Type = Double, Dynamic = False, Default = \"54", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = QUOTE, Type = Double, Dynamic = False, Default = \"10028", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RANDOM_FILE, Type = Double, Dynamic = False, Default = \"10076", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RANGE, Type = Double, Dynamic = False, Default = \"10007", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = READDATA, Type = Double, Dynamic = False, Default = \"10009", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = READFUNCTION, Type = Double, Dynamic = False, Default = \"20012", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REDIR_PROTOCOLS, Type = Double, Dynamic = False, Default = \"182", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = REFERER, Type = Double, Dynamic = False, Default = \"10016", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RESOLVE, Type = Double, Dynamic = False, Default = \"10203", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RESUME_FROM, Type = Double, Dynamic = False, Default = \"21", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RTSP_SESSION_ID, Type = Double, Dynamic = False, Default = \"10190", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RTSP_STREAM_URI, Type = Double, Dynamic = False, Default = \"10191", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = RTSP_TRANSPORT, Type = Double, Dynamic = False, Default = \"10192", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEEKDATA, Type = Double, Dynamic = False, Default = \"10168", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SEEKFUNCTION, Type = Double, Dynamic = False, Default = \"20167", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SHARE, Type = Double, Dynamic = False, Default = \"10100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SHOPT_LOCKFUNC, Type = Double, Dynamic = False, Default = \"3", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SHOPT_UNLOCKFUNC, Type = Double, Dynamic = False, Default = \"4", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SHOPT_USERDATA, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SOCKOPTDATA, Type = Double, Dynamic = False, Default = \"10149", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SOCKOPTFUNCTION, Type = Double, Dynamic = False, Default = \"20148", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SOCKS5_GSSAPI_SERVICE, Type = Double, Dynamic = False, Default = \"10179", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_AUTH_TYPES, Type = Double, Dynamic = False, Default = \"151", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_COMPRESSION, Type = Double, Dynamic = False, Default = \"268", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_HOST_PUBLIC_KEY_MD5, Type = Double, Dynamic = False, Default = \"10162", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_KNOWNHOSTS, Type = Double, Dynamic = False, Default = \"10183", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_PRIVATE_KEYFILE, Type = Double, Dynamic = False, Default = \"10153", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSH_PUBLIC_KEYFILE, Type = Double, Dynamic = False, Default = \"10152", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLCERT, Type = Double, Dynamic = False, Default = \"10025", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLCERTTYPE, Type = Double, Dynamic = False, Default = \"10086", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLENGINE, Type = Double, Dynamic = False, Default = \"10089", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLKEY, Type = Double, Dynamic = False, Default = \"10087", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLKEYTYPE, Type = Double, Dynamic = False, Default = \"10088", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSLVERSION, Type = Double, Dynamic = False, Default = \"32", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_CIPHER_LIST, Type = Double, Dynamic = False, Default = \"10083", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_CTX_DATA, Type = Double, Dynamic = False, Default = \"10109", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_CTX_FUNCTION, Type = Double, Dynamic = False, Default = \"20108", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_ENABLE_ALPN, Type = Double, Dynamic = False, Default = \"226", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_ENABLE_NPN, Type = Double, Dynamic = False, Default = \"225", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_VERIFYHOST, Type = Double, Dynamic = False, Default = \"81", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SSL_VERIFYPEER, Type = Double, Dynamic = False, Default = \"64", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = TIMEOUT, Type = Double, Dynamic = False, Default = \"13", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UPKEEP_INTERVAL_MS, Type = Double, Dynamic = False, Default = \"281", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UPLOAD, Type = Double, Dynamic = False, Default = \"46", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = UPLOAD_BUFFERSIZE , Type = Double, Dynamic = False, Default = \"280", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = URL, Type = Double, Dynamic = False, Default = \"10002", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = USERAGENT, Type = Double, Dynamic = False, Default = \"10018", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = USERNAME, Type = Double, Dynamic = False, Default = \"10173", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = USE_SSL, Type = Double, Dynamic = False, Default = \"119", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = USE_SSL_ALL, Type = Double, Dynamic = False, Default = \"3", Scope = Protected, Attributes = \"deprecated \x3D "libcURL.ConnectionType""
	#tag EndConstant

	#tag Constant, Name = USE_SSL_CONTROL, Type = Double, Dynamic = False, Default = \"2", Scope = Protected, Attributes = \"deprecated \x3D "libcURL.ConnectionType""
	#tag EndConstant

	#tag Constant, Name = USE_SSL_NONE, Type = Double, Dynamic = False, Default = \"0", Scope = Protected, Attributes = \"deprecated \x3D "libcURL.ConnectionType""
	#tag EndConstant

	#tag Constant, Name = USE_SSL_TRY, Type = Double, Dynamic = False, Default = \"1", Scope = Protected, Attributes = \"deprecated \x3D "libcURL.ConnectionType""
	#tag EndConstant

	#tag Constant, Name = VERBOSE, Type = Double, Dynamic = False, Default = \"41", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WILDCARDMATCH, Type = Double, Dynamic = False, Default = \"197", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WRITEDATA, Type = Double, Dynamic = False, Default = \"10001", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = WRITEFUNCTION, Type = Double, Dynamic = False, Default = \"20011", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = XFERINFODATA, Type = Double, Dynamic = False, Default = \"10057", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = XFERINFOFUNCTION, Type = Double, Dynamic = False, Default = \"20219", Scope = Protected
	#tag EndConstant


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
