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
   Begin cURL.cURLBase curlget
      Height          =   32
      Index           =   -2147483648
      Left            =   909
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   42
      Width           =   32
   End
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
      Left            =   532
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
      Width           =   80
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
      TabDefinition   =   "Main\rDebug and Headers\rAbout cURL"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   2
      Visible         =   True
      Width           =   879
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
         Height          =   507
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
         ColumnCount     =   1
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
         Height          =   507
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Debug"
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
         Height          =   503
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Features"
         Italic          =   ""
         Left            =   8
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
         TabIndex        =   0
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   239
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
         Height          =   503
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Features"
         Italic          =   ""
         Left            =   259
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
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   239
         _ScrollWidth    =   -1
      End
      Begin Listbox Versionstruct
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
         Height          =   503
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Version"
         Italic          =   ""
         Left            =   510
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
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   28
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   239
         _ScrollWidth    =   -1
      End
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
      Maximum         =   0
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   543
      Value           =   0
      Visible         =   True
      Width           =   246
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
      Text            =   "ftp://anonymous:user@mc.boredomsoft.org/FTP.example"
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   543
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   True
      Width           =   527
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Title = cURL.Version.Name
		End Sub
	#tag EndEvent


#tag EndWindowCode

#tag Events curlget
	#tag Event
		Sub DebugMessage(data As String)
		  Debug.AddRow(data.Trim)
		End Sub
	#tag EndEvent
	#tag Event
		Sub HeadersReceived(Headers As InternetHeaders)
		  For i As Integer = 0 To Headers.Count - 1
		    Self.Headers.AddRow(Headers.Name(i), Headers.Value(i))
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Integer
		  #pragma Unused ultotal
		  #pragma Unused ulnow
		  ProgressBar1.Maximum = dlTotal
		  ProgressBar1.Value = dlnow
		End Function
	#tag EndEvent
	#tag Event
		Sub DataAvailable(NewData As String)
		  Output.AppendText(NewData)
		End Sub
	#tag EndEvent
	#tag Event
		Sub Disconnected()
		  Debug.AddRow("Disconnected")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  Output.Text = ""
		  Headers.DeleteAllRows
		  Debug.DeleteAllRows
		  Call curlget.Perform(TextField1.Text)
		  curlget.Reset
		End Sub
	#tag EndEvent
	#tag Event
		Sub Close()
		  curlget.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Features
	#tag Event
		Sub Open()
		  Dim feat As Integer = cURL.Version.Struct.Features
		  If BitAnd(feat, cURL.Version.ASYNCHDNS) = cURL.Version.ASYNCHDNS Then Me.AddRow("Async DNS supported")
		  If BitAnd(feat, cURL.Version.CONV) = cURL.Version.CONV Then Me.AddRow("Character conversion supported")
		  If BitAnd(feat, cURL.Version.DEBUG) = cURL.Version.DEBUG Then Me.AddRow("Built with debug capabilities")
		  If BitAnd(feat, cURL.Version.GSSNEGOTIATE) = cURL.Version.GSSNEGOTIATE Then Me.AddRow("Negotiate auth support")
		  If BitAnd(feat, cURL.Version.IDN) = cURL.Version.IDN Then Me.AddRow("International Domain Names support")
		  If BitAnd(feat, cURL.Version.KERBEROS4) = cURL.Version.KERBEROS4 Then Me.AddRow("kerberos auth is supported")
		  If BitAnd(feat, cURL.Version.IPV6) = cURL.Version.IPV6 Then Me.AddRow("IPv6-enabled")
		  If BitAnd(feat, cURL.Version.LARGEFILE) = cURL.Version.LARGEFILE Then Me.AddRow("supports files bigger than 2GB")
		  If BitAnd(feat, cURL.Version.LIBZ) = cURL.Version.LIBZ Then Me.AddRow("libz features are present")
		  If BitAnd(feat, cURL.Version.NTLM) = cURL.Version.NTLM Then Me.AddRow("NTLM auth is supported")
		  If BitAnd(feat, cURL.Version.SPNEGO) = cURL.Version.SPNEGO Then Me.AddRow("SPNEGO auth")
		  If BitAnd(feat, cURL.Version.SSL) = cURL.Version.SSL Then Me.AddRow("SSL options are present")
		  If BitAnd(feat, cURL.Version.SSPI) = cURL.Version.SSPI Then Me.AddRow("SSPI is supported")
		End Sub
	#tag EndEvent
#tag EndEvents
