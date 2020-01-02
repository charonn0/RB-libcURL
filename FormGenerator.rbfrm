#tag Window
Begin Window FormGenerator
   BackColor       =   "&cFFFFFF"
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   HasBackColor    =   False
   Height          =   2.84e+2
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Edit HTTP Form"
   Visible         =   True
   Width           =   5.61e+2
   Begin PushButton PushButton2
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "-"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   27
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin PushButton PushButton1
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "+"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   6
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   20
   End
   Begin PushButton PushButton3
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "OK"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   470
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton PushButton4
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   386
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Listbox HTTPForm
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   True
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   225
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Form Element	Value"
      Italic          =   False
      Left            =   1
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   560
      _ScrollWidth    =   -1
   End
   Begin PushButton FileAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   0
      Cancel          =   False
      Caption         =   "File"
      Default         =   False
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   49
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   242
      Underline       =   False
      Visible         =   True
      Width           =   36
   End
   Begin RadioButton MultiEncoded
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "multipart/form-data"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   247
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   232
   End
   Begin RadioButton URLEncoded
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "application/x-www-form-urlencoded"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   228
      Underline       =   ""
      Value           =   True
      Visible         =   True
      Width           =   232
   End
   Begin RadioButton MIMEEncoded
      AutoDeactivate  =   True
      Bold            =   ""
      Caption         =   "MIME"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   ""
      Left            =   94
      LockBottom      =   ""
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   ""
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0
      TextUnit        =   0
      Top             =   266
      Underline       =   ""
      Value           =   ""
      Visible         =   True
      Width           =   232
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.Left = Window(1).Left + (Window(1).Width - Me.Width) / 2
		  Me.Top = Window(1).Top + (Window(1).Height - Me.Height) / 2
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CreateForm() As Pair
		  Form = New Dictionary
		  HTTPForm.DeleteAllRows
		  Self.ShowModal()
		  If Form = Nil Then Return Nil
		  Select Case mFormType
		  Case TYPE_URLENCODED ' urlencoded
		    Dim s() As String
		    For Each key As String In Form.Keys
		      s.Append(libcURL.URLEncode(key) + "=" + libcURL.URLEncode(Form.Value(key)))
		    Next
		    Return s:TYPE_URLENCODED
		    
		  Case TYPE_MULTIPART ' multipart
		    Return Form:TYPE_MULTIPART
		    
		  Case TYPE_MIME ' MIME message
		    Return Form:TYPE_MIME
		    
		  End Select
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected Form As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFormType As Integer
	#tag EndProperty


	#tag Constant, Name = TYPE_MIME, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_MULTIPART, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TYPE_URLENCODED, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events PushButton2
	#tag Event
		Sub Action()
		  If HTTPForm.ListIndex > -1 And MsgBox("Remove this form element?", 4 + 48, "Confirm removal") = 6 Then
		    HTTPForm.RemoveRow(HTTPForm.ListIndex)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton1
	#tag Event
		Sub Action()
		  HTTPForm.AddRow("New-Form-Element", "New-Form-Value", "")
		  HTTPForm.CellType(HTTPForm.LastIndex, 0) = Listbox.TypeEditable
		  HTTPForm.EditCell(HTTPForm.LastIndex, 0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton3
	#tag Event
		Sub Action()
		  For i As Integer = 0 To HTTPForm.ListCount - 1
		    If HTTPForm.RowTag(i) <> Nil And HTTPForm.RowTag(i) IsA FolderItem Then
		      Dim f As FolderItem = HTTPForm.RowTag(i)
		      Form.Value(HTTPForm.Cell(i, 0)) = f
		    Else
		      Form.Value(HTTPForm.Cell(i, 0)) = HTTPForm.Cell(i, 1)
		    End If
		  Next
		  
		  Select Case True
		  Case MultiEncoded.Value ' multipart
		    mFormType = TYPE_MULTIPART
		    
		  Case MIMEEncoded.Value ' MIME Message
		    mFormType = TYPE_MIME
		    
		  Else
		    mFormType = TYPE_URLENCODED
		  End Select
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButton4
	#tag Event
		Sub Action()
		  Form = Nil
		  Self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTTPForm
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #pragma Unused x
		  #pragma Unused y
		  Me.EditCell(row, column)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events FileAdd
	#tag Event
		Sub Action()
		  If URLEncoded.Value Then
		    If MsgBox("Change form encoding to 'multipart/form-data'?", 4 + 48, "Current encoding does not support files") = 6 Then
		      MultiEncoded.Value = True
		    Else
		      Return
		    End If
		  End If
		  Dim f As FolderItem = GetOpenFolderItem("")
		  If f <> Nil Then
		    #If RBVersion > 2019 Then
		      HTTPForm.AddRow(f.Name, f.NativePath, "")
		    #Else
		      HTTPForm.AddRow(f.Name, f.AbsolutePath, "")
		    #endif
		    
		    HTTPForm.RowTag(HTTPForm.LastIndex) = f
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MIMEEncoded
	#tag Event
		Sub Open()
		  Me.Enabled = libcURL.MIMEMessage.IsAvailable()
		End Sub
	#tag EndEvent
#tag EndEvents
