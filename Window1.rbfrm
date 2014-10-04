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
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
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
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   543
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Main\rDebug and Headers"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   1
      Visible         =   True
      Width           =   879
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
         Height          =   265
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Header name	Header value"
         Italic          =   ""
         Left            =   9
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   313
         _ScrollWidth    =   -1
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
         Height          =   265
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Type	Debug Message"
         Italic          =   ""
         Left            =   334
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   536
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
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Supported Protocols"
         Italic          =   ""
         Left            =   9
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
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   305
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   239
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
         Height          =   513
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   9
         LimitText       =   0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   0
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   30
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   861
      End
      Begin Listbox CurlInfo
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   2
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
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Info Name	Last request Value"
         Italic          =   ""
         Left            =   454
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
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   305
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   416
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
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Available Features"
         Italic          =   ""
         Left            =   260
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
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   305
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   182
         _ScrollWidth    =   -1
      End
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
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   3
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
      Width           =   469
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
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
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
      Left            =   624
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   543
      Value           =   0
      Visible         =   True
      Width           =   246
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Title = libcURL.Version.Name
		  
		  'for SSL/TLS connections we must specify a file with a list of acceptable cartificate authorities
		  ' We create a temp file and dump the DEFAULT_CA_INFO_PEM data into it for this purpose.
		  CA_File = GetTemporaryFolderItem()
		  Dim bs As BinaryStream = BinaryStream.Create(CA_File, True)
		  bs.Write(DEFAULT_CA_INFO_PEM)
		  bs.Close
		  multi = New cURLMulti
		  AddHandler multi.TransferComplete, WeakAddressOf TransferCompleteHandler
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function CreateSocketHandler(Sender As cURLItem) As SocketCore
		  #pragma Unused Sender
		  Dim sock As New TCPSocket
		  socks.Append(sock)
		  Return sock
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DataAvailableHandler(Sender As cURLItem, NewData As String)
		  #pragma Unused Sender
		  If SaveTo <> Nil Then
		    SaveTo.Write(NewData)
		  Else
		    Output.AppendText(NewData)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DebugMessageHandler(Sender As cURLItem, MessageType As libcURL.curl_infotype, data As String)
		  'If MessageType <> libcURL.cURL_InfoType.Text Then
		  #pragma Unused Sender
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
		Private Sub DisconnectedHandler(Sender As cURLItem)
		  #pragma Unused Sender
		  Debug.AddRow("RB-libcURL", "Disconnected")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DoPerform()
		  Output.Text = ""
		  Headers.DeleteAllRows
		  Debug.DeleteAllRows
		  CurlInfo.DeleteAllRows
		  
		  Dim curlget As New cURLItem
		  AddHandler curlget.CreateSocket, WeakAddressOf CreateSocketHandler
		  AddHandler curlget.DataAvailable, WeakAddressOf DataAvailableHandler
		  AddHandler curlget.DebugMessage, WeakAddressOf DebugMessageHandler
		  AddHandler curlget.Disconnected, WeakAddressOf DisconnectedHandler
		  AddHandler curlget.HeaderReceived, WeakAddressOf HeaderReceivedHandler
		  AddHandler curlget.Progress, WeakAddressOf ProgressHandler
		  
		  Call curlget.SetOption(libcURL.Opts.FOLLOWLOCATION, True) ' Follow redirects automatically
		  curlget.CA_ListFile = CA_File ' for SSL/TLS connections we must specify a list of acceptable certificate authorities
		  curlget.URL = TextField1.Text
		  Call multi.AddItem(curlget) ' by using a multistack a RB app will remain responsive during the transfer.
		  multi.Perform()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HeaderReceivedHandler(Sender As cURLItem, HeaderLine As String)
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
		Private Function ProgressHandler(Sender As cURLItem, dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  #pragma Unused Sender
		  #pragma Unused ultotal
		  #pragma Unused ulnow
		  ProgressBar1.Maximum = dlTotal
		  ProgressBar1.Value = dlnow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function TransferCompleteHandler(Sender As cURLMulti, easyitem As cURLItem) As Boolean
		  #pragma Unused Sender
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
		  MsgBox(easyitem.URL + " complete.")
		  If SaveTo <> Nil Then
		    SaveTo.Close
		    SaveTo = Nil
		  End If
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected CA_File As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private multi As cURLMulti
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SaveTo As BinaryStream
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Socks() As SocketCore
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButton1
	#tag Event
		Sub Action()
		  DoPerform()
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
#tag Events PushButton2
	#tag Event
		Sub Action()
		  Dim g As FolderItem = GetSaveFolderItem("", "")
		  SaveTo = BinaryStream.Create(g, True)
		  DoPerform()
		End Sub
	#tag EndEvent
#tag EndEvents
