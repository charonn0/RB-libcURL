##Introduction
RB-libcURL provides REALbasic and Xojo [bindings](http://en.wikipedia.org/wiki/Language_binding) for [libcURL](http://curl.haxx.se/libcurl/c/libcurl.html). RB-libcURL is designed and tested on Windows against [curl-7.34.0-devel-mingw32](http://curl.haxx.se/gknw.net/7.34.0/dist-w32/curl-7.34.0-devel-mingw32.zip) and associated security and compression libraries. The minimum supported libcURL version is [7.15.2](https://github.com/charonn0/RB-libcURL/wiki/libcURL.IsAvailable). 

It is strongly recommended that you familiarize yourself with [libcURL](http://curl.haxx.se/libcurl/c/libcurl-tutorial.html), as this project preserves the semantics and flexibility of libcURL's C-style API in its object-oriented, Xojo-flavored API. 

##Features
* Run transfers using any protocol supported by libcURL.
* Run transfers [on a Xojo thread](https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.PerformOnce).
* [Stream-oriented transfers](https://github.com/charonn0/RB-libcURL/wiki/cURLManager.Perform) using Xojo's built-in [Readable](http://docs.xojo.com/index.php/Readable) and [Writeable](http://docs.xojo.com/index.php/Writeable) interfaces.
* No plugins required.
* Synchronous and asynchronous transfers (any protocol).

##Synopsis
Every transfer is associated with a [`curl_easy`](http://curl.haxx.se/libcurl/c/libcurl-easy.html) handle; these handles are represented by the [`cURLItem`](https://github.com/charonn0/RB-libcURL/wiki/cURLItem) class.

After creating a new `cURLItem` instance, you can set various options for the handle by calling the [`SetOption`](https://github.com/charonn0/RB-libcURL/wiki/cURLItem.SetOption) method with the desired [cURL option number](http://curl.haxx.se/libcurl/c/curl_easy_setopt.html) and its new value. 

Once all the desired options have been set (e.g. URL, port, cookies, etc.) you are ready to begin the transfer. Depending on your specific requirements, you can do it in one of several ways. 

You may call [`cURLItem.Perform`](https://github.com/charonn0/RB-libcURL/wiki/cURLItem.Perform) directly. However, this is a blocking call; not merely asynchronous: the entire application _halts_ for the duration of the transfer. As such, it is useful only in single-threaded console applications.

To perform one or more transfers in a non-halting manner use the [`cURLMulti`](https://github.com/charonn0/RB-libcURL/wiki/cURLMulti) class. The `cURLMulti` class represents a [`curl_multi`](http://curl.haxx.se/libcurl/c/libcurl-multi.html) handle (AKA a "stack"). [Add](https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.AddItem) the `cURLItem` to the multi stack and then call [`cURLMulti.Perform`](https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.Perform) (or [`cURLMulti.PerformOnce`](https://github.com/charonn0/RB-libcURL/wiki/cURLMulti.PerformOnce) on a RB/Xojo thread.)

The [`cURLClient`](https://github.com/charonn0/RB-libcURL/wiki/cURLClient) class provides a simplified interface and is recommended for most transfers.

##Examples
* [HTTP GET](https://github.com/charonn0/RB-libcURL/wiki/HTTP-GET-Example)
* [HTTP HEAD](https://github.com/charonn0/RB-libcURL/wiki/HTTP-HEAD-Example)
* [HTTP Pipelining](https://github.com/charonn0/RB-libcURL/wiki/HTTP-Pipelining-Example)
* [HTTP POST](https://github.com/charonn0/RB-libcURL/wiki/HTTP-POST-Example)
* [FTP Download](https://github.com/charonn0/RB-libcURL/wiki/FTP-RETR-Example)
* [FTP Upload](https://github.com/charonn0/RB-libcURL/wiki/FTP-STOR-Example)
* [FTP Delete](https://github.com/charonn0/RB-libcURL/wiki/FTP-DELE-Example)
* [SMTP Send](https://github.com/charonn0/RB-libcURL/wiki/SMTP-Example)

