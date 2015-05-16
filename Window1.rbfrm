#tag Window
Begin Window Window1
   BackColor       =   16777215
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   563
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1777090559
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Untitled"
   Visible         =   True
   Width           =   879
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Perform"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   473
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin TextField TextField1
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "ftp://anonymous:user@ftp.microsoft.com/"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   371
   End
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "To File"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   545
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   67
   End
   Begin ProgressBar ProgressBar1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   618
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   543
      Value           =   0
      Visible         =   True
      Width           =   252
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Set Form Data"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   377
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      Visible         =   True
      Width           =   91
   End
   Begin Listbox CurlInfo
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "40%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   179
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Info Name	Last request Value"
      Italic          =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   229
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   438
      _ScrollWidth    =   -1
   End
   Begin Listbox Features
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   226
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Available Features"
      Italic          =   ""
      Left            =   125
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   110
      _ScrollWidth    =   -1
   End
   Begin Listbox Protocols
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   ""
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   226
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Supported Protocols"
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   122
      _ScrollWidth    =   -1
   End
   Begin CheckBox CheckBox1
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "Suppress data_in and data_out messages"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   239
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   204
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   356
   End
   Begin Listbox Debug
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   "10%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   200
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Debug Message"
      Italic          =   ""
      Left            =   238
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   641
      _ScrollWidth    =   -1
   End
   Begin Listbox Headers
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   ""
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   ""
      EnableDragReorder=   ""
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   179
      HelpTag         =   ""
      Hierarchical    =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Header name	Header value"
      Italic          =   ""
      Left            =   441
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   229
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   438
      _ScrollWidth    =   -1
   End
   Begin TextArea Output
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   16777215
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   124
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LimitText       =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   ""
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   0
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   412
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   879
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Window2.Show
		  Me.Title = libcURL.Version.Name
		  multi = New libcURL.cURLShare
		  AddHandler multi.TransferComplete, WeakAddressOf TransferCompleteHandler
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CreateSocketHandler(Sender As libcURL.cURLItem, Socket As Integer)
		  #pragma Unused Sender
		  Debug.AddRow("RB-libcURL", "Created socket " + Str(Socket))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataAvailableHandler(Sender As libcURL.cURLItem, NewData As String)
		  #pragma Unused Sender
		  If SaveTo <> Nil Then
		    SaveTo.Write(NewData)
		  Else
		    Output.AppendText(NewData)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DebugMessageHandler(Sender As libcURL.cURLItem, MessageType As libcURL.curl_infotype, data As String)
		  'If MessageType <> libcURL.cURL_InfoType.Text Then
		  #pragma Unused Sender
		  If CheckBox1.Value And (MessageType = libcURL.curl_infotype.data_in Or MessageType = libcURL.curl_infotype.data_out) Then Return
		  Dim ty As String
		  Select Case MessageType
		  Case libcURL.curl_infotype.data_in
		    ty = "Data In"
		  Case libcURL.curl_infotype.data_out
		    ty = "Data Out"
		  Case libcURL.curl_infotype.header_in
		    ty = "Header In"
		  Case libcURL.curl_infotype.header_out
		    ty = "Header Out"
		  Case libcURL.curl_infotype.info_end
		    ty = "Info End"
		  Case libcURL.curl_infotype.ssl_in
		    ty = "SSL In"
		  Case libcURL.curl_infotype.ssl_out
		    ty = "SSL Out"
		  Case libcURL.curl_infotype.text
		    ty = "Text"
		  End Select
		  
		  Debug.AddRow(ty, data.Trim)
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisconnectedHandler(Sender As libcURL.cURLItem, Socket As Integer)
		  #pragma Unused Sender
		  Debug.AddRow("RB-libcURL", "Socket " + Str(Socket) + " disconnected")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoPerform()
		  Output.Text = ""
		  Headers.DeleteAllRows
		  Debug.DeleteAllRows
		  CurlInfo.DeleteAllRows
		  
		  Dim curlget As New libcURL.cURLItem
		  AddHandler curlget.CreateSocket, WeakAddressOf CreateSocketHandler
		  AddHandler curlget.DataAvailable, WeakAddressOf DataAvailableHandler
		  AddHandler curlget.DebugMessage, WeakAddressOf DebugMessageHandler
		  AddHandler curlget.Disconnected, WeakAddressOf DisconnectedHandler
		  AddHandler curlget.HeaderReceived, WeakAddressOf HeaderReceivedHandler
		  AddHandler curlget.Progress, WeakAddressOf ProgressHandler
		  
		  If FormValue <> Nil Then Call curlget.SetOption(libcURL.Opts.HTTPPOST, FormValue)
		  Call curlget.SetOption(libcURL.Opts.FOLLOWLOCATION, True) ' Follow redirects automatically
		  Call curlget.SetOption(libcURL.Opts.REDIR_PROTOCOLS, libcURL.Opts.CURLPROTO_HTTP Or libcURL.Opts.CURLPROTO_HTTPS) ' Restrict redirects to HTTP(S)
		  Call curlget.SetOption(libcURL.Opts.FAILONERROR, True) ' fail on server errors
		  curlget.CA_ListFile = libcURL.Default_CA_File ' for SSL/TLS connections we must specify a list of acceptable certificate authorities
		  curlget.URL = TextField1.Text
		  multi.ShareCookies = True
		  multi.ShareSSL = True
		  multi.ShareDNSCache = True
		  Call multi.AddItem(curlget) ' by using a multistack a RB app will remain responsive during the transfer.
		  multi.Perform()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HeaderReceivedHandler(Sender As libcURL.cURLItem, HeaderLine As String)
		  #pragma Unused Sender
		  Dim n, v As String
		  If InStr(HeaderLine, ":") > 1 Then
		    n = NthField(HeaderLine, ":", 1)
		    v = Replace(HeaderLine, n + ":", "")
		  Else
		    n = HeaderLine.Trim
		  End If
		  
		  Self.Headers.AddRow(n, v)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProgressHandler(Sender As libcURL.cURLItem, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  #pragma Unused Sender
		  If ultotal > 0 Then
		    ProgressBar1.Value = ulnow * 100 / ulTotal
		  ElseIf dlTotal > 0 Then
		    ProgressBar1.Value = dlnow * 100 / dlTotal
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransferCompleteHandler(Sender As libcURL.cURLShare, easyitem As libcURL.cURLItem)
		  #pragma Unused Sender
		  Dim err As Integer = easyitem.LastError
		  MsgBox(easyitem.URL + " completed with error code: " + Str(err) + " (" + libcURL.FormatError(err) + ").")
		  CurlInfo.AddRow("EFFECTIVE_URL", easyitem.GetInfo(libcURL.Info.EFFECTIVE_URL))
		  CurlInfo.AddRow("REDIRECT_COUNT", Str(easyitem.GetInfo(libcURL.Info.REDIRECT_COUNT).Int32Value))
		  CurlInfo.AddRow("REDIRECT_URL", easyitem.GetInfo(libcURL.Info.REDIRECT_URL))
		  CurlInfo.AddRow("CONTENT_TYPE", easyitem.GetInfo(libcURL.Info.CONTENT_TYPE))
		  CurlInfo.AddRow("FTP_ENTRY_PATH", easyitem.GetInfo(libcURL.Info.FTP_ENTRY_PATH))
		  CurlInfo.AddRow("RESPONSE_CODE", Str(easyitem.GetInfo(libcURL.Info.RESPONSE_CODE).Int32Value))
		  CurlInfo.AddRow("NUM_CONNECTS", Str(easyitem.GetInfo(libcURL.Info.NUM_CONNECTS).Int32Value))
		  CurlInfo.AddRow("OS_ERRNO", Str(easyitem.GetInfo(libcURL.Info.OS_ERRNO).Int32Value))
		  CurlInfo.AddRow("SIZE_DOWNLOAD", Str(easyitem.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value))
		  CurlInfo.AddRow("SIZE_UPLOAD", Str(easyitem.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value))
		  
		  If SaveTo <> Nil Then
		    SaveTo.Close
		    SaveTo = Nil
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private FormValue As libcURL.Form
	#tag EndProperty

	#tag Property, Flags = &h21
		Private multi As libcURL.cURLShare
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SaveTo As BinaryStream
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  DoPerform()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim g As FolderItem = GetSaveFolderItem("", "")
		  SaveTo = BinaryStream.Create(g, True)
		  DoPerform()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Dim f As libcURL.Form = FormGenerator.CreateForm
		  If f <> Nil Then
		    FormValue = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Features
	#tag Event
		Sub Open()
		  If libcURL.Version.ASYNCHDNS Then Me.AddRow("Async DNS supported")
		  If libcURL.Version.CONV Then Me.AddRow("Character conversion supported")
		  If libcURL.Version.DEBUG Then Me.AddRow("Built with debug capabilities")
		  If libcURL.Version.GSSNEGOTIATE Then Me.AddRow("Negotiate auth support")
		  If libcURL.Version.IDN Then Me.AddRow("International Domain Names support")
		  If libcURL.Version.KERBEROS4 Then Me.AddRow("kerberos auth is supported")
		  If libcURL.Version.IPV6 Then Me.AddRow("IPv6-enabled")
		  If libcURL.Version.LARGEFILE Then Me.AddRow("supports files bigger than 2GB")
		  If libcURL.Version.LIBZ Then Me.AddRow("libz features are present")
		  If libcURL.Version.NTLM Then Me.AddRow("NTLM auth is supported")
		  If libcURL.Version.SPNEGO Then Me.AddRow("SPNEGO auth")
		  If libcURL.Version.SSL Then Me.AddRow("SSL options are present")
		  If libcURL.Version.SSPI Then Me.AddRow("SSPI is supported")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Protocols
	#tag Event
		Sub Open()
		  Dim l() As String = libcURL.Version.Protocols
		  l.Sort
		  For i As Integer = 0 To UBound(l)
		    Me.AddRow(l(i))
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
