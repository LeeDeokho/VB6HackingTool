Attribute VB_Name = "Module_Control"
'Programmed by Chun Dong Hyuk

Private Const MOUSEEVENTF_ABSOLUTE = &H8000
Private Const MOUSEEVENTF_MOVE = &H1
Private Const MOUSEEVENTF_LEFTDOWN = &H2
Private Const MOUSEEVENTF_LEFTUP = &H4
Private Const MOUSEEVENTF_RIGHTDOWN = &H8
Private Const MOUSEEVENTF_RIGHTUP = &H10
Private Const MOUSEEVENTF_MIDDLEDOWN = &H20
Private Const MOUSEEVENTF_MIDDLEUP = &H40
Private Const MOUSEEVENTF_WHEEL = &H800
Private Const MOUSEEVENTF_XDOWN = &H100
Private Const MOUSEEVENTF_XUP = &H200
Private Const MOUSEEVENTF_WHEELDELTA = 120

Private Type PointAPI
    X As Long
    Y As Long
End Type

Private Type MouseInfoType
    X As Integer
    Y As Integer
    Button As Byte
End Type

Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function GetMessageExtraInfo Lib "user32" () As Long
Private Declare Function SetCursorPos Lib "user32.dll" (ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function ImmGetContext Lib "imm32.dll" (ByVal Hwnd As Long) As Long
Private Declare Function ImmSetConversionStatus Lib "imm32.dll" (ByVal hIME As Long, ByVal dw1 As Long, ByVal dw2 As Long) As Long
Private Declare Function WindowFromPointXY Lib "user32" Alias "WindowFromPoint" (ByVal xPoint As Long, ByVal yPoint As Long) As Long
Private Declare Function SystemParametersInfo Lib "user32" Alias "SystemParametersInfoA" (ByVal uAuction As Long, ByVal uParam As Long, ByVal lpvParam As Any, ByVal fuWinIni As Long) As Long
Private Declare Function GetCursorPos Lib "user32" (lpPoint As PointAPI) As Long
Private Declare Sub keybd_event Lib "user32.dll" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Private Declare Sub mouse_event Lib "user32.dll" (ByVal dwFlags As Long, ByVal dX As Long, ByVal dY As Long, ByVal cButtons As Long, ByVal dwExtraInfo As Long)
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Dest As Any, Src As Any, ByVal cb&)

'������ ���콺 ��ư�� ���¸� �����ϴ� ����
Private MouseButtonInfo As Byte
'���� ����ȭ�� �̹����� ���(Wallpaper/OriginalWallpaper)
Private DesktopImageInfo(1) As String
'��������� ����ȭ�� �������θ� �����ϴ� ����
Private RestoreDesktopImage As Byte

'���콺 ��ǥ �� ��ư ������ �����ϴ� ����
Public MouseInfo As MouseInfoType

'���Ű�� ����PC�� ����ȭ�Ѵ�.
Public Sub SetToggleKey(NumLock As Byte, CapsLock As Byte, ScrollLock As Byte)
    'NumLockŰ�� �����Ѵ�.
    If NumLock = 1 Then
      If GetKeyState(&H90) = 0 Then
        keybd_event &H90, 0, 1, GetMessageExtraInfo
        keybd_event &H90, 0, 3, GetMessageExtraInfo
      End If
    Else
      If GetKeyState(&H90) = 1 Then
        keybd_event &H90, 0, 1, GetMessageExtraInfo
        keybd_event &H90, 0, 3, GetMessageExtraInfo
      End If
    End If
    'CapsLockŰ�� �����Ѵ�.
    If CapsLock = 1 Then
      If GetKeyState(&H14) = 0 Then
        keybd_event &H14, 0, 1, GetMessageExtraInfo
        keybd_event &H14, 0, 3, GetMessageExtraInfo
      End If
    Else
      If GetKeyState(&H14) = 1 Then
        keybd_event &H14, 0, 1, GetMessageExtraInfo
        keybd_event &H14, 0, 3, GetMessageExtraInfo
      End If
    End If
    'ScrollLockŰ�� �����Ѵ�.
    If ScrollLock = 1 Then
      If GetKeyState(&H91) = 0 Then
        keybd_event &H91, 0, 1, GetMessageExtraInfo
        keybd_event &H91, 0, 3, GetMessageExtraInfo
      End If
    Else
      If GetKeyState(&H91) = 1 Then
        keybd_event &H91, 0, 1, GetMessageExtraInfo
        keybd_event &H91, 0, 3, GetMessageExtraInfo
      End If
    End If

End Sub

'Ű���� ������ ó���Ѵ�.
Public Sub SetKeyBoardInfo(ButtonFlag As Byte, KeyCode As Byte)
    Select Case ButtonFlag
              'KeyDown
              Case 1
                       keybd_event KeyCode, 0, 1, GetMessageExtraInfo
              'KeyUp
              Case 2
                       keybd_event KeyCode, 0, 3, GetMessageExtraInfo
    End Select

End Sub

'���콺 ������ ó���Ѵ�.
Public Sub SetMouseInfo()
    '���ϴ� ��ǥ�� ���콺 Ŀ���� �̵��Ѵ�.
    If (MouseInfo.Button <> 8) And (MouseInfo.Button <> 9) Then
       SetCursorPos MouseInfo.X, MouseInfo.Y
    End If
    Select Case MouseInfo.Button
            Case 0   'None
                     '������ ���ʹ�ư�� �����־��ٸ�, ������ �����Ѵ�.
                     If MouseButtonInfo = 1 Then
                       mouse_event MOUSEEVENTF_LEFTUP, 0, 0, 0, GetMessageExtraInfo
                     '������ �����ʹ�ư�� �����־��ٸ�, ������ �����Ѵ�.
                     ElseIf MouseButtonInfo = 2 Then
                       mouse_event MOUSEEVENTF_RIGHTUP, 0, 0, 0, GetMessageExtraInfo
                     End If
                     MouseButtonInfo = 0
            Case 1   'Left
                     '������ ���ʹ�ư�� �������� �ʾҴٸ�, ��ư�� �������·� �����Ѵ�.
                     If MouseButtonInfo <> 1 Then
                       mouse_event MOUSEEVENTF_LEFTDOWN, 0, 0, 0, GetMessageExtraInfo
                     End If
                     MouseButtonInfo = 1
            Case 2   'Right
                     '������ �����ʹ�ư�� �������� �ʾҴٸ�, ��ư�� �������·� �����Ѵ�.
                     If MouseButtonInfo <> 2 Then
                       mouse_event MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, GetMessageExtraInfo
                     End If
                     MouseButtonInfo = 2
            Case 3   'Both
                     MouseButtonInfo = 3
            Case 8   'Wheel
                     mouse_event MOUSEEVENTF_WHEEL, 0, 0, MOUSEEVENTF_WHEELDELTA, GetMessageExtraInfo
            Case 9   'Wheel
                     mouse_event MOUSEEVENTF_WHEEL, 0, 0, -MOUSEEVENTF_WHEELDELTA, GetMessageExtraInfo
    End Select

End Sub

'Ű���� �ѱ�/�������� ��ȯ�Ѵ�.
Public Sub ConvertCharactorMode(Flag As Byte)
    Dim PointType As PointAPI
    Dim Handle As Long
    Dim hIME As Long
    '���� ���콺 Ŀ����ġ�� ���Ѵ�.
    GetCursorPos PointType
    '���콺 Ŀ���� ��ġ�� ���� �ڵ��� ���Ѵ�.
    Handle = WindowFromPointXY(PointType.X, PointType.Y)
    '�ڵ��� �̿��Ͽ� IME�� ��ȯ�Ѵ�.
    hIME = ImmGetContext(Handle)
    '�ѱۻ��·� �����Ѵ�.
    If Flag = 1 Then
      ImmSetConversionStatus hIME, &H1, &H0
    '�������·� �����Ѵ�.
    ElseIf Flag = 2 Then
      ImmSetConversionStatus hIME, &H0, &H0
    End If

End Sub



