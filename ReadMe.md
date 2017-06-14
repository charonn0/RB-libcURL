## Introduction
[libcurl](http://curl.haxx.se/libcurl/c/libcurl.html) is a cross-platform multi-protocol network transfer library. It is widely used both as a stand-alone command-line utility and as a standard or optional library for [many programming languages](http://curl.haxx.se/libcurl/bindings.html) and development environments.

**RB-libcURL** is a libcurl [binding](http://en.wikipedia.org/wiki/Language_binding) for Realbasic and Xojo ("classic" framework) projects. It is designed and tested using REALstudio 2011r4.3 on Windows 7 against [curl-7.40.0-devel-mingw32](http://curl.haxx.se/gknw.net/7.40.0/dist-w32/curl-7.40.0-devel-mingw32.zip) and associated security (e.g. OpenSSL, SChannel, etc.) and compression (i.e. zlib) libraries. Library binaries for [other platforms](http://curl.haxx.se/download.html) are available, or can built from source. 

The minimum supported libcURL version is [7.15.2](https://github.com/charonn0/RB-libcURL/wiki/libcURL.IsAvailable). The recommended minimum version is [7.33.0](https://curl.haxx.se/changes.html#7_33_0). Versions prior to 7.33.0 will function with degraded features, but versions prior to 7.15.2 will not function properly at all.

## Example
This example performs a synchronous HTTP GET request on the calling thread. [**More examples**](https://github.com/charonn0/RB-libcURL/wiki#examples).
```vbnet
  Dim curl As New cURLClient
  If curl.Get("http://www.example.com/index.html") Then 
      Dim page As String = curl.GetDownloadedData()
  End If
```
## Hilights
* [Synchronous and asynchronous](https://github.com/charonn0/RB-libcURL/wiki/Synchronous-vs.-Asynchronous-methods) transfers 
* Use any protocol supported by libcURL: DICT, FILE, FTP, FTPS, Gopher, HTTP(1.0, 1.1, and 2† ), HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, Telnet and TFTP.
* Support for modern HTTP features like [persistent connections](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.AutoDisconnect), [pipelining](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.HTTPPipelining), and [multiplexing](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.HTTPMultiplexing)†.
* Automatic browser-like [HTTP cookie management](https://github.com/charonn0/RB-libcURL/wiki/libcURL.CookieEngine).
* Automatic decompression of compressed HTTP downloads (i.e. `gzip` or `deflate`).†
* Automatic decoding of HTTP chunked Transfer-Encoding.
* SSL/TLS with [certificate validation](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.Secure), using any one of several SSL libraries†.
* Transparent support for [RB/Xojo threads](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.PerformOnce).
* Full support for HTTP, SOCKS4, SOCKS4A, SOCKS5, and SOCKS5_HOSTNAME [proxy servers](https://github.com/charonn0/RB-libcURL/wiki/libcURL.ProxyEngine).
* [Stream-oriented](https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLManager.Perform), using Xojo's built-in [Readable](http://docs.xojo.com/index.php/Readable) and [Writeable](http://docs.xojo.com/index.php/Writeable) interfaces. Download or upload directly to or from a file, [MemoryBlock](http://www.boredomsoft.org/string-building-in-realbasic.bs), Xojo socket, or your own custom class.
* [Easy to use](https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient), but still exposing [the full range of libcURL's features](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle).
* Interact directly with libcurl using idiomatic RB/Xojo objects, methods, and events; no shell or plugins required.
* International domain name support†.
* IPv6 support.

†= feature might not be available at run-time due to a build-time decision of the installed version of libcURL

## Synopsis

***
It is strongly recommended that you familiarize yourself with [libcURL](http://curl.haxx.se/libcurl/c/libcurl-tutorial.html), as this project preserves the semantics of libcURL's API in an object-oriented, Xojo-flavored wrapper. 

**For a simplified client interface that is appropriate for most types of transfers you should use the [`cURLClient`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLClient) class. Refer to the [examples](https://github.com/charonn0/RB-libcURL/wiki/Home#examples) below for demonstrations of `cURLClient`.**

For more thorough documentation of individual classes and methods refer to the [wiki](https://github.com/charonn0/RB-libcURL/wiki).

***

Each libcURL [handle](https://en.wikipedia.org/wiki/Handle_%28computing%29) or handle equivalent is managed by an object class. These handle-managing classes all descend from a common ancestor, the abstract [`cURLHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLHandle) class. 

libcURL uses several different handle types or equivalents:

|Handle Type|Object Class|Comment|
|-----------|------------|-------|
|[`curl_easy`](http://curl.haxx.se/libcurl/c/libcurl-easy.html)|[`EasyHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle)|A persistent collection of sockets, caches, and options which together will be used when libcURL is told to perform a transfer.| 
|[`curl_multi`](http://curl.haxx.se/libcurl/c/libcurl-multi.html)|[`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle)|A set of one or more `curl_easy` handles whose transfers will be performed simultaneously.|
|[`curl_share`](http://curl.haxx.se/libcurl/c/libcurl-share.html)|[`ShareHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.ShareHandle)|A set of one or more `curl_easy` handles that will share SSL session data, DNS caches, and/or HTTP cookies.|
|[`slist`](http://curl.haxx.se/libcurl/c/curl_slist_append.html)|[`ListPtr`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.ListPtr)|A linked list of string values.|
|[`form`](http://curl.haxx.se/libcurl/c/curl_formadd.html)|[`MultipartForm`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultipartForm)|An HTML form which libcURL will encode as `multipart/form-data`.|

Every transfer is associated with an `EasyHandle`. After creating a new `EasyHandle` instance, you can set various options for the handle by calling the [`SetOption`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.SetOption) method with the desired [cURL option number](http://curl.haxx.se/libcurl/c/curl_easy_setopt.html) and its new value. Options will persist until they are overridden or reset.

Once all the desired options have been set (e.g. URL, port, username and/or password, cookies, etc.) you are ready to begin the transfer. Depending on your specific requirements, you can do it in one of several ways. 

You may call [`EasyHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle).[`Perform`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.Perform) directly. However, this is a blocking call; not merely synchronous: the _entire application_ blocks for the duration of the transfer. As such, it is useful only in single-threaded console applications.

To perform one or more transfers in a non-blocking manner use the `MultiHandle` class. The `MultiHandle` class represents a `curl_multi` handle (AKA a "stack"). [Add](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.AddItem) the `EasyHandle` to the multi stack and then call [`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle).[`Perform`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.Perform) (or [`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle).[`PerformOnce`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.PerformOnce) on a RB/Xojo thread.)

## How to incorporate libcURL into your Realbasic/Xojo project
### Import the libcURL module
1. Download the RB-libcURL project either in [ZIP archive format](https://github.com/charonn0/RB-libcURL/archive/master.zip) or by cloning the repository with your Git client.
2. Open the RB-libcURL project in REALstudio or Xojo. Open your project in a separate window.
3. Copy the libcURL module and the DEFAULT_CA_INFO_PEM file into your project and save.

### Ensure the libcURL shared library is installed
libcURL is installed by default on most Unix-like operating systems, including OS X and most Linux distributions. 

Windows does not have it installed by default, you will need to ship all the necessary DLLs with your application. You can use pre-built DLLs available [here](http://curl.haxx.se/gknw.net/7.40.0/dist-w32/curl-7.40.0-devel-mingw32.zip) (Win32x86+OpenSSL+ZLib), or you can [build them yourself from source](https://github.com/blackrosezy/build-libcurl-windows). 

Depending on compile-time options, you may need to include additional DLLs for other libraries like OpenSSL or ZLib. Newly added features like HTTP/2 support may require building the latest version from source with special build flags and additional libraries. Review the libcURL documentation for the feature you're interested in.

RB-libcURL will raise a PlatformNotSupportedException when used if all required DLLs/SOs/DyLibs are not available at runtime. 

## Examples
* [HTTP GET](https://github.com/charonn0/RB-libcURL/wiki/HTTP-GET-Example)
* [HTTP GET with a persistent connection](https://github.com/charonn0/RB-libcURL/wiki/HTTP-persistent-connection-example)
* [HTTP HEAD](https://github.com/charonn0/RB-libcURL/wiki/HTTP-HEAD-Example)
* [HTTP POST](https://github.com/charonn0/RB-libcURL/wiki/HTTP-POST-Example)
* [HTTP TRACE](https://github.com/charonn0/RB-libcURL/wiki/HTTP-TRACE-Example)
* [HTTP Cookies](https://github.com/charonn0/RB-libcURL/wiki/HTTP-Cookies-Example)
* [Using a proxy](https://github.com/charonn0/RB-libcURL/wiki/Proxying-Example)
* [FTP Download](https://github.com/charonn0/RB-libcURL/wiki/FTP-RETR-Example)
* [FTP Upload](https://github.com/charonn0/RB-libcURL/wiki/FTP-STOR-Example)
* [FTP custom commands](https://github.com/charonn0/RB-libcURL/wiki/FTP-custom-commands)
* [FTP directory enumeration](https://github.com/charonn0/RB-libcURL/wiki/FTP-directory-enumeration)
* [SMTP Send](https://github.com/charonn0/RB-libcURL/wiki/SMTP-Example)
* [POP3 examples](https://github.com/charonn0/RB-libcURL/wiki/POP3-Examples)
* [DNS control](https://github.com/charonn0/RB-libcURL/wiki/DNS-Example)
* [DICT lookup example](https://github.com/charonn0/RB-libcURL/wiki/DICT-example)
* [FILE protocol example](https://github.com/charonn0/RB-libcURL/wiki/FILE-protocol-example)
* [Multiple Simultaneous Transfers](https://github.com/charonn0/RB-libcURL/wiki/Multiple-Simultaneous-Transfers)

![Powered by libcURL](https://raw.githubusercontent.com/wiki/charonn0/RB-libcURL/powered_by_curl7.gif)
