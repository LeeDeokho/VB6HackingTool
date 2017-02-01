Attribute VB_Name = "Module_Process"
'Programmed by Chun Dong Hyuk

Option Explicit

Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal Hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal Hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal cb&)
'���α׷��� �ʱ�ȭ�Ѵ�.
Public Sub Initialize()
    On Error GoTo ErrorProcess
    '�ߺ������� ��� �����Ѵ�.
    If App.PrevInstance Then End
    Dim Temp As String
    With Form_Main
           '��Ʈ��ȣ ������ ���� ������ �ݴ´�.
           .Winsock1.Close
           '��Ʈ�� ���� ��Ʈ��ȣ 30308
           .Winsock1.LocalPort = 30308
           '������ ����Ѵ�.
           .Winsock1.Listen
    End With
    '��ũ�� �ڵ�� DC�� ���Ѵ�.
    ScreenInitialize
    Exit Sub
ErrorProcess:
    '���� ���Ӵ���� ������ �߻��ϸ� ���α׷��� �����Ѵ�.
    End
    
End Sub

'�������� ��Ʈ�� �����͸� �����Ѵ�.
Public Sub SendData(Buffer() As Byte)
    On Error Resume Next
    Form_Main.Winsock1.SendData Buffer()
    
End Sub

'�������κ��� ������ �����͸� ����/ó���Ѵ�.
Public Sub ReceiveBufferProcess(ByRef Buffer() As Byte, BufferSize As Long)
    Dim Address As Long
    Do Until Address = BufferSize
         Select Case Buffer(Address)
                    '���÷��� ���� ���� �ʱ�ȭ
                    Case 1
                             'NumLock/CapsLock/ScrollLock Ű�� ����PC ���¿� ����ȭ�Ѵ�.
                             SetToggleKey Buffer(Address + 4), Buffer(Address + 5), Buffer(Address + 6)
                             '���÷��� �����͸� �����Ѵ�.
                             SendDisplayInfo Buffer(Address + 1)
                             Address = Address + 7
                    '���÷��� ������ ��û
                    Case 2
                             '���÷��� �����͸� �����Ѵ�.
                             SendDisplayInfo Buffer(Address + 1)
                             Address = Address + 2
                    '�ѱ�/���� ��� ��ȯ
                    Case 3
                             '�ѱ�/���� ��ȯ�ڵ尡 ������ ��带 �ٲ۴�.
                             ConvertCharactorMode Buffer(Address + 1)
                             Address = Address + 2
                    'Ű���� ����
                    Case 4
                             'Ű���� ������ ó���Ѵ�.
                             SetKeyBoardInfo Buffer(Address + 1), Buffer(Address + 2)
                             Address = Address + 3
                    '���콺 ����
                    Case 5
                             '���콺 ������ ó���Ѵ�.
                             CopyMemory MouseInfo, Buffer(Address + 1), 5
                             SetMouseInfo
                             Address = Address + 6
         End Select
    Loop
   
End Sub

'�ֻ��� ������� �����Ѵ�.
Public Sub SetTopWindow(Handle As Long)
    SetWindowPos Handle, -1, 0, 0, 10, 10, &H1

End Sub

'Control Move�� �����ϱ� ���� �Լ�
Public Sub ControlDrag(ByVal Hwnd As Long)
    ReleaseCapture
    SendMessage Hwnd, &HA1, 2, 0&

End Sub

'Control Resize�� �����ϱ� ���� �Լ�
Public Sub ControlResize(ByVal Hwnd As Long)
    ReleaseCapture
    SendMessage Hwnd, &HA1, 17, 0&

End Sub

'������Ʈ������ ���� �о���δ�.
Public Function GetRegistry(Root As Long, SubKey As String, ValueTitle As String) As String
    On Error Resume Next
    Dim Buffer1 As Long
    Dim Buffer2 As Long
    Dim Buffer3 As String * 255
    If RegOpenKeyEx(Root, SubKey, 0, 983103, Buffer2) <> 0 Then
      GetRegistry = ""
      RegCloseKey Buffer2
      Exit Function
    End If
    If RegQueryValueEx(Buffer2, ValueTitle, 0, Buffer1, ByVal Buffer3, 255) = 0 And Buffer1 = 1 Then
      GetRegistry = Mid$(Buffer3, 1, InStr(Buffer3, Chr$(0)) - 1)
    Else
      GetRegistry = ""
    End If
    RegCloseKey Buffer2
           
End Function

'������Ʈ���� ���� �����Ѵ�.
Public Sub SetRegistry(Root As Long, SubKey As String, ValueTitle As String, Value As String)
    On Error Resume Next
    Dim Buffer As Long
    RegCreateKey Root, SubKey, Buffer
    RegSetValueEx Buffer, ValueTitle, 0, 1, ByVal Value, XLen(Value) + 1
    RegCloseKey Buffer
          
End Sub

'�����ڵ� ���ڿ� Len �Լ�
Public Function XLen(Buffer As String) As Integer
    On Error Resume Next
    XLen = Val(LenB(StrConv(Buffer, vbFromUnicode)))

End Function

