Public Class U_Pub_Zwd_VB
    '----------------------------------------------------------------------
    ' ���ܣ�����ģ��-����
    ' -----------------------------
    '
    ' ###                                       By Zhangwd, 2002-06-18
    '----------------------------------------------------------------------
    ' # ##  #    #


    '------------------------------------------------------
    ' ת���ɴ�д����λ��,b1 - ��λ
    '------------------------------------------------------
    Public Shared Function ChineseCapital1(ByVal iNum As Long, Optional ByVal bCapital As Boolean = False, Optional ByVal b1 As Boolean = True) As String
        Select Case iNum
            Case 0 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), "")
            Case 1 : ChineseCapital1 = IIf(b1, IIf(bCapital, "Ҽ", "һ"), IIf(bCapital, "ʰ", "ʮ"))
            Case 2 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), IIf(bCapital, "��", "��"))
            Case 3 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), IIf(bCapital, "Ǫ", "ǧ"))
            Case 4 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), IIf(bCapital, "��", "��"))
            Case 5 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), "")
            Case 6 : ChineseCapital1 = IIf(b1, IIf(bCapital, "½", "��"), "")
            Case 7 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), "")
            Case 8 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), IIf(bCapital, "��", "��"))
            Case 9 : ChineseCapital1 = IIf(b1, IIf(bCapital, "��", "��"), "")
            Case Else
        End Select
    End Function

    '------------------------------------------------------
    ' ת���ɴ�д���ķֽڣ�
    '------------------------------------------------------
    Public Shared Function ChineseCapital4(ByVal iNum As Long, Optional ByVal bCapital As Boolean = False) As String
        Dim i As Long
        Dim ipos As Long
        Dim s As String

        On Error GoTo ReturnError

        ChineseCapital4 = ""

        i = iNum Mod 10000

        ' ��ʾ[ʮ]�Ĵη�
        ipos = 0

        Do Until i = 0
            s = ""

            If i Mod 10 > 0 Then
                ' [��]���� - ��[��]
                s = ChineseCapital1(i Mod 10, bCapital) + ChineseCapital1(ipos, bCapital, False)
            ElseIf ChineseCapital4 <> "" And Left(ChineseCapital4, 1) <> ChineseCapital1(0, bCapital) Then
                ' [��]���ܷ������, ������д
                s = ChineseCapital1(0, bCapital)
            End If

            ChineseCapital4 = s + ChineseCapital4

            ipos = ipos + 1

            i = i \ 10
        Loop

        Exit Function

ReturnError:
        ChineseCapital4 = ""

    End Function

    '------------------------------------------------------
    ' ת���ɴ�д
    '------------------------------------------------------
    Public Shared Function ChineseCapital(ByVal sNum As String, Optional ByVal bCapital As Boolean = False, Optional ByVal bHaveFirstOne As Boolean = False) As String
        Dim i As Long
        Dim ipos As Long
        Dim s As String, s2 As String

        On Error GoTo ReturnError

        ChineseCapital = ""

        i = Val(sNum)

        ' ��ʾ[��]�Ĵη�
        ipos = 0

        Do Until i = 0
            s = ChineseCapital4(i, bCapital)

            If s <> "" Then s = s + ChineseCapital1(ipos * 4, bCapital, False)

            If i Mod 10000 < 1000 And i \ 10000 > 0 Then
                ' [��]���ܷ������, ������д
                If Left(ChineseCapital, 1) <> ChineseCapital1(0, bCapital) Then s = ChineseCapital1(0, bCapital) + s
            End If

            ChineseCapital = s + ChineseCapital

            ipos = ipos + 1
            If ipos = 3 Then ipos = 1

            i = i \ 10000
        Loop

        ' [��]���ܷ���ǰ��
        If Left(ChineseCapital, 1) = ChineseCapital1(0, bCapital) Then ChineseCapital = Right(ChineseCapital, Len(ChineseCapital) - 1)

        ' [һ]���� - [һ]��[ʮ]֮ǰʡ��
        If Len(ChineseCapital) >= 2 And Not bHaveFirstOne Then
            If Left(ChineseCapital, 1) = ChineseCapital1(1, bCapital) _
              And Mid(ChineseCapital, 2, 1) = ChineseCapital1(1, bCapital, False) _
              Then ChineseCapital = Right(ChineseCapital, Len(ChineseCapital) - 1)
        End If

        If Len(ChineseCapital) = 0 Then ChineseCapital = ChineseCapital1(0, bCapital)

        Exit Function

ReturnError:
        ChineseCapital = ""

    End Function


End Class
