Public Class U_Pub_Zwd_VB
    '----------------------------------------------------------------------
    ' 功能：公用模块-杂项
    ' -----------------------------
    '
    ' ###                                       By Zhangwd, 2002-06-18
    '----------------------------------------------------------------------
    ' # ##  #    #


    '------------------------------------------------------
    ' 转换成大写（个位）,b1 - 个位
    '------------------------------------------------------
    Public Shared Function ChineseCapital1(ByVal iNum As Long, Optional ByVal bCapital As Boolean = False, Optional ByVal b1 As Boolean = True) As String
        Select Case iNum
            Case 0 : ChineseCapital1 = IIf(b1, IIf(bCapital, "零", "○"), "")
            Case 1 : ChineseCapital1 = IIf(b1, IIf(bCapital, "壹", "一"), IIf(bCapital, "拾", "十"))
            Case 2 : ChineseCapital1 = IIf(b1, IIf(bCapital, "贰", "二"), IIf(bCapital, "佰", "百"))
            Case 3 : ChineseCapital1 = IIf(b1, IIf(bCapital, "叁", "三"), IIf(bCapital, "仟", "千"))
            Case 4 : ChineseCapital1 = IIf(b1, IIf(bCapital, "肆", "四"), IIf(bCapital, "万", "万"))
            Case 5 : ChineseCapital1 = IIf(b1, IIf(bCapital, "伍", "五"), "")
            Case 6 : ChineseCapital1 = IIf(b1, IIf(bCapital, "陆", "六"), "")
            Case 7 : ChineseCapital1 = IIf(b1, IIf(bCapital, "柒", "七"), "")
            Case 8 : ChineseCapital1 = IIf(b1, IIf(bCapital, "捌", "八"), IIf(bCapital, "亿", "亿"))
            Case 9 : ChineseCapital1 = IIf(b1, IIf(bCapital, "玖", "九"), "")
            Case Else
        End Select
    End Function

    '------------------------------------------------------
    ' 转换成大写（四分节）
    '------------------------------------------------------
    Public Shared Function ChineseCapital4(ByVal iNum As Long, Optional ByVal bCapital As Boolean = False) As String
        Dim i As Long
        Dim ipos As Long
        Dim s As String

        On Error GoTo ReturnError

        ChineseCapital4 = ""

        i = iNum Mod 10000

        ' 表示[十]的次方
        ipos = 0

        Do Until i = 0
            s = ""

            If i Mod 10 > 0 Then
                ' [零]处理 - 非[零]
                s = ChineseCapital1(i Mod 10, bCapital) + ChineseCapital1(ipos, bCapital, False)
            ElseIf ChineseCapital4 <> "" And Left(ChineseCapital4, 1) <> ChineseCapital1(0, bCapital) Then
                ' [零]不能放在最后, 不能连写
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
    ' 转换成大写
    '------------------------------------------------------
    Public Shared Function ChineseCapital(ByVal sNum As String, Optional ByVal bCapital As Boolean = False, Optional ByVal bHaveFirstOne As Boolean = False) As String
        Dim i As Long
        Dim ipos As Long
        Dim s As String, s2 As String

        On Error GoTo ReturnError

        ChineseCapital = ""

        i = Val(sNum)

        ' 表示[万]的次方
        ipos = 0

        Do Until i = 0
            s = ChineseCapital4(i, bCapital)

            If s <> "" Then s = s + ChineseCapital1(ipos * 4, bCapital, False)

            If i Mod 10000 < 1000 And i \ 10000 > 0 Then
                ' [零]不能放在最后, 不能连写
                If Left(ChineseCapital, 1) <> ChineseCapital1(0, bCapital) Then s = ChineseCapital1(0, bCapital) + s
            End If

            ChineseCapital = s + ChineseCapital

            ipos = ipos + 1
            If ipos = 3 Then ipos = 1

            i = i \ 10000
        Loop

        ' [零]不能放在前面
        If Left(ChineseCapital, 1) = ChineseCapital1(0, bCapital) Then ChineseCapital = Right(ChineseCapital, Len(ChineseCapital) - 1)

        ' [一]处理 - [一]在[十]之前省略
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
