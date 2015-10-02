Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess

Partial Class Catalog_New
    Inherits System.Web.UI.Page

    Dim sText As String
    Dim sWidth As String
    Dim sHeight As String
    Dim sPercent As String = "100"

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


    '// Page setup
    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Not Page.IsPostBack Then

            Page.Title = "Rocket21 Concierge Add Media"
            litPreview.Visible = False
            pnlMain.Visible = False

            ddnMedia.Items.Add("Media Type")
            ddnMedia.Items.Add("Video")
            ddnMedia.Items.Add("R21 Video")
            ddnMedia.Items.Add("Image")
            ddnMedia.Items.Add("Document")
            ddnMedia.Items.Add("Web Site")
            ddnMedia.Items.Add("Web Page")
            ddnMedia.Items.Add("HTML")

            ddnMedia.SelectedIndex = 0
            txtContent.Focus()

            'txtContent.Text = "Enter Embedd URL etc.,"
            txtContent.Text = ""
            'txtContent.Attributes.Add("onfocus", "return clearTextBoxes('txtContent')")

            'txtWebsite.Text = "Website URL (Generated)"
            'txtWebsite.Attributes.Add("onfocus", "return clearTextBoxes('txtWebsite')")

            'txtURL.Text = "URL (Method Generated)"
            'txtURL.Attributes.Add("onfocus", "return clearTextBoxes('txtURL')")

            'txtThumbURL.Text = "Thumb URL (Method Generated)"
            'txtThumbURL.Attributes.Add("onfocus", "return clearTextBoxes('txtThumbURL')")

            txtLinkText.Text = "View"
            txtLinkText.Attributes.Add("onfocus", "return clearTextBoxes('txtLinkText')")

            'txtTitle.Text = "Title Caption"
            'txtTitle.Attributes.Add("onfocus", "return clearTextBoxes('txtTitle')")

            'txtCaption.Text = "Second Caption"
            'txtCaption.Attributes.Add("onfocus", "return clearTextBoxes('txtCaption')")

            txtNotes.Text = "Notes (this needs to be hooked up..)"
            txtNotes.Attributes.Add("onfocus", "return clearTextBoxes('txtNotes')")

            'txtFbMore.Text = ""
            'txtFbMore.Attributes.Add("onfocus", "return clearTextBoxes('txtFbMore')")

            'txtMediaType.Text = "media_type"
            'txtMediaType.Attributes.Add("onfocus", "return clearTextBoxes('txtMediaType')")

            txtDescription.Text = "Required"
            txtDescription.Attributes.Add("onfocus", "return clearTextBoxes('txtDescription')")

            'txtTags.Text = ""
            'txtTags.Attributes.Add("onfocus", "return clearTextBoxes('txtTags')")

            txtFB.Text = "FB text"
            txtFB.Attributes.Add("onfocus", "return clearTextBoxes('txtFB')")

            ddnSubmitted.Items.Add("Admin")
            ddnSubmitted.Items.Add("Allen")
            ddnSubmitted.Items.Add("Bob")
            ddnSubmitted.Items.Add("Jodell")
            ddnSubmitted.Items.Add("Lisa")
            ddnSubmitted.Items.Add("Marshall")
            ddnSubmitted.Items.Add("Rajiv")
            ddnSubmitted.Items.Add("Steve")

            ddnLinkStyle.Items.Add("Thumb")
            ddnLinkStyle.Items.Add("Text")
            ddnLinkStyle.Items.Add("Button1")

            ''PopulateDropDown(ddnGroup, "SELECT Distinct name from MediaGroups")
            ''ddnGroup.Items.Add("New")
            ''ddnGroup.Items.Insert(0, "Select Group")

            'ddnSuggestedPE.Items.Add("Suggested PEs")
            'ddnInterestedCategories.Items.Add("Interest Categories")
            'ddnGroups.Items.Add("Groups")

            ddnCampaign.Items.Add("Campaign")
            'ddnSystemKeywords.Items.Add("Keywords1")
            'ddnSystemKeywords.Items.Add("Keywords2")
            'ddnSystemKeywords.Items.Add("Keywords3")

            ddnOwnerType.Items.Add("Partner")
            ddnOwnerType.Items.Add("Sponsor")  'Need to put this in as a class...
            ddnOwnerType.Items.Add("Guest")
            ddnOwnerType.Items.Add("Test")

            ddnOwner.Items.Add("NASA")
            ddnOwner.Items.Add("PGF")
            ddnOwner.Items.Add("Option 2")

            'init divs on either side of Display panel
            ''grpdisplayas.Style("display") = "none"
            ''grpshowas.Style("display") = "none"
            ''normhasgrp.Style("display") = "inline"

            ''divGroup.Attributes.Add("style", "visibility:hidden; margin-left:230px;")

            ''gvwMembers.DataSource = GetData("select AutoID,HTMLEmbedTag, Description from ContentPicker where MediaType like 'Image%'")
            ''gvwMembers.DataBind()

        End If
    End Sub 'Page_load

    Protected Sub btnNext_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNext.Click
        firstPass()
    End Sub
    Protected Sub btnRefresh_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRefresh.Click
        parseContent()
    End Sub
    '[TODO] JS code to hide something on panel during refresh
    '[TODO] default ddnMedia given sContent input - see "Experiment" below
    'txtFB.Attributes.Add("Visible", "False")
    Protected Sub firstPass()

        'some tidying up
        If ddnMedia.SelectedIndex = 0 Then
            validstart.Style("display") = "inline"
        Else
            validstart.Style("display") = "none"
            parseContent()
            ''If ddnMedia.SelectedIndex <> 4 Then

            ''Else
            ''    grpdisplayas.Style("display") = "block"  'swap display of divs in Display panel
            ''    grpshowas.Style("display") = "block"
            ''    txtDisplayLbl.Text = "GROUP DISPLAY INFORMATION"
            ''    txtCatLbl.Text = "GROUP CATALOG INFORMATION"
            ''    normhasgrp.Style("display") = "none"
            ''    parserdata.Style("display") = "none"
            ''    sContent = ""

            ''    addGroup()

            ''End If
        End If
    End Sub
    Protected Sub parseContent()

        sContent = txtContent.Text

        '// Parse sContent relative to media type...

        'Reference class
        Dim oParse As ParseEmbed
        oParse = New ParseEmbed(sContent, ddnMedia.SelectedIndex)

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
    Protected Sub addGroup()

        assembleFB()
    End Sub
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
        Dim sDispClass As String = " rc" + Replace(StrConv(ddnMedia.SelectedItem.Value, VbStrConv.ProperCase), " ", "") 'sets second class element according to media type
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
        Dim sLinkText As String = txtLinkText.Text
        Dim sSrcClass As String 'intermediate var in anchorText for actual link - depends on what is passed in sLinkStyle (value of ddnLinkStyle)
        Dim sAnchorText As String 'final constructor, includes <a ...><img...></a>
        dim sImageText as String
        '-------------------------------------------------------------------------------
        '[TODO] Display size routines
        'using this for testing
        If rblImgSize.SelectedIndex = 1 Then  'Full Window
            If ddnMedia.SelectedItem.Value = "Video" Then
                sDispFormat = "sizeRatio:" + sRatio = " " 'sWidth + "/" + sHeight + " "
            Else

            End If
        Else
            If ddnMedia.SelectedItem.Value Like "*R21*Video*" Then
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

        sFbOps = "data-fb-options=""" + sDispFormat + sCaptionText + sDialogText + sGroupOps + txtFbMore.Text + """"
        sText = sPreamble + sFbOps + sAnchorText + "</div>"

        Session("content") = sText
        litPreview.Text = sText
        litPreview.Visible = True
        txtFB.Text = sText
        ''txtMediaType.Text = ddnMedia.SelectedItem.Value
        litPreview.Visible = True
        pnlMain.Visible = True
        btnNext.Visible = False
        btnRefresh.Visible = True
        ''If ddnMedia.SelectedIndex <> 4 Then 'if Group, leave blank
        txtWebsite.Text = sWebSite
        txtWidth.Text = sWidth
        txtHeight.Text = sHeight
        txtPercent.Text = sPercent
        txtRatio.Text = sRatio
        txtURL.Text = sURL
        txtThumbURL.Text = sThumb 'can be thumbUrl or button text or inline text...
        ''Else
        ''chkHasGroup.Enabled = False

        ''End If

    End Sub 'assembleFB

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        parseContent()
        postData()
    End Sub
    Protected Sub postData()
        'Try
        '    If Page.IsValid Then
        Dim iContentID As Integer
        Dim SubmittedBy As String = ddnSubmitted.SelectedValue
        Dim WebSiteURL As String = txtWebsite.Text
        Dim HTMLEmbedTag As String = txtFB.Text
        Dim KeyWords As String = ddlKeyWords.SelectedValue
        Dim InternalNotes As String = txtFbMore.Text
        Dim Message As String = txtTags.Text
        Dim OwnerType As String = ddnOwnerType.SelectedValue
        Dim Description As String = txtDescription.Text
        Dim Caption As String = txtCaption.Text
        Dim MediaURL As String = txtURL.Text
        Dim MediaType As String = ddnMedia.SelectedValue
        Dim Title As String = txtTitle.Text
        Dim ThumbURL As String = txtThumbURL.Text
        Dim LinkStyle As String = ddnLinkStyle.SelectedValue
        Dim LinkText As String = txtLinkText.Text
        Dim Owner As String = ddnOwner.SelectedValue
        Dim AlternateText As String = txtAlt.Text
        Dim HasTip As Boolean = 0
        If chkTip.Checked Then HasTip = 1
        Dim HasInfo As Boolean = 0
        If chkInfo.Checked Then HasInfo = 1
        Dim CanPrint As Boolean = 0
        If chkPrint.Checked Then CanPrint = 1
        ''Dim GroupName As String = ddnGroup.SelectedValue
        ''If GroupName = "New" Then
        ''    GroupName = txtGroupName.Text
        ''End If
        ''Dim MemberIDs As String = ""
        ''Dim I As Integer
        ''For I = 0 To gvwMembers.Rows.Count - 1
        ''    Dim row As GridViewRow = gvwMembers.Rows(I)
        ''    Dim isChecked As Boolean = DirectCast(row.FindControl("chkSelect"), CheckBox).Checked
        ''    If isChecked Then
        ''        MemberIDs = MemberIDs & "," & gvwMembers.Rows(I).Cells(1).Text
        ''    End If
        ''Next
        ''MemberIDs = Mid(MemberIDs, 1)

        Dim sCategory As String = ""
        Dim iCategory As Integer = lstCategory.SelectedIndex
        If iCategory > -1 Then
            Dim lstCatItem As New ListItem
            For Each lstCatItem In lstCategory.Items
                If lstCatItem.Selected Then
                    sCategory = sCategory & lstCatItem.Value & ","
                End If
            Next
        End If
        Dim sGroup As String = ""
        Dim iGroup As Integer = lstGroup.SelectedIndex
        If iGroup > -1 Then
            Dim lstGrpItem As New ListItem
            For Each lstGrpItem In lstGroup.Items
                If lstGrpItem.Selected Then
                    sGroup = sGroup & lstGrpItem.Value & ","
                End If
            Next
        End If
        Dim sAssociatedPE As String = ""
        Dim iPE As Integer = ddlAssociatedPE.SelectedIndex
        If iPE > -1 Then
            Dim lstPEItem As New ListItem
            For Each lstPEItem In ddlAssociatedPE.Items
                If lstPEItem.Selected Then
                    sAssociatedPE = sAssociatedPE & lstPEItem.Value & ","
                End If
            Next
        End If

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

        '    End If
        'Catch ex As Exception
        '    lblStatus.Text = ex.Message
        '    lblStatus.ForeColor = Drawing.Color.Red
        'End Try

    End Sub

    Private Sub PopulateDropDown(ByVal lstBoxFrom As DropDownList, ByVal sSQL As String)
        lstBoxFrom.DataSource = GetData(sSQL)
        lstBoxFrom.DataTextField = "name"
        lstBoxFrom.DataValueField = "name"
        lstBoxFrom.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Session("login") <> 1 Then
            '    Response.Redirect("Login.aspx")
            'End If
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If

        End If
    End Sub
End Class

