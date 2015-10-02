'[TODO] Validate 40 <= iPercent <= 400
'[TODO] Populate txtPct with sPercent
'[TODO] Store old ht/width values

Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess
Partial Class Catalog_JG
    Inherits System.Web.UI.Page
    Dim sText As String
    Dim sWidth As String
    Dim sHeight As String
    Dim sPercent As String = "100"
    Dim sFileDate As String = DateTime.Now.ToString("yymmddhhmmssff")

    'NEW vars - Aspect Ratio, Thumbnail
    Dim nRatio As Double = 1.0
    Dim sRatio As String
    Dim sThumb As String = ""


    Dim sContent As String
    Dim sURL As String

    Dim sWebSite As String
    Dim sCaption As String
    Dim sCaption1 As String

    Dim parsePass As Integer = 0 'parse function counter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            pnlShowMore.Style.Add("visibility", "hidden")
            pnlShowCustom.Style.Add("visibility", "hidden")


        End If
    End Sub
    Protected Sub parseContent()
        Dim iPercent As Integer
        iPercent = CInt(txtPct.Text)
        sContent = txtContent.Text

        '// Parse sContent relative to media type...

        'Reference class
        Dim oParse As New ParseEmbed
        'oParse = New ParseEmbed(sContent, cboMedia.SelectedIndex + 1, iPercent)
        With oParse
            .input = sContent
            .mtype = cboMedia.SelectedIndex + 1
            .pct = iPercent
            .sdate = sFileDate
        End With

        '// Make collection & call the parse class, return collection oParse.results
        Dim oVars As New Dictionary(Of String, String)

        '// Copy oParse.results into local oVars
        oVars = oParse.results

        '// Assign oVars to local vars
        sURL = oVars("url")
        'If parsePass = 0 Then  'Check for existence - if none there, allow entry.
        If oVars("thumb").IndexOf("http://") = 0 Then
            sThumb = oVars("thumb")
            'End If
            'Else
            'If oVars("thumb") = txtThumbURL.Text Then
            'sThumb = oVars("thumb")
        Else
            sThumb = txtThumbURL.Text
        End If

        'End If
        sWebSite = oVars("web")
        sHeight = oVars("height")
        sWidth = oVars("width")
        sRatio = oVars("ratio")
        parsePass += 1
        assembleFB()
    End Sub 'parseContent()


    '@ADD@ BELOW ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


    '   Function ImageSize() As Integer
    '       Select Case True
    '           Case rbNative.Checked
    '               Return 1
    '           Case rbFullscreen.Checked
    '               Return 2
    '           Case rbCustom.Checked
    '               Return 3
    '       End Select
    '   End Function
    '   Protected Sub assembleFB()
    '       Dim iImageSize As Integer = 1

    '       Dim buildFB As New FBBuilder
    '       With buildFB
    '           .mediaType = cboMedia.SelectedText
    '           .mediaURL = sURL
    '           .height = sHeight
    '           .width = sWidth
    '           .size = ImageSize()
    '           .thumb = sThumb
    '           .title = txtTitle.Text
    '           .caption = txtCaption.Text
    '           .tip = txtTip.Text
    '           .infoLink = txtInfoLink.Text
    '           .print = txtPrint.Text
    '           .alt = txtAlt.Text
    '           .linkType = ddnLinkStyle.Text
    '           .linkText = cboLinkText.SelectedText
    '       End With

    '       sText = buildFB.getFB()


    '@ADD@ (& uncomment!) ABOVE ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

    '@REMOVE BELOW ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


    Protected Sub assembleFB()
        '----------------------------------------------------------------------------
        '{TODO] Default LinkStyle and LinkText
        'Dim sLinkStyle As String = ddnLinkStyle.SelectedItem.Value ' - whether link is button, text or thumb; (ddnLinkStyle)
        'Dim sLinkText As String = txtLinkText.Text
        '----------------------------------------------------------------------------

        '// FLOATBOX STRING ASSEMBLER
        'PUTS TOGETHER THE FLOATBOX STRINGS TO BE ACTIVATED ON THE FEEDS PAGE, AS FOLLOWS:

        '   sFbOps = sDispFormat + sCaptionText + sDialogText + sGroupOps + " "
        '   sGroupOps = (sThisGroup + " " + sDoSlide + " " + sDoShow + " " + sEndShow + " ") 
        '   sText = sPreamble + sFbOps + sAnchorText

        Dim sFbClass As String = "floatbox"
        Dim sDispClass As String = " rc" + Replace(StrConv(cboMedia.SelectedValue, VbStrConv.ProperCase), " ", "") 'sets second class element according to media type
        Dim sPreamble As String = "<div>" + "<a class=""" + sFbClass + " " + sDispClass + """ href=""" + sURL + """ "
        Dim sFbOps As String = ""
        Dim sDispFormat As String = ""
        Dim sCaptionText As String = ""
        Dim sAltText As String = ""
        Dim sGroupOps As String = ""
        Dim sDialogText As String = "" 'collects string data from Info/Tooltip dialog below
        Dim sButton As String = "Full Window" 'placeholder Button declaration for sDispFormat Option group; [DEV] make Display As an option group

        Dim isActive As Boolean = True 'whether a particular image link is active;  normally one image link per gallery...
        Dim sLinkStyle As String = ddnLinkStyle.SelectedItem.Value ' - whether link is button, text or thumb; (ddnLinkStyle)
        Dim sLinkIndex As Integer = ddnLinkStyle.SelectedIndex
        Dim sLinkText As String = "" 'txtLinkText.Text
        Dim sSrcClass As String 'intermediate var in anchorText for actual link - depends on what is passed in sLinkStyle (value of ddnLinkStyle)
        Dim sAnchorText As String 'final constructor, includes <a ...><img...></a>
        Dim sImageText As String
        '-------------------------------------------------------------------------------
        '[TODO] Display size routines
        'using this for testing
        If rbNative.Checked Then  'Full Window
            If cboMedia.SelectedValue = "Video" Then
                sDispFormat = "sizeRatio:" + sRatio = " " 'sWidth + "/" + sHeight + " "
            Else

            End If
        Else
            If cboMedia.SelectedValue Like "*R21*Video*" Then
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

        '[FB] sCaptionText - caption options;
        sCaption = txtTitle.Text
        sCaption1 = txtCaption.Text

        If sCaption <> "" Then
            sCaptionText += "caption:`" + sCaption + "` "
        End If
        If sCaption1 <> "" Then
            sCaptionText += "caption2:`" + sCaption1 + "` "
        End If

        '------------------------------------------------------------------------------------------
        '[TODO] Group, Info, Tooltip & Print ops

        '[FB] sDialogText - Info, Print and Tooltip options (http://randomous.com/floatbox/demo#Bonus1) [DEV] INCLUDE PRINT OPTION
        'Dim hasInfo As Boolean
        'Dim hasTip As Boolean
        'Dim canPrint As Boolean

        '[FB]  *****groupOpts – Grouping Options
        'Dim hasGroup As Boolean  'opens group dialog
        '***Assumes a group maintenance dialog based on a groups table;  groups table joined to catalog by group_id.
        ' form: sGroupOps = (sThisGroup + " " + sDoSlide + " " + sDoShow + " " + sEndShow + " ")

        '-------------------------------------------------------------------------------------------

        '// [FB]****anchorText – anchor display;  also forms Proc for above groupOps


        sAltText = txtAlt.Text
        sAnchorText = ""

        If isActive Then  ' if marked as "active" (meaning visible) link
            sSrcClass = "rc" + Replace(StrConv(sLinkStyle, VbStrConv.ProperCase), " ", "")
            Select Case sLinkIndex   ' tell us which link type – button, text link or thumbnail; sLinkStyle Dim'd to = ddnLinkStyle selected value
                Case 0 'thumb
                    sImageText = "<img class=""" + sSrcClass + """ src=""" + sThumb + """ "
                    If sAltText <> "" Then
                        sImageText += "alt=""" + sAltText + """ "
                        sAnchorText = " title=""" + sAltText + """>"
                    End If
                    sAnchorText += ">" & sImageText + "/></a>"
                Case Else
                    sAnchorText = "><span class=""" + sSrcClass + """>" + sLinkText + "</span></a>"
            End Select

        Else
            sAnchorText = "</a>"
        End If  ' isActive

        'sFbOps = "data-fb-options=""" + sDispFormat + sCaptionText + sDialogText + sGroupOps + txtFbMore.Text + """"
        sFbOps = "data-fb-options=""" + sDispFormat + sCaptionText + sDialogText + sGroupOps + """"
        sText = sPreamble + sFbOps + sAnchorText + "</div>"

        '@REMOVE@ ABOVE ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲

        Session("content") = sText
        litPreview.Text = sText
        litPreview.Visible = True
        txtFB.Value = sText
        ''txtMediaType.Text = ddnMedia.SelectedItem.Value
        litPreview.Visible = True
        pnlMain.Visible = True
        'btnNext.Visible = False
        'btnRefresh.Visible = True
        ''If ddnMedia.SelectedIndex <> 4 Then 'if Group, leave blank
        txtWebsite.Text = sWebSite
        txtWidth.Text = sWidth
        txtHeight.Text = sHeight
        'txtPercent.Text = sPercent
        'txtRatio.Text = sRatio
        txtURL.Text = sURL
        txtThumbURL.Text = sThumb 'can be thumbUrl or button text or inline text...
        ''Else
        ''chkHasGroup.Enabled = False

        ''End If

    End Sub 'assembleFB
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        pnlShowMore.Style.Add("visibility", "hidden")
        Call parseContent()
        Call postData()
    End Sub
    Protected Sub postData()
        Dim iContentID As Integer
        Dim SubmittedBy As String = cboSubmitted.SelectedValue
        Dim WebSiteURL As String = txtWebsite.Text
        Dim HTMLEmbedTag As String = txtFB.Value
        Dim KeyWords As String = ddlKeywords.Text
        Dim InternalNotes As String = "" 'txtFbMore.Text
        Dim Message As String = "" 'txtTags.Text
        Dim OwnerType As String = txtOwnerType.Text
        Dim Description As String = txtDescription.Text
        Dim Caption As String = txtCaption.Text
        Dim MediaURL As String = txtURL.Text
        Dim MediaType As String = cboMedia.SelectedValue
        Dim Title As String = txtTitle.Text
        Dim ThumbURL As String = txtThumbURL.Text
        Dim LinkStyle As String = ddnLinkStyle.SelectedValue
        Dim LinkText As String = "" 'txtLinkText.Text
        Dim Owner As String = cboOwner.SelectedValue
        Dim AlternateText As String = txtAlt.Text
        Dim HasTip As Boolean = 0
        If chkTip.Checked Then HasTip = 1
        Dim HasInfo As Boolean = 0
        If chkInfo.Checked Then HasInfo = 1
        Dim CanPrint As Boolean = 0
        If chkPrint.Checked Then CanPrint = 1

        Dim sCategory As String = lstCategory.SelectedValue
        Dim sGroup As String = ddnAssociations.SelectedValue
        Dim sAssociatedPE As String = ddlAssociatedPE.SelectedValue

        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim myCommand = New SqlCommand
            myCommand.Connection = myConnection
            myCommand.CommandType = CommandType.StoredProcedure
            myCommand.CommandText = "sp_ContentPicker_Ins"
            'parameters required for the stpred procedure
            myCommand.Parameters.AddWithValue("@SubmittedBy", SubmittedBy)
            myCommand.Parameters.AddWithValue("@WebSiteURL", WebSiteURL)
            myCommand.Parameters.AddWithValue("@HTMLEmbedTag", HTMLEmbedTag)
            myCommand.Parameters.AddWithValue("@KeyWords", KeyWords)
            myCommand.Parameters.AddWithValue("@AssociatedPE", sAssociatedPE)
            myCommand.Parameters.AddWithValue("@InternalNotes", InternalNotes)
            myCommand.Parameters.AddWithValue("@Message", Message)
            myCommand.Parameters.AddWithValue("@OwnerType", OwnerType)
            myCommand.Parameters.AddWithValue("@Description", Description)
            myCommand.Parameters.AddWithValue("@Caption", Caption)
            myCommand.Parameters.AddWithValue("@MediaURL", MediaURL)
            myCommand.Parameters.AddWithValue("@MediaType", MediaType)
            myCommand.Parameters.AddWithValue("@Title", Title)
            myCommand.Parameters.AddWithValue("@ThumbURL", ThumbURL)
            myCommand.Parameters.AddWithValue("@LinkStyle", LinkStyle)
            myCommand.Parameters.AddWithValue("@LinkText", LinkText)
            myCommand.Parameters.AddWithValue("@Owner", Owner)
            myCommand.Parameters.AddWithValue("@HasTip", HasTip)
            myCommand.Parameters.AddWithValue("@HasInfo", HasInfo)
            myCommand.Parameters.AddWithValue("@CanPrint", CanPrint)
            myCommand.Parameters.AddWithValue("@Tags", Message)
            myCommand.Parameters.AddWithValue("@Height", 1) '[TODO]
            myCommand.Parameters.AddWithValue("@Width", 1)
            myCommand.Parameters.AddWithValue("@AltText", AlternateText)
            myCommand.Parameters.Add("@ContentID", SqlDbType.Int)
            myCommand.Parameters("@ContentID").Direction = ParameterDirection.Output

            myCommand.ExecuteNonQuery()

            iContentID = myCommand.Parameters("@ContentID").Value

            Dim myCommand1 = New SqlCommand
            myCommand1.Connection = myConnection
            myCommand1.CommandType = CommandType.StoredProcedure
            myCommand1.CommandText = "sp_ContentPicker_Modify"
            myCommand1.Parameters.AddWithValue("@AutoID", iContentID)
            myCommand1.Parameters.AddWithValue("@Category", sCategory)
            myCommand1.Parameters.AddWithValue("@Group", sGroup)
            myCommand1.Parameters.AddWithValue("@AssociatedPE", sAssociatedPE)
            myCommand1.ExecuteNonQuery()

            ''If MediaType.Contains("Image") Then
            ''    Dim cmdMedGrps As New SqlCommand
            ''    cmdMedGrps.Connection = myConnection
            ''    cmdMedGrps.CommandType = CommandType.StoredProcedure
            ''    cmdMedGrps.CommandText = "sp_MediaGroups_Ins"
            ''    cmdMedGrps.Parameters.AddWithValue("@ContentPickerID", iContentID)
            ''    cmdMedGrps.Parameters.AddWithValue("@Name", GroupName)
            ''    cmdMedGrps.Parameters.AddWithValue("@Title", Title)
            ''    cmdMedGrps.Parameters.AddWithValue("@Caption", Caption)
            ''    cmdMedGrps.Parameters.AddWithValue("@Display", rbldisplayas.Text)
            ''    cmdMedGrps.Parameters.AddWithValue("@Size", rblImgSize.Text)
            ''    cmdMedGrps.Parameters.AddWithValue("@End", rblshowend.Text)
            ''    cmdMedGrps.Parameters.AddWithValue("@GroupItems", MemberIDs)
            ''    cmdMedGrps.ExecuteNonQuery()
            ''    cmdMedGrps.Dispose()
            ''End If

            myCommand.Dispose()
            myCommand1.Dispose()
            myConnection.Close()

            btnSubmit.Enabled = False

            lblStatus.Text = "Record saved successfully | ContentID: " & iContentID.ToString

        Catch ex As Exception
            lblStatus.Text = ex.Message
        End Try

        lblStatus.Text = "Record saved successfully | ContentID: " & iContentID.ToString


    End Sub

    Protected Sub btnMore_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnMore.Click
        Call parseContent()
        'pnlShowMore.Visible = True
        pnlShowMore.Style.Add("visibility", "show")
    End Sub
End Class
