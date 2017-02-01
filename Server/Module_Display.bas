Attribute VB_Name = "Module_Display"
'Programmed by Chun Dong Hyuk

Option Explicit

Private Type SafeArrayBound
    cElements As Long
    lLbound As Long
End Type

Private Type SafeArray2D
    cDims As Integer
    fFeatures As Integer
    cbElements As Long
    cLocks As Long
    pvData As Long
    Bounds(0 To 1) As SafeArrayBound
End Type

Private Type BitmapInfoHeader
    biSize As Long
    biWidth As Long
    biHeight As Long
    biPlanes As Integer
    biBitCount As Integer
    biCompression As Long
    biSizeImage As Long
    biXPelsPerMeter As Long
    biYPelsPerMeter As Long
    biClrUsed As Long
    biClrImportant As Long
End Type

Private Type RGBQuad
    RGBBlue As Byte
    RGBGreen As Byte
    RGBRed As Byte
    RGBReserved As Byte
End Type

Private Type BitmapInfo
    bmiHeader As BitmapInfoHeader
    bmiColors() As RGBQuad
End Type

Private Type BitmapInfo16
    bmiHeader As BitmapInfoHeader
    bmiColors(0 To 15) As RGBQuad
End Type

Private Type BitmapInfo256
    bmiHeader As BitmapInfoHeader
    bmiColors(0 To 255) As RGBQuad
End Type

Private Type Rect
    Left As Long
    Top As Long
    Right As Long
    Bottom As Long
End Type

Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal Hwnd As Long) As Long
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long
Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal HDC As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal HDC As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function CreateDIBSection Lib "gdi32" (ByVal HDC As Long, pBitmapInfo As BitmapInfo, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function CreateDIBSection16 Lib "gdi32" Alias "CreateDIBSection" (ByVal HDC As Long, pBitmapInfo As BitmapInfo16, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function CreateDIBSection256 Lib "gdi32" Alias "CreateDIBSection" (ByVal HDC As Long, pBitmapInfo As BitmapInfo256, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function compress Lib "zlib.dll" (Dest As Any, destLen As Any, Src As Any, ByVal srcLen As Long) As Long
Private Declare Function GetWindowRect Lib "user32" (ByVal Hwnd As Long, lpRect As Rect) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

Private Type DisplayInfoType
    '������ ũ��
    DataBufferSize As Long
    '���� ������ ũ��
    OriginalBufferSize As Long
    '���� ��ũ�� ���� �ػ�
    ScreenWidth As Integer
    '���� ��ũ�� ���� �ػ�
    ScreenHeight As Integer
    '��ũ�� �����Ʈ��
    ColorDepth As Integer
    'X��ǥ
    PositionX As Integer
    'Y��ǥ
    PositionY As Integer
End Type

'�̹��� ��� ���� ����
Private Const ImageBlockX As Integer = 5
'�̹��� ��� ���� ����
Private Const ImageBlockY As Integer = 5

'���÷��������� ������ ����ü ����
Private DisplayInfo As DisplayInfoType
'�̹��� ����� ���� ������
Private BlockWidth As Integer
'�̹��� ����� ���� ������
Private BlockHeight As Integer
'�̹��� ������ ĳ�� ����
Private CacheBuffer(ImageBlockX, ImageBlockY) As Long
'���� ���÷��� �����͸� ������ X ����� ��
Private CurrentX As Integer
'���� ���÷��� �����͸� ������ Y ����� ��
Private CurrentY As Integer
'��Ʈ�� �̹��� �迭 ����ü
Private SafeArray As SafeArray2D
'24��Ʈ ��Ʈ�� ���� ����ü
Private BitmapInfo As BitmapInfo
'4��Ʈ ��Ʈ�� ���� ����ü
Private BitmapInfo16 As BitmapInfo16
'8��Ʈ ��Ʈ�� ���� ����ü
Private BitmapInfo256 As BitmapInfo256
'�ӽ� ��Ʈ�� ������Ʈ
Private TempBitmap As Long
'��Ʈ�� ������ �ּ�
Private TempBitmapAddress As Long
'��Ʈ�� DC
Private TempBitmapDC As Long
'��Ʈ�� DIB
Private TempBitmapDIB As Long
'����ũž �ڵ�
Private DesktopHandle As Long
'����ũž DC
Private DesktopDC As Long
'����ũž ũ�� ����ü ����
Private DesktopRect As Rect

'��ũ���� �ڵ�� DC�� ���Ѵ�.
Public Sub ScreenInitialize()
    '��ũ���� �ڵ��� ���Ѵ�.
    DesktopHandle = GetDesktopWindow()
    '��ũ���� DC�� ���Ѵ�.
    DesktopDC = GetDC(DesktopHandle)

End Sub

'���÷��� ������ �����Ѵ�.
Public Sub SendDisplayInfo(ByVal ColorDepth As Byte)
    On Error Resume Next
    Dim ByteBuffer() As Byte
    '�ڵ��� �̿��Ͽ� ��ũ���� ����� ���Ѵ�.
    GetWindowRect DesktopHandle, DesktopRect
    '���� ������ �ػ�/�����Ʈ���� ����Ǿ����� �˻��Ѵ�.
    If (DisplayInfo.ScreenWidth <> DesktopRect.Right) Or (DisplayInfo.ScreenHeight <> DesktopRect.Bottom) Or (DisplayInfo.ColorDepth <> ColorDepth) Then
      '��ũ�� ����� ��������� �����Ѵ�.
      BlockWidth = DesktopRect.Right / ImageBlockX
      BlockHeight = DesktopRect.Bottom / ImageBlockY
      '���� ���÷��� ������ ������ �����Ѵ�.
      DisplayInfo.ScreenWidth = DesktopRect.Right
      DisplayInfo.ScreenHeight = DesktopRect.Bottom
      DisplayInfo.ColorDepth = ColorDepth
      '��ũ���� DIB�� �����Ѵ�.
      CreateDIB
    End If
    Do
         Do Until CurrentY > ImageBlockY
              Do Until CurrentX > ImageBlockX
                   'Ư����ǥ�� ��ũ�� �����͸� ĸ���Ѵ�.
                   DisplayInfo.PositionX = BlockWidth * CurrentX
                   DisplayInfo.PositionY = BlockHeight * CurrentY
                   'ȭ���� ĸ���Ѵ�.
                   ScreenCapture ByteBuffer()
                   If CacheBuffer(CurrentX, CurrentY) <> UBound(ByteBuffer()) Then
                     '���÷��� �����͸� �����Ѵ�.
                     SendData ByteBuffer()
                     CacheBuffer(CurrentX, CurrentY) = UBound(ByteBuffer())
                     CurrentX = CurrentX + 1
                     Exit Sub
                   Else
                     CurrentX = CurrentX + 1
                   End If
                   DoEvents
              Loop
              CurrentX = 0
              CurrentY = CurrentY + 1
         Loop
         CurrentY = 0
    Loop
          
End Sub

'ȭ���� ĸ���Ѵ�.
Private Sub ScreenCapture(ByRef ByteBuffer() As Byte)
    '������ũ��[4]+��ũ������ũ��2]+��ũ������ũ��[2]+�����Ʈ��[2]+X��ǥ[2]+Y��ǥ[2]+����������ũ��[4]+����������..
    On Error Resume Next
    Dim DIBBuffer() As Byte
    Dim TempBuffer() As Byte
    'Ư�� ���� �̹����� ������ DC�� �����Ѵ�.
    BitBlt TempBitmapDC, 0, 0, BlockWidth, BlockHeight, DesktopDC, DisplayInfo.PositionX, DisplayInfo.PositionY, &HCC0020
    ReDim ByteBuffer(DisplayInfo.OriginalBufferSize - 1)
    '���÷��� �����͸� ����Ʈ �迭�� �����Ѵ�.
    CopyMemory ByVal VarPtrArray(DIBBuffer()), VarPtr(SafeArray), 4
    CopyMemory ByteBuffer(0), DIBBuffer(0, 0), DisplayInfo.OriginalBufferSize
    CopyMemory ByVal VarPtrArray(DIBBuffer), 0&, 4
    '���� �ӽù迭�� ũ�⸦ ���Ѵ�.
    DisplayInfo.DataBufferSize = DisplayInfo.OriginalBufferSize + (DisplayInfo.OriginalBufferSize * 0.01) + 12
    ReDim TempBuffer(DisplayInfo.DataBufferSize)
    '�����͸� �����Ѵ�.
    compress TempBuffer(0), DisplayInfo.DataBufferSize, ByteBuffer(0), DisplayInfo.OriginalBufferSize
    '���÷��� ������ �����Ѵ�.
    DisplayInfo.DataBufferSize = DisplayInfo.DataBufferSize + 18
    '����Ʈ �迭 ũ�⸦ �缳���Ѵ�.
    ReDim Preserve ByteBuffer(DisplayInfo.DataBufferSize - 1)
    '���ۿ� ���� ���÷��� ���� �����͸� �����Ѵ�.
    CopyMemory ByteBuffer(0), DisplayInfo, 18
    '������ ���÷��� �����͸� �����Ѵ�.
    CopyMemory ByteBuffer(18), TempBuffer(0), DisplayInfo.DataBufferSize - 18
    
End Sub

'DIB�� �����Ѵ�.
Private Sub CreateDIB()
    '���� DC�� DIB�� �����Ѵٸ� �����Ѵ�.
    If TempBitmapDC <> 0 Then
      If TempBitmapDIB <> 0 Then
        SelectObject TempBitmapDC, TempBitmap
        DeleteObject TempBitmapDIB
      End If
      DeleteObject TempBitmapDC
    End If
    '��Ʈ�� ���� �������� �ʱ�ȭ�Ѵ�.
    TempBitmapDC = 0
    TempBitmapDIB = 0
    TempBitmap = 0
    TempBitmapAddress = 0
    TempBitmapDC = CreateCompatibleDC(0)
    '�̹��� ĳ�� ���۸� Ŭ�����Ѵ�.
    CacheBufferClear
    '�̻���� DC�� �����Ǿ��ٸ�..
    If TempBitmapDC <> 0 Then
      With BitmapInfo.bmiHeader
             .biSize = Len(BitmapInfo.bmiHeader)
             .biWidth = BlockWidth
             .biHeight = BlockHeight
             .biPlanes = 1
             .biBitCount = DisplayInfo.ColorDepth
             .biCompression = 0&
             .biSizeImage = BytesPerScanLine() * .biHeight
              DisplayInfo.OriginalBufferSize = .biSizeImage
      End With
      '��ũ�� �����Ʈ���� ���� ��Ʈ�� ���� ����ü�� �����Ѵ�.
      Select Case DisplayInfo.ColorDepth
                Case 4
                         '4Bit(16Color) �ȷ�Ʈ�� �����Ѵ�.
                         Create4BitPalette
                         'DIB�� �����Ѵ�.
                         TempBitmapDIB = CreateDIBSection16(TempBitmapDC, BitmapInfo16, 0, TempBitmapAddress, 0, 0)
                Case 8
                         '8Bit(256Color) �ȷ�Ʈ�� �����Ѵ�.
                         Create8BitPalette
                         'DIB�� �����Ѵ�.
                         TempBitmapDIB = CreateDIBSection256(TempBitmapDC, BitmapInfo256, 0, TempBitmapAddress, 0, 0)
                Case 24
                         'DIB�� �����Ѵ�.
                         TempBitmapDIB = CreateDIBSection(TempBitmapDC, BitmapInfo, 0, TempBitmapAddress, 0, 0)
      End Select
      '��Ʈ�� �̹��� �迭 ����� �����Ѵ�.
      With SafeArray
            .cDims = 2
            .cbElements = 1
            .Bounds(0).cElements = BitmapInfo.bmiHeader.biHeight
            .Bounds(1).cElements = BytesPerScanLine()
            .pvData = TempBitmapAddress
      End With
      '�̻���� DIB�� �����Ǿ��ٸ� �ӽ� ��Ʈ�� ������Ʈ�� �����Ѵ�.
      If TempBitmapDIB <> 0 Then
        TempBitmap = SelectObject(TempBitmapDC, TempBitmapDIB)
      Else
        DeleteObject TempBitmapDC
        TempBitmapDC = 0
      End If
    End If

End Sub

'���δ� ����Ʈ ����� ���Ѵ�.
Private Function BytesPerScanLine() As Long
    BytesPerScanLine = BitmapInfo.bmiHeader.biWidth * DisplayInfo.ColorDepth
    If BytesPerScanLine Mod 32 > 0 Then
      BytesPerScanLine = BytesPerScanLine + 32 - (BytesPerScanLine Mod 32)
    End If
    BytesPerScanLine = BytesPerScanLine \ 8

End Function

'4Bit(16Color) �ȷ�Ʈ�� �����Ѵ�.
Private Sub Create4BitPalette()
    BitmapInfo16.bmiHeader = BitmapInfo.bmiHeader
    With BitmapInfo16.bmiColors(0)
           .RGBRed = &H0: .RGBGreen = &H0: .RGBBlue = &H0
    End With
    With BitmapInfo16.bmiColors(1)
           .RGBRed = &H80: .RGBGreen = 0: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(2)
           .RGBRed = 0: .RGBGreen = &H80: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(3)
           .RGBRed = &H80: .RGBGreen = &H80: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(4)
           .RGBRed = 0: .RGBGreen = 0: .RGBBlue = &H80
    End With
    With BitmapInfo16.bmiColors(5)
           .RGBRed = &H80: .RGBGreen = 0: .RGBBlue = &H80
    End With
    With BitmapInfo16.bmiColors(6)
           .RGBRed = 0: .RGBGreen = &H80: .RGBBlue = &H80
    End With
    With BitmapInfo16.bmiColors(7)
           .RGBRed = &HC0: .RGBGreen = &HC0: .RGBBlue = &HC0
    End With
    With BitmapInfo16.bmiColors(8)
           .RGBRed = &H80: .RGBGreen = &H80: .RGBBlue = &H80
    End With
    With BitmapInfo16.bmiColors(9)
           .RGBRed = &HFF: .RGBGreen = 0: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(10)
           .RGBRed = 0: .RGBGreen = &HFF: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(11)
           .RGBRed = &HFF: .RGBGreen = &HFF: .RGBBlue = 0
    End With
    With BitmapInfo16.bmiColors(12)
           .RGBRed = 0: .RGBGreen = 0: .RGBBlue = &HFF
    End With
    With BitmapInfo16.bmiColors(13)
           .RGBRed = &HFF: .RGBGreen = 0: .RGBBlue = &HFF
    End With
    With BitmapInfo16.bmiColors(14)
           .RGBRed = 0: .RGBGreen = &HFF: .RGBBlue = &HFF
    End With
    With BitmapInfo16.bmiColors(15)
           .RGBRed = &HFF: .RGBGreen = &HFF: .RGBBlue = &HFF
    End With

End Sub

'8Bit(256Color) �ȷ�Ʈ�� �����Ѵ�.
Private Sub Create8BitPalette()
    Dim ColorR  As Long, ColorG As Long, ColorB As Long
    Dim ResultR As Long, ResultG As Long, ResultB As Long
    Dim Count As Integer
    BitmapInfo256.bmiHeader = BitmapInfo.bmiHeader
    For ColorB = 0 To 256 Step 64
          ResultB = IIf(ColorB = 256, ColorB - 1, ColorB)
          For ColorG = 0 To 256 Step 64
                ResultG = IIf(ColorG = 256, ColorG - 1, ColorG)
                For ColorR = 0 To 256 Step 64
                      ResultR = IIf(ColorR = 256, ColorR - 1, ColorR)
                      With BitmapInfo256.bmiColors(Count)
                            .RGBRed = ResultR
                            .RGBGreen = ResultG
                            .RGBBlue = ResultB
                      End With
                      Count = Count + 1
                Next ColorR
          Next ColorG
    Next ColorB
   
End Sub

'�̹��� ĳ�� ���۸� Ŭ���� �Ѵ�.
Private Sub CacheBufferClear()
    Dim CountX As Integer
    Dim CountY As Integer
    'ĳ�� ���۸� Ŭ�����Ѵ�.
    For CountY = 0 To ImageBlockY
          For CountX = 0 To ImageBlockX
               CacheBuffer(CountX, CountY) = 0
          Next
    Next

End Sub

'���÷��� ������ Ŭ���� �Ѵ�.
Public Sub DisplayInfoClear()
    With DisplayInfo
          .ScreenWidth = 0
          .ScreenHeight = 0
          .ColorDepth = 0
    End With
    
End Sub
