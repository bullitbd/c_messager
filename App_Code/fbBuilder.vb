Imports Microsoft.VisualBasic

Public Class FBBuilder
    Protected sType, sMedia, sURL, sThumb, sTitle, sCaption, sCaption1, sAlt, sLinkStyle, sLinkText, sTip, sInfo, sPrint As String
    Protected sCaptionText As String
    Protected sHeight, sWidth, sPct As String
    Protected iImageSize As Integer
    Protected fbReturn As String
    WriteOnly Property mediaType() As String
        Set(ByVal value As String)
            sType = value
        End Set
    End Property
    WriteOnly Property mediaURL() As String
        Set(ByVal value As String)
            sMedia = value
        End Set
    End Property
    WriteOnly Property thumb() As String
        Set(ByVal value As String)
            sThumb = value
        End Set
    End Property
    WriteOnly Property height() As String
        Set(ByVal value As String)
            sHeight = value
        End Set
    End Property
    WriteOnly Property width() As String
        Set(ByVal value As String)
            sWidth = value
        End Set
    End Property
    WriteOnly Property size() As Integer
        Set(ByVal value As Integer)
            iImageSize = value
        End Set
    End Property
    WriteOnly Property title() As String
        Set(ByVal value As String)
            sTitle = value
            If sTitle <> "" Then
                sCaptionText += "caption:`" + sTitle + "` "
            End If
        End Set
    End Property
    WriteOnly Property caption() As String
        Set(ByVal value As String)
            sCaption = value
            If sCaption <> "" Then
                sCaptionText += "caption2:`" + sCaption + "` "
            End If
        End Set
    End Property
    WriteOnly Property alt() As String
        Set(ByVal value As String)
            sAlt = value
        End Set
    End Property
    WriteOnly Property linkType() As String
        Set(ByVal value As String)
            sLinkStyle = value
        End Set
    End Property
    WriteOnly Property linkText() As String
        Set(ByVal value As String)
            sLinkText = value
        End Set
    End Property
    WriteOnly Property tip() As String
        Set(ByVal value As String)
            sTip = value
        End Set
    End Property
    WriteOnly Property infoLink() As String
        Set(ByVal value As String)
            sInfo = value
        End Set
    End Property
    WriteOnly Property print() As String
        Set(ByVal value As String)
            sPrint=value
        End Set
    End Property
    Public Function getFB() As String
        Return AssembleFB()
    End Function
    Protected Function AssembleFB() As String
        '// FLOATBOX STRING ASSEMBLER
        'PUTS TOGETHER THE FLOATBOX STRINGS TO BE ACTIVATED ON THE FEEDS PAGE, AS FOLLOWS:

        'routine for sText = (1)sPreamble + (2)sFbOps + (3)sAnchorText

        '(1)  preamble
        Dim sFbClass As String = "floatbox"
        Dim sDispClass As String = " rc" + Replace(StrConv(sType, VbStrConv.ProperCase), " ", "") 'sets second class element according to media type
        Dim sPreamble As String = "<div>" + "<a class=""" + sFbClass + " " + sDispClass + """ href=""" + sMedia + """ "

        '(2)   sFbOps = sDispFormat + sCaptionText + sDialogText + sGroupOps + " "
        Dim sDispFormat As String = ""
        '-------------------------------------------------------------------------------
        '[TODO] Display size routines
        'using this for testing
        If iImageSize = 2 Then  'Full Window
            If sMedia = "Video" Then
                'sDispFormat = "sizeRatio:" + sRatio = " " 'sWidth + "/" + sHeight + " "
            Else

            End If
        Else
            If sMedia Like "*R21*Video*" Then
                sDispFormat = "scrolling:no "
            End If
            If sWidth <> "" Then
                sDispFormat = "width:" + sWidth + " "
            End If
            If sHeight <> "" Then
                sDispFormat += "height:" + sHeight + " "
            End If
        End If
        '// End Display size Testing
        '----------------------------------------------------------------------------

        '[TODO]Dim sButton As String = "Full Window" 'placeholder Button declaration for sDispFormat Option group; [DEV] make Display As an option group
        'sCaptionText built above in properties
        Dim sDialogText As String = "" 'collects string data from Info/Tooltip dialog below
        '[TODO] sDialogText - test in properties set FB options vals
        Dim sGroupOps As String = ""
        '[TODO] part of Media_groups code now?  sGroupOps = (sThisGroup + " " + sDoSlide + " " + sDoShow + " " + sEndShow + " ") 
        Dim sFbOps As String = "data-fb-options=""" + sDispFormat + sCaptionText + sDialogText + sGroupOps + """"

        '(3)  sAnchorText
        Dim sAnchorText As String = "" 'final constructor, includes  ...><img...></a>
        'Dim isActive As Boolean = True 'whether a particular image link is active;  normally one image link per gallery...
        'If isActive Then  ' if marked as "active" (meaning visible) link
        Dim sSrcClass As String = "rc" + Replace(StrConv(sLinkStyle, VbStrConv.ProperCase), " ", "") 'linkType css class
        Select Case sLinkStyle   ' tell us which link type – button, text link or thumbnail; sLinkStyle Dim'd to = ddnLinkStyle selected value
            Case "Thumbnail"
                Dim sImageText As String = "<img class=""" + sSrcClass + """ src=""" + sThumb + """ "
                If sAlt <> "" Then
                    sImageText += "alt=""" + sAlt + """ "
                    sAnchorText = " title=""" + sAlt + """>"
                End If
                sAnchorText += ">" + sImageText + "/></a>"
            Case Else
                sAnchorText = "><span class=""" + sSrcClass + """>" + sLinkText + "</span></a>"
        End Select
        'Else
        '    sAnchorText = "</a>"
        'End If  ' isActive

        Dim sText As String = sPreamble + sFbOps + sAnchorText + "</div>"

        Return sText
    End Function
End Class
