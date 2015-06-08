#tag Window
Begin Window DemoWindow
   BackColor       =   &hFFFFFF
   Backdrop        =   ""
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   True
   Title           =   "cURLClient Demo"
   Visible         =   True
   Width           =   600
   Begin TabPanel TabPanel2
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   309
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "Information\rOutput\rFeatures"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   92
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   596
      Begin Listbox Debug
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   2
         ColumnsResizable=   True
         ColumnWidths    =   "20%"
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
         Height          =   147
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Type	Message"
         Italic          =   ""
         Left            =   13
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   ""
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   246
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
         _ScrollWidth    =   -1
      End
      Begin TextArea TextArea1
         AcceptTabs      =   ""
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &hFFFFFF
         Bold            =   ""
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   134
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   13
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
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   259
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
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
         Height          =   138
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Supported Protocols"
         Italic          =   ""
         Left            =   11
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   122
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
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
         Height          =   121
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Available Features"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   267
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
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
         Height          =   130
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Header name	Header value"
         Italic          =   ""
         Left            =   13
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
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   123
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
         _ScrollWidth    =   -1
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
         Height          =   119
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Info Name	Last request Value"
         Italic          =   ""
         Left            =   13
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   ""
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollBarVertical=   True
         SelectionType   =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   121
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   578
         _ScrollWidth    =   -1
      End
   End
   Begin cURLClient Client
      Height          =   32
      Index           =   -2147483648
      Left            =   7
      LockedInPosition=   False
      Port            =   ""
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
      UploadMode      =   ""
      Width           =   32
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
      Left            =   258
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   ""
      ReadOnly        =   ""
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "https://www.google.com/"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   335
   End
   Begin Thread GetThread
      Height          =   32
      Index           =   -2147483648
      Left            =   43
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin Thread PutThread
      Height          =   32
      Index           =   -2147483648
      Left            =   80
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin Thread PostThread
      Height          =   32
      Index           =   -2147483648
      Left            =   117
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin ProgressBar ProgressUpload
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   7
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   258
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   35
      Value           =   0
      Visible         =   True
      Width           =   335
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   85
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   4
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   ""
      TabDefinition   =   "GET\rPUT\rPOST"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   0
      Visible         =   True
      Width           =   246
      Begin PushButton PushButton1
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Get"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   9
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   33
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton2
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Get Threaded"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   101
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   33
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin CheckBox CheckBox1
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "GET uses stream"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   172
      End
      Begin PushButton PushButton3
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Put"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton4
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Put Threaded"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   103
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton5
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Post"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton6
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Post Threaded"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   103
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PushButton7
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
         InitialParent   =   "TabPanel1"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Underline       =   ""
         Visible         =   True
         Width           =   91
      End
   End
   Begin ProgressBar ProgressDownload
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   7
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   258
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   47
      Value           =   0
      Visible         =   True
      Width           =   335
   End
   Begin TextArea ErrorBuffer
      AcceptTabs      =   ""
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   True
      BackColor       =   &hFFFFFF
      Bold            =   ""
      Border          =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   38
      HelpTag         =   ""
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   ""
      Left            =   259
      LimitText       =   0
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Mask            =   ""
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      ScrollbarHorizontal=   ""
      ScrollbarVertical=   True
      Styled          =   True
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   59
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   False
      Width           =   332
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Title = Me.Title + " - " + libcURL.Version.Name
		  Client.UseErrorBuffer = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Sub ShowErrorBuffer()
		  If Client.ErrorBuffer <> "" Then 
		    ErrorBuffer.Text = Client.ErrorBuffer
		    ErrorBuffer.Visible = True
		  Else
		    ErrorBuffer.Visible = False
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private FormValue As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events Debug
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  base.Append(New MenuItem("Clear log"))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Clear log"
		    Me.DeleteAllRows
		    Return True
		  End Select
		End Function
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
		  If libcURL.Version.LibZ.IsAvailable Then Me.AddRow("libz features are present")
		  If libcURL.Version.NTLM Then Me.AddRow("NTLM auth is supported")
		  If libcURL.Version.SPNEGO Then Me.AddRow("SPNEGO auth")
		  If libcURL.Version.SSL Then Me.AddRow("SSL options are present")
		  If libcURL.Version.SSPI Then Me.AddRow("SSPI is supported")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Client
	#tag Event
		Sub Error(cURLCode As Integer)
		  MsgBox("cURL error " + Str(cURLCode) + ": " + libcURL.FormatError(cURLCode))
		  ShowErrorBuffer()
		End Sub
	#tag EndEvent
	#tag Event
		Function Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  ProgressDownload.Value = dlnow * 100 / dlTotal
		  ProgressUpload.Value = ulnow * 100 / ulTotal
		  ShowErrorBuffer()
		End Function
	#tag EndEvent
	#tag Event
		Sub DebugMessage(MessageType As libcURL.curl_infotype, data As String)
		  If MessageType = libcURL.curl_infotype.data_in Or MessageType = libcURL.curl_infotype.data_out _
		    Or MessageType = libcURL.curl_infotype.ssl_in Or MessageType = libcURL.curl_infotype.ssl_out Then Return
		    Debug.AddRow(libcURL.curl_infoname(MessageType), data.Trim)
		    Debug.ScrollPosition = Debug.ListCount
		    ShowErrorBuffer()
		End Sub
	#tag EndEvent
	#tag Event
		Sub TransferComplete(BytesRead As Integer, BytesWritten As Integer)
		  If Not CheckBox1.Value Then
		    TextArea1.Text = Me.GetDownloadedData()
		  Else
		    TextArea1.Text = ""
		  End If
		  CurlInfo.DeleteAllRows
		  CurlInfo.AddRow("EFFECTIVE_URL", Me.GetInfo(libcURL.Info.EFFECTIVE_URL))
		  CurlInfo.AddRow("REDIRECT_COUNT", Str(Me.GetInfo(libcURL.Info.REDIRECT_COUNT).Int32Value))
		  CurlInfo.AddRow("REDIRECT_URL", Me.GetInfo(libcURL.Info.REDIRECT_URL))
		  CurlInfo.AddRow("CONTENT_TYPE", Me.GetInfo(libcURL.Info.CONTENT_TYPE))
		  CurlInfo.AddRow("FTP_ENTRY_PATH", Me.GetInfo(libcURL.Info.FTP_ENTRY_PATH))
		  CurlInfo.AddRow("RESPONSE_CODE", Str(Me.GetInfo(libcURL.Info.RESPONSE_CODE).Int32Value))
		  CurlInfo.AddRow("NUM_CONNECTS", Str(Me.GetInfo(libcURL.Info.NUM_CONNECTS).Int32Value))
		  CurlInfo.AddRow("OS_ERRNO", Str(Me.GetInfo(libcURL.Info.OS_ERRNO).Int32Value))
		  CurlInfo.AddRow("SIZE_DOWNLOAD", Str(Me.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value))
		  CurlInfo.AddRow("SIZE_UPLOAD", Str(Me.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value))
		  Headers.DeleteAllRows
		  Dim h As InternetHeaders = Me.GetResponseHeaders
		  For i As Integer = 0 To h.Count - 1
		    Headers.AddRow(h.Name(i), h.Value(i))
		  Next
		  MsgBox("Transfer completed (" + Str(BytesWritten) + " bytes written, " + Str(BytesRead) +" bytes read) with status: " + Str(Me.GetStatusCode))
		  ShowErrorBuffer()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetThread
	#tag Event
		Sub Run()
		  If Not Client.Get(TextField1.Text) Then
		    Break
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PutThread
	#tag Event
		Sub Run()
		  Dim f As FolderItem = GetOpenFolderItem("")
		  If f <> Nil Then
		    Dim bs As BinaryStream = BinaryStream.Open(f)
		    If Not Client.Put(TextField1.Text, bs) Then
		      Break
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostThread
	#tag Event
		Sub Run()
		  If FormValue <> Nil And Not Client.Post(TextField1.Text, FormValue) Then
		    Break
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Dim bs As BinaryStream
		  If CheckBox1.Value Then
		    Dim f As FolderItem = GetSaveFolderItem("", "")
		    bs = BinaryStream.Create(f, True)
		  End If
		  Client.Get(TextField1.Text, bs)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton2
	#tag Event
		Sub Action()
		  GetThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem("")
		  Dim bs As BinaryStream = BinaryStream.Open(f)
		  Client.Put(TextField1.Text, bs)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  PutThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  If FormValue <> Nil Then Client.Post(TextField1.Text, FormValue)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton6
	#tag Event
		Sub Action()
		  PostThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton7
	#tag Event
		Sub Action()
		  Dim f As Dictionary = FormGenerator.CreateForm
		  If f <> Nil Then
		    FormValue = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
