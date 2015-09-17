##Introduction
**RB-libcURL** is a [libcURL](http://curl.haxx.se/libcurl/c/libcurl.html) [binding](http://en.wikipedia.org/wiki/Language_binding) for Realbasic and Xojo projects. It is designed and tested on Windows 7 against [curl-7.40.0-devel-mingw32](http://curl.haxx.se/gknw.net/7.40.0/dist-w32/curl-7.40.0-devel-mingw32.zip) and associated security and compression libraries ([more platforms](http://curl.haxx.se/download.html)). The minimum supported libcURL version is [7.15.2](https://github.com/charonn0/RB-libcURL/wiki/libcURL.IsAvailable). 

##Example
This example performs a synchronous HTTP GET request on the calling thread. [More examples](https://github.com/charonn0/RB-libcURL/wiki#examples).
```vbnet
  Dim curl As New cURLClient
  Dim page As String
  If curl.Get("http://www.example.com/index.html") Then 
    page = curl.GetDownloadedData
  End If
```
##Hilights
* [Synchronous and asynchronous](https://github.com/charonn0/RB-libcURL/wiki/Synchronous-vs.-Asynchronous-methods) transfers 
* Use any supported protocol (DICT, FILE, FTP, FTPS, Gopher, HTTP(1.0, 1.1, and 2.0), HTTPS, IMAP, IMAPS, LDAP, LDAPS, POP3, POP3S, RTMP, RTSP, SCP, SFTP, SMTP, SMTPS, Telnet and TFTP).
* SSL/TLS with [certificate validation](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.Secure).
* Full support for [RB/Xojo threads](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.PerformOnce)
* Automatic decompression (gzip, deflate, etc.) using zlib.
* [Stream-oriented](https://github.com/charonn0/RB-libcURL/wiki/cURLManager.Perform), using Xojo's built-in [Readable](http://docs.xojo.com/index.php/Readable) and [Writeable](http://docs.xojo.com/index.php/Writeable) interfaces. Download or upload directly to or from a file, MemoryBlock, or your own custom class.
* [Easy to use](https://github.com/charonn0/RB-libcURL/wiki/cURLClient), but still exposing [the full range of libcURL's features](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle).
* Interact directly with libcurl via declares and [callback methods](https://en.wikipedia.org/wiki/Callback_%28computer_programming%29); no shell or plugins required.

##Synopsis

***
It is strongly recommended that you familiarize yourself with [libcURL](http://curl.haxx.se/libcurl/c/libcurl-tutorial.html), as this project preserves the semantics of libcURL's API in an object-oriented, Xojo-flavored wrapper. 

**For a simplified client interface that is appropriate for most types of transfers you should use the [`cURLClient`](https://github.com/charonn0/RB-libcURL/wiki/cURLClient) class. Refer to the [examples](https://github.com/charonn0/RB-libcURL/wiki/Home#examples) below for demonstrations of `cURLClient`.**

***

Each libcURL [handle](https://en.wikipedia.org/wiki/Handle_%28computing%29) or handle equivalent is managed by an object class. These handle-managing classes all descend from a common ancestor, the abstract [`cURLHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.cURLHandle) class. 

libcURL uses several different handle types or equivalents:

|Handle Type|Object Class|Comment|
|-----------|------------|-------|
|[`curl_easy`](http://curl.haxx.se/libcurl/c/libcurl-easy.html)|[`EasyHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle)|A persistent collection of sockets, caches, and options which together will be used when libcURL is told to perform a transfer.| 
|[`curl_multi`](http://curl.haxx.se/libcurl/c/libcurl-multi.html)|[`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle)|A set of one or more `curl_easy` handles whose transfers will be performed simultaneously.|
|[`curl_share`](http://curl.haxx.se/libcurl/c/libcurl-share.html)|[`ShareHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.ShareHandle)|A set of one or more `curl_easy` handles that will share SSL session data, DNS caches, and/or HTTP cookies.|
|[`slist`](http://curl.haxx.se/libcurl/c/curl_slist_append.html)|[`ListPtr`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.ListPtr)|A linked list of string values.|
|[`form`](http://curl.haxx.se/libcurl/c/curl_formadd.html)|[`MultipartForm`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultipartForm)|An HTML form which libcURL encode as `multipart/form-data`.|

Every transfer is associated with an `EasyHandle`. After creating a new `EasyHandle` instance, you can set various options for the handle by calling the [`SetOption`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.SetOption) method with the desired [cURL option number](http://curl.haxx.se/libcurl/c/curl_easy_setopt.html) and its new value. 

Once all the desired options have been set (e.g. URL, port, cookies, etc.) you are ready to begin the transfer. Depending on your specific requirements, you can do it in one of several ways. 

You may call [`EasyHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle).[`Perform`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.EasyHandle.Perform) directly. However, this is a blocking call; not merely asynchronous: the entire application _halts_ for the duration of the transfer. As such, it is useful only in single-threaded console applications.

To perform one or more transfers in a non-halting manner use the `MultiHandle` class. The `MultiHandle` class represents a `curl_multi` handle (AKA a "stack"). [Add](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.AddItem) the `EasyHandle` to the multi stack and then call [`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle).[`Perform`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.Perform) (or [`MultiHandle`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle).[`PerformOnce`](https://github.com/charonn0/RB-libcURL/wiki/libcURL.MultiHandle.PerformOnce) on a RB/Xojo thread.)

##Examples
* [HTTP GET](https://github.com/charonn0/RB-libcURL/wiki/HTTP-GET-Example)
* [HTTP GET with a persistent connection](https://github.com/charonn0/RB-libcURL/wiki/HTTP-persistent-connection-example)
* [HTTP HEAD](https://github.com/charonn0/RB-libcURL/wiki/HTTP-HEAD-Example)
* [HTTP POST](https://github.com/charonn0/RB-libcURL/wiki/HTTP-POST-Example)
* [FTP Download](https://github.com/charonn0/RB-libcURL/wiki/FTP-RETR-Example)
* [FTP Upload](https://github.com/charonn0/RB-libcURL/wiki/FTP-STOR-Example)
* [FTP custom commands](https://github.com/charonn0/RB-libcURL/wiki/FTP-custom-commands)
* [SMTP Send](https://github.com/charonn0/RB-libcURL/wiki/SMTP-Example)
* [DNS control](https://github.com/charonn0/RB-libcURL/wiki/DNS-Example)

![Powered by libcURL](https://raw.githubusercontent.com/wiki/charonn0/RB-libcURL/powered_by_curl7.gif)
