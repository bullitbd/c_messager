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
    Dim nRatio As Double = 1.0 'DEPRECATED
    Dim sRatio As String  'DEPRECATED
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
            pnlMain.Visible = True

        End If
    End Sub 'Page_load

  
    Protected Sub parseContent()

        sContent = txtContent.Text

        '// Parse sContent relative to media type...

        'Reference class
        Dim oParse As ParseEmbed
        oParse = New ParseEmbed(sContent, cboMedia.SelectedIndex)

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
    Function ImageSize() As Integer
        Select Case True
            Case rbNative.Checked
                Return 1
            Case rbFullscreen.Checked
                Return 2
            Case rbCustom.Checked
                Return 3
        End Select
    End Function
    Protected Sub assembleFB()
        Dim iImageSize As Integer = 1

        Dim buildFB As New FBBuilder
        With buildFB
            .mediaType = cboMedia.SelectedText
            .mediaURL = sURL
            .height = sHeight
            .width = sWidth
            .size = ImageSize()
            .thumb = sThumb
            .title = txtTitle.Text
            .caption = txtCaption.Text
            .tip = txtTip.Text
            .infoLink = txtInfoLink.Text
            .print = txtPrint.Text
            .alt = txtAlt.Text
            .linkType = ddnLinkStyle.Text
            .linkText = cboLinkText.SelectedText
        End With

        sText = buildFB.getFB()
        Session("content") = sText
        litPreview.Text = sText
        litPreview.Visible = True
        txtFB.Value = sText
        ''txtMediaType.Text = cboMedia.SelectedItem.Value
        litPreview.Visible = True
        pnlMain.Visible = True
        btnNext.Visible = False
        btnRefresh.Visible = True
        ''If cboMedia.SelectedIndex <> 4 Then 'if Group, leave blank
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
        Dim SubmittedBy As String = cboSubmitted.SelectedValue
        Dim WebSiteURL As String = txtWebsite.Text
        Dim HTMLEmbedTag As String = txtFB.Value '// hidden control

        '&& Dim KeyWords As String = ddlKeywords.Text 'ddlKeyWords.SelectedValue
        Dim InternalNotes As String = txtFbMore.Text
        Dim Message As String = txtTags.Text
        'XX Dim OwnerType As String = txtOwnerType.SelectedValue comes from ds
        Dim Description As String = txtDescription.Text
        Dim Caption As String = txtCaption.Text
        Dim MediaURL As String = txtURL.Text
        Dim MediaType As String = cboMedia.SelectedValue
        Dim Title As String = txtTitle.Text
        Dim ThumbURL As String = txtThumbURL.Text
        Dim LinkStyle As String = ddnLinkStyle.SelectedValue
        Dim LinkText As String = cboLinkText.SelectedText
        Dim Owner As String = cboOwner.SelectedValue
        Dim AlternateText As String = txtAltOld.Text
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
            '&& For Each lstCatItem In lstCategory.Items
            '    If lstCatItem.Selected Then
            '        sCategory = sCategory & lstCatItem.Value & ","
            '    End If
            '&& Next
        End If
        Dim sGroup As String = ""
        '&& Dim iGroup As Integer = lstGroup.SelectedIndex
        'If iGroup > -1 Then
        '    Dim lstGrpItem As New ListItem
        ' For Each lstGrpItem In lstGroup.Items
        'If lstGrpItem.Selected Then
        'sGroup = sGroup & lstGrpItem.Value & ","
        ' End If
        ' Next
        '&& End If
        Dim sAssociatedPE As String = ""
        Dim iPE As Integer = ddlAssociatedPE.SelectedIndex
        If iPE > -1 Then
            Dim lstPEItem As New ListItem
            '&&     For Each lstPEItem In ddlAssociatedPE.Items
            'If lstPEItem.Selected Then
            '    sAssociatedPE = sAssociatedPE & lstPEItem.Value & ","
            'End If
            '&& Next
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
            myCommand.Parameters.AddWithValue("@SubmittedBy", SubmittedBy) 'ddnSubmitted.SelectedValue
            myCommand.Parameters.AddWithValue("@WebSiteURL", WebSiteURL) 'txtWebsite.txt
            myCommand.Parameters.AddWithValue("@HTMLEmbedTag", HTMLEmbedTag) 'txtFB.Text
            '&& myCommand.Parameters.AddWithValue("@KeyWords", KeyWords)
            myCommand.Parameters.AddWithValue("@AssociatedPE", sAssociatedPE)
            myCommand.Parameters.AddWithValue("@InternalNotes", InternalNotes)
            myCommand.Parameters.AddWithValue("@Message", Message)
            '&& myCommand.Parameters.AddWithValue("@OwnerType", OwnerType)
            myCommand.Parameters.AddWithValue("@Description", Description) 'txtDescription.Text
            myCommand.Parameters.AddWithValue("@Caption", Caption) 'txtCaption.Text
            myCommand.Parameters.AddWithValue("@MediaURL", MediaURL) 'txtURL.Text
            myCommand.Parameters.AddWithValue("@MediaType", MediaType) 'cboMedia.SelectedValue
            myCommand.Parameters.AddWithValue("@Title", Title) 'txtTitle.Text
            myCommand.Parameters.AddWithValue("@ThumbURL", ThumbURL) 'txtThumbURL.Text
            myCommand.Parameters.AddWithValue("@LinkStyle", LinkStyle)
            myCommand.Parameters.AddWithValue("@LinkText", LinkText) 'cboLinkText.Text
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

    'Private Sub PopulateDropDown(ByVal lstBoxFrom As DropDownList, ByVal sSQL As String)
    '    lstBoxFrom.DataSource = GetData(sSQL)
    '    lstBoxFrom.DataTextField = "name"
    '    lstBoxFrom.DataValueField = "name"
    '    lstBoxFrom.DataBind()
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Session("login") <> 1 Then
            '    Response.Redirect("Login.aspx")
            'End If
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If
            

        End If
        pnlShowMore.Style.Add("visibility", "hidden")
        pnlShowCustom.Style.Add("visibility", "hidden")
        'btnMore.Attributes.Add("onClick", "return showMore();return false;")

    End Sub
    'New code for calling fbbuilder
    Sub newcode()
        Dim buildFB As New FBBuilder
        With buildFB
            .mediaType = cboMedia.SelectedText
            .mediaURL = txtURL.Text
            .title = txtTitle.Text
            '....
        End With
        Dim HTMLCode As String = buildFB.getFB()

    End Sub
End Class

'//////from Form1_Load
'XX ddnMedia.SelectedIndex = 0
'XX txtContent.Focus()
'XX txtContent.Text = ""
'XX txtContent.Attributes.Add("onfocus", "return clearTextBoxes('txtContent')")

'XX txtWebsite.Text = "Website URL (Generated)"
'XX txtWebsite.Attributes.Add("onfocus", "return clearTextBoxes('txtWebsite')")

'XX txtURL.Text = "URL (Method Generated)"
'XX txtURL.Attributes.Add("onfocus", "return clearTextBoxes('txtURL')")

'XX txtThumbURL.Text = "Thumb URL (Method Generated)"
'XX txtThumbURL.Attributes.Add("onfocus", "return clearTextBoxes('txtThumbURL')")

'XX txtLinkTextOld.Text = "View"
'XX txtLinkTextOld.Attributes.Add("onfocus", "return clearTextBoxes('txtLinkText')")

'XX txtTitle.Text = "Title Caption"
'XX txtTitle.Attributes.Add("onfocus", "return clearTextBoxes('txtTitle')")

'XX txtCaption.Text = "Second Caption"
'XX txtCaption.Attributes.Add("onfocus", "return clearTextBoxes('txtCaption')")

'XX txtNotes.Text = ""
'XX txtNotes.Attributes.Add("onfocus", "return clearTextBoxes('txtNotes')")

'XX txtFbMore.Text = ""
'XX txtFbMore.Attributes.Add("onfocus", "return clearTextBoxes('txtFbMore')")

'XX txtMediaType.Text = "media_type"
'XX txtMediaType.Attributes.Add("onfocus", "return clearTextBoxes('txtMediaType')")

'XX txtDescription.Text = "Required"
'XX txtDescription.Attributes.Add("onfocus", "return clearTextBoxes('txtDescription')")

'XX txtTags.Text = ""
'XX txtTags.Attributes.Add("onfocus", "return clearTextBoxes('txtTags')")

'XX XX txtFB.Text = "FB text"
'XX XX txtFB.Attributes.Add("onfocus", "return clearTextBoxes('txtFB')")


