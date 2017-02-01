VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "File List"
   ClientHeight    =   4050
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   4680
   LinkTopic       =   "Form4"
   ScaleHeight     =   4050
   ScaleWidth      =   4680
   StartUpPosition =   2  'ȭ�� ���
   Begin VB.CommandButton Command4 
      Caption         =   "���� �б�"
      Height          =   375
      Left            =   1320
      TabIndex        =   5
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton Command3 
      Caption         =   "���� ����"
      Height          =   375
      Left            =   120
      TabIndex        =   4
      Top             =   3120
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "����"
      Height          =   375
      Left            =   1320
      TabIndex        =   3
      Top             =   3600
      Width           =   1095
   End
   Begin VB.CommandButton Command1 
      Caption         =   "����"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   3600
      Width           =   1095
   End
   Begin VB.ListBox List1 
      Height          =   2580
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   4455
   End
   Begin VB.TextBox Text1 
      Height          =   270
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   120
      Width           =   4455
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
    On Error Resume Next
    
    If Left(lstFileList.List(lstFileList.ListIndex), 1) <> "[" Then
        Form1.Winsock1.SendData "[E]" & DriverName & ForderName & lstFileList.List(lstFileList.ListIndex)
    End If
End Sub

Private Sub Command2_Click()
    On Error Resume Next
    
    If Left(lstFileList.List(lstFileList.ListIndex), 1) <> "[" Then
        Form1.Winsock1.SendData "[D]" & DriverName & ForderName & lstFileList.List(lstFileList.ListIndex)
    End If
End Sub

Private Sub Command3_Click()
    On Error Resume Next
    
    Dim XTemp() As String
    Dim i As Integer
    
    If ForderName <> "" Then
        XTemp = Split(ForderName, "\")
        
        If UBound(XTemp) = 1 Then
            ForderName = ""
            Form1.Winsock1.SendData "[R]" & DriverName & ForderName & "*.*"
        Else
            ForderName = ""
        
            For i = 0 To UBound(XTemp) - 2 Step 1
                ForderName = ForderName & XTemp(i) & "\"
            Next i
            
            Form1.Winsock1.SendData "[R]" & DriverName & ForderName & "*.*"
        End If
    End If
    
End Sub

Private Sub Command4_Click()
    On Error Resume Next
    
    List1.Clear '// ����Ʈ �ڽ� �ʱ�ȭ
    
    If DriverName = "" Then '// ����̹� �̸� ��� ���� �ʱ�ȭ
        DriverName = "c:\"
    End If
    
    Form1.Winsock1.SendData "[R]" & DriverName & ForderName & "*.*" '// *.*�� ��� ���� ǥ��
    
    txtFileName = DriverName & ForderName & "*.*"
End Sub

Private Sub List1_Click()
    On Error Resume Next
    
    Dim VTemp As String
    Dim TempList As String
    
    If Left(List1.List(List1.ListIndex), 4) = "[..]" Then '// ���� ����
        Command3_Click '// ���� Ŭ�� ���� ���� ���� ����
        Exit Sub
    End If
    
    VTemp = Left(List1.List(List1.ListIndex), 2) '// If ���� ������ ������� �� ����
    TempList = ""
    
    If VTemp = "[-" Then '// ����̺� �̸�
        TempList = Mid$(List1.List(List1.ListIndex), 3, Len(List1.List(List1.ListIndex)))
        DriverName = Mid$(TempList, 1, Len(TempList) - 2) & ":\"
        ForderName = "" '// ����̹��� �ٲ�� ���� ������ ��� Ŭ����
        
        sckFile.SendData "[R]" & DriverName & ForderName & "*.*"
    ElseIf VTemp <> "[-" And Left(List1.List(List1.ListIndex), 1) = "[" Then '// ����
        TempList = Mid$(List1.List(List1.ListIndex), 2, Len(List1.List(List1.ListIndex)))
        ForderName = ForderName & Mid$(TempList, 1, Len(TempList) - 1) & "\"
        
        sckFile.SendData "[R]" & DriverName & ForderName & "*.*"
    End If
    
    txtFileName = DriverName & ForderName & "*.*"
End Sub
