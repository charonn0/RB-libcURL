#tag Class
Protected Class OptionIterator
	#tag Method, Flags = &h0
		Sub Constructor()
		  If Not IsAvailable() Then
		    mDataStore = FakeDataStore
		  Else
		    
		    mPrev = curl_easy_option_next(Nil)
		    If mPrev = Nil Then
		      Dim err As New cURLException(Nil)
		      err.ErrorNumber = libcURL.Errors.INIT_FAILED
		      err.Message = libcURL.FormatError(libcURL.Errors.INIT_FAILED)
		      Raise err
		    End If
		  End If
		  mIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Session As libcURL.EasyHandle)
		  OptionDumper(Session).Dump(mDataStore)
		  mIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  If mDataStore <> Nil Then
		    Return mDataStore.Count
		  Else
		    If mPrev = Nil Then Return 0
		    Dim lastp As Ptr = mPrev
		    Dim lasti As Integer = mIndex
		    Do Until Not Me.MoveNext()
		    Loop
		    Dim c As Integer = mIndex + 1
		    mIndex = lasti
		    mPrev = lastp
		    Return c
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function IsAvailable() As Boolean
		  Return libcURL.Version.IsAtLeast(7, 73, 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MoveNext() As Boolean
		  If mDataStore = Nil Then
		    mPrev = curl_easy_option_next(mPrev)
		    If mPrev <> Nil Then
		      mIndex = mIndex + 1
		      Return True
		    End If
		    
		  Else
		    If mIndex >= mDataStore.Count - 1 Then Return False
		    mIndex = mIndex + 1
		    Return True
		    
		  End If
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mIndex
			End Get
		#tag EndGetter
		CurrentIndex As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mDataStore <> Nil Then
			    Dim optnum As Integer = mDataStore.Key(mIndex)
			    Return optnum
			  ElseIf mPrev <> Nil Then
			    Dim opt As curl_easyoption = mPrev.curl_easyoption
			    Return New OptionInfo(opt)
			  End If
			End Get
		#tag EndGetter
		CurrentOption As libcURL.Opts.OptionInfo
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Static store As Dictionary
			  If store = Nil Then store = New Dictionary(ABSTRACT_UNIX_SOCKET:Nil, ACCEPTTIMEOUT_MS:Nil, ACCEPT_ENCODING:Nil, ADDRESS_SCOPE:Nil, ALTSVC:Nil, _
			  ALTSVC_CTRL:Nil, APPEND:Nil, AUTOREFERER:Nil, BUFFERSIZE:Nil, CAINFO:Nil, CAPATH:Nil, CERTINFO:Nil, CHUNK_BGN_FUNCTION:Nil, _
			  CHUNK_DATA:Nil, CHUNK_END_FUNCTION:Nil, CLOSESOCKETDATA:Nil, CLOSESOCKETFUNCTION:Nil, CONNECTTIMEOUT:Nil, CONNECTTIMEOUT_MS:Nil, _
			  CONNECT_ONLY:Nil, CONNECT_TO:Nil, CONV_FROM_NETWORK_FUNCTION:Nil, CONV_FROM_UTF8_FUNCTION:Nil, CONV_TO_NETWORK_FUNCTION:Nil, _
			  COOKIE:Nil, COOKIEFILE:Nil, COOKIEJAR:Nil, COOKIELIST:Nil, COOKIESESSION:Nil, COPYPOSTFIELDS:Nil, CRLF:Nil, CRLFILE:Nil, _
			  CURLU:Nil, CUSTOMREQUEST:Nil, DEBUGDATA:Nil, DEBUGFUNCTION:Nil, DEFAULT_PROTOCOL:Nil, DIRLISTONLY:Nil, DISALLOW_USERNAME_IN_URL:Nil, _
			  DNS_CACHE_TIMEOUT:Nil, DNS_INTERFACE:Nil, DNS_LOCAL_IP4:Nil, DNS_LOCAL_IP6:Nil, DNS_SERVERS:Nil, DNS_SHUFFLE_ADDRESSES:Nil, _
			  DNS_USE_GLOBAL_CACHE:Nil, DOH_URL:Nil, EGDSOCKET:Nil, ACCEPT_ENCODING:Nil, ERRORBUFFER:Nil, EXPECT_100_TIMEOUT_MS:Nil, _
			  FAILONERROR:Nil, WRITEDATA:Nil, FILETIME:Nil, FNMATCH_DATA:Nil, FNMATCH_FUNCTION:Nil, FOLLOWLOCATION:Nil, FORBID_REUSE:Nil, _
			  FRESH_CONNECT:Nil, APPEND:Nil, DIRLISTONLY:Nil, FTPPORT:Nil, FTPSSLAUTH:Nil, FTP_ACCOUNT:Nil, FTP_ALTERNATIVE_TO_USER:Nil, _
			  FTP_CREATE_MISSING_DIRS:Nil, FTP_FILEMETHOD:Nil, FTP_RESPONSE_TIMEOUT:Nil, FTP_SKIP_PASV_IP:Nil, USE_SSL:Nil, FTP_SSL_CCC:Nil, _
			  FTP_USE_EPRT:Nil, FTP_USE_EPSV:Nil, FTP_USE_PRET:Nil, GSSAPI_DELEGATION:Nil, HAPPY_EYEBALLS_TIMEOUT_MS:Nil, HAPROXYPROTOCOL:Nil, _
			  HEADER:Nil, HEADERDATA:Nil, HEADERFUNCTION:Nil, HEADEROPT:Nil, HTTP09_ALLOWED:Nil, HTTP200ALIASES:Nil, HTTPAUTH:Nil, HTTPGET:Nil, _
			  HTTPHEADER:Nil, HTTPPOST:Nil, HTTPPROXYTUNNEL:Nil, HTTP_CONTENT_DECODING:Nil, HTTP_TRANSFER_DECODING:Nil, HTTP_VERSION:Nil, _
			  IGNORE_CONTENT_LENGTH:Nil, READDATA:Nil, INFILESIZE:Nil, INFILESIZE_LARGE:Nil, NETINTERFACE:Nil, INTERLEAVEDATA:Nil, _
			  INTERLEAVEFUNCTION:Nil, IOCTLDATA:Nil, IOCTLFUNCTION:Nil, IPRESOLVE:Nil, ISSUERCERT:Nil, ISSUERCERT_BLOB:Nil, KEEP_SENDING_ON_ERROR:Nil, _
			  KEYPASSWD:Nil, KRBLEVEL:Nil, KRBLEVEL:Nil, LOCALPORT:Nil, LOCALPORTRANGE:Nil, LOGIN_OPTIONS:Nil, LOW_SPEED_LIMIT:Nil, LOW_SPEED_TIME:Nil, _
			  MAIL_AUTH:Nil, MAIL_FROM:Nil, MAIL_RCPT:Nil, MAIL_RCPT_ALLLOWFAILS:Nil, MAXAGE_CONN:Nil, MAXCONNECTS:Nil, MAXFILESIZE:Nil, _
			  MAXFILESIZE_LARGE:Nil, MAXREDIRS:Nil, MAX_RECV_SPEED_LARGE:Nil, MAX_SEND_SPEED_LARGE:Nil, MIMEPOST:Nil, NETRC:Nil, NETRC_FILE:Nil, _
			  NEW_DIRECTORY_PERMS:Nil, NEW_FILE_PERMS:Nil, NOBODY:Nil, NOPROGRESS:Nil, NOPROXY:Nil, NOSIGNAL:Nil, OPENSOCKETDATA:Nil, _
			  OPENSOCKETFUNCTION:Nil, PASSWORD:Nil, PATH_AS_IS:Nil, PINNEDPUBLICKEY:Nil, PIPEWAIT:Nil, PORT:Nil, POST:Nil, POSTREDIR:Nil, _
			  POSTFIELDS:Nil, POSTFIELDSIZE:Nil, POSTFIELDSIZE_LARGE:Nil, POSTQUOTE:Nil, POSTREDIR:Nil, PREQUOTE:Nil, PRE_PROXY:Nil, PRIVATE_:Nil, _
			  XFERINFODATA:Nil, PROGRESSFUNCTION:Nil, PROTOCOLS:Nil, PROXY:Nil, PROXYAUTH:Nil, PROXYHEADER:Nil, PROXYPASSWORD:Nil, PROXYPORT:Nil, _
			  PROXYTYPE:Nil, PROXYUSERNAME:Nil, PROXYUSERPWD:Nil, PROXY_CAINFO:Nil, PROXY_CAPATH:Nil, PROXY_CRLFILE:Nil, PROXY_ISSUERCERT:Nil, _
			  PROXY_ISSUERCERT_BLOB:Nil, PROXY_KEYPASSWD:Nil, PROXY_PINNEDPUBLICKEY:Nil, PROXY_SERVICE_NAME:Nil, PROXY_SSLCERT:Nil, _
			  PROXY_SSLCERTTYPE:Nil, PROXY_SSLCERT_BLOB:Nil, PROXY_SSLKEY:Nil, PROXY_SSLKEYTYPE:Nil, PROXY_SSLKEY_BLOB:Nil, PROXY_SSLVERSION:Nil, _
			  PROXY_SSL_CIPHER_LIST:Nil, PROXY_SSL_OPTIONS:Nil, PROXY_SSL_VERIFYHOST:Nil, PROXY_SSL_VERIFYPEER:Nil, PROXY_TLS13_CIPHERS:Nil, _
			  PROXY_TLSAUTH_PASSWORD:Nil, PROXY_TLSAUTH_TYPE:Nil, PROXY_TLSAUTH_USERNAME:Nil, PROXY_TRANSFER_MODE:Nil, PUT:Nil, QUOTE:Nil, _
			  RANDOM_FILE:Nil, RANGE:Nil, READDATA:Nil, READFUNCTION:Nil, REDIR_PROTOCOLS:Nil, REFERER:Nil, REQUEST_TARGET:Nil, RESOLVE:Nil, _
			  RESOLVER_START_DATA:Nil, RESOLVER_START_FUNCTION:Nil, RESUME_FROM:Nil, RESUME_FROM_LARGE:Nil, HTTPHEADER:Nil, RTSP_CLIENT_CSEQ:Nil, _
			  RTSP_REQUEST:Nil, RTSP_SERVER_CSEQ:Nil, RTSP_SESSION_ID:Nil, RTSP_STREAM_URI:Nil, RTSP_TRANSPORT:Nil, SASL_AUTHZID:Nil, SASL_IR:Nil, _
			  SEEKDATA:Nil, SEEKFUNCTION:Nil, FTP_RESPONSE_TIMEOUT:Nil, SERVICE_NAME:Nil, SHARE:Nil, SOCKOPTDATA:Nil, SOCKOPTFUNCTION:Nil, SOCKS5_AUTH:Nil, _
			  SOCKS5_GSSAPI_NEC:Nil, SOCKS5_GSSAPI_SERVICE:Nil, SSH_AUTH_TYPES:Nil, SSH_COMPRESSION:Nil, SSH_HOST_PUBLIC_KEY_MD5:Nil, SSH_KEYDATA:Nil, _
			  SSH_KEYFUNCTION:Nil, SSH_KNOWNHOSTS:Nil, SSH_PRIVATE_KEYFILE:Nil, SSH_PUBLIC_KEYFILE:Nil, SSLCERT:Nil, KEYPASSWD:Nil, SSLCERTTYPE:Nil, _
			  SSLCERT_BLOB:Nil, SSLENGINE:Nil, SSLENGINE_DEFAULT:Nil, SSLKEY:Nil, KEYPASSWD:Nil, SSLKEYTYPE:Nil, SSLKEY_BLOB:Nil, SSLVERSION:Nil, _
			  SSL_CIPHER_LIST:Nil, SSL_CTX_DATA:Nil, SSL_CTX_FUNCTION:Nil, SSL_EC_CURVES:Nil, SSL_ENABLE_ALPN:Nil, SSL_ENABLE_NPN:Nil, SSL_FALSESTART:Nil, _
			  SSL_OPTIONS:Nil, SSL_SESSIONID_CACHE:Nil, SSL_VERIFYHOST:Nil, SSL_VERIFYPEER:Nil, SSL_VERIFYSTATUS:Nil, STDERR:Nil, STREAM_DEPENDS:Nil, _
			  STREAM_DEPENDS_E:Nil, STREAM_WEIGHT:Nil, SUPPRESS_CONNECT_HEADERS:Nil, TCP_FASTOPEN:Nil, TCP_KEEPALIVE:Nil, TCP_KEEPIDLE:Nil, _
			  TCP_KEEPINTVL:Nil, TCP_NODELAY:Nil, TELNETOPTIONS:Nil, TFTP_BLKSIZE:Nil, TFTP_NO_OPTIONS:Nil, TIMECONDITION:Nil, TIMEOUT:Nil, _
			  TIMEOUT_MS:Nil, TIMEVALUE:Nil, TIMEVALUE_LARGE:Nil, TLS13_CIPHERS:Nil, TLSAUTH_PASSWORD:Nil, TLSAUTH_TYPE:Nil, TLSAUTH_USERNAME:Nil, _
			  TRAILERDATA:Nil, TRAILERFUNCTION:Nil, TRANSFERTEXT:Nil, TRANSFER_ENCODING:Nil, UNIX_SOCKET_PATH:Nil, UNRESTRICTED_AUTH:Nil, _
			  UPKEEP_INTERVAL_MS:Nil, UPLOAD:Nil, UPLOAD_BUFFERSIZE:Nil, URL:Nil, USERAGENT:Nil, USERNAME:Nil, USERPWD:Nil, USE_SSL:Nil, _
			  VERBOSE:Nil, WILDCARDMATCH:Nil, WRITEDATA:Nil, WRITEFUNCTION:Nil, HEADERDATA:Nil, XFERINFODATA:Nil, XFERINFOFUNCTION:Nil, XOAUTH2_BEARER:Nil)
			  
			  Return store
			End Get
		#tag EndGetter
		Private Shared FakeDataStore As Dictionary
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDataStore As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrev As Ptr
	#tag EndProperty


End Class
#tag EndClass
