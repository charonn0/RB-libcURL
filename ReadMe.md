RB-libcURL provides a RB-friendly interface to libcURL. RB-libcURL is designed and tested on Windows against [curl-7.34.0-devel-mingw32](http://curl.haxx.se/gknw.net/7.34.0/dist-w32/curl-7.34.0-devel-mingw32.zip) and associated security and compression libraries.

The cURL.cURLItem class provides an interface to a curl_easy handle. After creating a new instance, you can set various options for the instance by calling the SetOption method with the desired cURL option number and its new value. The new value may be a string, boolean, memoryblock, ptr or Integer. 

Once all the desired options have been set (e.g. URL, port, cookies, etc.) call the cURLItem.Perform method. cURLItem.Perform accepts an options string parameter that can be used to set the URL, port, username, etc. automatically.

For example:

    Dim cURL As New cURLItem
    Call cURL.Perform("http://username:password@www.example.com:8080/example.txt")

is equivalent to:

    Dim cURL As New cURLItem
    Call cURL.SetOption(cURL.Opts.USERNAME, "username")
    Call cURL.SetOption(cURL.Opts.PASSWORD, "password")
    Call cURL.SetOption(cURL.Opts.PORT, 8080)
    Call cURL.SetOption(cURL.Opts.URL, "http://www.example.com/example.txt")
    Call cURL.Perform()

The curlmulti class allows you to manage 1 or more curlitem objects as a "stack" of connections and handle transfers in a non-blocking fashion.

    Dim cURL As New cURLItem
    Call cURL.SetOption(cURL.Opts.URL, "http://www.example.com/BigFile.bin")
    Dim multi As New cURLMulti
    multi.AddItem(cURL)
    multi.Perform 
    

