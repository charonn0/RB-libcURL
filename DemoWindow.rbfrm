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
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   ""
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   640
   Placement       =   1
   Resizeable      =   True
   Title           =   "cURLClient Demo"
   Visible         =   True
   Width           =   640
   Begin TabPanel OptionsPanel
      AutoDeactivate  =   True
      Bold            =   ""
      Enabled         =   True
      Height          =   282
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
      TabDefinition   =   "Information\rOutput\rFeatures\rCookies\rRaw Options"
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   119
      Underline       =   ""
      Value           =   4
      Visible         =   True
      Width           =   636
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
         InitialParent   =   "OptionsPanel"
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
         Top             =   150
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   618
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
         Height          =   155
         HelpTag         =   ""
         Hierarchical    =   False
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
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
         Top             =   148
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   618
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
         Height          =   105
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
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
         Top             =   288
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   618
      End
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
         Height          =   83
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
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
         Top             =   310
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   618
         _ScrollWidth    =   -1
      End
      Begin Canvas HSplitter1
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   5
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Left            =   137
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   304
         UseFocusRing    =   True
         Visible         =   True
         Width           =   370
      End
      Begin GroupBox CookieControl
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Cookielist"
         Enabled         =   False
         Height          =   228
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   8
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   4
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   168
         Underline       =   ""
         Visible         =   True
         Width           =   625
         Begin Listbox CookieList
            AutoDeactivate  =   True
            AutoHideScrollbars=   True
            Bold            =   ""
            Border          =   True
            ColumnCount     =   6
            ColumnsResizable=   True
            ColumnWidths    =   "25%,25%,20%,10%,10%,10%"
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
            Height          =   128
            HelpTag         =   ""
            Hierarchical    =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            InitialValue    =   "Name	Value	Domain	Expires	Path	HTTPOnly"
            Italic          =   ""
            Left            =   20
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
            TabIndex        =   0
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   189
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   604
            _ScrollWidth    =   -1
         End
         Begin TextField CookieSearchName
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "Cookie Name"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   20
            LimitText       =   0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Mask            =   ""
            Password        =   ""
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   323
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   205
         End
         Begin PushButton CookieLookupButton
            AutoDeactivate  =   True
            Bold            =   ""
            ButtonStyle     =   0
            Cancel          =   ""
            Caption         =   "Lookup"
            Default         =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   477
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   3
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   323
            Underline       =   ""
            Visible         =   True
            Width           =   70
         End
         Begin TextField CookieSearchDomain
            AcceptTabs      =   ""
            Alignment       =   0
            AutoDeactivate  =   True
            AutomaticallyCheckSpelling=   False
            BackColor       =   &hFFFFFF
            Bold            =   ""
            Border          =   True
            CueText         =   "Cookie Domain"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Format          =   ""
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   229
            LimitText       =   0
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   False
            Mask            =   ""
            Password        =   ""
            ReadOnly        =   ""
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   4
            TabStop         =   True
            Text            =   ""
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   323
            Underline       =   ""
            UseFocusRing    =   True
            Visible         =   True
            Width           =   245
         End
         Begin CheckBox StrictLookup
            AutoDeactivate  =   True
            Bold            =   ""
            Caption         =   "Strict"
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   552
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            State           =   1
            TabIndex        =   4
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   324
            Underline       =   ""
            Value           =   True
            Visible         =   True
            Width           =   68
         End
         Begin Label CookiesTotal
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   13
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   ""
            Scope           =   0
            Selectable      =   False
            TabIndex        =   9
            TabPanelIndex   =   4
            Text            =   "Cookies known: 0"
            TextAlign       =   2
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   378
            Transparent     =   True
            Underline       =   ""
            Visible         =   True
            Width           =   108
         End
         Begin Label CookiesShown
            AutoDeactivate  =   True
            Bold            =   ""
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            Height          =   20
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   13
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   False
            Multiline       =   ""
            Scope           =   0
            Selectable      =   False
            TabIndex        =   10
            TabPanelIndex   =   4
            Text            =   "Cookies shown: 0"
            TextAlign       =   2
            TextColor       =   &h000000
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   356
            Transparent     =   True
            Underline       =   ""
            Visible         =   True
            Width           =   108
         End
         Begin PushButton WriteCookies
            AutoDeactivate  =   True
            Bold            =   ""
            ButtonStyle     =   0
            Cancel          =   ""
            Caption         =   "Save to file..."
            Default         =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   390
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   14
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   369
            Underline       =   ""
            Visible         =   True
            Width           =   115
         End
         Begin PushButton ReadCookies
            AutoDeactivate  =   True
            Bold            =   ""
            ButtonStyle     =   0
            Cancel          =   ""
            Caption         =   "Load from file..."
            Default         =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   505
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   15
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   369
            Underline       =   ""
            Visible         =   True
            Width           =   115
         End
         Begin PushButton NewCookieSessionButton
            AutoDeactivate  =   True
            Bold            =   ""
            ButtonStyle     =   0
            Cancel          =   ""
            Caption         =   "New Session"
            Default         =   ""
            Enabled         =   True
            Height          =   22
            HelpTag         =   ""
            Index           =   -2147483648
            InitialParent   =   "CookieControl"
            Italic          =   ""
            Left            =   274
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   False
            Scope           =   0
            TabIndex        =   16
            TabPanelIndex   =   4
            TabStop         =   True
            TextFont        =   "System"
            TextSize        =   0
            TextUnit        =   0
            Top             =   369
            Underline       =   ""
            Visible         =   True
            Width           =   115
         End
      End
      Begin CheckBox UseCookies
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Enable cookies"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   14
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   0
         TabPanelIndex   =   4
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   146
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   135
      End
      Begin Canvas HSplitter2
         AcceptFocus     =   ""
         AcceptTabs      =   ""
         AutoDeactivate  =   True
         Backdrop        =   ""
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   5
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Left            =   137
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   281
         UseFocusRing    =   True
         Visible         =   True
         Width           =   370
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   104
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   0
         TabPanelIndex   =   3
         Text            =   "Not specified"
         TextAlign       =   0
         TextColor       =   &h00464646
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   351
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   451
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   559
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   350
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   592
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   350
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   104
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   True
         TabIndex        =   3
         TabPanelIndex   =   3
         Text            =   "Not specified"
         TextAlign       =   0
         TextColor       =   &h00464646
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   373
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   451
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   559
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   False
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   372
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   592
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
         Top             =   372
         Underline       =   ""
         Visible         =   True
         Width           =   34
      End
      Begin Label Label6
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   3
         Text            =   "Interface:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   267
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   73
      End
      Begin ComboBox nic
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   ""
         Italic          =   False
         Left            =   296
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   267
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   174
      End
      Begin CheckBox Verbose
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Verbose"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   350
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   8
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   209
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox Secure
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Validate SSL"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   350
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   9
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   189
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox HTTPPreserveMethod
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Preserve method"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   350
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   169
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox HTTPCompress
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "gzip,deflate"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   350
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   11
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   149
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox FollowRedirects
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Follow redirects"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   12
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   209
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox Autoreferer
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "AutoReferrer"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   13
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   189
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox AutoDisconnect
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Autodisconnect"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   14
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   169
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin CheckBox FailOnError
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Fail on error"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   15
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   149
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
      End
      Begin Label Label7
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   16
         TabPanelIndex   =   3
         Text            =   "Proxy server:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   292
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   73
      End
      Begin TextField ProxyServer
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   296
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
         TabIndex        =   17
         TabPanelIndex   =   3
         TabStop         =   True
         Text            =   ""
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   292
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   174
      End
      Begin Label Label8
         AutoDeactivate  =   True
         Bold            =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   18
         TabPanelIndex   =   3
         Text            =   "Proxy type:"
         TextAlign       =   0
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   315
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   73
      End
      Begin ComboBox ProxyTypes
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   "Socks 4\r\nSocks 4A\r\nSocks 5\r\nSocks 5A\r\nHTTP\r\nHTTP 1.0"
         Italic          =   False
         Left            =   296
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   315
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   174
      End
      Begin CheckBox NoProgress
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Progress Event"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   350
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   20
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   229
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   111
      End
      Begin ComboBox SSLVer
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   "Default SSL/TLS\r\nSSLv2\r\nSSLv3\r\nTLSv1.X\r\nTLSv1.0\r\nTLSv1.1\r\nTLSv1.2"
         Italic          =   False
         Left            =   474
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   21
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   199
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   100
      End
      Begin ComboBox HTTPVer
         AutoComplete    =   False
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   "HTTP/1.1\r\nHTTP/1.0\r\nHTTP/2"
         Italic          =   False
         Left            =   474
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   22
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   168
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   100
      End
      Begin CheckBox ShowDataMsgs
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Show data messages"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   14
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   False
         Scope           =   0
         State           =   0
         TabIndex        =   23
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   318
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   145
      End
      Begin CheckBox YieldOnLoop
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Yield"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   218
         LockBottom      =   ""
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   ""
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   24
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   229
         Underline       =   ""
         Value           =   False
         Visible         =   True
         Width           =   120
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
         Height          =   161
         HelpTag         =   ""
         Hierarchical    =   True
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   "Available Features"
         Italic          =   ""
         Left            =   14
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
         TabIndex        =   26
         TabPanelIndex   =   3
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   153
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   170
         _ScrollWidth    =   -1
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   10
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   27
         TabPanelIndex   =   3
         Text            =   "Client certificate:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   372
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   93
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
         InitialParent   =   "OptionsPanel"
         Italic          =   ""
         Left            =   18
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         Multiline       =   ""
         Scope           =   0
         Selectable      =   False
         TabIndex        =   28
         TabPanelIndex   =   3
         Text            =   "CA List:"
         TextAlign       =   2
         TextColor       =   &h000000
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   350
         Transparent     =   True
         Underline       =   ""
         Visible         =   True
         Width           =   85
      End
      Begin Listbox RawOptsList
         AutoDeactivate  =   True
         AutoHideScrollbars=   True
         Bold            =   ""
         Border          =   True
         ColumnCount     =   3
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
         Height          =   244
         HelpTag         =   ""
         Hierarchical    =   ""
         Index           =   -2147483648
         InitialParent   =   "OptionsPanel"
         InitialValue    =   "Name	Current Value	Type"
         Italic          =   ""
         Left            =   11
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
         TabPanelIndex   =   5
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0
         TextUnit        =   0
         Top             =   150
         Underline       =   ""
         UseFocusRing    =   True
         Visible         =   True
         Width           =   622
         _ScrollWidth    =   -1
      End
   End
   Begin cURLClient Client
      Height          =   32
      Index           =   -2147483648
      IsSSLCertOK     =   ""
      Left            =   7
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin TextField URLField
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
      Width           =   353
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
      Width           =   375
   End
   Begin TabPanel ActionPanel
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
      Value           =   0
      Visible         =   True
      Width           =   246
      Begin PushButton GetBtn
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
         InitialParent   =   "ActionPanel"
         Italic          =   ""
         Left            =   11
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
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
      Begin PushButton GetThreadBtn
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
         InitialParent   =   "ActionPanel"
         Italic          =   ""
         Left            =   117
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
         Top             =   31
         Underline       =   ""
         Visible         =   True
         Width           =   100
      End
      Begin PushButton PutBtn
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
         InitialParent   =   "ActionPanel"
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
         Width           =   100
      End
      Begin PushButton PutThreadBtn
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
         InitialParent   =   "ActionPanel"
         Italic          =   ""
         Left            =   117
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
         Width           =   100
      End
      Begin PushButton PostBtn
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
         InitialParent   =   "ActionPanel"
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
         Width           =   100
      End
      Begin PushButton PostThreadBtn
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
         InitialParent   =   "ActionPanel"
         Italic          =   ""
         Left            =   117
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
         Width           =   100
      End
      Begin PushButton SetFormBtn
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
         InitialParent   =   "ActionPanel"
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
         Width           =   100
      End
      Begin PushButton HeadThreadBtn
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
         InitialParent   =   "ActionPanel"
         Italic          =   ""
         Left            =   117
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
         Width           =   100
      End
      Begin PushButton HeadBtn
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
         InitialParent   =   "ActionPanel"
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
         Width           =   100
      End
      Begin CheckBox SaveToFileChkBx
         AutoDeactivate  =   True
         Bold            =   ""
         Caption         =   "Download to file"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ActionPanel"
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
      Width           =   375
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
      LockRight       =   True
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
      Top             =   73
      Underline       =   ""
      UseFocusRing    =   True
      Visible         =   False
      Width           =   372
   End
   Begin Timer GUITimer
      Height          =   32
      Index           =   -2147483648
      Left            =   45
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
      Left            =   79
      LockedInPosition=   False
      Mode            =   1
      Period          =   10
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   437
      Width           =   32
   End
   Begin PushButton PauseButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Pause"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   9
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   85
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin PushButton AbortButton
      AutoDeactivate  =   True
      Bold            =   True
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "X"
      Default         =   ""
      Enabled         =   False
      Height          =   22
      HelpTag         =   "Abort"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   611
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   12
      Underline       =   ""
      Visible         =   True
      Width           =   24
   End
   Begin PushButton ResetButton
      AutoDeactivate  =   True
      Bold            =   ""
      ButtonStyle     =   0
      Cancel          =   ""
      Caption         =   "Reset"
      Default         =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   90
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   85
      Underline       =   ""
      Visible         =   True
      Width           =   80
   End
   Begin Label ETALabel
      AutoDeactivate  =   True
      Bold            =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   268
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Multiline       =   ""
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      Text            =   ""
      TextAlign       =   1
      TextColor       =   &h000000
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   53
      Transparent     =   True
      Underline       =   ""
      Visible         =   True
      Width           =   312
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Title = Me.Title + " - " + libcURL.Version.UserAgent
		  Client.EasyHandle.UseErrorBuffer = True
		  RefreshOpts()
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub DoProgress()
		  ProgressDownload.Value = mdlnow * 100 / mdlTotal
		  ProgressUpload.Value = mulnow * 100 / mulTotal
		  If PauseButton.Caption = "Pause" Then
		    If multotal > 0 Then
		      Dim speed As Double = Client.GetInfo(libcURL.Info.SPEED_UPLOAD).DoubleValue
		      ETALabel.Text = "Time remaining: " + ETA(multotal, mulnow, speed) + " (" + FormatBytes(speed) + "/sec" + ")"
		    ElseIf mdltotal > 0 Then
		      Dim speed As Double = Client.GetInfo(libcURL.Info.SPEED_DOWNLOAD).DoubleValue
		      ETALabel.Text = "Time remaining: " + ETA(mdltotal, mdlnow, speed) + " (" + FormatBytes(speed) + "/sec" + ")"
		    Else
		      ETALabel.Text = ""
		    End If
		  End If
		  Do Until UBound(dbgmsgs) = -1
		    Dim p As Pair = dbgmsgs.Pop
		    Dim MessageType As libcURL.curl_infotype = p.Left
		    Dim data As String = p.Right
		    Select Case MessageType
		    Case libcURL.curl_infotype.data_in, libcURL.curl_infotype.data_out, libcURL.curl_infotype.ssl_in, libcURL.curl_infotype.ssl_out
		      If ShowDataMsgs.Value Then
		        data = Format(data.LenB, "###,###,###,###,###0") + " bytes"
		      Else
		        Continue
		      End If
		    End Select
		    
		    
		    Debug.AddRow(libcURL.curl_infoname(MessageType), data.Trim)
		    Debug.ScrollPosition = Debug.ListCount
		  Loop
		  ShowErrorBuffer()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ETA(Total As UInt64, Current As UInt64, BPS As Double) As String
		  Dim remaining As UInt64 = Total - Current
		  Dim secs As Double = remaining / BPS
		  Return FormatTime(secs * 1000, True)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FormatBytes(bytes As UInt64, precision As Integer = 2) As String
		  'Converts raw byte counts into SI formatted strings. 1KB = 1024 bytes.
		  'Optionally pass an integer representing the number of decimal places to return. The default is two decimal places. You may specify
		  'between 0 and 16 decimal places. Specifying more than 16 will append extra zeros to make up the length. Passing 0
		  'shows no decimal places and no decimal point.
		  
		  Const kilo = 1024
		  Static mega As UInt64 = kilo * kilo
		  Static giga As UInt64 = kilo * mega
		  Static tera As UInt64 = kilo * giga
		  Static peta As UInt64 = kilo * tera
		  Static exab As UInt64 = kilo * peta
		  
		  Dim suffix, precisionZeros As String
		  Dim strBytes As Double
		  
		  
		  If bytes < kilo Then
		    strbytes = bytes
		    If bytes = 1 Then suffix = " byte" Else suffix = " bytes"
		    precision = 0
		  ElseIf bytes >= kilo And bytes < mega Then
		    strbytes = bytes / kilo
		    suffix = "KB"
		  ElseIf bytes >= mega And bytes < giga Then
		    strbytes = bytes / mega
		    suffix = "MB"
		  ElseIf bytes >= giga And bytes < tera Then
		    strbytes = bytes / giga
		    suffix = "GB"
		  ElseIf bytes >= tera And bytes < peta Then
		    strbytes = bytes / tera
		    suffix = "TB"
		  ElseIf bytes >= tera And bytes < exab Then
		    strbytes = bytes / peta
		    suffix = "PB"
		  ElseIf bytes >= exab Then
		    strbytes = bytes / exab
		    suffix = "EB"
		  End If
		  
		  
		  While precisionZeros.Len < precision
		    precisionZeros = precisionZeros + "0"
		  Wend
		  If precisionZeros.Trim <> "" Then precisionZeros = "." + precisionZeros
		  
		  Return Format(strBytes, "#,###0" + precisionZeros) + suffix
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function FormatTime(Milliseconds As Int64, FractionalSeconds As Boolean = False) As String
		  ' Formats the period of time denoted by Milliseconds as HH:MM:SS. If FractionalSeconds is true then fractions of a second are included.
		  
		  Dim hours As Integer = (Milliseconds / (1000 * 60 * 60))
		  Dim minutes As Integer = (Milliseconds / (1000 * 60)) Mod 60
		  Dim seconds As Integer = (Milliseconds / 1000) Mod 60
		  Dim frac As Integer  = Milliseconds Mod 1000
		  Dim out As String
		  If hours > 0 Then
		    out = Str(hours) + ":" + Format(minutes, "00") + ":"
		  Else
		    out = out + Format(minutes, "#0") + ":"
		  End If
		  If FractionalSeconds Then
		    out = out + Format(seconds + (frac / 1000), "00.00")
		  Else
		    out = out + Format(seconds, "00")
		  End If
		  Return out
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function ParseContentType(Raw As String) As TextEncoding
		  Dim fields() As String = Split(raw, ";")
		  Dim fcount As Integer = Ubound(fields)
		  For i As Integer = 0 To fcount
		    Dim entry As String = fields(i)
		    If InStr(entry, "/") = 0 Then
		      Dim parm, value As String
		      parm = NthField(entry, "=", 1).Trim
		      value = NthField(entry, "=", 2).Trim
		      If parm = "charset" Then
		        For e As Integer = 0 To Encodings.Count
		          Dim enc As TextEncoding = Encodings.Item(e)
		          If enc.internetName = value Then Return enc
		        Next
		      End If
		    End If
		  Next
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Populate()
		  mLockUI = True
		  PauseButton.Enabled = False
		  ResetButton.Enabled = True
		  PauseButton.Caption = "Pause"
		  AbortButton.Enabled = False
		  Dim cURLCode As Integer = Client.LastError
		  If Not SaveToFileChkBx.Value And cURLCode = 0 Then
		    Dim data As String = Client.GetDownloadedData()
		    Dim enc As TextEncoding
		    Dim headers As InternetHeaders = Client.GetResponseHeaders()
		    If headers <> Nil And headers.NameCount("Content-Type") > 0 Then
		      enc = ParseContentType(Client.GetResponseHeaders.CommaSeparatedValues("Content-Type"))
		    End If
		    If enc <> Nil Then data = DefineEncoding(data, enc)
		    DownloadOutput.Text = data
		  Else
		    DownloadOutput.Text = ""
		  End If
		  Dim BytesRead As Integer = Client.GetInfo(libcURL.Info.SIZE_DOWNLOAD).Int32Value
		  Dim BytesWritten As Integer = Client.GetInfo(libcURL.Info.SIZE_UPLOAD).Int32Value
		  CurlInfo.DeleteAllRows
		  Headers.DeleteAllRows
		  ShowErrorBuffer()
		  If cURLCode <> 0 Then
		    Dim err As String = libcURL.Errors.Name(cURLCode) + "(" + Str(cURLCode) + "): " + libcURL.FormatError(cURLCode)
		    Call MsgBox(err, 16, "libcURL error")
		  Else
		    MsgBox("Transfer completed (" + Str(BytesWritten) + " bytes written, " + Str(BytesRead) +" bytes read) with status: " + Str(Client.LastStatusCode))
		  End If
		  
		  Dim infoiterator As New libcURL.Info.InfoTypeIterator()
		  Do
		    Dim info As libcURL.Info.InfoType = infoiterator.CurrentInfoType
		    Dim value As String
		    Select Case info.Name
		    Case "SPEED_DOWNLOAD", "SPEED_UPLOAD"
		      Dim number As Double = info.Value(Client.EasyHandle).DoubleValue
		      If number < 0 Then number = 0
		      value = FormatBytes(number) + "/sec"
		      
		    Case "SPEED_DOWNLOAD_T", "SPEED_UPLOAD_T"
		      Dim number As Int64 = info.Value(Client.EasyHandle).Int64Value
		      If number < 0 Then number = 0
		      value = FormatBytes(number) + "/sec"
		      
		    Case "APPCONNECT_TIME", "CONNECT_TIME", "STARTTRANSFER_TIME", "TOTAL_TIME", "NAMELOOKUP_TIME", "PRETRANSFER_TIME", "REDIRECT_TIME"
		      Dim number As Double = info.Value(Client.EasyHandle).DoubleValue
		      If number < 0 Then number = 0
		      value = Format(number, "###,###,##0.0##")
		      
		    Case "APPCONNECT_TIME_T", "CONNECT_TIME_T", "STARTTRANSFER_TIME_T", "TOTAL_TIME_T", "NAMELOOKUP_TIME_T", "PRETRANSFER_TIME_T", "REDIRECT_TIME_T"
		      Dim number As Int64 = info.Value(Client.EasyHandle).Int64Value / 1000000
		      If number < 0 Then number = 0
		      value = Format(number, "###,###,##0.0##")
		      
		    Case "CONTENT_LENGTH_DOWNLOAD", "CONTENT_LENGTH_UPLOAD", "SIZE_DOWNLOAD", "SIZE_UPLOAD"
		      Dim number As Double = info.Value(Client.EasyHandle).Int64Value
		      If number < 0 Then number = 0
		      value = FormatBytes(number)
		      
		    Case "CONTENT_LENGTH_DOWNLOAD_T", "CONTENT_LENGTH_UPLOAD_T", "SIZE_DOWNLOAD_T", "SIZE_UPLOAD_T"
		      Dim number As Int64 = info.Value(Client.EasyHandle).Int64Value
		      If number < 0 Then number = 0
		      value = FormatBytes(number)
		      
		    Case "HEADER_SIZE", "REQUEST_SIZE"
		      Dim number As Int32 = info.Value(Client.EasyHandle).Int32Value
		      If number < 0 Then number = 0
		      value = FormatBytes(number)
		      
		    Else
		      value = info.StringValue(Client.EasyHandle)
		    End Select
		    
		    CurlInfo.AddRow(info.Name, value)
		  Loop Until Not infoiterator.MoveNext()
		  
		  Dim h As InternetHeaders = Client.GetResponseHeaders
		  If h <> Nil Then
		    For i As Integer = 0 To h.Count - 1
		      Headers.AddRow(h.Name(i), h.Value(i))
		    Next
		  End If
		  UpdateCookieList()
		  Select Case Client.EasyHandle.HTTPVersion
		  Case libcURL.HTTPVersion.HTTP1_1
		    HTTPVer.ListIndex = 0
		  Case libcURL.HTTPVersion.HTTP1_0
		    HTTPVer.ListIndex = 1
		  Case libcURL.HTTPVersion.HTTP2
		    HTTPVer.ListIndex = 2
		  End Select
		  
		  Select Case Client.EasyHandle.SSLVersion
		  Case libcURL.SSLVersion.Default
		    SSLVer.ListIndex = 0
		  Case libcURL.SSLVersion.TLSv1
		    SSLVer.ListIndex = 1
		  Case libcURL.SSLVersion.SSLv2
		    SSLVer.ListIndex = 2
		  Case libcURL.SSLVersion.SSLv3
		    SSLVer.ListIndex = 3
		  Case libcURL.SSLVersion.TLSv1_0
		    SSLVer.ListIndex = 4
		  Case libcURL.SSLVersion.TLSv1_1
		    SSLVer.ListIndex = 5
		  Case libcURL.SSLVersion.TLSv1_2
		    SSLVer.ListIndex = 6
		  End Select
		  
		  RefreshOpts()
		  
		Finally
		  mLockUI = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RefreshOpts()
		  RawOptsList.DeleteAllRows()
		  Dim iter As libcURL.Opts.OptionIterator
		  If mShowOnlyModdedOpts Then
		    iter = New libcURL.Opts.OptionIterator(Client.EasyHandle)
		  Else
		    iter = New libcURL.Opts.OptionIterator()
		  End If
		  Do
		    Dim opt As libcURL.Opts.OptionInfo = iter.CurrentOption
		    Dim tp As String = libcURL.Opts.OptionTypeName(opt.Type)
		    Dim vl As String = opt.StringValue(Client.EasyHandle)
		    If opt.IsDeprecated And Not mShowDeprecatedOptions Then Continue
		    Dim nm As String
		    
		    If opt.IsDeprecated Then
		      If mOptNameDisplay > 0 Then nm = "CURLOPT_"
		      If opt.LibraryAlias <> "" Then
		        nm = nm + opt.Name + " (" + opt.LibraryAlias + ")"
		      Else
		        nm = nm + opt.Name + " (Deprecated)"
		      End If
		      
		    Else
		      Select Case mOptNameDisplay
		      Case 0
		        nm = opt.Name
		      Case 1
		        nm = opt.LibraryAlias
		      Case 2
		        nm = opt.BindingAlias
		      End Select
		      
		    End If
		    
		    If opt.Type = libcURL.OptionType.Boolean Then
		      RawOptsList.AddRow(nm, "", tp, opt.DocumentationURL)
		      RawOptsList.CellType(RawOptsList.LastIndex, 1) = Listbox.TypeCheckbox
		      If vl = "True" Then
		        RawOptsList.CellState(RawOptsList.LastIndex, 1) = CheckBox.CheckedStates.Checked
		      Else
		        RawOptsList.CellState(RawOptsList.LastIndex, 1) = CheckBox.CheckedStates.Unchecked
		      End If
		    Else
		      RawOptsList.AddRow(nm, vl, tp, opt.DocumentationURL)
		    End If
		    
		    RawOptsList.RowTag(RawOptsList.LastIndex) = opt
		    
		  Loop Until Not iter.MoveNext()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetUI()
		  mLockUI = True
		  Try
		    AutoDisconnect.Value = Client.EasyHandle.AutoDisconnect
		    Autoreferer.Value = Client.EasyHandle.AutoReferer
		    FailOnError.Value = Client.EasyHandle.FailOnServerError
		    FollowRedirects.Value = Client.EasyHandle.FollowRedirects
		    HTTPCompress.Value = Client.EasyHandle.HTTPCompression
		    HTTPPreserveMethod.Value = Client.EasyHandle.HTTPPreserveMethod
		    NoProgress.Value = Client.EasyHandle.UseProgressEvent
		    Secure.Value = Client.EasyHandle.Secure
		    UseCookies.Value = Client.Cookies.Enabled
		    Verbose.Value = Client.EasyHandle.Verbose
		    YieldOnLoop.Value = Client.Yield
		    
		    If Client.Proxy.Address <> "" Then
		      ProxyServer.Text = Client.Proxy.Address
		      Select Case Client.Proxy.Type
		      Case libcURL.ProxyType.HTTP
		        ProxyTypes.ListIndex = 4
		      Case libcURL.ProxyType.HTTP1_0
		        ProxyTypes.ListIndex = 5
		      Case libcURL.ProxyType.SOCKS4
		        ProxyTypes.ListIndex = 0
		      Case libcURL.ProxyType.SOCKS4A
		        ProxyTypes.ListIndex = 1
		      Case libcURL.ProxyType.SOCKS5
		        ProxyTypes.ListIndex = 2
		      Case libcURL.ProxyType.SOCKS5_HOSTNAME
		        ProxyTypes.ListIndex = 3
		      End Select
		    Else
		      ProxyServer.Text = ""
		      ProxyTypes.ListIndex = -1
		    End If
		    
		    Select Case Client.HTTPVersion
		    Case libcURL.HTTPVersion.None, libcURL.HTTPVersion.HTTP1_1
		      HTTPVer.ListIndex = 0
		    Case libcURL.HTTPVersion.HTTP1_0
		      HTTPVer.ListIndex = 1
		    Case libcURL.HTTPVersion.HTTP2
		      HTTPVer.ListIndex = 2
		    End Select
		    
		    Select Case Client.EasyHandle.SSLVersion
		    Case libcURL.SSLVersion.Default
		      SSLVer.ListIndex = 0
		    Case libcURL.SSLVersion.SSLv2
		      SSLVer.ListIndex = 1
		    Case libcURL.SSLVersion.SSLv3
		      SSLVer.ListIndex = 2
		    Case libcURL.SSLVersion.TLSv1
		      SSLVer.ListIndex = 3
		    Case libcURL.SSLVersion.TLSv1_0
		      SSLVer.ListIndex = 4
		    Case libcURL.SSLVersion.TLSv1_1
		      SSLVer.ListIndex = 5
		    Case libcURL.SSLVersion.TLSv1_2
		      SSLVer.ListIndex = 6
		    End Select
		    
		    If Client.EasyHandle.URL <> "" Then URLField.Text = Client.EasyHandle.URL
		    
		    nic.ListIndex = -1
		    If Client.EasyHandle.NetworkInterface <> Nil Then
		      For i As Integer = 0 To nic.ListCount - 1
		        If nic.RowTag(i) IsA NetworkInterface And NetworkInterface(nic.RowTag(i)).IPAddress = Client.EasyHandle.NetworkInterface.IPAddress Then
		          nic.ListIndex = i
		          Exit For
		        End If
		      Next
		    End If
		    
		    
		    If Client.EasyHandle.CA_ListFile <> Nil Then
		      #If RBVersion > 2019 Then
		        CAListFile.Text = Client.EasyHandle.CA_ListFile.NativePath
		      #Else
		        CAListFile.Text = Client.EasyHandle.CA_ListFile.AbsolutePath
		      #endif
		    Else
		      CAListFile.Text = "Not specified"
		    End If
		    RefreshOpts()
		  Finally
		    mLockUI = False
		  End Try
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunGet(Sender As Thread)
		  #pragma Unused Sender
		  If Not Client.Get(mURL, ThreadStream) Then System.DebugLog("Failed")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunHead(Sender As Thread)
		  #pragma Unused Sender
		  If Not Client.Head(mURL) Then
		    Break
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunPost(Sender As Thread)
		  #pragma Unused Sender
		  If FormValue <> Nil Then
		    If FormValue.Right = FormGenerator.TYPE_URLENCODED Then ' URLEncoded
		      Dim frm() As String = FormValue.Left
		      If Not Client.Post(mURL, frm)Then
		        //meh
		      End If
		    ElseIf FormValue.Right = FormGenerator.TYPE_MULTIPART Then ' Multipart
		      Dim frm As Dictionary = FormValue.Left
		      If Not Client.Post(mURL, frm)Then
		        //meh
		      End If
		    ElseIf FormValue.Right = FormGenerator.TYPE_MIME Then ' MIME
		      Dim frm As Dictionary = FormValue.Left
		      Dim mime As New libcURL.MIMEMessage(Client.EasyHandle, frm)
		      If Not Client.Post(mURL, mime) Then
		        //meh
		      End If
		    Else
		      Break
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RunPut(Sender As Thread)
		  #pragma Unused Sender
		  If mPutTarget <> Nil Then
		    Dim bs As BinaryStream = BinaryStream.Open(mPutTarget)
		    If Not Client.Put(mURL, bs) Then
		      Break
		    End If
		    bs.Close
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowErrorBuffer()
		  If Client.EasyHandle.ErrorBuffer <> "" Then
		    ErrorBuffer.Text = Client.EasyHandle.ErrorBuffer
		    ErrorBuffer.Visible = True
		  Else
		    ErrorBuffer.Visible = False
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateCookieList()
		  If Client.Cookies.Enabled Then
		    CookieList.DeleteAllRows
		    Dim i As Integer = Client.Cookies.Lookup(CookieSearchName.Text, CookieSearchDomain.Text, 0, StrictLookup.Value)
		    Do Until i <= -1
		      Dim expire As String
		      Dim d As Date = Client.Cookies.Expiry(i)
		      If d <> Nil Then expire = libcURL.ParseDate(d)
		      CookieList.AddRow(Client.Cookies.Name(i), Client.Cookies.Value(i), Client.Cookies.Domain(i), expire, Client.Cookies.Path(i))
		      CookieList.CellTag(CookieList.LastIndex, 3) = d
		      CookieList.CellType(CookieList.LastIndex, 5) = Listbox.TypeCheckbox
		      If Client.Cookies.HTTPOnly(i) Then
		        CookieList.CellState(CookieList.LastIndex, 5) = CheckBox.CheckedStates.Checked
		      Else
		        CookieList.CellState(CookieList.LastIndex, 5) = CheckBox.CheckedStates.Unchecked
		      End If
		      CookieList.RowTag(CookieList.LastIndex) = i
		      i = Client.Cookies.Lookup(CookieSearchName.Text, CookieSearchDomain.Text, i + 1, StrictLookup.Value)
		    Loop
		    CookiesTotal.Text = "Cookies known: " + Format(Client.Cookies.Count, "###,###,##0")
		    CookiesShown.Text = "Cookies shown: " + Format(CookieList.ListCount, "###,###,##0")
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
		Private mdlnow As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdltotal As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLockUI As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOptNameDisplay As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPutTarget As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowDeprecatedOptions As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mShowOnlyModdedOpts As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mulnow As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private multotal As Int64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mURL As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorker As Thread
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ThreadStream As BinaryStream
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
#tag Events HSplitter1
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.SplitterNorthSouth
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Me.Width > Me.Height Then 'horizontal
		    Me.Top = Me.Window.MouseY
		  Else
		    Me.Left = Me.Window.MouseX
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  
		  CurlInfo.Height = Me.Top - CurlInfo.Top - 1
		  Debug.Top = Me.Top + Me.Height + 1
		  Debug.Height = Me.Window.Height - Debug.Top - 5
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion > 2012.1 Then
		    #pragma Unused areas
		  #EndIf
		  
		  g.ForeColor = &cC0C0C000
		  g.DrawRect(0, 0, g.Width, g.Height)
		  
		  g.ForeColor = &c80808000
		  g.DrawLine(0.25 * g.Width, 0.25 * g.Height, 0.75 * g.Width, 0.25 * g.Height)
		  g.DrawLine(0.25 * g.Width, 0.75 * g.Height, 0.75 * g.Width, 0.75 * g.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CookieList
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  #pragma Unused column
		  
		  If column <> 3 And Me.Cell(row, 0) = Me.CellTag(row, 0) And Me.Cell(row, 1) = Me.CellTag(row, 1) And Me.Cell(row, 2) = Me.CellTag(row, 2) And _
		    Me.Cell(row, 4) = Me.CellTag(row, 4) Then Return ' no changes
		    
		    Dim n, v, d, p As String
		    Dim h As Boolean
		    Dim e As Date
		    n = Me.Cell(row, 0)
		    v = Me.Cell(row, 1)
		    d = Me.Cell(row, 2)
		    If Me.Cell(row, 3) <> "" Then Call libcURL.ParseDate(Me.Cell(row, 3), e)
		    p = Me.Cell(row, 4)
		    h = Me.CellCheck(row, 4)
		    
		    If Not Client.Cookies.SetCookie(n, v, d, e, p, h) Then
		      Dim err As New libcURL.cURLException(Client.EasyHandle)
		      MsgBox(err.Message)
		      Me.Cell(row, 0) = Me.CellTag(row, 0)
		      Me.Cell(row, 1) = Me.CellTag(row, 1)
		      Me.Cell(row, 2) = Me.CellTag(row, 2)
		      Me.Cell(row, 3) = Me.CellTag(row, 3)
		      Me.Cell(row, 4) = Me.CellTag(row, 4)
		    End If
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim r, c As Integer
		  r = Me.RowFromXY(x, y)
		  c = Me.ColumnFromXY(x, y)
		  If r = -1 Then Return False
		  If Me.RowTag(r) < 0 Then Return False
		  Dim m As New MenuItem("Expire")
		  m.Tag = r
		  base.Append(m)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Expire"
		    Dim i As Integer = hitItem.Tag
		    If i > -1 Then
		      Dim index As Integer = Me.RowTag(i)
		      If MsgBox("Delete this cookie?", 48 + 4, "Confirm deletion") = 6 Then
		        Client.Cookies.Expiry(index) = New Date(1970, 2, 1, 0, 0, 0, 0.0)
		        Me.RemoveRow(i)
		      End If
		      Return True
		    End If
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  If (column = 1 Or column = 3 Or column = 4) And Not IsContextualClick And Me.Selected(row) Then
		    Me.CellTag(row, column) = Me.Cell(row, column)
		    Me.EditCell(row, column)
		    Return True
		  End If
		  Return (column = 5)
		  
		End Function
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  If column = 5 Then
		    Dim a, b As Boolean
		    a = (Me.CellState(row1, column) = CheckBox.CheckedStates.Checked)
		    b = (Me.CellState(row2, column) = CheckBox.CheckedStates.Checked)
		    
		    If a Xor b Then
		      If a And Not b Then
		        result = 1
		      Else
		        result = -1
		      End If
		    End If
		    Return True
		  End If
		  
		  If column = 3 Then
		    Dim d1 As Date = Me.CellTag(row1, 3)
		    Dim d2 As Date = Me.CellTag(row2, 3)
		    Select Case True
		    Case d1 = Nil And d2 = Nil
		      result = 0
		    Case d1 = Nil And d2 <> Nil
		      result = -1
		    Case d1 <> Nil And d2 = Nil
		      result = 1
		    Else
		      Dim s1, s2 As Double
		      s1 = d1.TotalSeconds
		      s2 = d2.TotalSeconds
		      result = Sign(s1 - s2)
		    End Select
		    Return True
		  End If
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CookieLookupButton
	#tag Event
		Sub Action()
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WriteCookies
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetSaveFolderItem(cURLTypes.NetscapeCookieJar, "cookie.jar")
		  If f <> Nil Then
		    If Not Client.Cookies.WriteCookies(f) Then
		      Call MsgBox(libcURL.FormatError(Client.EasyHandle.LastError), 16, "Cookie save failed")
		    Else
		      MsgBox("Cookies saved!")
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReadCookies
	#tag Event
		Sub Action()
		  Dim f As FolderItem = GetOpenFolderItem(cURLTypes.NetscapeCookieJar)
		  If f <> Nil Then
		    Client.Cookies.ReadCookies(f)
		    UseCookies.Value = True
		    Call Client.Cookies.Reload
		    UpdateCookieList()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewCookieSessionButton
	#tag Event
		Sub Action()
		  If Not Client.Cookies.NewSession Then Raise New libcURL.cURLException(Client.EasyHandle)
		  UpdateCookieList()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UseCookies
	#tag Event
		Sub Action()
		  If Not mLockUI Then Client.Cookies.Enabled = Me.Value
		  CookieControl.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HSplitter2
	#tag Event
		Sub MouseEnter()
		  Me.MouseCursor = System.Cursors.SplitterNorthSouth
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  Me.MouseCursor = System.Cursors.StandardPointer
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #pragma Unused X
		  #pragma Unused Y
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Me.Width > Me.Height Then 'horizontal
		    Me.Top = Me.Window.MouseY
		  Else
		    Me.Left = Me.Window.MouseX
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  
		  Headers.Height = Me.Top - Headers.Top - 1
		  DownloadOutput.Top = Me.Top + Me.Height + 1
		  DownloadOutput.Height = Me.Window.Height - DownloadOutput.Top - 5
		End Sub
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics)
		  #If RBVersion > 2012.1 Then
		    #pragma Unused areas
		  #EndIf
		  
		  g.ForeColor = &cC0C0C000
		  g.DrawRect(0, 0, g.Width, g.Height)
		  
		  g.ForeColor = &c80808000
		  g.DrawLine(0.25 * g.Width, 0.25 * g.Height, 0.75 * g.Width, 0.25 * g.Height)
		  g.DrawLine(0.25 * g.Width, 0.75 * g.Height, 0.75 * g.Width, 0.75 * g.Height)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CAListFile
	#tag Event
		Sub Open()
		  #If RBVersion > 2019 Then
		    If Client.EasyHandle.CA_ListFile <> Nil Then Me.Text = Client.EasyHandle.CA_ListFile.NativePath
		  #Else
		    If Client.EasyHandle.CA_ListFile <> Nil Then Me.Text = Client.EasyHandle.CA_ListFile.AbsolutePath
		  #endif
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  #pragma Unused X
		  #pragma Unused Y
		  If Client.EasyHandle.CA_ListFile <> Nil Then
		    Client.EasyHandle.CA_ListFile.Parent.Launch
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
		    Client.EasyHandle.CA_ListFile = f
		    Client.EasyHandle.Secure = False
		    #If RBVersion > 2019 Then
		      CAListFile.Text = Client.EasyHandle.CA_ListFile.NativePath
		    #Else
		      CAListFile.Text = Client.EasyHandle.CA_ListFile.AbsolutePath
		    #endif
		    
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CAUnset
	#tag Event
		Sub Action()
		  Client.EasyHandle.CA_ListFile = Nil
		  Client.EasyHandle.Secure = False
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
		    If Client.EasyHandle.SetOption(libcURL.Opts.SSLCERT, f) Then
		      #If RBVersion > 2019 Then
		        ClientCert.Text = f.NativePath
		      #Else
		        ClientCert.Text = f.AbsolutePath
		      #endif
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
		  Call Client.EasyHandle.SetOption(libcURL.Opts.SSLCERT, Nil)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events nic
	#tag Event
		Sub Open()
		  Dim i As Integer
		  For i = 0 To System.NetworkInterfaceCount - 1
		    Me.AddRow(System.GetNetworkInterface(i).IPAddress)
		    If System.GetNetworkInterface(i).IPAddress <> "0.0.0.0" Then
		      Me.RowTag(i) = System.GetNetworkInterface(i)
		    End If
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  If Me.ListIndex > -1 Then Client.EasyHandle.NetworkInterface = Me.RowTag(Me.ListIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Verbose
	#tag Event
		Sub Open()
		  If Client.EasyHandle.Verbose Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.Verbose = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Secure
	#tag Event
		Sub Open()
		  If Client.EasyHandle.Secure Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.Secure = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPPreserveMethod
	#tag Event
		Sub Open()
		  If Client.EasyHandle.HTTPPreserveMethod Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.HTTPPreserveMethod = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPCompress
	#tag Event
		Sub Open()
		  If Client.EasyHandle.HTTPCompression Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.HTTPCompression = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FollowRedirects
	#tag Event
		Sub Open()
		  If Client.EasyHandle.FollowRedirects Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.FollowRedirects = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Autoreferer
	#tag Event
		Sub Open()
		  If Client.EasyHandle.AutoReferer Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.AutoReferer = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AutoDisconnect
	#tag Event
		Sub Open()
		  If Client.EasyHandle.AutoDisconnect Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.AutoDisconnect = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FailOnError
	#tag Event
		Sub Open()
		  If Client.EasyHandle.FailOnServerError Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.FailOnServerError = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProxyServer
	#tag Event
		Sub TextChange()
		  Client.Proxy.Address = Me.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ProxyTypes
	#tag Event
		Sub Change()
		  Select Case Me.Text
		  Case "Socks 4"
		    Client.Proxy.Type = libcURL.ProxyType.SOCKS4
		  Case "Socks 4A"
		    Client.Proxy.Type = libcURL.ProxyType.SOCKS4A
		  Case "Socks 5"
		    Client.Proxy.Type = libcURL.ProxyType.SOCKS5
		  Case "Socks 5A"
		    Client.Proxy.Type = libcURL.ProxyType.SOCKS5_HOSTNAME
		  Case "HTTP"
		    Client.Proxy.Type = libcURL.ProxyType.HTTP
		  Case "HTTP 1.0"
		    Client.Proxy.Type = libcURL.ProxyType.HTTP1_0
		  End Select
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NoProgress
	#tag Event
		Sub Open()
		  If Client.EasyHandle.UseProgressEvent Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.EasyHandle.UseProgressEvent = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SSLVer
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  Select Case Me.Text
		  Case "TLSv1.X"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.TLSv1
		  Case "SSLv2"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.SSLv2
		  Case "SSLv3"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.SSLv3
		  Case "TLSv1.0"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.TLSv1_0
		  Case "TLSv1.1"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.TLSv1_1
		  Case "TLSv1.2"
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.TLSv1_2
		  Else
		    Client.EasyHandle.SSLVersion = libcURL.SSLVersion.Default
		  End Select
		  
		  Exception err As libcURL.cURLException
		    If err.ErrorNumber = libcURL.Errors.BAD_FUNCTION_ARGUMENT Then
		      Call MsgBox("Unsupported SSL/TLS version", 16, "Option error")
		    Else
		      Raise err
		    End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.Enabled = libcURL.IsFeatureAvailable(libcURL.FeatureType.SSL)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPVer
	#tag Event
		Sub Change()
		  If mLockUI Then Return
		  Select Case Me.Text
		  Case "HTTP/1.1"
		    Client.HTTPVersion = libcURL.HTTPVersion.HTTP1_1
		  Case "HTTP/1.0"
		    Client.HTTPVersion = libcURL.HTTPVersion.HTTP1_0
		  Case "HTTP/2"
		    Try
		      Client.HTTPVersion = libcURL.HTTPVersion.HTTP2
		    Catch Err As libcURL.cURLException
		      If Err.ErrorNumber = libcURL.Errors.UNSUPPORTED_PROTOCOL Then
		        Call MsgBox("HTTP/2 support was not built into the installed version of libcurl.", 16, libcURL.Errors.Name(Err.ErrorNumber))
		        Me.ListIndex = 0
		      Else
		        Raise Err
		      End If
		    End Try
		  End Select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events YieldOnLoop
	#tag Event
		Sub Open()
		  If Client.EasyHandle.FollowRedirects Then
		    Me.State = CheckBox.CheckedStates.Checked
		  Else
		    Me.State = CheckBox.CheckedStates.Unchecked
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  If mLockUI Then Return
		  Client.Yield = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Features
	#tag Event
		Sub Open()
		  Me.AddFolder("Protocols")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.AsyncDNS) Then Me.AddRow("Asynchronous DNS")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.DebugSymbols) Then Me.AddRow("Debug capabilities")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.CharsetConversion) Then Me.AddRow("Encoding conversion")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.LargeFiles) Then Me.AddRow("Files >2GB")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.HTTP2) Then Me.AddRow("HTTP/2")
		  If libcURL.Version.LibZ.IsAvailable Then Me.AddRow("HTTP decompression")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.InternationalDomainNames) Then Me.AddRow("International Domain Names")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.IPv6) Then Me.AddRow("IPv6")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_Kerberos4) Then Me.AddRow("Kerberos 4")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_Kerberos5) Then Me.AddRow("Kerberos 5")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_SSPI) Then Me.AddRow("Microsoft SSPI")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_GSS) Then Me.AddRow("Negotiate auth")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_NTLM) Then Me.AddRow("NTLM auth")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_SPNEGO) Then Me.AddRow("SPNEGO auth")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.SSL) Then Me.AddRow("SSL/TLS security")
		  If libcURL.IsFeatureAvailable(libcURL.FeatureType.Auth_TLS_SRP) Then Me.AddRow("TLS-SRP")
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  If Me.Cell(row, 0) = "Protocols" Then
		    Dim l() As String = libcURL.Version.Protocols
		    l.Sort
		    For i As Integer = UBound(l) DownTo 0
		      Me.InsertRow(row + 1, l(i), 1)
		    Next
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RawOptsList
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  If Asc(Key) = &hCC Then 'F5
		    RefreshOpts()
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  Dim opt As libcURL.Opts.OptionInfo = Me.RowTag(row)
		  Select Case column
		  Case 1 ' value
		    Select Case opt.Type
		    Case libcURL.OptionType.Boolean
		      
		    Case libcURL.OptionType.Ptr, libcURL.OptionType.Subroutine, libcURL.OptionType.Opaque, libcURL.OptionType.List
		      Return False
		    Else
		      Me.CellTag(row, column) = Me.Cell(row, column)
		      Me.CellType(row, column) = Listbox.TypeEditable
		      Me.EditCell(row, column)
		      Return True
		    End Select
		    'Case 3 ' doc url
		    'If opt.DocumentationURL <> "" Then ShowURL(opt.DocumentationURL)
		    'Return True
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  If Me.Selected(row) Then Return False
		  Dim opt As libcURL.Opts.OptionInfo = Me.RowTag(row)
		  Select Case column
		  Case 0 ' name
		    If opt.IsDeprecated Then
		      g.ForeColor = &cFF000000 ' deprecated
		      'If opt.LibraryAlias <> "" Then
		      'g.DrawString(opt.Name + " (Alias " + opt.LibraryAlias + ")", x, y)
		      'Return True
		      'Else
		      'g.DrawString(opt.Name + " (Deprecated)", x, y)
		      'Return True
		      'End If
		    End If
		    
		  Case 1 ' value
		    If opt.Type = libcURL.OptionType.Boolean Then Return False
		    If Me.Cell(row, column) = "" Then
		      g.ForeColor = &c80808000
		      g.Italic = True
		      g.DrawString("default", x, y)
		      Return True
		    End If
		    
		  Case 2 ' type
		    Select Case opt.Type
		    Case libcURL.OptionType.Bitmask, libcURL.OptionType.LargeNumber, libcURL.OptionType.Number
		      g.ForeColor = &c0080FF00
		    Case libcURL.OptionType.Blob, libcURL.OptionType.List, libcURL.OptionType.Opaque, libcURL.OptionType.Ptr, _
		      libcURL.OptionType.Subroutine
		      g.ForeColor = &cFF000000
		    Case libcURL.OptionType.String
		      g.ForeColor = &c8000FF00
		    Case libcURL.OptionType.Boolean
		      g.ForeColor = &c00800000
		    End Select
		    
		    'Case 3 ' doc url
		    'If opt.DocumentationURL <> "" Then
		    'g.ForeColor = &c0000FF00
		    'g.Underline = True
		    'End If
		    
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  If column <> 1 Then Return
		  If mLockUI Then Return
		  If Me.Cell(row, column) <> Me.CellTag(row, column) Or Me.CellType(row, column) = Listbox.TypeCheckbox Then
		    Dim opt As libcURL.Opts.OptionInfo = Me.RowTag(row)
		    Select Case opt.Type
		    Case libcURL.OptionType.Boolean
		      opt.Value(Client.EasyHandle) = Me.CellState(row, column) = CheckBox.CheckedStates.Checked
		    Case libcURL.OptionType.String
		      opt.Value(Client.EasyHandle) = Me.Cell(row, column)
		      
		    Case libcURL.OptionType.List
		      
		    Else
		      opt.Value(Client.EasyHandle) = CType(Val(Me.Cell(row, column)), Integer)
		    End Select
		  End If
		  'RefreshOpts()
		  
		Exception err As TypeMismatchException
		  Me.Cell(row, column) = Me.CellTag(row, column)
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim row, col As Integer
		  row = Me.RowFromXY(x, y)
		  col = Me.ColumnFromXY(x, y)
		  If col <> -1 And row <> -1 Then
		    Dim opt As libcURL.Opts.OptionInfo = Me.RowTag(row)
		    If opt.Type <> libcURL.OptionType.Boolean Then
		      Dim edt As New MenuItem("Edit value")
		      edt.Tag = row:col
		      base.Append(edt)
		    End If
		    
		    Dim rst As New MenuItem("Reset default")
		    rst.Tag = row:col
		    rst.Enabled = Not opt.IsSet(Client.EasyHandle)
		    base.Append(rst)
		    
		    Dim doc As New MenuItem("View documentation...")
		    doc.Tag = opt.DocumentationURL
		    doc.Enabled = (opt.DocumentationURL <> "")
		    base.Append(doc)
		    
		  End If
		  
		  base.Append(New MenuItem(MenuItem.TextSeparator))
		  
		  Dim showmodded As New MenuItem("Show only modified options")
		  If mShowOnlyModdedOpts Then showmodded.Checked = True
		  base.Append(showmodded)
		  
		  Dim showdeprecated As New MenuItem("Show deprecated options")
		  If mShowDeprecatedOptions Then showdeprecated.Checked = True
		  base.Append(showdeprecated)
		  
		  Dim nameopt As New MenuItem("Display")
		  Dim basename As New MenuItem("Names")
		  If mOptNameDisplay = 0 Then basename.Checked = True
		  nameopt.Append(basename)
		  Dim libalias As New MenuItem("Library alias")
		  If mOptNameDisplay = 1 Then libalias.Checked = True
		  nameopt.Append(libalias)
		  Dim bindalias As New MenuItem("Binding alias")
		  If mOptNameDisplay = 2 Then bindalias.Checked = True
		  nameopt.Append(bindalias)
		  
		  base.Append(nameopt)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Text
		  Case "Show only modified options"
		    mShowOnlyModdedOpts = Not mShowOnlyModdedOpts
		    RefreshOpts()
		  Case "Show deprecated options"
		    mShowDeprecatedOptions = Not mShowDeprecatedOptions
		    RefreshOpts()
		    
		  Case "Names"
		    mOptNameDisplay = 0
		    RefreshOpts()
		  Case "Library alias"
		    mOptNameDisplay = 1
		    RefreshOpts()
		  Case "Binding alias"
		    mOptNameDisplay = 2
		    RefreshOpts()
		    
		  Case "View documentation..."
		    Dim url As String = hitItem.Tag
		    If url.Trim <> "" Then ShowURL(url)
		    
		  Else
		    
		    Dim p As Pair = hitItem.Tag
		    Dim row As Integer = p.Left
		    Dim column As Integer = p.Right
		    Select Case hitItem.Text
		    Case "Edit value"
		      Me.EditCell(row, 1)
		      
		    Case "Reset default"
		      Dim opt As libcURL.Opts.OptionInfo = Me.RowTag(row)
		      Select Case opt.Type
		      Case libcURL.OptionType.Boolean
		        opt.Value(Client.EasyHandle) = False
		        Me.CellState(row, column) = CheckBox.CheckedStates.Indeterminate
		      Case libcURL.OptionType.String
		        opt.Value(Client.EasyHandle) = ""
		        Me.Cell(row, column) = ""
		      Else
		        opt.Value(Client.EasyHandle) = 0
		        Me.Cell(row, column) = ""
		      End Select
		    End Select
		  End Select
		  
		  Return True
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Client
	#tag Event
		Function Progress(dlTotal As Int64, dlNow As Int64, ulTotal As Int64, ulNow As Int64) As Boolean
		  mdlnow = dlnow
		  mdltotal = dlTotal
		  mulnow = ulnow
		  multotal = ultotal
		  If App.CurrentThread = Nil Then ' main thread
		    DoProgress()
		  ElseIf ProgressTimer <> Nil Then
		    ProgressTimer.Mode = Timer.ModeSingle
		  End If
		End Function
	#tag EndEvent
	#tag Event
		Sub Error(cURLCode As Integer)
		  #pragma Unused cURLCode
		  Dim w As Writeable = Me.EasyHandle.DownloadStream
		  If w <> Nil And w IsA BinaryStream Then BinaryStream(w).Close
		  ThreadStream = Nil
		  GUITimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub TransferComplete(BytesRead As Integer, BytesWritten As Integer)
		  #pragma Unused BytesRead
		  #pragma Unused BytesWritten
		  multotal = 0
		  mdltotal = 0
		  GUITimer.Mode = Timer.ModeSingle
		  Dim w As Writeable = Me.EasyHandle.DownloadStream
		  If w <> Nil And w IsA BinaryStream Then BinaryStream(w).Close
		  ThreadStream = Nil
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
#tag Events GetBtn
	#tag Event
		Sub Action()
		  Dim bs As BinaryStream
		  If SaveToFileChkBx.Value Then
		    Dim name As String
		    If libcURL.URLParser.IsAvailable Then ' URL parsing API is available
		      Dim u As New libcURL.URLParser(URLField.Text)
		      name = NthField(u.Path, "/", CountFields(u.Path, "/"))
		    End If
		    Dim f As FolderItem = GetSaveFolderItem("", name)
		    If f = Nil Then Return
		    bs = BinaryStream.Create(f, True)
		  End If
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  Client.Get(URLField.Text, bs)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GetThreadBtn
	#tag Event
		Sub Action()
		  mURL = URLField.Text
		  If SaveToFileChkBx.Value Then
		    Dim name As String
		    If libcURL.URLParser.IsAvailable Then ' URL parsing API is available
		      Dim u As New libcURL.URLParser(URLField.Text)
		      name = NthField(u.Path, "/", CountFields(u.Path, "/"))
		    End If
		    Dim f As FolderItem = GetSaveFolderItem("", name)
		    If f = Nil Then Return
		    ThreadStream = BinaryStream.Create(f, True)
		  End If
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  mWorker = New Thread
		  AddHandler mWorker.Run, WeakAddressOf RunGet
		  mWorker.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PutBtn
	#tag Event
		Sub Action()
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  Dim f As FolderItem = GetOpenFolderItem("")
		  Dim bs As BinaryStream = BinaryStream.Open(f)
		  Client.Put(URLField.Text, bs)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PutThreadBtn
	#tag Event
		Sub Action()
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  mPutTarget = GetOpenFolderItem("")
		  mURL = URLField.Text
		  mWorker = New Thread
		  AddHandler mWorker.Run, WeakAddressOf RunPut
		  mWorker.Run
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostBtn
	#tag Event
		Sub Action()
		  If FormValue <> Nil Then
		    PauseButton.Enabled = True
		    ResetButton.Enabled = False
		    AbortButton.Enabled = True
		    Select Case FormValue.Right
		    Case FormGenerator.TYPE_URLENCODED
		      Dim frm() As String = FormValue.Left
		      Client.Post(URLField.Text, frm)
		      
		    Case FormGenerator.TYPE_MULTIPART
		      Dim frm As Dictionary = FormValue.Left
		      Client.Post(URLField.Text, frm)
		      
		    Case FormGenerator.TYPE_MIME
		      Dim frm As Dictionary = FormValue.Left
		      Dim mime As New libcURL.MIMEMessage(Client.EasyHandle, frm)
		      Client.Post(URLField.Text, mime)
		      
		    Else
		      Break
		    End Select
		    
		  Else
		    Call MsgBox("Please specify an HTTP form to be POSTed", 16, "Missing form")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PostThreadBtn
	#tag Event
		Sub Action()
		  If FormValue <> Nil Then
		    PauseButton.Enabled = True
		    ResetButton.Enabled = False
		    AbortButton.Enabled = True
		    mURL = URLField.Text
		    mWorker = New Thread
		    AddHandler mWorker.Run, WeakAddressOf RunPost
		    mWorker.Run
		  Else
		    Call MsgBox("Please specify an HTTP form to be POSTed", 16, "Missing form")
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetFormBtn
	#tag Event
		Sub Action()
		  Dim f As Pair = FormGenerator.CreateForm
		  If f <> Nil Then
		    FormValue = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HeadThreadBtn
	#tag Event
		Sub Action()
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  mURL = URLField.Text
		  mWorker = New Thread
		  AddHandler mWorker.Run, WeakAddressOf RunHead
		  mWorker.Run
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HeadBtn
	#tag Event
		Sub Action()
		  PauseButton.Enabled = True
		  ResetButton.Enabled = False
		  AbortButton.Enabled = True
		  Client.Head(URLField.Text)
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
		  DoProgress()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PauseButton
	#tag Event
		Sub Action()
		  If Me.Caption = "Pause" Then
		    Client.Pause
		    Me.Caption = "Resume"
		    ProgressTimer.Mode = Timer.ModeSingle
		  Else
		    Client.Resume
		    Me.Caption = "Pause"
		    ProgressTimer.Mode = Timer.ModeOff
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AbortButton
	#tag Event
		Sub Action()
		  If Not Client.IsTransferComplete And MsgBox("Are you sure you want to cancel?", 32 + 4, "Confirm cancel") = 6 Then
		    Client.Abort()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResetButton
	#tag Event
		Sub Action()
		  If MsgBox("Reset all options to their default values?", 4 + 48, "Confirm reset") = 6 Then
		    Client.Reset()
		    ResetUI()
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
