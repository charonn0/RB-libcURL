#tag Class
Protected Class OptionInfo
	#tag Method, Flags = &h0
		Attributes( hidden = true )  Sub Constructor(Option As curl_easyoption)
		  mOpt = Option
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GetOptionByName(Name As String) As Integer
		  Name = Replace(Name, "CURLOPT_", "")
		  Name = Replace(Name, "libcURL.Opts.", "")
		  Select Case Name
		  Case "ABSTRACT_UNIX_SOCKET"
		    Return ABSTRACT_UNIX_SOCKET
		  Case "ACCEPTTIMEOUT_MS"
		    Return ACCEPTTIMEOUT_MS
		  Case "ACCEPT_ENCODING"
		    Return ACCEPT_ENCODING
		  Case "ADDRESS_SCOPE"
		    Return ADDRESS_SCOPE
		  Case "ALTSVC"
		    Return ALTSVC
		  Case "ALTSVC_CTRL"
		    Return ALTSVC_CTRL
		  Case "APPEND"
		    Return APPEND
		  Case "AUTOREFERER"
		    Return AUTOREFERER
		  Case "BUFFERSIZE"
		    Return BUFFERSIZE
		  Case "CAINFO"
		    Return CAINFO
		  Case "CAPATH"
		    Return CAPATH
		  Case "CERTINFO"
		    Return CERTINFO
		  Case "CHUNK_BGN_FUNCTION"
		    Return CHUNK_BGN_FUNCTION
		  Case "CHUNK_DATA"
		    Return CHUNK_DATA
		  Case "CHUNK_END_FUNCTION"
		    Return CHUNK_END_FUNCTION
		  Case "CLOSESOCKETDATA"
		    Return CLOSESOCKETDATA
		  Case "CLOSESOCKETFUNCTION"
		    Return CLOSESOCKETFUNCTION
		  Case "CONNECTTIMEOUT"
		    Return CONNECTTIMEOUT
		  Case "CONNECTTIMEOUT_MS"
		    Return CONNECTTIMEOUT_MS
		  Case "CONNECT_ONLY"
		    Return CONNECT_ONLY
		  Case "CONNECT_TO"
		    Return CONNECT_TO
		  Case "CONV_FROM_NETWORK_FUNCTION"
		    Return CONV_FROM_NETWORK_FUNCTION
		  Case "CONV_FROM_UTF8_FUNCTION"
		    Return CONV_FROM_UTF8_FUNCTION
		  Case "CONV_TO_NETWORK_FUNCTION"
		    Return CONV_TO_NETWORK_FUNCTION
		  Case "COOKIE"
		    Return COOKIE
		  Case "COOKIEFILE"
		    Return COOKIEFILE
		  Case "COOKIEJAR"
		    Return COOKIEJAR
		  Case "COOKIELIST"
		    Return COOKIELIST
		  Case "COOKIESESSION"
		    Return COOKIESESSION
		  Case "COPYPOSTFIELDS"
		    Return COPYPOSTFIELDS
		  Case "CRLF"
		    Return CRLF
		  Case "CRLFILE"
		    Return CRLFILE
		  Case "CURLU"
		    Return CURLU
		  Case "CUSTOMREQUEST"
		    Return CUSTOMREQUEST
		  Case "DEBUGDATA"
		    Return DEBUGDATA
		  Case "DEBUGFUNCTION"
		    Return DEBUGFUNCTION
		  Case "DEFAULT_PROTOCOL"
		    Return DEFAULT_PROTOCOL
		  Case "DIRLISTONLY"
		    Return DIRLISTONLY
		  Case "DISALLOW_USERNAME_IN_URL"
		    Return DISALLOW_USERNAME_IN_URL
		  Case "DNS_CACHE_TIMEOUT"
		    Return DNS_CACHE_TIMEOUT
		  Case "DNS_INTERFACE"
		    Return DNS_INTERFACE
		  Case "DNS_LOCAL_IP4"
		    Return DNS_LOCAL_IP4
		  Case "DNS_LOCAL_IP6"
		    Return DNS_LOCAL_IP6
		  Case "DNS_SERVERS"
		    Return DNS_SERVERS
		  Case "DNS_SHUFFLE_ADDRESSES"
		    Return DNS_SHUFFLE_ADDRESSES
		  Case "DNS_USE_GLOBAL_CACHE"
		    Return DNS_USE_GLOBAL_CACHE
		  Case "DOH_URL"
		    Return DOH_URL
		  Case "EGDSOCKET"
		    Return EGDSOCKET
		  Case "ERRORBUFFER"
		    Return ERRORBUFFER
		  Case "EXPECT_100_TIMEOUT_MS"
		    Return EXPECT_100_TIMEOUT_MS
		  Case "FAILONERROR"
		    Return FAILONERROR
		  Case "FILETIME"
		    Return FILETIME
		  Case "FNMATCH_DATA"
		    Return FNMATCH_DATA
		  Case "FNMATCH_FUNCTION"
		    Return FNMATCH_FUNCTION
		  Case "FOLLOWLOCATION"
		    Return FOLLOWLOCATION
		  Case "FORBID_REUSE"
		    Return FORBID_REUSE
		  Case "FRESH_CONNECT"
		    Return FRESH_CONNECT
		  Case "FTPPORT"
		    Return FTPPORT
		  Case "FTPSSLAUTH"
		    Return FTPSSLAUTH
		  Case "FTP_ACCOUNT"
		    Return FTP_ACCOUNT
		  Case "FTP_ALTERNATIVE_TO_USER"
		    Return FTP_ALTERNATIVE_TO_USER
		  Case "FTP_CREATE_MISSING_DIRS"
		    Return FTP_CREATE_MISSING_DIRS
		  Case "FTP_FILEMETHOD"
		    Return FTP_FILEMETHOD
		  Case "FTP_RESPONSE_TIMEOUT"
		    Return FTP_RESPONSE_TIMEOUT
		  Case "FTP_SKIP_PASV_IP"
		    Return FTP_SKIP_PASV_IP
		  Case "FTP_SSL_CCC"
		    Return FTP_SSL_CCC
		  Case "FTP_USE_EPRT"
		    Return FTP_USE_EPRT
		  Case "FTP_USE_EPSV"
		    Return FTP_USE_EPSV
		  Case "FTP_USE_PRET"
		    Return FTP_USE_PRET
		  Case "GSSAPI_DELEGATION"
		    Return GSSAPI_DELEGATION
		  Case "HAPPY_EYEBALLS_TIMEOUT_MS"
		    Return HAPPY_EYEBALLS_TIMEOUT_MS
		  Case "HAPROXYPROTOCOL"
		    Return HAPROXYPROTOCOL
		  Case "HEADER"
		    Return HEADER
		  Case "HEADERDATA"
		    Return HEADERDATA
		  Case "HEADERFUNCTION"
		    Return HEADERFUNCTION
		  Case "HEADEROPT"
		    Return HEADEROPT
		  Case "HTTP09_ALLOWED"
		    Return HTTP09_ALLOWED
		  Case "HTTP200ALIASES"
		    Return HTTP200ALIASES
		  Case "HTTPAUTH"
		    Return HTTPAUTH
		  Case "HTTPGET"
		    Return HTTPGET
		  Case "HTTPHEADER"
		    Return HTTPHEADER
		  Case "HTTPPOST"
		    Return HTTPPOST
		  Case "HTTPPROXYTUNNEL"
		    Return HTTPPROXYTUNNEL
		  Case "HTTPVERSION"
		    Return HTTPVERSION
		  Case "HTTP_CONTENT_DECODING"
		    Return HTTP_CONTENT_DECODING
		  Case "HTTP_TRANSFER_DECODING"
		    Return HTTP_TRANSFER_DECODING
		  Case "HTTP_VERSION"
		    Return HTTP_VERSION
		  Case "IGNORE_CONTENT_LENGTH"
		    Return IGNORE_CONTENT_LENGTH
		  Case "INFILESIZE"
		    Return INFILESIZE
		  Case "INFILESIZE_LARGE"
		    Return INFILESIZE_LARGE
		  Case "INTERLEAVEDATA"
		    Return INTERLEAVEDATA
		  Case "INTERLEAVEFUNCTION"
		    Return INTERLEAVEFUNCTION
		  Case "IOCTLDATA"
		    Return IOCTLDATA
		  Case "IOCTLFUNCTION"
		    Return IOCTLFUNCTION
		  Case "IPRESOLVE"
		    Return IPRESOLVE
		  Case "ISSUERCERT"
		    Return ISSUERCERT
		  Case "ISSUERCERT_BLOB"
		    Return ISSUERCERT_BLOB
		  Case "KEEP_SENDING_ON_ERROR"
		    Return KEEP_SENDING_ON_ERROR
		  Case "KEYPASSWD"
		    Return KEYPASSWD
		  Case "KRBLEVEL"
		    Return KRBLEVEL
		  Case "LOCALPORT"
		    Return LOCALPORT
		  Case "LOCALPORTRANGE"
		    Return LOCALPORTRANGE
		  Case "LOGIN_OPTIONS"
		    Return LOGIN_OPTIONS
		  Case "LOW_SPEED_LIMIT"
		    Return LOW_SPEED_LIMIT
		  Case "LOW_SPEED_TIME"
		    Return LOW_SPEED_TIME
		  Case "MAIL_AUTH"
		    Return MAIL_AUTH
		  Case "MAIL_FROM"
		    Return MAIL_FROM
		  Case "MAIL_RCPT"
		    Return MAIL_RCPT
		  Case "MAIL_RCPT_ALLLOWFAILS"
		    Return MAIL_RCPT_ALLLOWFAILS
		  Case "MAXAGE_CONN"
		    Return MAXAGE_CONN
		  Case "MAXCONNECTS"
		    Return MAXCONNECTS
		  Case "MAXFILESIZE"
		    Return MAXFILESIZE
		  Case "MAXFILESIZE_LARGE"
		    Return MAXFILESIZE_LARGE
		  Case "MAXREDIRS"
		    Return MAXREDIRS
		  Case "MAX_RECV_SPEED_LARGE"
		    Return MAX_RECV_SPEED_LARGE
		  Case "MAX_SEND_SPEED_LARGE"
		    Return MAX_SEND_SPEED_LARGE
		  Case "MIMEPOST"
		    Return MIMEPOST
		  Case "NETINTERFACE", "INTERFACE"
		    Return NETINTERFACE
		  Case "NETRC"
		    Return NETRC
		  Case "NETRC_FILE"
		    Return NETRC_FILE
		  Case "NEW_DIRECTORY_PERMS"
		    Return NEW_DIRECTORY_PERMS
		  Case "NEW_FILE_PERMS"
		    Return NEW_FILE_PERMS
		  Case "NOBODY"
		    Return NOBODY
		  Case "NOPROGRESS"
		    Return NOPROGRESS
		  Case "NOPROXY"
		    Return NOPROXY
		  Case "NOSIGNAL"
		    Return NOSIGNAL
		  Case "OPENSOCKETDATA"
		    Return OPENSOCKETDATA
		  Case "OPENSOCKETFUNCTION"
		    Return OPENSOCKETFUNCTION
		  Case "PASSWORD"
		    Return PASSWORD
		  Case "PATH_AS_IS"
		    Return PATH_AS_IS
		  Case "PINNEDPUBLICKEY"
		    Return PINNEDPUBLICKEY
		  Case "PIPELINING_SERVER_BL"
		    Return PIPELINING_SERVER_BL
		  Case "PIPELINING_SITE_BL"
		    Return PIPELINING_SITE_BL
		  Case "PIPEWAIT"
		    Return PIPEWAIT
		  Case "PORT"
		    Return PORT
		  Case "POST"
		    Return POST
		  Case "POSTFIELDS"
		    Return POSTFIELDS
		  Case "POSTFIELDSIZE"
		    Return POSTFIELDSIZE
		  Case "POSTFIELDSIZE_LARGE"
		    Return POSTFIELDSIZE_LARGE
		  Case "POSTQUOTE"
		    Return POSTQUOTE
		  Case "POSTREDIR"
		    Return POSTREDIR
		  Case "PREQUOTE"
		    Return PREQUOTE
		  Case "PRE_PROXY"
		    Return PRE_PROXY
		  Case "PRIVATE_"
		    Return PRIVATE_
		  Case "PROGRESSDATA"
		    Return PROGRESSDATA
		  Case "PROGRESSFUNCTION"
		    Return PROGRESSFUNCTION
		  Case "PROTOCOLS"
		    Return PROTOCOLS
		  Case "PROXY"
		    Return PROXY
		  Case "PROXYAUTH"
		    Return PROXYAUTH
		  Case "PROXYHEADER"
		    Return PROXYHEADER
		  Case "PROXYPASSWORD"
		    Return PROXYPASSWORD
		  Case "PROXYPORT"
		    Return PROXYPORT
		  Case "PROXYTYPE"
		    Return PROXYTYPE
		  Case "PROXYUSERNAME"
		    Return PROXYUSERNAME
		  Case "PROXYUSERPWD"
		    Return PROXYUSERPWD
		  Case "PROXY_CAINFO"
		    Return PROXY_CAINFO
		  Case "PROXY_CAPATH"
		    Return PROXY_CAPATH
		  Case "PROXY_CRLFILE"
		    Return PROXY_CRLFILE
		  Case "PROXY_ISSUERCERT"
		    Return PROXY_ISSUERCERT
		  Case "PROXY_ISSUERCERT_BLOB"
		    Return PROXY_ISSUERCERT_BLOB
		  Case "PROXY_KEYPASSWD"
		    Return PROXY_KEYPASSWD
		  Case "PROXY_PINNEDPUBLICKEY"
		    Return PROXY_PINNEDPUBLICKEY
		  Case "PROXY_SERVICE_NAME"
		    Return PROXY_SERVICE_NAME
		  Case "PROXY_SSLCERT"
		    Return PROXY_SSLCERT
		  Case "PROXY_SSLCERTTYPE"
		    Return PROXY_SSLCERTTYPE
		  Case "PROXY_SSLCERT_BLOB"
		    Return PROXY_SSLCERT_BLOB
		  Case "PROXY_SSLKEY"
		    Return PROXY_SSLKEY
		  Case "PROXY_SSLKEYTYPE"
		    Return PROXY_SSLKEYTYPE
		  Case "PROXY_SSLKEY_BLOB"
		    Return PROXY_SSLKEY_BLOB
		  Case "PROXY_SSLVERSION"
		    Return PROXY_SSLVERSION
		  Case "PROXY_SSL_CIPHER_LIST"
		    Return PROXY_SSL_CIPHER_LIST
		  Case "PROXY_SSL_OPTIONS"
		    Return PROXY_SSL_OPTIONS
		  Case "PROXY_SSL_VERIFYHOST"
		    Return PROXY_SSL_VERIFYHOST
		  Case "PROXY_SSL_VERIFYPEER"
		    Return PROXY_SSL_VERIFYPEER
		  Case "PROXY_TLS13_CIPHERS"
		    Return PROXY_TLS13_CIPHERS
		  Case "PROXY_TLSAUTH_PASSWORD"
		    Return PROXY_TLSAUTH_PASSWORD
		  Case "PROXY_TLSAUTH_TYPE"
		    Return PROXY_TLSAUTH_TYPE
		  Case "PROXY_TLSAUTH_USERNAME"
		    Return PROXY_TLSAUTH_USERNAME
		  Case "PROXY_TRANSFER_MODE"
		    Return PROXY_TRANSFER_MODE
		  Case "PUT"
		    Return PUT
		  Case "QUOTE"
		    Return QUOTE
		  Case "RANDOM_FILE"
		    Return RANDOM_FILE
		  Case "RANGE"
		    Return RANGE
		  Case "READDATA"
		    Return READDATA
		  Case "READFUNCTION"
		    Return READFUNCTION
		  Case "REDIR_PROTOCOLS"
		    Return REDIR_PROTOCOLS
		  Case "REFERER"
		    Return REFERER
		  Case "REQUEST_TARGET"
		    Return REQUEST_TARGET
		  Case "RESOLVE"
		    Return RESOLVE
		  Case "RESOLVER_START_DATA"
		    Return RESOLVER_START_DATA
		  Case "RESOLVER_START_FUNCTION"
		    Return RESOLVER_START_FUNCTION
		  Case "RESUME_FROM"
		    Return RESUME_FROM
		  Case "RESUME_FROM_LARGE"
		    Return RESUME_FROM_LARGE
		  Case "RTSP_CLIENT_CSEQ"
		    Return RTSP_CLIENT_CSEQ
		  Case "RTSP_REQUEST"
		    Return RTSP_REQUEST
		  Case "RTSP_SERVER_CSEQ"
		    Return RTSP_SERVER_CSEQ
		  Case "RTSP_SESSION_ID"
		    Return RTSP_SESSION_ID
		  Case "RTSP_STREAM_URI"
		    Return RTSP_STREAM_URI
		  Case "RTSP_TRANSPORT"
		    Return RTSP_TRANSPORT
		  Case "SASL_AUTHZID"
		    Return SASL_AUTHZID
		  Case "SASL_IR"
		    Return SASL_IR
		  Case "SEEKDATA"
		    Return SEEKDATA
		  Case "SEEKFUNCTION"
		    Return SEEKFUNCTION
		  Case "SERVICE_NAME"
		    Return SERVICE_NAME
		  Case "SHARE"
		    Return SHARE
		  Case "SHOPT_LOCKFUNC"
		    Return SHOPT_LOCKFUNC
		  Case "SHOPT_UNLOCKFUNC"
		    Return SHOPT_UNLOCKFUNC
		  Case "SHOPT_USERDATA"
		    Return SHOPT_USERDATA
		  Case "SOCKOPTDATA"
		    Return SOCKOPTDATA
		  Case "SOCKOPTFUNCTION"
		    Return SOCKOPTFUNCTION
		  Case "SOCKS5_AUTH"
		    Return SOCKS5_AUTH
		  Case "SOCKS5_GSSAPI_NEC"
		    Return SOCKS5_GSSAPI_NEC
		  Case "SOCKS5_GSSAPI_SERVICE"
		    Return SOCKS5_GSSAPI_SERVICE
		  Case "SSH_AUTH_TYPES"
		    Return SSH_AUTH_TYPES
		  Case "SSH_COMPRESSION"
		    Return SSH_COMPRESSION
		  Case "SSH_HOST_PUBLIC_KEY_MD5"
		    Return SSH_HOST_PUBLIC_KEY_MD5
		  Case "SSH_KEYDATA"
		    Return SSH_KEYDATA
		  Case "SSH_KEYFUNCTION"
		    Return SSH_KEYFUNCTION
		  Case "SSH_KNOWNHOSTS"
		    Return SSH_KNOWNHOSTS
		  Case "SSH_PRIVATE_KEYFILE"
		    Return SSH_PRIVATE_KEYFILE
		  Case "SSH_PUBLIC_KEYFILE"
		    Return SSH_PUBLIC_KEYFILE
		  Case "SSLCERT"
		    Return SSLCERT
		  Case "SSLCERTTYPE"
		    Return SSLCERTTYPE
		  Case "SSLCERT_BLOB"
		    Return SSLCERT_BLOB
		  Case "SSLENGINE"
		    Return SSLENGINE
		  Case "SSLENGINE_DEFAULT"
		    Return SSLENGINE_DEFAULT
		  Case "SSLKEY"
		    Return SSLKEY
		  Case "SSLKEYTYPE"
		    Return SSLKEYTYPE
		  Case "SSLKEY_BLOB"
		    Return SSLKEY_BLOB
		  Case "SSLVERSION"
		    Return SSLVERSION
		  Case "SSL_CIPHER_LIST"
		    Return SSL_CIPHER_LIST
		  Case "SSL_CTX_DATA"
		    Return SSL_CTX_DATA
		  Case "SSL_CTX_FUNCTION"
		    Return SSL_CTX_FUNCTION
		  Case "SSL_EC_CURVES"
		    Return SSL_EC_CURVES
		  Case "SSL_ENABLE_ALPN"
		    Return SSL_ENABLE_ALPN
		  Case "SSL_ENABLE_NPN"
		    Return SSL_ENABLE_NPN
		  Case "SSL_FALSESTART"
		    Return SSL_FALSESTART
		  Case "SSL_OPTIONS"
		    Return SSL_OPTIONS
		  Case "SSL_SESSIONID_CACHE"
		    Return SSL_SESSIONID_CACHE
		  Case "SSL_VERIFYHOST"
		    Return SSL_VERIFYHOST
		  Case "SSL_VERIFYPEER"
		    Return SSL_VERIFYPEER
		  Case "SSL_VERIFYSTATUS"
		    Return SSL_VERIFYSTATUS
		  Case "STDERR"
		    Return STDERR
		  Case "STREAM_DEPENDS"
		    Return STREAM_DEPENDS
		  Case "STREAM_DEPENDS_E"
		    Return STREAM_DEPENDS_E
		  Case "STREAM_WEIGHT"
		    Return STREAM_WEIGHT
		  Case "SUPPRESS_CONNECT_HEADERS"
		    Return SUPPRESS_CONNECT_HEADERS
		  Case "TCP_FASTOPEN"
		    Return TCP_FASTOPEN
		  Case "TCP_KEEPALIVE"
		    Return TCP_KEEPALIVE
		  Case "TCP_KEEPIDLE"
		    Return TCP_KEEPIDLE
		  Case "TCP_KEEPINTVL"
		    Return TCP_KEEPINTVL
		  Case "TCP_NODELAY"
		    Return TCP_NODELAY
		  Case "TELNETOPTIONS"
		    Return TELNETOPTIONS
		  Case "TFTP_BLKSIZE"
		    Return TFTP_BLKSIZE
		  Case "TFTP_NO_OPTIONS"
		    Return TFTP_NO_OPTIONS
		  Case "TIMECONDITION"
		    Return TIMECONDITION
		  Case "TIMEOUT"
		    Return TIMEOUT
		  Case "TIMEOUT_MS"
		    Return TIMEOUT_MS
		  Case "TIMEVALUE"
		    Return TIMEVALUE
		  Case "TIMEVALUE_LARGE"
		    Return TIMEVALUE_LARGE
		  Case "TLS13_CIPHERS"
		    Return TLS13_CIPHERS
		  Case "TLSAUTH_PASSWORD"
		    Return TLSAUTH_PASSWORD
		  Case "TLSAUTH_TYPE"
		    Return TLSAUTH_TYPE
		  Case "TLSAUTH_USERNAME"
		    Return TLSAUTH_USERNAME
		  Case "TRAILERDATA"
		    Return TRAILERDATA
		  Case "TRAILERFUNCTION"
		    Return TRAILERFUNCTION
		  Case "TRANSFERTEXT"
		    Return TRANSFERTEXT
		  Case "TRANSFER_ENCODING"
		    Return TRANSFER_ENCODING
		  Case "UNIX_SOCKET_PATH"
		    Return UNIX_SOCKET_PATH
		  Case "UNRESTRICTED_AUTH"
		    Return UNRESTRICTED_AUTH
		  Case "UPKEEP_INTERVAL_MS"
		    Return UPKEEP_INTERVAL_MS
		  Case "UPLOAD"
		    Return UPLOAD
		  Case "UPLOAD_BUFFERSIZE"
		    Return UPLOAD_BUFFERSIZE
		  Case "URL"
		    Return URL
		  Case "USERAGENT"
		    Return USERAGENT
		  Case "USERNAME"
		    Return USERNAME
		  Case "USERPWD"
		    Return USERPWD
		  Case "USE_SSL"
		    Return USE_SSL
		  Case "VERBOSE"
		    Return VERBOSE
		  Case "WILDCARDMATCH"
		    Return WILDCARDMATCH
		  Case "WRITEDATA"
		    Return WRITEDATA
		  Case "WRITEFUNCTION"
		    Return WRITEFUNCTION
		  Case "XFERINFODATA"
		    Return XFERINFODATA
		  Case "XFERINFOFUNCTION"
		    Return XFERINFOFUNCTION
		  Case "XOAUTH2_BEARER"
		    Return XOAUTH2_BEARER
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GetOptionName(OptionID As Integer, BindingAlias As Boolean) As String
		  Dim name As String
		  Select Case OptionID
		  Case ABSTRACT_UNIX_SOCKET
		    name = "ABSTRACT_UNIX_SOCKET"
		  Case ACCEPTTIMEOUT_MS
		    name = "ACCEPTTIMEOUT_MS"
		  Case ACCEPT_ENCODING
		    name = "ACCEPT_ENCODING"
		  Case ADDRESS_SCOPE
		    name = "ADDRESS_SCOPE"
		  Case ALTSVC
		    name = "ALTSVC"
		  Case ALTSVC_CTRL
		    name = "ALTSVC_CTRL"
		  Case APPEND
		    name = "APPEND"
		  Case AUTOREFERER
		    name = "AUTOREFERER"
		  Case BUFFERSIZE
		    name = "BUFFERSIZE"
		  Case CAINFO
		    name = "CAINFO"
		  Case CAPATH
		    name = "CAPATH"
		  Case CERTINFO
		    name = "CERTINFO"
		  Case CHUNK_BGN_FUNCTION
		    name = "CHUNK_BGN_FUNCTION"
		  Case CHUNK_DATA
		    name = "CHUNK_DATA"
		  Case CHUNK_END_FUNCTION
		    name = "CHUNK_END_FUNCTION"
		  Case CLOSESOCKETDATA
		    name = "CLOSESOCKETDATA"
		  Case CLOSESOCKETFUNCTION
		    name = "CLOSESOCKETFUNCTION"
		  Case CONNECTTIMEOUT
		    name = "CONNECTTIMEOUT"
		  Case CONNECTTIMEOUT_MS
		    name = "CONNECTTIMEOUT_MS"
		  Case CONNECT_ONLY
		    name = "CONNECT_ONLY"
		  Case CONNECT_TO
		    name = "CONNECT_TO"
		  Case CONV_FROM_NETWORK_FUNCTION
		    name = "CONV_FROM_NETWORK_FUNCTION"
		  Case CONV_FROM_UTF8_FUNCTION
		    name = "CONV_FROM_UTF8_FUNCTION"
		  Case CONV_TO_NETWORK_FUNCTION
		    name = "CONV_TO_NETWORK_FUNCTION"
		  Case COOKIE
		    name = "COOKIE"
		  Case COOKIEFILE
		    name = "COOKIEFILE"
		  Case COOKIEJAR
		    name = "COOKIEJAR"
		  Case COOKIELIST
		    name = "COOKIELIST"
		  Case COOKIESESSION
		    name = "COOKIESESSION"
		  Case COPYPOSTFIELDS
		    name = "COPYPOSTFIELDS"
		  Case CRLF
		    name = "CRLF"
		  Case CRLFILE
		    name = "CRLFILE"
		  Case CURLU
		    name = "CURLU"
		  Case CUSTOMREQUEST
		    name = "CUSTOMREQUEST"
		  Case DEBUGDATA
		    name = "DEBUGDATA"
		  Case DEBUGFUNCTION
		    name = "DEBUGFUNCTION"
		  Case DEFAULT_PROTOCOL
		    name = "DEFAULT_PROTOCOL"
		  Case DIRLISTONLY
		    name = "DIRLISTONLY"
		  Case DISALLOW_USERNAME_IN_URL
		    name = "DISALLOW_USERNAME_IN_URL"
		  Case DNS_CACHE_TIMEOUT
		    name = "DNS_CACHE_TIMEOUT"
		  Case DNS_INTERFACE
		    name = "DNS_INTERFACE"
		  Case DNS_LOCAL_IP4
		    name = "DNS_LOCAL_IP4"
		  Case DNS_LOCAL_IP6
		    name = "DNS_LOCAL_IP6"
		  Case DNS_SERVERS
		    name = "DNS_SERVERS"
		  Case DNS_SHUFFLE_ADDRESSES
		    name = "DNS_SHUFFLE_ADDRESSES"
		  Case DNS_USE_GLOBAL_CACHE
		    name = "DNS_USE_GLOBAL_CACHE"
		  Case DOH_URL
		    name = "DOH_URL"
		  Case EGDSOCKET
		    name = "EGDSOCKET"
		  Case ERRORBUFFER
		    name = "ERRORBUFFER"
		  Case EXPECT_100_TIMEOUT_MS
		    name = "EXPECT_100_TIMEOUT_MS"
		  Case FAILONERROR
		    name = "FAILONERROR"
		  Case FILETIME
		    name = "FILETIME"
		  Case FNMATCH_DATA
		    name = "FNMATCH_DATA"
		  Case FNMATCH_FUNCTION
		    name = "FNMATCH_FUNCTION"
		  Case FOLLOWLOCATION
		    name = "FOLLOWLOCATION"
		  Case FORBID_REUSE
		    name = "FORBID_REUSE"
		  Case FRESH_CONNECT
		    name = "FRESH_CONNECT"
		  Case FTPPORT
		    name = "FTPPORT"
		  Case FTPSSLAUTH
		    name = "FTPSSLAUTH"
		  Case FTP_ACCOUNT
		    name = "FTP_ACCOUNT"
		  Case FTP_ALTERNATIVE_TO_USER
		    name = "FTP_ALTERNATIVE_TO_USER"
		  Case FTP_CREATE_MISSING_DIRS
		    name = "FTP_CREATE_MISSING_DIRS"
		  Case FTP_FILEMETHOD
		    name = "FTP_FILEMETHOD"
		  Case FTP_RESPONSE_TIMEOUT
		    name = "FTP_RESPONSE_TIMEOUT"
		  Case FTP_SKIP_PASV_IP
		    name = "FTP_SKIP_PASV_IP"
		  Case FTP_SSL_CCC
		    name = "FTP_SSL_CCC"
		  Case FTP_USE_EPRT
		    name = "FTP_USE_EPRT"
		  Case FTP_USE_EPSV
		    name = "FTP_USE_EPSV"
		  Case FTP_USE_PRET
		    name = "FTP_USE_PRET"
		  Case GSSAPI_DELEGATION
		    name = "GSSAPI_DELEGATION"
		  Case HAPPY_EYEBALLS_TIMEOUT_MS
		    name = "HAPPY_EYEBALLS_TIMEOUT_MS"
		  Case HAPROXYPROTOCOL
		    name = "HAPROXYPROTOCOL"
		  Case HEADER
		    name = "HEADER"
		  Case HEADERDATA
		    name = "HEADERDATA"
		  Case HEADERFUNCTION
		    name = "HEADERFUNCTION"
		  Case HEADEROPT
		    name = "HEADEROPT"
		  Case HTTP09_ALLOWED
		    name = "HTTP09_ALLOWED"
		  Case HTTP200ALIASES
		    name = "HTTP200ALIASES"
		  Case HTTPAUTH
		    name = "HTTPAUTH"
		  Case HTTPGET
		    name = "HTTPGET"
		  Case HTTPHEADER
		    name = "HTTPHEADER"
		  Case HTTPPOST
		    name = "HTTPPOST"
		  Case HTTPPROXYTUNNEL
		    name = "HTTPPROXYTUNNEL"
		  Case HTTPVERSION
		    name = "HTTPVERSION"
		  Case HTTP_CONTENT_DECODING
		    name = "HTTP_CONTENT_DECODING"
		  Case HTTP_TRANSFER_DECODING
		    name = "HTTP_TRANSFER_DECODING"
		  Case HTTP_VERSION
		    name = "HTTP_VERSION"
		  Case IGNORE_CONTENT_LENGTH
		    name = "IGNORE_CONTENT_LENGTH"
		  Case INFILESIZE
		    name = "INFILESIZE"
		  Case INFILESIZE_LARGE
		    name = "INFILESIZE_LARGE"
		  Case INTERLEAVEDATA
		    name = "INTERLEAVEDATA"
		  Case INTERLEAVEFUNCTION
		    name = "INTERLEAVEFUNCTION"
		  Case IOCTLDATA
		    name = "IOCTLDATA"
		  Case IOCTLFUNCTION
		    name = "IOCTLFUNCTION"
		  Case IPRESOLVE
		    name = "IPRESOLVE"
		  Case ISSUERCERT
		    name = "ISSUERCERT"
		  Case ISSUERCERT_BLOB
		    name = "ISSUERCERT_BLOB"
		  Case KEEP_SENDING_ON_ERROR
		    name = "KEEP_SENDING_ON_ERROR"
		  Case KEYPASSWD
		    name = "KEYPASSWD"
		  Case KRBLEVEL
		    name = "KRBLEVEL"
		  Case LOCALPORT
		    name = "LOCALPORT"
		  Case LOCALPORTRANGE
		    name = "LOCALPORTRANGE"
		  Case LOGIN_OPTIONS
		    name = "LOGIN_OPTIONS"
		  Case LOW_SPEED_LIMIT
		    name = "LOW_SPEED_LIMIT"
		  Case LOW_SPEED_TIME
		    name = "LOW_SPEED_TIME"
		  Case MAIL_AUTH
		    name = "MAIL_AUTH"
		  Case MAIL_FROM
		    name = "MAIL_FROM"
		  Case MAIL_RCPT
		    name = "MAIL_RCPT"
		  Case MAIL_RCPT_ALLLOWFAILS
		    name = "MAIL_RCPT_ALLLOWFAILS"
		  Case MAXAGE_CONN
		    name = "MAXAGE_CONN"
		  Case MAXCONNECTS
		    name = "MAXCONNECTS"
		  Case MAXFILESIZE
		    name = "MAXFILESIZE"
		  Case MAXFILESIZE_LARGE
		    name = "MAXFILESIZE_LARGE"
		  Case MAXREDIRS
		    name = "MAXREDIRS"
		  Case MAX_RECV_SPEED_LARGE
		    name = "MAX_RECV_SPEED_LARGE"
		  Case MAX_SEND_SPEED_LARGE
		    name = "MAX_SEND_SPEED_LARGE"
		  Case MIMEPOST
		    name = "MIMEPOST"
		  Case NETINTERFACE
		    If BindingAlias Then
		      name = "NETINTERFACE"
		    Else
		      name = "INTERFACE"
		    End If
		  Case NETRC
		    name = "NETRC"
		  Case NETRC_FILE
		    name = "NETRC_FILE"
		  Case NEW_DIRECTORY_PERMS
		    name = "NEW_DIRECTORY_PERMS"
		  Case NEW_FILE_PERMS
		    name = "NEW_FILE_PERMS"
		  Case NOBODY
		    name = "NOBODY"
		  Case NOPROGRESS
		    name = "NOPROGRESS"
		  Case NOPROXY
		    name = "NOPROXY"
		  Case NOSIGNAL
		    name = "NOSIGNAL"
		  Case OPENSOCKETDATA
		    name = "OPENSOCKETDATA"
		  Case OPENSOCKETFUNCTION
		    name = "OPENSOCKETFUNCTION"
		  Case PASSWORD
		    name = "PASSWORD"
		  Case PATH_AS_IS
		    name = "PATH_AS_IS"
		  Case PINNEDPUBLICKEY
		    name = "PINNEDPUBLICKEY"
		  Case PIPELINING_SERVER_BL
		    name = "PIPELINING_SERVER_BL"
		  Case PIPELINING_SITE_BL
		    name = "PIPELINING_SITE_BL"
		  Case PIPEWAIT
		    name = "PIPEWAIT"
		  Case PORT
		    name = "PORT"
		  Case POST
		    name = "POST"
		  Case POSTFIELDS
		    name = "POSTFIELDS"
		  Case POSTFIELDSIZE
		    name = "POSTFIELDSIZE"
		  Case POSTFIELDSIZE_LARGE
		    name = "POSTFIELDSIZE_LARGE"
		  Case POSTQUOTE
		    name = "POSTQUOTE"
		  Case POSTREDIR
		    name = "POSTREDIR"
		  Case PREQUOTE
		    name = "PREQUOTE"
		  Case PRE_PROXY
		    name = "PRE_PROXY"
		  Case PRIVATE_
		    name = "PRIVATE_"
		  Case PROGRESSDATA
		    name = "PROGRESSDATA"
		  Case PROGRESSFUNCTION
		    name = "PROGRESSFUNCTION"
		  Case PROTOCOLS
		    name = "PROTOCOLS"
		  Case PROXY
		    name = "PROXY"
		  Case PROXYAUTH
		    name = "PROXYAUTH"
		  Case PROXYHEADER
		    name = "PROXYHEADER"
		  Case PROXYPASSWORD
		    name = "PROXYPASSWORD"
		  Case PROXYPORT
		    name = "PROXYPORT"
		  Case PROXYTYPE
		    name = "PROXYTYPE"
		  Case PROXYUSERNAME
		    name = "PROXYUSERNAME"
		  Case PROXYUSERPWD
		    name = "PROXYUSERPWD"
		  Case PROXY_CAINFO
		    name = "PROXY_CAINFO"
		  Case PROXY_CAPATH
		    name = "PROXY_CAPATH"
		  Case PROXY_CRLFILE
		    name = "PROXY_CRLFILE"
		  Case PROXY_ISSUERCERT
		    name = "PROXY_ISSUERCERT"
		  Case PROXY_ISSUERCERT_BLOB
		    name = "PROXY_ISSUERCERT_BLOB"
		  Case PROXY_KEYPASSWD
		    name = "PROXY_KEYPASSWD"
		  Case PROXY_PINNEDPUBLICKEY
		    name = "PROXY_PINNEDPUBLICKEY"
		  Case PROXY_SERVICE_NAME
		    name = "PROXY_SERVICE_NAME"
		  Case PROXY_SSLCERT
		    name = "PROXY_SSLCERT"
		  Case PROXY_SSLCERTTYPE
		    name = "PROXY_SSLCERTTYPE"
		  Case PROXY_SSLCERT_BLOB
		    name = "PROXY_SSLCERT_BLOB"
		  Case PROXY_SSLKEY
		    name = "PROXY_SSLKEY"
		  Case PROXY_SSLKEYTYPE
		    name = "PROXY_SSLKEYTYPE"
		  Case PROXY_SSLKEY_BLOB
		    name = "PROXY_SSLKEY_BLOB"
		  Case PROXY_SSLVERSION
		    name = "PROXY_SSLVERSION"
		  Case PROXY_SSL_CIPHER_LIST
		    name = "PROXY_SSL_CIPHER_LIST"
		  Case PROXY_SSL_OPTIONS
		    name = "PROXY_SSL_OPTIONS"
		  Case PROXY_SSL_VERIFYHOST
		    name = "PROXY_SSL_VERIFYHOST"
		  Case PROXY_SSL_VERIFYPEER
		    name = "PROXY_SSL_VERIFYPEER"
		  Case PROXY_TLS13_CIPHERS
		    name = "PROXY_TLS13_CIPHERS"
		  Case PROXY_TLSAUTH_PASSWORD
		    name = "PROXY_TLSAUTH_PASSWORD"
		  Case PROXY_TLSAUTH_TYPE
		    name = "PROXY_TLSAUTH_TYPE"
		  Case PROXY_TLSAUTH_USERNAME
		    name = "PROXY_TLSAUTH_USERNAME"
		  Case PROXY_TRANSFER_MODE
		    name = "PROXY_TRANSFER_MODE"
		  Case PUT
		    name = "PUT"
		  Case QUOTE
		    name = "QUOTE"
		  Case RANDOM_FILE
		    name = "RANDOM_FILE"
		  Case RANGE
		    name = "RANGE"
		  Case READDATA
		    name = "READDATA"
		  Case READFUNCTION
		    name = "READFUNCTION"
		  Case REDIR_PROTOCOLS
		    name = "REDIR_PROTOCOLS"
		  Case REFERER
		    name = "REFERER"
		  Case REQUEST_TARGET
		    name = "REQUEST_TARGET"
		  Case RESOLVE
		    name = "RESOLVE"
		  Case RESOLVER_START_DATA
		    name = "RESOLVER_START_DATA"
		  Case RESOLVER_START_FUNCTION
		    name = "RESOLVER_START_FUNCTION"
		  Case RESUME_FROM
		    name = "RESUME_FROM"
		  Case RESUME_FROM_LARGE
		    name = "RESUME_FROM_LARGE"
		  Case RTSP_CLIENT_CSEQ
		    name = "RTSP_CLIENT_CSEQ"
		  Case RTSP_REQUEST
		    name = "RTSP_REQUEST"
		  Case RTSP_SERVER_CSEQ
		    name = "RTSP_SERVER_CSEQ"
		  Case RTSP_SESSION_ID
		    name = "RTSP_SESSION_ID"
		  Case RTSP_STREAM_URI
		    name = "RTSP_STREAM_URI"
		  Case RTSP_TRANSPORT
		    name = "RTSP_TRANSPORT"
		  Case SASL_AUTHZID
		    name = "SASL_AUTHZID"
		  Case SASL_IR
		    name = "SASL_IR"
		  Case SEEKDATA
		    name = "SEEKDATA"
		  Case SEEKFUNCTION
		    name = "SEEKFUNCTION"
		  Case SERVICE_NAME
		    name = "SERVICE_NAME"
		  Case SHARE
		    name = "SHARE"
		  Case SHOPT_LOCKFUNC
		    name = "SHOPT_LOCKFUNC"
		  Case SHOPT_UNLOCKFUNC
		    name = "SHOPT_UNLOCKFUNC"
		  Case SHOPT_USERDATA
		    name = "SHOPT_USERDATA"
		  Case SOCKOPTDATA
		    name = "SOCKOPTDATA"
		  Case SOCKOPTFUNCTION
		    name = "SOCKOPTFUNCTION"
		  Case SOCKS5_AUTH
		    name = "SOCKS5_AUTH"
		  Case SOCKS5_GSSAPI_NEC
		    name = "SOCKS5_GSSAPI_NEC"
		  Case SOCKS5_GSSAPI_SERVICE
		    name = "SOCKS5_GSSAPI_SERVICE"
		  Case SSH_AUTH_TYPES
		    name = "SSH_AUTH_TYPES"
		  Case SSH_COMPRESSION
		    name = "SSH_COMPRESSION"
		  Case SSH_HOST_PUBLIC_KEY_MD5
		    name = "SSH_HOST_PUBLIC_KEY_MD5"
		  Case SSH_KEYDATA
		    name = "SSH_KEYDATA"
		  Case SSH_KEYFUNCTION
		    name = "SSH_KEYFUNCTION"
		  Case SSH_KNOWNHOSTS
		    name = "SSH_KNOWNHOSTS"
		  Case SSH_PRIVATE_KEYFILE
		    name = "SSH_PRIVATE_KEYFILE"
		  Case SSH_PUBLIC_KEYFILE
		    name = "SSH_PUBLIC_KEYFILE"
		  Case SSLCERT
		    name = "SSLCERT"
		  Case SSLCERTTYPE
		    name = "SSLCERTTYPE"
		  Case SSLCERT_BLOB
		    name = "SSLCERT_BLOB"
		  Case SSLENGINE
		    name = "SSLENGINE"
		  Case SSLENGINE_DEFAULT
		    name = "SSLENGINE_DEFAULT"
		  Case SSLKEY
		    name = "SSLKEY"
		  Case SSLKEYTYPE
		    name = "SSLKEYTYPE"
		  Case SSLKEY_BLOB
		    name = "SSLKEY_BLOB"
		  Case SSLVERSION
		    name = "SSLVERSION"
		  Case SSL_CIPHER_LIST
		    name = "SSL_CIPHER_LIST"
		  Case SSL_CTX_DATA
		    name = "SSL_CTX_DATA"
		  Case SSL_CTX_FUNCTION
		    name = "SSL_CTX_FUNCTION"
		  Case SSL_EC_CURVES
		    name = "SSL_EC_CURVES"
		  Case SSL_ENABLE_ALPN
		    name = "SSL_ENABLE_ALPN"
		  Case SSL_ENABLE_NPN
		    name = "SSL_ENABLE_NPN"
		  Case SSL_FALSESTART
		    name = "SSL_FALSESTART"
		  Case SSL_OPTIONS
		    name = "SSL_OPTIONS"
		  Case SSL_SESSIONID_CACHE
		    name = "SSL_SESSIONID_CACHE"
		  Case SSL_VERIFYHOST
		    name = "SSL_VERIFYHOST"
		  Case SSL_VERIFYPEER
		    name = "SSL_VERIFYPEER"
		  Case SSL_VERIFYSTATUS
		    name = "SSL_VERIFYSTATUS"
		  Case STDERR
		    name = "STDERR"
		  Case STREAM_DEPENDS
		    name = "STREAM_DEPENDS"
		  Case STREAM_DEPENDS_E
		    name = "STREAM_DEPENDS_E"
		  Case STREAM_WEIGHT
		    name = "STREAM_WEIGHT"
		  Case SUPPRESS_CONNECT_HEADERS
		    name = "SUPPRESS_CONNECT_HEADERS"
		  Case TCP_FASTOPEN
		    name = "TCP_FASTOPEN"
		  Case TCP_KEEPALIVE
		    name = "TCP_KEEPALIVE"
		  Case TCP_KEEPIDLE
		    name = "TCP_KEEPIDLE"
		  Case TCP_KEEPINTVL
		    name = "TCP_KEEPINTVL"
		  Case TCP_NODELAY
		    name = "TCP_NODELAY"
		  Case TELNETOPTIONS
		    name = "TELNETOPTIONS"
		  Case TFTP_BLKSIZE
		    name = "TFTP_BLKSIZE"
		  Case TFTP_NO_OPTIONS
		    name = "TFTP_NO_OPTIONS"
		  Case TIMECONDITION
		    name = "TIMECONDITION"
		  Case TIMEOUT
		    name = "TIMEOUT"
		  Case TIMEOUT_MS
		    name = "TIMEOUT_MS"
		  Case TIMEVALUE
		    name = "TIMEVALUE"
		  Case TIMEVALUE_LARGE
		    name = "TIMEVALUE_LARGE"
		  Case TLS13_CIPHERS
		    name = "TLS13_CIPHERS"
		  Case TLSAUTH_PASSWORD
		    name = "TLSAUTH_PASSWORD"
		  Case TLSAUTH_TYPE
		    name = "TLSAUTH_TYPE"
		  Case TLSAUTH_USERNAME
		    name = "TLSAUTH_USERNAME"
		  Case TRAILERDATA
		    name = "TRAILERDATA"
		  Case TRAILERFUNCTION
		    name = "TRAILERFUNCTION"
		  Case TRANSFERTEXT
		    name = "TRANSFERTEXT"
		  Case TRANSFER_ENCODING
		    name = "TRANSFER_ENCODING"
		  Case UNIX_SOCKET_PATH
		    name = "UNIX_SOCKET_PATH"
		  Case UNRESTRICTED_AUTH
		    name = "UNRESTRICTED_AUTH"
		  Case UPKEEP_INTERVAL_MS
		    name = "UPKEEP_INTERVAL_MS"
		  Case UPLOAD
		    name = "UPLOAD"
		  Case UPLOAD_BUFFERSIZE
		    name = "UPLOAD_BUFFERSIZE"
		  Case URL
		    name = "URL"
		  Case USERAGENT
		    name = "USERAGENT"
		  Case USERNAME
		    name = "USERNAME"
		  Case USERPWD
		    name = "USERPWD"
		  Case USE_SSL
		    name = "USE_SSL"
		  Case VERBOSE
		    name = "VERBOSE"
		  Case WILDCARDMATCH
		    name = "WILDCARDMATCH"
		  Case WRITEDATA
		    name = "WRITEDATA"
		  Case WRITEFUNCTION
		    name = "WRITEFUNCTION"
		  Case XFERINFODATA
		    name = "XFERINFODATA"
		  Case XFERINFOFUNCTION
		    name = "XFERINFOFUNCTION"
		  Case XOAUTH2_BEARER
		    name = "XOAUTH2_BEARER"
		  End Select
		  
		  If Not BindingAlias And name <> "" Then name = "CURLOPT_" + name
		  If BindingAlias And name <> "" Then name = "libcURL.Opts." + name
		  Return name
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function GetOptionType(OptionID As Integer) As OptionType
		  Select Case OptionID
		  Case ABSTRACT_UNIX_SOCKET
		    Return OptionType.String
		  Case ACCEPTTIMEOUT_MS
		    Return OptionType.Number
		  Case ACCEPT_ENCODING
		    Return OptionType.String
		  Case ADDRESS_SCOPE
		    Return OptionType.Number
		  Case ALTSVC
		    Return OptionType.String
		  Case ALTSVC_CTRL
		    Return OptionType.Number
		  Case APPEND
		    Return OptionType.Number
		  Case AUTOREFERER
		    Return OptionType.Number
		  Case BUFFERSIZE
		    Return OptionType.Number
		  Case CAINFO
		    Return OptionType.String
		  Case CAPATH
		    Return OptionType.String
		  Case CERTINFO
		    Return OptionType.Number
		  Case CHUNK_BGN_FUNCTION
		    Return OptionType.Subroutine
		  Case CHUNK_DATA
		    Return OptionType.Opaque
		  Case CHUNK_END_FUNCTION
		    Return OptionType.Subroutine
		  Case CLOSESOCKETDATA
		    Return OptionType.Opaque
		  Case CLOSESOCKETFUNCTION
		    Return OptionType.Subroutine
		  Case CONNECTTIMEOUT
		    Return OptionType.Number
		  Case CONNECTTIMEOUT_MS
		    Return OptionType.Number
		  Case CONNECT_ONLY
		    Return OptionType.Number
		  Case CONNECT_TO
		    Return OptionType.List
		  Case CONV_FROM_NETWORK_FUNCTION
		    Return OptionType.Subroutine
		  Case CONV_FROM_UTF8_FUNCTION
		    Return OptionType.Subroutine
		  Case CONV_TO_NETWORK_FUNCTION
		    Return OptionType.Subroutine
		  Case COOKIE
		    Return OptionType.String
		  Case COOKIEFILE
		    Return OptionType.String
		  Case COOKIEJAR
		    Return OptionType.String
		  Case COOKIELIST
		    Return OptionType.String
		  Case COOKIESESSION
		    Return OptionType.Number
		  Case COPYPOSTFIELDS
		    Return OptionType.Ptr
		  Case CRLF
		    Return OptionType.Number
		  Case CRLFILE
		    Return OptionType.String
		  Case CURLU
		    Return OptionType.Ptr
		  Case CUSTOMREQUEST
		    Return OptionType.String
		  Case DEBUGDATA
		    Return OptionType.Opaque
		  Case DEBUGFUNCTION
		    Return OptionType.Subroutine
		  Case DEFAULT_PROTOCOL
		    Return OptionType.String
		  Case DIRLISTONLY
		    Return OptionType.Number
		  Case DISALLOW_USERNAME_IN_URL
		    Return OptionType.Number
		  Case DNS_CACHE_TIMEOUT
		    Return OptionType.Number
		  Case DNS_INTERFACE
		    Return OptionType.String
		  Case DNS_LOCAL_IP4
		    Return OptionType.String
		  Case DNS_LOCAL_IP6
		    Return OptionType.String
		  Case DNS_SERVERS
		    Return OptionType.String
		  Case DNS_SHUFFLE_ADDRESSES
		    Return OptionType.Number
		  Case DNS_USE_GLOBAL_CACHE
		    Return OptionType.Number
		  Case DOH_URL
		    Return OptionType.String
		  Case EGDSOCKET
		    Return OptionType.String
		  Case ACCEPT_ENCODING
		    Return OptionType.String
		  Case ERRORBUFFER
		    Return OptionType.Ptr
		  Case EXPECT_100_TIMEOUT_MS
		    Return OptionType.Number
		  Case FAILONERROR
		    Return OptionType.Number
		  Case WRITEDATA
		    Return OptionType.Opaque
		  Case FILETIME
		    Return OptionType.Number
		  Case FNMATCH_DATA
		    Return OptionType.Opaque
		  Case FNMATCH_FUNCTION
		    Return OptionType.Subroutine
		  Case FOLLOWLOCATION
		    Return OptionType.Number
		  Case FORBID_REUSE
		    Return OptionType.Number
		  Case FRESH_CONNECT
		    Return OptionType.Number
		  Case APPEND
		    Return OptionType.Number
		  Case DIRLISTONLY
		    Return OptionType.Number
		  Case FTPPORT
		    Return OptionType.String
		  Case FTPSSLAUTH
		    Return OptionType.Bitmask
		  Case FTP_ACCOUNT
		    Return OptionType.String
		  Case FTP_ALTERNATIVE_TO_USER
		    Return OptionType.String
		  Case FTP_CREATE_MISSING_DIRS
		    Return OptionType.Number
		  Case FTP_FILEMETHOD
		    Return OptionType.Bitmask
		  Case FTP_RESPONSE_TIMEOUT
		    Return OptionType.Number
		  Case FTP_SKIP_PASV_IP
		    Return OptionType.Number
		  Case USE_SSL
		    Return OptionType.Bitmask
		  Case FTP_SSL_CCC
		    Return OptionType.Number
		  Case FTP_USE_EPRT
		    Return OptionType.Number
		  Case FTP_USE_EPSV
		    Return OptionType.Number
		  Case FTP_USE_PRET
		    Return OptionType.Number
		  Case GSSAPI_DELEGATION
		    Return OptionType.Bitmask
		  Case HAPPY_EYEBALLS_TIMEOUT_MS
		    Return OptionType.Number
		  Case HAPROXYPROTOCOL
		    Return OptionType.Number
		  Case HEADER
		    Return OptionType.Number
		  Case HEADERDATA
		    Return OptionType.Opaque
		  Case HEADERFUNCTION
		    Return OptionType.Subroutine
		  Case HEADEROPT
		    Return OptionType.Bitmask
		  Case HTTP09_ALLOWED
		    Return OptionType.Number
		  Case HTTP200ALIASES
		    Return OptionType.List
		  Case HTTPAUTH
		    Return OptionType.Bitmask
		  Case HTTPGET
		    Return OptionType.Number
		  Case HTTPHEADER
		    Return OptionType.List
		  Case HTTPPOST
		    Return OptionType.Ptr
		  Case HTTPPROXYTUNNEL
		    Return OptionType.Number
		  Case HTTP_CONTENT_DECODING
		    Return OptionType.Number
		  Case HTTP_TRANSFER_DECODING
		    Return OptionType.Number
		  Case HTTP_VERSION
		    Return OptionType.Bitmask
		  Case IGNORE_CONTENT_LENGTH
		    Return OptionType.Number
		  Case READDATA
		    Return OptionType.Opaque
		  Case INFILESIZE
		    Return OptionType.Number
		  Case INFILESIZE_LARGE
		    Return OptionType.LargeNumber
		  Case NETINTERFACE
		    Return OptionType.String
		  Case INTERLEAVEDATA
		    Return OptionType.Opaque
		  Case INTERLEAVEFUNCTION
		    Return OptionType.Subroutine
		  Case IOCTLDATA
		    Return OptionType.Opaque
		  Case IOCTLFUNCTION
		    Return OptionType.Subroutine
		  Case IPRESOLVE
		    Return OptionType.Bitmask
		  Case ISSUERCERT
		    Return OptionType.String
		  Case ISSUERCERT_BLOB
		    Return OptionType.Blob
		  Case KEEP_SENDING_ON_ERROR
		    Return OptionType.Number
		  Case KEYPASSWD
		    Return OptionType.String
		  Case KRBLEVEL
		    Return OptionType.String
		  Case KRBLEVEL
		    Return OptionType.String
		  Case LOCALPORT
		    Return OptionType.Number
		  Case LOCALPORTRANGE
		    Return OptionType.Number
		  Case LOGIN_OPTIONS
		    Return OptionType.String
		  Case LOW_SPEED_LIMIT
		    Return OptionType.Number
		  Case LOW_SPEED_TIME
		    Return OptionType.Number
		  Case MAIL_AUTH
		    Return OptionType.String
		  Case MAIL_FROM
		    Return OptionType.String
		  Case MAIL_RCPT
		    Return OptionType.List
		  Case MAIL_RCPT_ALLLOWFAILS
		    Return OptionType.Number
		  Case MAXAGE_CONN
		    Return OptionType.Number
		  Case MAXCONNECTS
		    Return OptionType.Number
		  Case MAXFILESIZE
		    Return OptionType.Number
		  Case MAXFILESIZE_LARGE
		    Return OptionType.LargeNumber
		  Case MAXREDIRS
		    Return OptionType.Number
		  Case MAX_RECV_SPEED_LARGE
		    Return OptionType.LargeNumber
		  Case MAX_SEND_SPEED_LARGE
		    Return OptionType.LargeNumber
		  Case MIMEPOST
		    Return OptionType.Ptr
		  Case NETRC
		    Return OptionType.Bitmask
		  Case NETRC_FILE
		    Return OptionType.String
		  Case NEW_DIRECTORY_PERMS
		    Return OptionType.Number
		  Case NEW_FILE_PERMS
		    Return OptionType.Number
		  Case NOBODY
		    Return OptionType.Number
		  Case NOPROGRESS
		    Return OptionType.Number
		  Case NOPROXY
		    Return OptionType.String
		  Case NOSIGNAL
		    Return OptionType.Number
		  Case OPENSOCKETDATA
		    Return OptionType.Opaque
		  Case OPENSOCKETFUNCTION
		    Return OptionType.Subroutine
		  Case PASSWORD
		    Return OptionType.String
		  Case PATH_AS_IS
		    Return OptionType.Number
		  Case PINNEDPUBLICKEY
		    Return OptionType.String
		  Case PIPEWAIT
		    Return OptionType.Number
		  Case PORT
		    Return OptionType.Number
		  Case POST
		    Return OptionType.Number
		  Case POSTREDIR
		    Return OptionType.Bitmask
		  Case POSTFIELDS
		    Return OptionType.Ptr
		  Case POSTFIELDSIZE
		    Return OptionType.Number
		  Case POSTFIELDSIZE_LARGE
		    Return OptionType.LargeNumber
		  Case POSTQUOTE
		    Return OptionType.List
		  Case POSTREDIR
		    Return OptionType.Bitmask
		  Case PREQUOTE
		    Return OptionType.List
		  Case PRE_PROXY
		    Return OptionType.String
		  Case PRIVATE_
		    Return OptionType.Ptr
		  Case XFERINFODATA
		    Return OptionType.Opaque
		  Case PROGRESSFUNCTION
		    Return OptionType.Subroutine
		  Case PROTOCOLS
		    Return OptionType.Number
		  Case PROXY
		    Return OptionType.String
		  Case PROXYAUTH
		    Return OptionType.Bitmask
		  Case PROXYHEADER
		    Return OptionType.List
		  Case PROXYPASSWORD
		    Return OptionType.String
		  Case PROXYPORT
		    Return OptionType.Number
		  Case PROXYTYPE
		    Return OptionType.Bitmask
		  Case PROXYUSERNAME
		    Return OptionType.String
		  Case PROXYUSERPWD
		    Return OptionType.String
		  Case PROXY_CAINFO
		    Return OptionType.String
		  Case PROXY_CAPATH
		    Return OptionType.String
		  Case PROXY_CRLFILE
		    Return OptionType.String
		  Case PROXY_ISSUERCERT
		    Return OptionType.String
		  Case PROXY_ISSUERCERT_BLOB
		    Return OptionType.Blob
		  Case PROXY_KEYPASSWD
		    Return OptionType.String
		  Case PROXY_PINNEDPUBLICKEY
		    Return OptionType.String
		  Case PROXY_SERVICE_NAME
		    Return OptionType.String
		  Case PROXY_SSLCERT
		    Return OptionType.String
		  Case PROXY_SSLCERTTYPE
		    Return OptionType.String
		  Case PROXY_SSLCERT_BLOB
		    Return OptionType.Blob
		  Case PROXY_SSLKEY
		    Return OptionType.String
		  Case PROXY_SSLKEYTYPE
		    Return OptionType.String
		  Case PROXY_SSLKEY_BLOB
		    Return OptionType.Blob
		  Case PROXY_SSLVERSION
		    Return OptionType.Bitmask
		  Case PROXY_SSL_CIPHER_LIST
		    Return OptionType.String
		  Case PROXY_SSL_OPTIONS
		    Return OptionType.Number
		  Case PROXY_SSL_VERIFYHOST
		    Return OptionType.Number
		  Case PROXY_SSL_VERIFYPEER
		    Return OptionType.Number
		  Case PROXY_TLS13_CIPHERS
		    Return OptionType.String
		  Case PROXY_TLSAUTH_PASSWORD
		    Return OptionType.String
		  Case PROXY_TLSAUTH_TYPE
		    Return OptionType.String
		  Case PROXY_TLSAUTH_USERNAME
		    Return OptionType.String
		  Case PROXY_TRANSFER_MODE
		    Return OptionType.Number
		  Case PUT
		    Return OptionType.Number
		  Case QUOTE
		    Return OptionType.List
		  Case RANDOM_FILE
		    Return OptionType.String
		  Case RANGE
		    Return OptionType.String
		  Case READDATA
		    Return OptionType.Opaque
		  Case READFUNCTION
		    Return OptionType.Subroutine
		  Case REDIR_PROTOCOLS
		    Return OptionType.Number
		  Case REFERER
		    Return OptionType.String
		  Case REQUEST_TARGET
		    Return OptionType.String
		  Case RESOLVE
		    Return OptionType.List
		  Case RESOLVER_START_DATA
		    Return OptionType.Opaque
		  Case RESOLVER_START_FUNCTION
		    Return OptionType.Subroutine
		  Case RESUME_FROM
		    Return OptionType.Number
		  Case RESUME_FROM_LARGE
		    Return OptionType.LargeNumber
		  Case HTTPHEADER
		    Return OptionType.List
		  Case RTSP_CLIENT_CSEQ
		    Return OptionType.Number
		  Case RTSP_REQUEST
		    Return OptionType.Bitmask
		  Case RTSP_SERVER_CSEQ
		    Return OptionType.Number
		  Case RTSP_SESSION_ID
		    Return OptionType.String
		  Case RTSP_STREAM_URI
		    Return OptionType.String
		  Case RTSP_TRANSPORT
		    Return OptionType.String
		  Case SASL_AUTHZID
		    Return OptionType.String
		  Case SASL_IR
		    Return OptionType.Number
		  Case SEEKDATA
		    Return OptionType.Opaque
		  Case SEEKFUNCTION
		    Return OptionType.Subroutine
		  Case FTP_RESPONSE_TIMEOUT
		    Return OptionType.Number
		  Case SERVICE_NAME
		    Return OptionType.String
		  Case SHARE
		    Return OptionType.Ptr
		  Case SOCKOPTDATA
		    Return OptionType.Opaque
		  Case SOCKOPTFUNCTION
		    Return OptionType.Subroutine
		  Case SOCKS5_AUTH
		    Return OptionType.Number
		  Case SOCKS5_GSSAPI_NEC
		    Return OptionType.Number
		  Case SOCKS5_GSSAPI_SERVICE
		    Return OptionType.String
		  Case SSH_AUTH_TYPES
		    Return OptionType.Bitmask
		  Case SSH_COMPRESSION
		    Return OptionType.Number
		  Case SSH_HOST_PUBLIC_KEY_MD5
		    Return OptionType.String
		  Case SSH_KEYDATA
		    Return OptionType.Opaque
		  Case SSH_KEYFUNCTION
		    Return OptionType.Subroutine
		  Case SSH_KNOWNHOSTS
		    Return OptionType.String
		  Case SSH_PRIVATE_KEYFILE
		    Return OptionType.String
		  Case SSH_PUBLIC_KEYFILE
		    Return OptionType.String
		  Case SSLCERT
		    Return OptionType.String
		  Case KEYPASSWD
		    Return OptionType.String
		  Case SSLCERTTYPE
		    Return OptionType.String
		  Case SSLCERT_BLOB
		    Return OptionType.Blob
		  Case SSLENGINE
		    Return OptionType.String
		  Case SSLENGINE_DEFAULT
		    Return OptionType.Number
		  Case SSLKEY
		    Return OptionType.String
		  Case KEYPASSWD
		    Return OptionType.String
		  Case SSLKEYTYPE
		    Return OptionType.String
		  Case SSLKEY_BLOB
		    Return OptionType.Blob
		  Case SSLVERSION
		    Return OptionType.Bitmask
		  Case SSL_CIPHER_LIST
		    Return OptionType.String
		  Case SSL_CTX_DATA
		    Return OptionType.Opaque
		  Case SSL_CTX_FUNCTION
		    Return OptionType.Subroutine
		  Case SSL_EC_CURVES
		    Return OptionType.String
		  Case SSL_ENABLE_ALPN
		    Return OptionType.Number
		  Case SSL_ENABLE_NPN
		    Return OptionType.Number
		  Case SSL_FALSESTART
		    Return OptionType.Number
		  Case SSL_OPTIONS
		    Return OptionType.Bitmask
		  Case SSL_SESSIONID_CACHE
		    Return OptionType.Number
		  Case SSL_VERIFYHOST
		    Return OptionType.Number
		  Case SSL_VERIFYPEER
		    Return OptionType.Number
		  Case SSL_VERIFYSTATUS
		    Return OptionType.Number
		  Case STDERR
		    Return OptionType.Ptr
		  Case STREAM_DEPENDS
		    Return OptionType.Ptr
		  Case STREAM_DEPENDS_E
		    Return OptionType.Ptr
		  Case STREAM_WEIGHT
		    Return OptionType.Number
		  Case SUPPRESS_CONNECT_HEADERS
		    Return OptionType.Number
		  Case TCP_FASTOPEN
		    Return OptionType.Number
		  Case TCP_KEEPALIVE
		    Return OptionType.Number
		  Case TCP_KEEPIDLE
		    Return OptionType.Number
		  Case TCP_KEEPINTVL
		    Return OptionType.Number
		  Case TCP_NODELAY
		    Return OptionType.Number
		  Case TELNETOPTIONS
		    Return OptionType.List
		  Case TFTP_BLKSIZE
		    Return OptionType.Number
		  Case TFTP_NO_OPTIONS
		    Return OptionType.Number
		  Case TIMECONDITION
		    Return OptionType.Bitmask
		  Case TIMEOUT
		    Return OptionType.Number
		  Case TIMEOUT_MS
		    Return OptionType.Number
		  Case TIMEVALUE
		    Return OptionType.Number
		  Case TIMEVALUE_LARGE
		    Return OptionType.LargeNumber
		  Case TLS13_CIPHERS
		    Return OptionType.String
		  Case TLSAUTH_PASSWORD
		    Return OptionType.String
		  Case TLSAUTH_TYPE
		    Return OptionType.String
		  Case TLSAUTH_USERNAME
		    Return OptionType.String
		  Case TRAILERDATA
		    Return OptionType.Opaque
		  Case TRAILERFUNCTION
		    Return OptionType.Subroutine
		  Case TRANSFERTEXT
		    Return OptionType.Number
		  Case TRANSFER_ENCODING
		    Return OptionType.Number
		  Case UNIX_SOCKET_PATH
		    Return OptionType.String
		  Case UNRESTRICTED_AUTH
		    Return OptionType.Number
		  Case UPKEEP_INTERVAL_MS
		    Return OptionType.Number
		  Case UPLOAD
		    Return OptionType.Number
		  Case UPLOAD_BUFFERSIZE
		    Return OptionType.Number
		  Case URL
		    Return OptionType.String
		  Case USERAGENT
		    Return OptionType.String
		  Case USERNAME
		    Return OptionType.String
		  Case USERPWD
		    Return OptionType.String
		  Case USE_SSL
		    Return OptionType.Bitmask
		  Case VERBOSE
		    Return OptionType.Number
		  Case WILDCARDMATCH
		    Return OptionType.Number
		  Case WRITEDATA
		    Return OptionType.Opaque
		  Case WRITEFUNCTION
		    Return OptionType.Subroutine
		  Case HEADERDATA
		    Return OptionType.Opaque
		  Case XFERINFODATA
		    Return OptionType.Opaque
		  Case XFERINFOFUNCTION
		    Return OptionType.Subroutine
		  Case XOAUTH2_BEARER
		    Return OptionType.String
		    
		  Else
		    Return OptionType.Unknown
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function IsBooleanOption(OptionID As Integer) As Boolean
		  Select Case OptionID
		  Case APPEND, AUTOREFERER, BUFFERSIZE, CONNECT_ONLY, COOKIESESSION, DIRLISTONLY, DISALLOW_USERNAME_IN_URL, DNS_SHUFFLE_ADDRESSES, _
		    DNS_USE_GLOBAL_CACHE, FAILONERROR, FILETIME, FOLLOWLOCATION, FORBID_REUSE, FRESH_CONNECT, FTP_CREATE_MISSING_DIRS, _
		    FTP_SKIP_PASV_IP, FTP_USE_EPRT, FTP_USE_EPSV, FTP_USE_PRET, HAPROXYPROTOCOL, HEADER, HTTP09_ALLOWED, HTTPGET, HTTPPROXYTUNNEL, _
		    HTTP_CONTENT_DECODING, HTTP_TRANSFER_DECODING, IGNORE_CONTENT_LENGTH, KEEP_SENDING_ON_ERROR, MAIL_RCPT_ALLLOWFAILS, NOBODY, _
		    NOPROGRESS, NOSIGNAL, PATH_AS_IS, PIPEWAIT, POST, PROXY_TRANSFER_MODE, PUT, SASL_IR, SOCKS5_GSSAPI_NEC, SSH_COMPRESSION, _
		    SSLENGINE_DEFAULT, SSL_ENABLE_ALPN, SSL_ENABLE_NPN, SSL_FALSESTART, SSL_SESSIONID_CACHE, SSL_VERIFYPEER, SSL_VERIFYSTATUS, _
		    SUPPRESS_CONNECT_HEADERS, TCP_FASTOPEN, TCP_KEEPALIVE, TCP_NODELAY, TFTP_NO_OPTIONS, TRANSFER_ENCODING, UNRESTRICTED_AUTH, _
		    UPLOAD, VERBOSE, WILDCARDMATCH
		    Return True
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Compare(OtherOpt As libcURL.Opts.OptionInfo) As Integer
		  Return Sign(OptionNumber - OtherOpt.OptionNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As Integer
		  Return OptionNumber
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(OptionID As Integer)
		  If Not libcURL.IsAvailable Then Raise New PlatformNotSupportedException
		  If OptionIterator.IsAvailable() Then
		    Dim opt As Ptr = curl_easy_option_by_id(OptionID)
		    If opt <> Nil Then Me.Constructor(opt.curl_easyoption)
		  Else
		    mOpt.Option = OptionID
		    mOpt.Type = GetOptionType(OptionID)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Operator_Convert(Name As String)
		  If Not libcURL.IsAvailable Then Raise New PlatformNotSupportedException
		  If OptionIterator.IsAvailable() Then
		    Dim opt As Ptr = curl_easy_option_by_name(Name)
		    If opt <> Nil Then Me.Constructor(opt.curl_easyoption)
		  Else
		    mOpt.Option = GetOptionByName(Uppercase(Name))
		    mOpt.Type = GetOptionType(OptionNumber)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringValue(Session As libcURL.EasyHandle) As String
		  Select Case Me.Type
		  Case OptionType.Bitmask, OptionType.LargeNumber, OptionType.Number
		    #If Target64Bit Then
		      Return Str(Me.Value(Session).Int64Value)
		    #Else
		      Return Str(Me.Value(Session).Int32Value)
		    #EndIf
		    
		  Case OptionType.List, OptionType.Opaque, OptionType.Ptr
		    Dim p As Ptr = Me.Value(Session).PtrValue
		    If p = Nil Then Return "(nil)"
		    If Me.Type = OptionType.Ptr Then
		      Try
		        Dim mb As MemoryBlock = p
		        Return mb.CString(0)
		      Catch
		      End Try
		    End If
		    Return "0x" + Hex(Integer(p))
		    
		    
		  Case OptionType.String
		    Return Me.Value(Session).StringValue
		    
		  Case OptionType.Subroutine
		    Return "(delegate)"
		    
		  End Select
		  
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Session As libcURL.EasyHandle) As Variant
		  Return Session.GetOption(OptionNumber)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Value(Session As libcURL.EasyHandle, Assigns NewValue As Variant)
		  Call Session.SetOption(OptionNumber, NewValue)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return GetOptionName(OptionNumber, True)
			End Get
		#tag EndGetter
		BindingAlias As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If Name <> "" Then Return "https://curl.haxx.se/libcurl/c/" + Name + ".html"
			End Get
		#tag EndGetter
		DocumentationURL As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mOpt.Flags = CURLOT_FLAG_ALIAS
			End Get
		#tag EndGetter
		IsDeprecated As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mOpt As curl_easyoption
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim mb As MemoryBlock = mOpt.Name
			  If mb <> Nil Then
			    Return mb.CString(0)
			  Else
			    Return GetOptionName(OptionNumber, False)
			  End If
			End Get
		#tag EndGetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mOpt.Option
			End Get
		#tag EndGetter
		OptionNumber As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If IsBooleanOption(OptionNumber) Then Return OptionType.Boolean
			  Return mOpt.Type
			End Get
		#tag EndGetter
		Type As libcURL.Opts.OptionType
	#tag EndComputedProperty


	#tag Constant, Name = CURLOT_FLAG_ALIAS, Type = Double, Dynamic = False, Default = \"1", Scope = Protected
	#tag EndConstant

End Class
#tag EndClass
