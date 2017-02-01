VERSION 5.00
Begin VB.UserControl LunaWindow 
   Appearance      =   0  '���
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   ClientHeight    =   645
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   735
   ControlContainer=   -1  'True
   ForeColor       =   &H00000000&
   KeyPreview      =   -1  'True
   LockControls    =   -1  'True
   PaletteMode     =   4  '����
   ScaleHeight     =   43
   ScaleMode       =   3  '�ȼ�
   ScaleWidth      =   49
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   60
      Top             =   90
   End
End
Attribute VB_Name = "LunaWindow"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'Programmed by Chun Dong Hyuk

Option Explicit

'Mouse Over �̺�Ʈ�� ���� API�� �����Ѵ�.
Private Declare Function GetCursorPos Lib "user32" (lpPoint As PointAPI) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal Hwnd As Long, lpRect As Rect) As Long

'API ���� ���� ����ü
Private Type PointAPI
    X As Long
    Y As Long
End Type

Private Type Rect
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

'����� ���� ��Ʈ�ѿ��� ����� �̺�Ʈ�� �����Ѵ�.
Public Event Click()
Public Event DblClick()
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Public Event MouseOver()
Public Event MouseExit()

'��Ʈ�� ���� ������ ����
Public Enum WindowType
    SingleTitle = 0
    DualTitle = 1
End Enum

'MouseOver ������ ���� �÷��� ����
Private MouseOverFlag As Integer
Private WindowTypeFlag As WindowType
Private TitleColorData(23) As Long

'��Ʈ���� �ڵ��� ��ȯ�Ѵ�.
Public Property Get Hwnd() As Long
    Hwnd = UserControl.Hwnd

End Property

'��Ʈ���� Enabled �Ӽ��� ��ȯ�Ѵ�.
Public Property Get Enabled() As Boolean
    Enabled = UserControl.Enabled

End Property

'��Ʈ���� Enabled �Ӽ��� �����Ѵ�.
Public Property Let Enabled(ByVal Flag As Boolean)
    UserControl.Enabled = Flag
    PropertyChanged "Enabled"
    
End Property

'��Ʈ���� WindowType �Ӽ��� ��ȯ�Ѵ�.
Public Property Get WindowType() As WindowType
    WindowType = WindowTypeFlag

End Property

'��Ʈ���� WindowType �Ӽ��� �����Ѵ�.
Public Property Let WindowType(ByVal Flag As WindowType)
    WindowTypeFlag = Flag
    PropertyChanged "WindowType"
    UserControl_Resize

End Property

'��Ʈ���� ������ ��ȯ�Ѵ�.
Public Property Get BackColor() As OLE_COLOR
    BackColor = UserControl.BackColor

End Property

'��Ʈ���� ������ �����Ѵ�.
Public Property Let BackColor(ByVal Color As OLE_COLOR)
    UserControl.BackColor = Color
    PropertyChanged "BackColor"
    UserControl_Resize
    
End Property

'MouseOver �̺�Ʈ ó���� ���� Ÿ�̸Ӹ� ����Ѵ�.
Private Sub Timer1_Timer()
    On Error Resume Next
    Dim WindowPointAPI As PointAPI
    Dim WindowRect As Rect
    GetCursorPos WindowPointAPI
    GetWindowRect UserControl.Hwnd, WindowRect
    If (WindowRect.Left <= WindowPointAPI.X And WindowRect.Right >= WindowPointAPI.X And WindowRect.Top <= WindowPointAPI.Y And WindowRect.Bottom >= WindowPointAPI.Y) Then
      If MouseOverFlag = 1 Then Exit Sub
      MouseOverFlag = 1
      RaiseEvent MouseOver
    Else
      MouseOverFlag = 0
      Timer1.Enabled = False
      RaiseEvent MouseExit
    End If

End Sub

'��Ʈ�� Ŭ���� Ŭ�� �̺�Ʈ�� �߻��Ѵ�.
Private Sub UserControl_Click()
    RaiseEvent Click

End Sub

'��Ʈ�� ����Ŭ���� ����Ŭ�� �̺�Ʈ�� �߻��Ѵ�.
Private Sub UserControl_DblClick()
    RaiseEvent DblClick

End Sub

'�ʱ� ��Ʈ�� ���� �����Ѵ�.
Private Sub UserControl_Initialize()
    TitleColorData(0) = RGB(120, 162, 223)
    TitleColorData(1) = RGB(117, 160, 221)
    TitleColorData(2) = RGB(114, 158, 219)
    TitleColorData(3) = RGB(111, 156, 218)
    TitleColorData(4) = RGB(109, 153, 216)
    TitleColorData(5) = RGB(109, 153, 216)
    TitleColorData(6) = RGB(107, 152, 215)
    TitleColorData(7) = RGB(104, 150, 214)
    TitleColorData(8) = RGB(102, 148, 212)
    TitleColorData(9) = RGB(100, 146, 211)
    TitleColorData(10) = RGB(97, 144, 210)
    TitleColorData(11) = RGB(94, 141, 208)
    TitleColorData(12) = RGB(91, 139, 206)
    TitleColorData(13) = RGB(89, 138, 205)
    TitleColorData(14) = RGB(85, 135, 204)
    TitleColorData(15) = RGB(83, 133, 202)
    TitleColorData(16) = RGB(81, 132, 202)
    TitleColorData(17) = RGB(79, 130, 200)
    TitleColorData(18) = RGB(76, 127, 197)
    TitleColorData(19) = RGB(73, 126, 196)
    TitleColorData(20) = RGB(71, 124, 195)
    TitleColorData(21) = RGB(68, 121, 193)
    TitleColorData(22) = RGB(66, 120, 193)
    TitleColorData(23) = RGB(66, 120, 193)
    
End Sub

'�ʱ� ��Ʈ�� ũ�⸦ �����Ѵ�.
Private Sub UserControl_InitProperties()
    UserControl.Width = 1500
    UserControl.Height = 1000

End Sub

'��Ʈ�� MouseDown �̺�Ʈ�� ó���Ѵ�.
Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Timer1.Enabled = False
    RaiseEvent MouseDown(Button, Shift, X, Y)

End Sub

'��Ʈ�� MouseMove �̺�Ʈ�� ó���Ѵ�.
Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If MouseOverFlag = 0 Then
      Timer1.Enabled = True
    End If
    RaiseEvent MouseMove(Button, Shift, X, Y)
    
End Sub

'��Ʈ�� MouseUp �̺�Ʈ�� ó���Ѵ�.
Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    Timer1.Enabled = True
    RaiseEvent MouseUp(Button, Shift, X, Y)

End Sub

'��Ʈ�� �Ӽ��� �о �����Ѵ�.
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
    UserControl.BackColor = PropBag.ReadProperty("BackColor", RGB(255, 255, 255))
    WindowTypeFlag = PropBag.ReadProperty("WindowType", SingleTitle)
    
End Sub

'��Ʈ�� �Ӽ��� �����Ѵ�.
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    PropBag.WriteProperty "Enabled", UserControl.Enabled, True
    PropBag.WriteProperty "BackColor", UserControl.BackColor, RGB(255, 255, 255)
    PropBag.WriteProperty "WindowType", WindowTypeFlag, SingleTitle
    
End Sub

'��������� �����츦 �ٽ� �׸���.
Private Sub UserControl_Resize()
    On Error Resume Next
    Dim Count As Integer
    With UserControl
           Cls
           Line (0, 0)-(0, .ScaleHeight - 1), RGB(154, 187, 233)
           Line (0, 0)-(.ScaleWidth - 1, 0), RGB(154, 187, 233)
           Line (.ScaleWidth - 1, 0)-(.ScaleWidth - 1, .ScaleHeight), RGB(49, 88, 143)
           Line (0, .ScaleHeight - 1)-(.ScaleWidth - 1, .ScaleHeight - 1), RGB(49, 88, 143)
           PSet (.ScaleWidth - 1, 0), RGB(66, 120, 193)
           PSet (0, .ScaleHeight - 1), RGB(66, 120, 193)
           For Count = 1 To 24
                 Line (1, Count)-(.ScaleWidth - 1, Count), TitleColorData(Count - 1)
           Next Count
           Select Case WindowTypeFlag
                     Case SingleTitle
                              Line (1, 25)-(2, .ScaleHeight - 2), RGB(66, 120, 193), BF
                              Line (.ScaleWidth - 3, 25)-(.ScaleWidth - 2, .ScaleHeight - 2), RGB(66, 120, 193), BF
                              Line (1, .ScaleHeight - 3)-(.ScaleWidth - 2, .ScaleHeight - 2), RGB(66, 120, 193), BF
                              Line (3, 25)-(.ScaleWidth - 3, 25), RGB(49, 88, 143)
                              Line (3, 25)-(3, .ScaleHeight - 4), RGB(49, 88, 143)
                              Line (3, .ScaleHeight - 4)-(.ScaleWidth - 4, .ScaleHeight - 4), RGB(116, 156, 213)
                              Line (.ScaleWidth - 4, 25)-(.ScaleWidth - 4, .ScaleHeight - 3), RGB(116, 156, 213)
                     Case DualTitle
                              Line (1, 25)-(2, .ScaleHeight - 25), RGB(66, 120, 193), BF
                              Line (.ScaleWidth - 3, 25)-(.ScaleWidth - 2, .ScaleHeight - 25), RGB(66, 120, 193), BF
                              Line (3, 25)-(.ScaleWidth - 3, 25), RGB(49, 88, 143)
                              Line (3, 25)-(3, .ScaleHeight - 25), RGB(49, 88, 143)
                              Line (3, .ScaleHeight - 26)-(.ScaleWidth - 4, .ScaleHeight - 26), RGB(116, 156, 213)
                              Line (.ScaleWidth - 4, 25)-(.ScaleWidth - 4, .ScaleHeight - 25), RGB(116, 156, 213)
                              For Count = 0 To 23
                                    Line (1, .ScaleHeight - 25 + Count)-(.ScaleWidth - 1, .ScaleHeight - 25 + Count), TitleColorData(Count)
                              Next Count
           End Select
    End With
    
End Sub


