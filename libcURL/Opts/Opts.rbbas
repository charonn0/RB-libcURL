#tag Module
Protected Module Opts
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_option_by_id Lib cURLLib (OptionID As Integer) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_option_by_name Lib cURLLib (Name As CString) As Ptr
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function curl_easy_option_next Lib cURLLib (Previous As Ptr) As Ptr
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function GetOptionByName(Name As String) As Integer
		  Static Names As New Dictionary("ACCEPT_ENCODING":10102, "APPEND":50, "AUTOREFERER":58, "BUFFERSIZE":98, "CAINFO":10065, "CAPATH":10097, _
		  "CERTINFO":172, "CHUNK_BGN_FUNCTION":20198, "CHUNK_DATA":10201, "CHUNK_END_FUNCTION":20199, "CLOSESOCKETDATA":10209, "CLOSESOCKETFUNCTION":20208, _
		  "CONNECTTIMEOUT":78, "CONNECT_ONLY":141, "COOKIE":10022, "COOKIEFILE":10031, "COOKIEJAR":10082, "COOKIELIST":10135, "COOKIESESSION":96, _
		  "COPYPOSTFIELDS":10165, "CRLF":27, "CRLFILE":10169, "CURLU":10282, "CUSTOMREQUEST":10036, "DEBUGDATA":10095, "DEBUGFUNCTION":20094, _
		  "DEFAULT_PROTOCOL":10238, "DIRLISTONLY":48, "DISALLOW_USERNAME_IN_URL":278, "DNS_CACHE_TIMEOUT":92, "DNS_INTERFACE":10221, "DNS_LOCAL_IP4":10222, _
		  "DNS_LOCAL_IP6":10223, "DNS_SERVERS":10211, "DNS_SHUFFLE_ADDRESSES":275, "EGDSOCKET":10077, "ERRORBUFFER":10010, "EXPECT_100_TIMEOUT_MS":227, _
		  "FAILONERROR":45, "FILETIME":69, "FNMATCH_DATA":10202, "FNMATCH_FUNCTION":20200, "FOLLOWLOCATION":52, "FORBID_REUSE":75, "FRESH_CONNECT":74, _
		  "FTPPORT":10017, "FTP_ACCOUNT":10134, "FTP_ALTERNATIVE_TO_USER":10147, "FTP_CREATE_MISSING_DIRS":110, "FTP_FILEMETHOD":138, _
		  "HAPROXYPROTOCOL":274, "HEADER":42, "HEADERDATA":10029, "HEADERFUNCTION":20079, "HEADEROPT":229, "HTTP200ALIASES":10104, "HTTPAUTH":107, _
		  "HTTPGET":80, "HTTPHEADER":10023, "HTTPPOST":10024, "HTTPPROXYTUNNEL":61, "HTTPVERSION":84, "HTTP_CONTENT_DECODING":158, _
		  "HTTP_TRANSFER_DECODING":157, "IGNORE_CONTENT_LENGTH":136, "INFILESIZE":14, "IPRESOLVE":113, "ISSUERCERT":10170, "KEYPASSWD":10026, _
		  "KRBLEVEL":10063, "LOCALPORT":139, "LOCALPORTRANGE":140, "LOW_SPEED_LIMIT":19, "LOW_SPEED_TIME":20, "MAIL_FROM":10186, "MAIL_RCPT":10187, _
		  "MAXREDIRS":68, "MIMEPOST":10269, "NETINTERFACE":10062, "NETRC_FILE":10118, "NOBODY":44, "NOPROGRESS":43, "NOPROXY":10177, "OPENSOCKETDATA":10164, _
		  "OPENSOCKETFUNCTION":20163, "PASSWORD":10174, "PATH_AS_IS":234, "PIPELINING_SERVER_BL":10012, "PIPELINING_SITE_BL":10011, "PIPEWAIT":237, "PORT":3, _
		  "POSTFIELDS":10015, "POSTFIELDSIZE":60, "POSTQUOTE":10039, "POSTREDIR":161, "PREQUOTE":10093, "PRIVATE_":10103, "PROGRESSDATA":10057, _
		  "PROGRESSFUNCTION":20056, "PROTOCOLS":181, "PROXY":10004, "PROXYAUTH":111, "PROXYHEADER":10228, "PROXYPASSWORD":10176, "PROXYPORT":59, _
		  "PROXYTYPE":101, "PROXYUSERNAME":10175, "PROXYUSERPWD":10006, "PROXY_SERVICE_NAME":10235, "PUT":54, "QUOTE":10028, "RANDOM_FILE":10076, _
		  "RANGE":10007, "READDATA":10009, "READFUNCTION":20012, "REDIR_PROTOCOLS":182, "REFERER":10016, "RESOLVE":10203, "RESUME_FROM":21, _
		  "RESUME_FROM_LARGE":30116, "RTSP_SESSION_ID":10190, "RTSP_STREAM_URI":10191, "RTSP_TRANSPORT":10192, "SEEKDATA":10168, "SEEKFUNCTION":20167, _
		  "SHARE":10100, "SHOPT_LOCKFUNC":3, "SHOPT_UNLOCKFUNC":4, "SHOPT_USERDATA":5, "SOCKOPTDATA":10149, "SOCKOPTFUNCTION":20148, _
		  "SOCKS5_GSSAPI_SERVICE":10179, "SSH_AUTH_TYPES":151, "SSH_COMPRESSION":268, "SSH_HOST_PUBLIC_KEY_MD5":10162, "SSH_KNOWNHOSTS":10183, _
		  "SSH_PRIVATE_KEYFILE":10153, "SSH_PUBLIC_KEYFILE":10152, "SSLCERT":10025, "SSLCERTTYPE":10086, "SSLENGINE":10089, "SSLKEY":10087, _
		  "SSLKEYTYPE":10088, "SSLVERSION":32, "SSL_CIPHER_LIST":10083, "SSL_CTX_DATA":10109, "SSL_CTX_FUNCTION":20108, "SSL_ENABLE_ALPN":226, _
		  "SSL_ENABLE_NPN":225, "SSL_OPTIONS":216, "SSL_VERIFYHOST":81, "SSL_VERIFYPEER":64, "TIMEOUT":13, "UPKEEP_INTERVAL_MS":281, "UPLOAD":46, _
		  "UPLOAD_BUFFERSIZE":280, "URL":10002, "USERAGENT":10018, "USERNAME":10173, "USE_SSL":119, "USE_SSL_ALL":3, "VERBOSE":41, "WILDCARDMATCH":197, _
		  "WRITEDATA":10001, "WRITEFUNCTION":20011, "XFERINFODATA":10057, "XFERINFOFUNCTION":20219)
		  
		  Return Names.Lookup(Name, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOptionName(OptionID As Integer) As String
		  Static Names As New Dictionary(10102:"ACCEPT_ENCODING", 50:"APPEND", 58:"AUTOREFERER", 98:"BUFFERSIZE", 10065:"CAINFO", 10097:"CAPATH", _
		  172:"CERTINFO", 20198:"CHUNK_BGN_FUNCTION", 10201:"CHUNK_DATA", 20199:"CHUNK_END_FUNCTION", 10209:"CLOSESOCKETDATA", 20208:"CLOSESOCKETFUNCTION", _
		  78:"CONNECTTIMEOUT", 141:"CONNECT_ONLY", 10022:"COOKIE", 10031:"COOKIEFILE", 10082:"COOKIEJAR", 10135:"COOKIELIST", 96:"COOKIESESSION", _
		  10165:"COPYPOSTFIELDS", 27:"CRLF", 10169:"CRLFILE", 10282:"CURLU", 10036:"CUSTOMREQUEST", 10095:"DEBUGDATA", 20094:"DEBUGFUNCTION", _
		  10238:"DEFAULT_PROTOCOL", 48:"DIRLISTONLY", 278:"DISALLOW_USERNAME_IN_URL", 92:"DNS_CACHE_TIMEOUT", 10221:"DNS_INTERFACE", 10222:"DNS_LOCAL_IP4", _
		  10223:"DNS_LOCAL_IP6", 10211:"DNS_SERVERS", 275:"DNS_SHUFFLE_ADDRESSES", 10077:"EGDSOCKET", 10010:"ERRORBUFFER", 227:"EXPECT_100_TIMEOUT_MS", _
		  45:"FAILONERROR", 69:"FILETIME", 10202:"FNMATCH_DATA", 20200:"FNMATCH_FUNCTION", 52:"FOLLOWLOCATION", 75:"FORBID_REUSE", 74:"FRESH_CONNECT", _
		  10017:"FTPPORT", 10134:"FTP_ACCOUNT", 10147:"FTP_ALTERNATIVE_TO_USER", 110:"FTP_CREATE_MISSING_DIRS", 138:"FTP_FILEMETHOD", 274:"HAPROXYPROTOCOL", _
		  42:"HEADER", 10029:"HEADERDATA", 20079:"HEADERFUNCTION", 229:"HEADEROPT", 10104:"HTTP200ALIASES", 107:"HTTPAUTH", 80:"HTTPGET", 10023:"HTTPHEADER", _
		  10024:"HTTPPOST", 61:"HTTPPROXYTUNNEL", 84:"HTTPVERSION", 158:"HTTP_CONTENT_DECODING", 157:"HTTP_TRANSFER_DECODING", 136:"IGNORE_CONTENT_LENGTH", _
		  14:"INFILESIZE", 113:"IPRESOLVE", 10170:"ISSUERCERT", 10026:"KEYPASSWD", 10063:"KRBLEVEL", 139:"LOCALPORT", 140:"LOCALPORTRANGE", _
		  19:"LOW_SPEED_LIMIT", 20:"LOW_SPEED_TIME", 10186:"MAIL_FROM", 10187:"MAIL_RCPT", 68:"MAXREDIRS", 10269:"MIMEPOST", 10062:"NETINTERFACE", _
		  10118:"NETRC_FILE", 44:"NOBODY", 43:"NOPROGRESS", 10177:"NOPROXY", 10164:"OPENSOCKETDATA", 20163:"OPENSOCKETFUNCTION", 10174:"PASSWORD", _
		  234:"PATH_AS_IS", 10012:"PIPELINING_SERVER_BL", 10011:"PIPELINING_SITE_BL", 237:"PIPEWAIT", 3:"PORT", 10015:"POSTFIELDS", 60:"POSTFIELDSIZE", _
		  10039:"POSTQUOTE", 161:"POSTREDIR", 10093:"PREQUOTE", 10103:"PRIVATE_", 10057:"PROGRESSDATA", 20056:"PROGRESSFUNCTION", 181:"PROTOCOLS", _
		  10004:"PROXY", 111:"PROXYAUTH", 10228:"PROXYHEADER", 10176:"PROXYPASSWORD", 59:"PROXYPORT", 101:"PROXYTYPE", 10175:"PROXYUSERNAME", _
		  10006:"PROXYUSERPWD", 10235:"PROXY_SERVICE_NAME", 54:"PUT", 10028:"QUOTE", 10076:"RANDOM_FILE", 10007:"RANGE", 10009:"READDATA", _
		  20012:"READFUNCTION", 182:"REDIR_PROTOCOLS", 10016:"REFERER", 10203:"RESOLVE", 21:"RESUME_FROM", 30116:"RESUME_FROM_LARGE", _
		  10190:"RTSP_SESSION_ID", 10191:"RTSP_STREAM_URI", 10192:"RTSP_TRANSPORT", 10168:"SEEKDATA", 20167:"SEEKFUNCTION", 10100:"SHARE", _
		  3:"SHOPT_LOCKFUNC", 4:"SHOPT_UNLOCKFUNC", 5:"SHOPT_USERDATA", 10149:"SOCKOPTDATA", 20148:"SOCKOPTFUNCTION", 10179:"SOCKS5_GSSAPI_SERVICE", _
		  151:"SSH_AUTH_TYPES", 268:"SSH_COMPRESSION", 10162:"SSH_HOST_PUBLIC_KEY_MD5", 10183:"SSH_KNOWNHOSTS", 10153:"SSH_PRIVATE_KEYFILE", _
		  10152:"SSH_PUBLIC_KEYFILE", 10025:"SSLCERT", 10086:"SSLCERTTYPE", 10089:"SSLENGINE", 10087:"SSLKEY", 10088:"SSLKEYTYPE", 32:"SSLVERSION", _
		  10083:"SSL_CIPHER_LIST", 10109:"SSL_CTX_DATA", 20108:"SSL_CTX_FUNCTION", 226:"SSL_ENABLE_ALPN", 225:"SSL_ENABLE_NPN", 216:"SSL_OPTIONS", _
		  81:"SSL_VERIFYHOST", 64:"SSL_VERIFYPEER", 13:"TIMEOUT", 281:"UPKEEP_INTERVAL_MS", 46:"UPLOAD", 280:"UPLOAD_BUFFERSIZE", 10002:"URL", _
		  10018:"USERAGENT", 10173:"USERNAME", 119:"USE_SSL", 3:"USE_SSL_ALL", 41:"VERBOSE", 197:"WILDCARDMATCH", 10001:"WRITEDATA", 20011:"WRITEFUNCTION", _
		  10057:"XFERINFODATA", 20219:"XFERINFOFUNCTION")
		  
		  Return Names.Lookup(OptionID, "UNKNOWN_OPTION")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOptionType(OptionID As Integer) As curl_easytype
		  Select Case OptionID
		    ' numbers and bools
		  Case FTPPORT, FAILONERROR, PATH_AS_IS, PROXYPORT, HTTPPROXYTUNNEL, LOCALPORT, LOCALPORTRANGE, DNS_CACHE_TIMEOUT, BUFFERSIZE, PORT, DISALLOW_USERNAME_IN_URL, _
		    AUTOREFERER, FOLLOWLOCATION, MAXREDIRS, POSTREDIR, PUT, POSTFIELDSIZE, COOKIESESSION, HTTPGET, HTTPVERSION, IGNORE_CONTENT_LENGTH, HTTP_CONTENT_DECODING, _
		    HTTP_TRANSFER_DECODING, EXPECT_100_TIMEOUT_MS, PIPEWAIT, APPEND, FTP_CREATE_MISSING_DIRS, FTP_FILEMETHOD, CRLF, RESUME_FROM, FILETIME, DIRLISTONLY, _
		    NOBODY, INFILESIZE, UPLOAD, UPLOAD_BUFFERSIZE, TIMEOUT, LOW_SPEED_LIMIT, LOW_SPEED_TIME, FRESH_CONNECT, FORBID_REUSE, CONNECTTIMEOUT, IPRESOLVE, _
		    CONNECT_ONLY, USE_SSL, DNS_SHUFFLE_ADDRESSES, SSL_ENABLE_ALPN, SSL_ENABLE_NPN, SSLVERSION, SSL_VERIFYHOST, SSL_VERIFYPEER, CERTINFO, SSH_COMPRESSION, _
		    NOPROGRESS, VERBOSE
		    Return curl_easytype.Number
		    
		  Case RESUME_FROM_LARGE
		    ' big numbers
		    Return curl_easytype.LargeNumber
		    
		  Case PROTOCOLS, REDIR_PROTOCOLS, PROXYTYPE, HTTPAUTH, PROXYAUTH, HEADEROPT, SSL_OPTIONS, SSH_AUTH_TYPES
		    ' numbers with defined meanings
		    Return curl_easytype.Bitmask
		    
		  Case WRITEFUNCTION, READFUNCTION, SEEKFUNCTION, SOCKOPTFUNCTION, OPENSOCKETFUNCTION, CLOSESOCKETFUNCTION, PROGRESSFUNCTION, XFERINFOFUNCTION, _
		    HEADERFUNCTION, DEBUGFUNCTION, SSL_CTX_FUNCTION, CHUNK_BGN_FUNCTION, CHUNK_END_FUNCTION, FNMATCH_FUNCTION
		    ' callback functions
		    Return curl_easytype.Subroutine
		    
		  Case WRITEDATA, READDATA, SEEKDATA, SOCKOPTDATA, OPENSOCKETDATA, CLOSESOCKETDATA, PROGRESSDATA, XFERINFODATA, HEADERDATA, DEBUGDATA, SSL_CTX_DATA, _
		    CHUNK_DATA, FNMATCH_DATA
		    ' callback function contexts
		    Return curl_easytype.Opaque
		    
		  Case ERRORBUFFER, HTTPPOST, MIMEPOST, RESOLVE, SSL_CIPHER_LIST, PRIVATE_, SHARE
		    ' void*
		    Return curl_easytype.Ptr
		    
		  Case HTTPHEADER, PROXYHEADER, HTTP200ALIASES, MAIL_RCPT, QUOTE, PREQUOTE, POSTQUOTE
		    ' ListPtr
		    Return curl_easytype.List
		    
		  Case URL, DEFAULT_PROTOCOL, PROXY, NOPROXY, SOCKS5_GSSAPI_SERVICE, NETINTERFACE, NETRC_FILE, PROXYUSERPWD, USERNAME, PASSWORD, PROXYUSERNAME, PROXYPASSWORD, _
		    ACCEPT_ENCODING, POSTFIELDS, COPYPOSTFIELDS, REFERER, USERAGENT, COOKIE, COOKIEFILE, COOKIEJAR, COOKIELIST, MAIL_FROM, FTP_ACCOUNT, RTSP_SESSION_ID, _
		    RTSP_STREAM_URI, RTSP_TRANSPORT, RANGE, CUSTOMREQUEST, DNS_INTERFACE, DNS_LOCAL_IP4, DNS_LOCAL_IP6, DNS_SERVERS, SSLCERT, SSLCERTTYPE, SSLKEY, _
		    SSLKEYTYPE, KEYPASSWD, SSLENGINE, CAINFO, ISSUERCERT, CAPATH, CRLFILE, RANDOM_FILE, EGDSOCKET, SSH_HOST_PUBLIC_KEY_MD5, SSH_PUBLIC_KEYFILE, _
		    SSH_PRIVATE_KEYFILE, SSH_KNOWNHOSTS
		    ' ptr to a string
		    Return curl_easytype.String
		    
		  Else
		    Return curl_easytype.Unknown
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

	#tag Constant, Name = INFILESIZE, Type = Double, Dynamic = False, Default = \"14", Scope = Protected
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

	#tag Constant, Name = RESUME_FROM_LARGE, Type = Double, Dynamic = False, Default = \"30116", Scope = Protected
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

	#tag Constant, Name = SSL_OPTIONS, Type = Double, Dynamic = False, Default = \"216", Scope = Protected
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


	#tag Structure, Name = curl_easyoption, Flags = &h21
		Name As Ptr
		  Option As Integer
		Type As curl_easytype
	#tag EndStructure


	#tag Enum, Name = curl_easytype, Type = Integer, Flags = &h1
		Number
		  Bitmask
		  LargeNumber
		  Ptr
		  String
		  List
		  Opaque
		  Blob
		  Subroutine
		Unknown
	#tag EndEnum


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
