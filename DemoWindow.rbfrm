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
      Value           =   2
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
      Begin TextArea DownloadOutput
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
         Height          =   185
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Supported Protocols"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
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
         Width           =   290
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
         Height          =   185
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         InitialValue    =   "Available Features"
         Italic          =   ""
         Left            =   305
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
         Top             =   122
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   287
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
      Begin Label Label1
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   2
         TabPanelIndex   =   3
         Text            =   "CA List:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   351
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   94
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   3
         Text            =   "Client certificate:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   373
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   94
      End
      Begin Label CAListFile
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   110
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   4
         TabPanelIndex   =   3
         Text            =   "Not specified"
         TextAlign       =   0
         TextColor       =   &h00464646
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   352
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   411
      End
      Begin PushButton CASet
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   525
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   351
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin PushButton CAUnset
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Unset"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   558
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   351
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin Label ClientCert
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   110
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   7
         TabPanelIndex   =   3
         Text            =   "Not specified"
         TextAlign       =   0
         TextColor       =   &h00464646
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   374
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   411
      End
      Begin PushButton ClientCertSet
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   525
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   373
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin PushButton ClientCertUnset
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Unset"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   558
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   373
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin PushButton CookieJarUnset
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Unset"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   558
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   329
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin PushButton CookieJarSet
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Set"
         Default         =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   525
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   329
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin Label CookieJar
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   110
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   12
         TabPanelIndex   =   3
         Text            =   "Not specified"
         TextAlign       =   0
         TextColor       =   &h00464646
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   330
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   411
      End
      Begin Label Label5
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel2"
         Italic          =   ""
         Left            =   11
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   13
         TabPanelIndex   =   3
         Text            =   "Cookiejar:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   329
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   94
      End
   End
   Begin cURLClient Client
      Height          =   32
      Index           =   -2147483648
      Left            =   7
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
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
      TabDefinition   =   "GET\rHEAD\rPUT\rPOST"
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   0
      Underline       =   ""
      Value           =   1
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
         TabPanelIndex   =   4
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
         TabPanelIndex   =   4
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
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   58
         Underline       =   ""
         Visible         =   True
         Width           =   91
      End
      Begin PushButton PushButton8
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Head Threaded"
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
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   104
      End
      Begin PushButton PushButton9
         AutoDeactivate  =   True
         Bold            =   ""
         ButtonStyle     =   0
         Cancel          =   ""
         Caption         =   "Head"
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
   Begin Timer GUITimer
      Height          =   32
      Index           =   -2147483648
      Left            =   190
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin Timer ProgressTimer
      Height          =   32
      Index           =   -2147483648
      Left            =   224
      LockedInPosition=   False
      Mode            =   0
      Period          =   1
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin Thread HeadThread
      Height          =   32
      Index           =   -2147483648
      Left            =   155
      LockedInPosition=   False
      Priority        =   5
      Scope           =   0
      StackSize       =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Title = Me.Title + " - " + libcURL.Version.Name
		  Client.EasyItem.UseErrorBuffer = True
		  'Client.EasyItem.AutoDisconnect = True
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub Populate()
		  Dim cURLCode As Integer = Client.LastError
		  If Not CheckBox1.Value Then
		    DownloadOutput.Text = Client.GetDownloadedData()
		  Else
		    DownloadOutput.Text = ""
		  End If
		  CurlInfo.DeleteAllRows
		  Headers.DeleteAllRows
		  ShowErrorBuffer()
		  If cURLCode <> 0 Then
		    Dim err As String = libcURL.Errors.Name(cURLCode) + "(" + Str(cURLCode) + "): " + libcURL.FormatError(cURLCode)
		    Call MsgBox(err, 16, "libcURL error")
		  Else
		    Dim BytesRead As Integer = Client.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value
		    Dim BytesWritten As Integer = Client.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value
		    MsgBox("Transfer completed (" + Str(BytesWritten) + " bytes written, " + Str(BytesRead) +" bytes read) with status: " + Str(Client.GetStatusCode))
		    CurlInfo.AddRow("EFFECTIVE_URL", Client.GetInfo(libcURL.Info.EFFECTIVE_URL))
		    CurlInfo.AddRow("REDIRECT_COUNT", Str(Client.GetInfo(libcURL.Info.REDIRECT_COUNT).Int32Value))
		    CurlInfo.AddRow("REDIRECT_URL", Client.GetInfo(libcURL.Info.REDIRECT_URL))
		    CurlInfo.AddRow("CONTENT_TYPE", Client.GetInfo(libcURL.Info.CONTENT_TYPE))
		    CurlInfo.AddRow("FTP_ENTRY_PATH", Client.GetInfo(libcURL.Info.FTP_ENTRY_PATH))
		    CurlInfo.AddRow("RESPONSE_CODE", Str(Client.GetInfo(libcURL.Info.RESPONSE_CODE).Int32Value))
		    CurlInfo.AddRow("NUM_CONNECTS", Str(Client.GetInfo(libcURL.Info.NUM_CONNECTS).Int32Value))
		    CurlInfo.AddRow("OS_ERRNO", Str(Client.GetInfo(libcURL.Info.OS_ERRNO).Int32Value))
		    CurlInfo.AddRow("SIZE_DOWNLOAD", Str(BytesRead))
		    CurlInfo.AddRow("SIZE_UPLOAD", Str(BytesWritten))
		    Dim h As InternetHeaders = Client.GetResponseHeaders
		    If h <> Nil Then
		      For i As Integer = 0 To h.Count - 1
		        Headers.AddRow(h.Name(i), h.Value(i))
		      Next
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowErrorBuffer()
		  If Client.EasyItem.ErrorBuffer <> "" Then
		    ErrorBuffer.Text = Client.EasyItem.ErrorBuffer
		    ErrorBuffer.Visible = True
		  Else
		    ErrorBuffer.Visible = False
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ClientCertItem As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dbgmsgs() As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FormValue As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdlnow As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdltotal As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPutTarget As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mulnow As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private multotal As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mURL As String
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
#tag Events CAListFile
	#tag Event
		Sub Open()
		  If Client.EasyItem.CA_ListFile <> Nil Then Me.Text = Client.EasyItem.CA_ListFile.AbsolutePath
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Client.EasyItem.CA_ListFile <> Nil Then
		    Client.EasyItem.CA_ListFile.Parent.Launch
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CASet
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(cURLTypes.SecurityCertificate)
		  If f <> Nil Then
		    Client.EasyItem.CA_ListFile = f
		    Client.EasyItem.Secure = False
		    CAListFile.Text = Client.EasyItem.CA_ListFile.AbsolutePath
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CAUnset
	#tag Event
		Sub Action()
		  Client.EasyItem.CA_ListFile = Nil
		  Client.EasyItem.Secure = False
		  CAListFile.Text = "Not specified"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClientCert
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If ClientCertItem <> Nil Then
		    ClientCertItem.Parent.Launch
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ClientCertSet
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(cURLTypes.SecurityCertificate)
		  If f <> Nil Then
		    If Client.EasyItem.SetOption(libcURL.Opts.SSLCERT, f) Then
		      ClientCert.Text = f.AbsolutePath
		      ClientCertItem = f
		    Else
		      MsgBox("Unable to set client certificate!")
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClientCertUnset
	#tag Event
		Sub Action()
		  Call Client.EasyItem.SetOption(libcURL.Opts.SSLCERT, Nil)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookieJarUnset
	#tag Event
		Sub Action()
		  Client.EasyItem.CookieJar = Nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookieJarSet
	#tag Event
		Sub Action()
		  Dim f As FolderItem
		  If MsgBox("Would you like to open an existing cookie file?", 4 + 32, "Open existing?") = 6 Then
		    f = GetOpenFolderItem(cURLTypes.NetscapeCookieJar)
		  Else
		    f = GetSaveFolderItem(cURLTypes.NetscapeCookieJar, "cookie.jar")
		  End If
		  If f <> Nil Then
		    Client.EasyItem.CookieJar = f
		    CookieJar.Text = Client.EasyItem.CookieJar.AbsolutePath
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookieJar
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Client.EasyItem.CookieJar <> Nil Then
		    Client.EasyItem.CookieJar.Parent.Launch
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Client
	#tag Event
		Function Progress(dlTotal As UInt64, dlnow As UInt64, ultotal As UInt64, ulnow As UInt64) As Boolean
		  mdlnow = dlnow
		  mdltotal = dlTotal
		  mulnow = ulnow
		  multotal = ultotal
		  ProgressTimer.Mode = Timer.ModeSingle
		End Function
	#tag EndEvent
	#tag Event
		Sub Error(cURLCode As Integer)
		  #pragma Unused cURLCode
		  GUITimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub TransferComplete(BytesRead As Integer, BytesWritten As Integer)
		  #pragma Unused BytesRead
		  #pragma Unused BytesWritten
		  GUITimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub DebugMessage(MessageType As libcURL.curl_infotype, data As String)
		  If MessageType = libcURL.curl_infotype.header_out Then
		    Dim msgs() As String = SplitB(data.Trim, EndOfLine.Windows)
		    For i As Integer = 0 To UBound(msgs)
		      dbgmsgs.Insert(0, MessageType:msgs(i))
		    Next
		  Else
		    dbgmsgs.Insert(0, MessageType:data)
		  End If
		  ProgressTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetThread
	#tag Event
		Sub Run()
		  If Not Client.Get(mURL) Then
		    Break
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PutThread
	#tag Event
		Sub Run()
		  If mPutTarget <> Nil Then
		    Dim bs As BinaryStream = BinaryStream.Open(mPutTarget)
		    If Not Client.Put(mURL, bs) Then
		      Break
		    End If
		    bs.Close
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostThread
	#tag Event
		Sub Run()
		  If FormValue <> Nil Then
		    If FormValue.Right = 0 Then ' URLEncoded
		      Dim frm() As String = FormValue.Left
		      If Not Client.Post(mURL, frm) Then Break
		    ElseIf FormValue.Right = 1 Then ' Multipart
		      Dim frm As Dictionary = FormValue.Left
		      If Not Client.Post(mURL, frm) Then Break
		    Else
		      Break
		    End If
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
		  mURL = TextField1.Text
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
		  mPutTarget = GetOpenFolderItem("")
		  mURL = TextField1.Text
		  PutThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton5
	#tag Event
		Sub Action()
		  If FormValue <> Nil Then
		    If FormValue.Right = 0 Then ' URLEncoded
		      Dim frm() As String = FormValue.Left
		      Client.Post(TextField1.Text, frm)
		    ElseIf FormValue.Right = 1 Then ' Multipart
		      Dim frm As Dictionary = FormValue.Left
		      Client.Post(TextField1.Text, frm)
		    Else
		      Break
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton6
	#tag Event
		Sub Action()
		  
		  mURL = TextField1.Text
		  PostThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton7
	#tag Event
		Sub Action()
		  Dim f As Pair = FormGenerator.CreateForm
		  If f <> Nil Then
		    FormValue = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton8
	#tag Event
		Sub Action()
		  mURL = TextField1.Text
		  HeadThread.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton9
	#tag Event
		Sub Action()
		  Client.Head(TextField1.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GUITimer
	#tag Event
		Sub Action()
		  Populate()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProgressTimer
	#tag Event
		Sub Action()
		  ProgressDownload.Value = mdlnow * 100 / mdlTotal
		  ProgressUpload.Value = mulnow * 100 / mulTotal
		  
		  Do Until UBound(dbgmsgs) = -1
		    Dim p As Pair = dbgmsgs.Pop
		    Dim MessageType As libcURL.curl_infotype = p.Left
		    Dim data As String = p.Right
		    If MessageType = libcURL.curl_infotype.data_in Or MessageType = libcURL.curl_infotype.data_out _
		      Or MessageType = libcURL.curl_infotype.ssl_in Or MessageType = libcURL.curl_infotype.ssl_out Then Continue
		      Debug.AddRow(libcURL.curl_infoname(MessageType), data.Trim)
		      Debug.ScrollPosition = Debug.ListCount
		  Loop
		  ShowErrorBuffer()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HeadThread
	#tag Event
		Sub Run()
		  If Not Client.Head(mURL) Then
		    Break
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
