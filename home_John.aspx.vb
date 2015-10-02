Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess
Imports System.Web.HttpUtility
Imports System.Net
Imports System.IO
Imports Obout.Ajax.UI

Partial Class home_John
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'If Session("login") <> 1 Then
            '    Response.Redirect("Login.aspx")
            'End If
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If

            Dim sSQL As String
            If Request.QueryString.Count > 0 Then
                If Not (Request.QueryString("sentid") Is Nothing) Then
                    sSQL = "EXEC sp_GetSentDetails " & Request.QueryString("sentid").ToString
                    Dim sData As DataTable = GetData(sSQL)
                    sSQL = "EXEC sp_GetMembersFromSent " & Request.QueryString("sentid").ToString
                    Call PopulateListBox(ListInterests, sSQL)
                    sSQL = "EXEC sp_GetMembersFromSent " & Request.QueryString("sentid").ToString & ",1"
                    Call PopulateListBox(ListInterestsNew, sSQL)
                    'sSQL = "EXEC sp_GetRecipientsFromDraft " & Request.QueryString("draftid").ToString & ",1"
                    'Call PopulateListBox(ListUsers, sSQL)
                    sSQL = "EXEC sp_GetRecipientsFromSent " & Request.QueryString("sentid").ToString
                    Call PopulateListBox(ListUsersNew, sSQL)
                    sSQL = "EXEC sp_GetConciergeGroupsFromSent " & Request.QueryString("sentid").ToString
                    Call PopulateGroupListBox(ListGroupsNew, sSQL)

                    Call PopulateIcons(sData.Rows(0)("icon_url").ToString)
                    Call PopulateWrapper(sData.Rows(0)("wrapper_text").ToString)
                    txtSubject.Text = sData.Rows(0)("title").ToString
                    'Editor.Text = sData.Rows(0)("body").ToString
                    Editor.Content = sData.Rows(0)("body").ToString
                    txtMedia.Text = sData.Rows(0)("media_text").ToString
                    CPID.Value = sData.Rows(0)("content_picker_id").ToString
                    DraftID.Value = 0
                    litPreview.Text = sData.Rows(0)("media_text").ToString
                    litPreview.Visible = True
                    sData.Dispose()

                    btnSend.Attributes.Add("onclick", "return SendMails()")
                    'btnSaveDraft.Visible = False
                    btnSaveDraft.Attributes.Add("onclick", "return SaveDraft()")
                    txtSubject.Attributes.Add("onfocus", "return clearSubject()")
                    lblCount.Text = GetUsersCount()
                    hidUsers.Value = GetListBoxContent(ListUsersNew)
                    hidMembers.Value = GetListBoxContent(ListInterestsNew)
                    hidGroups.Value = GetListBoxContent(ListGroupsNew)
                ElseIf Not (Request.QueryString("draftid") Is Nothing) Then
                    sSQL = "EXEC sp_GetDraftDetails " & Request.QueryString("draftid").ToString
                    Dim sData As DataTable = GetData(sSQL)
                    sSQL = "EXEC sp_GetMembersFromDraft " & Request.QueryString("draftid").ToString
                    Call PopulateListBox(ListInterests, sSQL)
                    sSQL = "EXEC sp_GetMembersFromDraft " & Request.QueryString("draftid").ToString & ",1"
                    Call PopulateListBox(ListInterestsNew, sSQL)
                    'sSQL = "EXEC sp_GetRecipientsFromDraft " & Request.QueryString("draftid").ToString & ",1"
                    'Call PopulateListBox(ListUsers, sSQL)
                    sSQL = "EXEC sp_GetRecipientsFromDraft " & Request.QueryString("draftid").ToString
                    Call PopulateListBox(ListUsersNew, sSQL)
                    sSQL = "EXEC sp_GetConciergeGroupsFromDraft " & Request.QueryString("draftid").ToString
                    Call PopulateGroupListBox(ListGroupsNew, sSQL)

                    Call PopulateIcons(sData.Rows(0)("icon_url").ToString)
                    Call PopulateWrapper(sData.Rows(0)("wrapper_text").ToString)
                    txtSubject.Text = sData.Rows(0)("title").ToString
                    'Editor.Text = sData.Rows(0)("body").ToString
                    Editor.Content = sData.Rows(0)("body").ToString
                    txtMedia.Text = sData.Rows(0)("media_text").ToString
                    txtUpdatedBy.Text = sData.Rows(0)("updated_by").ToString
                    txtUpdatedNotes.Text = sData.Rows(0)("update_notes").ToString
                    CPID.Value = sData.Rows(0)("content_picker_id").ToString
                    DraftID.Value = Request.QueryString("draftid").ToString
                    litPreview.Text = sData.Rows(0)("media_text").ToString
                    litPreview.Visible = True
                    sData.Dispose()

                    btnSend.Attributes.Add("onclick", "return SendMails()")
                    btnUpdateDraft.Attributes.Add("onclick", "return SaveDraft()")
                    btnSaveDraft.Visible = False
                    pnlUpdate.Visible = True
                    txtSubject.Attributes.Add("onfocus", "return clearSubject()")
                    lblCount.Text = GetUsersCount()
                    hidUsers.Value = GetListBoxContent(ListUsersNew)
                    hidMembers.Value = GetListBoxContent(ListInterestsNew)
                    hidGroups.Value = GetListBoxContent(ListGroupsNew)
                Else

                End If
            Else
                sSQL = "EXEC sp_GetMembersFromDraft"
                Call PopulateListBox(ListInterests, sSQL)
                Call PopulateIcons("http://r21concierge.s3.amazonaws.com/images/concierge.png")
                Call PopulateWrapper("R21 RECOMMENDS")

                btnSend.Attributes.Add("onclick", "return SendMails()")
                btnSaveDraft.Attributes.Add("onclick", "return SaveDraft()")
                'btnPreview.Attributes.Add("onclick", "return PreviewMsg()")
                txtSubject.Attributes.Add("onfocus", "return clearSubject()")
                'txtMsg.Attributes.Add("onfocus", "return clearMsg()")
                lblCount.Text = GetUsersCount()
                DraftID.Value = 0
                Dim MyReferrer As String = ""
                If Not Request.ServerVariables("HTTP_REFERER") Is Nothing Then
                    MyReferrer = LCase(Request.ServerVariables("HTTP_REFERER"))
                End If
                If MyReferrer.Contains("catalognew.aspx") Then
                    'Editor.Content = Session("content")
                    'txtMsg.Value = Session("content")
                    txtMedia.Text = Session("content")
                    litPreview.Text = Session("content")
                    Session("content") = ""
                    'Rajiv: 01/27/2011: Commented lines 62, 65, 66 to enable autopost back for ListUser selected index changed. 
                    'Call PopulateListBox(ListUsers, "SELECT id, login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' Else '' END  AS name FROM Rocket21.R21EY.users WHERE Login not in ('child5','child7','child9') ORDER BY login")
                    Call PopulateListBox(ListUsersNew, "SELECT id, u.login AS name FROM Rocket21.R21EY.users u where [login] in ('child5','child7','child9')")
                    hidUsers.Value = GetListBoxContent(ListUsersNew)
                    'Else
                    'Call PopulateListBox(ListUsers, "SELECT id, login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' Else '' END  AS name FROM Rocket21.R21EY.users ORDER BY login")
                End If
            End If
        End If
    End Sub
    Private Sub PopulateWrapper(ByVal sSelected As String)
        lstWrapper.Items.Add("HEY - TAKE A LOOK AT THIS!")
        lstWrapper.Items.Add("R21 RECOMMENDS")
        lstWrapper.Items.Add("WE THINK YOU WOULD BE INTERESTED")
        lstWrapper.Items.Add("NEW...")
        Dim I As Integer
        For I = 0 To lstWrapper.Items.Count - 1
            If lstWrapper.Items(I).Value = sSelected Then
                lstWrapper.Items(I).Selected = True
                txtWrapper.Text = lstWrapper.Items(I).Text
            End If
        Next
    End Sub
    Private Sub PopulateIcons(ByVal sSelected As String)
        Dim MyIcons = New Hashtable
        'MyIcons.Add("R21", "http://r21_staging.s3.amazonaws.com/avatars/419/s41x49/AdminLogo.png")
        MyIcons.Add("Concierge", "http://r21concierge.s3.amazonaws.com/images/concierge.png")
        lstType.DataSource = MyIcons
        lstType.DataValueField = "value"
        lstType.DataTextField = "key"
        lstType.DataBind()
        Dim I As Integer
        For I = 0 To lstType.Items.Count - 1
            If lstType.Items(I).Value = sSelected Then
                lstType.Items(I).Selected = True
                txtIconURL.Text = lstType.Items(I).Value
                imgIcon.ImageUrl = lstType.Items(I).Value
                imgIcon.ToolTip = lstType.Items(I).Text
            End If
        Next
    End Sub
    Private Sub PopulateListBox(ByVal lstBoxFrom As ListBox, ByVal sSQL As String)
        lstBoxFrom.DataSource = GetData(sSQL)
        lstBoxFrom.DataTextField = "name"
        lstBoxFrom.DataValueField = "id"
        lstBoxFrom.DataBind()
    End Sub

    Private Sub MoveItems(ByVal lstBoxFrom As ListBox, ByVal lstBoxTo As ListBox)
        Dim I As Integer
        Dim crItem As ListItem
        For I = lstBoxFrom.Items.Count - 1 To 0 Step -1
            If lstBoxFrom.Items(I).Selected Then
                'check if the item already exists in the lstBoxTo
                crItem = lstBoxTo.Items.FindByValue(lstBoxFrom.Items(I).Value)
                If crItem Is Nothing Then
                    lstBoxTo.Items.Add(lstBoxFrom.Items(I))
                    lstBoxTo.ClearSelection()
                    'lstBoxFrom.Items.Remove(lstBoxFrom.Items(I))
                Else
                    lstBoxTo.ClearSelection()
                    lstBoxFrom.Items.Remove(lstBoxFrom.Items(I))
                    'lblStatus.Text = lstBoxFrom.Items(I).Text & " already exisits in the recipient list!"
                End If
            End If
        Next
    End Sub
    Private Sub RemoveItems(ByVal lstBox As ListBox)
        Dim I As Integer
        If lstBox.Items.Count > 0 Then
            For I = lstBox.Items.Count - 1 To 0 Step -1
                lstBox.Items.Remove(lstBox.Items(I))
            Next
        End If
    End Sub
    Private Sub PopulateUsers()
        Dim Int_IDs As String = ""
        Int_IDs = GetListBoxContent(ListInterestsNew)

        Dim sUserLst As String = ""
        sUserLst = GetCheckBoxContent(chkUsers)

        Dim sSQL As String = ""
        sSQL = GetSQL(Int_IDs, sUserLst)

        If sUserLst <> "" And Int_IDs <> "" Then
            sSQL = GetSQL(Int_IDs, sUserLst)
            Call PopulateListBox(ListUsersNew, sSQL)
        End If
        If sUserLst = "" Then
            Call RemoveItems(ListUsersNew)
        End If
        If Int_IDs = "" Then
            Call RemoveItems(ListUsersNew)
        End If
        hidUsers.Value = GetListBoxContent(ListUsersNew)
        lblCount.Text = " (" & ListUsersNew.Items.Count.ToString & ")"
    End Sub
    Private Function GetListBoxContent(ByVal lstBox As ListBox) As String
        Dim sContent As String = ""
        Dim I As Integer
        If lstBox.Items.Count > 0 Then
            For I = lstBox.Items.Count - 1 To 0 Step -1
                sContent = sContent + "," + lstBox.Items(I).Value
            Next
        End If
        If sContent <> "" Then
            sContent = Mid(sContent, 2)
        End If
        GetListBoxContent = sContent
    End Function
    Private Function GetCheckBoxContent(ByVal chkBox As CheckBoxList) As String
        Dim sContent As String = ""
        Dim li As ListItem
        For Each li In chkBox.Items
            If li.Selected Then
                sContent += "," + li.Text
            End If
        Next
        If sContent <> "" Then
            sContent = Mid(sContent, 2)
        End If
        GetCheckBoxContent = sContent
    End Function
    Private Function GetSQL(ByVal Interests As String, ByVal UsersList As String) As String
        Dim sSQL As String, sSQLMain As String
        'U.profile_type= 'ChildProfile' AND
        sSQLMain = "SELECT DISTINCT U.id, U.login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' ELSE '' END AS Name FROM Rocket21.R21EY.users U JOIN Rocket21.R21EY.interest_banks E ON U.id = E.user_id WHERE E.interest_id IN (" & Interests & ") "
        If UsersList = "B3" Then
            sSQL = sSQLMain + "AND E.is_passion IS NOT NULL"
        ElseIf UsersList = "T10" Then
            sSQL = sSQLMain + "AND E.is_top IS NOT NULL"
        ElseIf UsersList = "pGPS" Then
            sSQL = sSQLMain + "AND E.is_top IS NULL AND E.is_passion IS NULL"
        ElseIf UsersList = "B3,T10" Then
            sSQL = sSQLMain + "AND E.is_passion IS NOT NULL UNION " + sSQLMain + "AND E.is_top IS NOT NULL"
        ElseIf UsersList = "B3,pGPS" Then
            sSQL = sSQLMain + "AND E.is_passion IS NOT NULL UNION " + sSQLMain + "AND E.is_top IS NULL AND E.is_passion IS NULL"
        ElseIf UsersList = "T10,pGPS" Then
            sSQL = sSQLMain + "AND E.is_top IS NOT NULL UNION " + sSQLMain + "AND E.is_top IS NULL AND E.is_passion IS NULL"
        ElseIf UsersList = "B3,T10,pGPS" Then
            'sSQL = sSQLMain + "AND E.is_passion IS NOT NULL UNION " + sSQLMain + "AND E.is_top IS NOT NULL UNION " + sSQLMain + "AND E.is_top IS NULL AND E.is_passion IS NULL"
            sSQL = sSQLMain
        End If
        sSQL = sSQL + " ORDER BY U.Login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' ELSE '' END"
        GetSQL = sSQL
    End Function
    Private Function GetUsersCount() As String
        GetUsersCount = " (" & ListUsersNew.Items.Count.ToString & ")"
    End Function


    Protected Sub btnAddInterest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddInterest.Click
        Call MoveItems(ListInterests, ListInterestsNew)
        hidMembers.Value = GetListBoxContent(ListInterestsNew)
        Call PopulateUsers()
    End Sub

    Protected Sub btnRemoveInterest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveInterest.Click
        Call MoveItems(ListInterestsNew, ListInterests)
        hidMembers.Value = GetListBoxContent(ListInterestsNew)
        Call PopulateUsers()
    End Sub

    Protected Sub btnAddUsers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddUsers.Click
        Call MoveItems(ListUsers, ListUsersNew)
        hidUsers.Value = GetListBoxContent(ListUsersNew)
        lblCount.Text = GetUsersCount()
    End Sub

    Protected Sub btnRemoveUsers_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveUsers.Click
        Call MoveItems(ListUsersNew, ListUsers)
        hidUsers.Value = GetListBoxContent(ListUsersNew)
        lblCount.Text = GetUsersCount()
    End Sub

    Protected Sub chkUsers_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkUsers.SelectedIndexChanged

        Dim Int_IDs As String = ""
        Int_IDs = GetListBoxContent(ListInterestsNew)

        Dim sUserLst As String = ""
        sUserLst = GetCheckBoxContent(chkUsers)

        Dim sSQL As String = ""
        sSQL = GetSQL(Int_IDs, sUserLst)
        If sUserLst <> "" And Int_IDs <> "" Then
            sSQL = GetSQL(Int_IDs, sUserLst)
            Call PopulateListBox(ListUsersNew, sSQL)
        End If
        If sUserLst = "" Then
            Call RemoveItems(ListUsersNew)
        End If
        hidUsers.Value = GetListBoxContent(ListUsersNew)
        lblCount.Text = GetUsersCount()
    End Sub

    Protected Sub rdbProfileType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rdbProfileType.SelectedIndexChanged
        If rdbProfileType.SelectedIndex > -1 Then
            ObjectDataSource1.SelectParameters.Item(0).DefaultValue = rdbProfileType.SelectedValue

            ObjectDataSource1.Select()
            ListUsers.DataBind()
        End If
    End Sub

    Protected Sub imgBtnClear_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnClear.Click
        ListUsersNew.Items.Clear()
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Try
            Dim AutoID As String = GridView1.SelectedRow.Cells(1).Text
            Dim sType As String = GridView1.SelectedRow.Cells(5).Text
            Dim sSQL As String = ""
            If sType <> "Group" Then
                sSQL = "SELECT HTMLEmbedTag FROM Rocket21.dbo.ContentPicker WHERE AutoID = " + AutoID
            Else
                sSQL = "SELECT FlotBoxText AS HTMLEmbedTag FROM Rocket21.dbo.MediaGroups WHERE GroupID = " + AutoID
            End If
            Dim sData As DataTable = GetData(sSQL)
            Dim strTag As String = sData.Rows(0)("HTMLEmbedTag").ToString
            'Dim strTag As String = GridView1.SelectedRow.Cells(5).Text
            sData.Dispose()
            'Editor.Content += "<BR>" & HtmlDecode(strTag)
            txtMedia.Text = HtmlDecode(strTag)
            litPreview.Text = strTag
            litPreview.Visible = True
            txtMsg.Value = HtmlDecode(strTag)
            CPID.Value = AutoID
            MediaType.Value = sType
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    'Protected Sub btnPreview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreview.Click
    '    pnlTag.Visible = False
    'End Sub

    'Protected Sub Editor_ContentChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Editor.ContentChanged
    '    txtMsg.Value = Editor.Content
    'End Sub

    'Protected Sub Editor_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Editor.Unload
    '    txtMsg.Value = Editor.Content
    'End Sub

    Protected Sub lstWrapper_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lstWrapper.SelectedIndexChanged
        txtWrapper.Text = lstWrapper.SelectedItem.Text
    End Sub

    Protected Sub lstType_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles lstType.SelectedIndexChanged
        txtIconURL.Text = lstType.SelectedItem.Value
        imgIcon.ImageUrl = lstType.SelectedItem.Value
        imgIcon.ToolTip = lstType.SelectedItem.Text
    End Sub

    Protected Sub btnClear_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnClear.Click
        txtMedia.Text = ""
        litPreview.Text = ""
        litPreview.Visible = False
        txtMsg.Value = ""
        CPID.Value = 0
    End Sub


    Protected Sub btnAddGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGroup.Click
        Try
            If ListGroups.SelectedIndex > -1 Then
                MoveItems(ListGroups, ListGroupsNew)
                Call PopulateGroupUsers()
                hidGroups.Value = GetListBoxContent(ListGroupsNew)
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub btnRemoveGroup_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveGroup.Click
        Try
            If ListGroupsNew.SelectedIndex > -1 Then
                MoveItems(ListGroupsNew, ListGroups)
                Call PopulateGroupUsers()
                hidGroups.Value = GetListBoxContent(ListGroupsNew)
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub
    Private Sub PopulateGroupListBox(ByVal lstBoxFrom As ListBox, ByVal sSQL As String)
        Try
            lstBoxFrom.DataSource = GetData(sSQL)
            lstBoxFrom.DataValueField = "user_id"
            lstBoxFrom.DataTextField = "login"
            lstBoxFrom.DataBind()
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try

    End Sub
    Private Sub PopulateGroupUsers()
        Try
            Dim Group_IDs As String = ""
            Group_IDs = GetListBoxContent(ListGroupsNew)

            Dim sUserLst As String = ""
            'sUserLst = GetCheckBoxContent(chkUsers)

            Dim sSQL As String = ""
            'sSQL = GetGroupSQL(Group_IDs)

            If Group_IDs <> "" Then
                sSQL = GetGroupSQL(Group_IDs)
                Call PopulateGroupListBox(ListUsersNew, sSQL)
            End If
            If Group_IDs = "" Then
                Call RemoveItems(ListUsersNew)
            End If
            hidUsers.Value = GetListBoxContent(ListUsersNew)
            lblCount.Text = " (" & ListUsersNew.Items.Count.ToString & ")"
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
            Exit Sub
        End Try

    End Sub
    Private Function GetGroupSQL(ByVal Groups As String) As String
        Dim sSQL As String, sSQLMain As String
        'U.profile_type= 'ChildProfile' AND
        'sSQLMain = "SELECT DISTINCT U.id, U.login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' ELSE '' END AS Name FROM Rocket21.R21EY.users U JOIN Rocket21.R21EY.interest_banks E ON U.id = E.user_id WHERE E.interest_id IN (" & Interests & ") "
        sSQLMain = "SELECT ib.user_id, " & _
                   "u.login + ' (C)' as login " & _
                   "FROM R21EY.interest_banks ib " & _
                   "JOIN R21EY.users u " & _
                   "ON ib.user_id = u.id " & _
                   "JOIN vw_Executive_Group_Count egc " & _
                   "ON ib.interest_id = egc.interest_id " & _
                   "WHERE egc.Group_Id IN (" & Groups & ") " & _
                   "GROUP BY  ib.user_id, " & _
                              "u.login " & _
                    "ORDER BY u.login"

        sSQL = sSQLMain
        GetGroupSQL = sSQL

    End Function

    Protected Sub btnPreview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreview.Click
        Try
            'Exit Sub
            Dim postData As String
            Dim APIKey As String = "123"
            Dim APIURL As String = ""
            Dim SenderName As String = "Concierge"
            Dim IconURL As String = "http://r21concierge.s3.amazonaws.com/images/concierge.png"
            Dim WrapperText As String = ""
            Dim Subject As String = ""
            Dim Msg As String = ""
            Dim Media As String = ""
            Dim RecID As String = "18"
            Subject = txtSubject.Text
            Msg = Regex.Replace(Editor.Content, "<br\s?\/>\s*(<br\s?\/>){1,2}", "</p><p>")
            WrapperText = txtWrapper.Text
            Media = txtMedia.Text
            APIURL = "http://2ndstage.rocket21.com/admin/concierge_messages"


            'Response.Write(SenderName & "<br>")
            'Response.Write(IconURL & "<br>")
            'Response.Write(WrapperText & "<br>")
            'Response.Write(Title & "<br>")
            'Response.Write(Msg & "<br>")
            'Response.Write(Media & "<br>")
            'Response.End()

            'build postData string
            postData = "api_key=" & APIKey
            postData += "&sender_name=" & SenderName
            postData += "&icon_url=" & IconURL
            postData += "&wrapper_text=" & WrapperText
            postData += "&title=" & Subject
            postData += "&body=" & HttpUtility.UrlEncode(Msg)
            'postData += "&media_text=" & Media
            postData += "&media_text=" & HttpUtility.UrlEncode(Media)
            postData += "&recipient_ids=" & RecID
            'postData += "&public=" & IsPublic

            Dim encoding As New ASCIIEncoding
            Dim data() As Byte = encoding.GetBytes(postData)

            'prepare web request
            Dim myReqeust As WebRequest = WebRequest.Create(APIURL)
            myReqeust.Method = "POST"
            myReqeust.ContentType = "application/x-www-form-urlencoded"
            myReqeust.ContentLength = data.Length

            Dim newSteam As Stream = myReqeust.GetRequestStream
            'send the data
            newSteam.Write(data, 0, data.Length)
            'close stream
            newSteam.Close()

            Dim iSeed As Integer = Today.Year + Today.Month + Today.Day + Today.Hour + Today.Minute + Today.Second
            Dim strRandom As String = New Random(iSeed).Next.ToString
            Dim strURL As String = """http://2ndstage.rocket21.com/workspaces/child#child=tab1&rnd=" & strRandom & """"

            Dim sb As New StringBuilder
            sb.Append("<script>")
            sb.Append("var sURL = " & strURL & ";")
            sb.Append("var width = 800;")
            sb.Append("var height = 600;")
            sb.Append("var left = screen.availWidth;")
            sb.Append("var top = 0;")
            sb.Append("var windowFeatures = ""width="" + width + "",height="" + height + "",status,resizable=yes,scrollbars=yes,left="" + left + "",top="" + top + ""screenX="" + left + "",screenY="" + top;")
            sb.Append("new_window = window.open(sURL, 'preview', windowFeatures);")
            sb.Append("new_window.focus();")

            'sb.Append("var left = parseInt((screen.availWidth / 2) - (width / 2));")
            'sb.Append("var top = parseInt((screen.availHeight / 2) - (height / 2));")
            'sb.Append("var sURL = ""http://2ndstage.rocket21.com/workspaces/child#child=tab1"";")
            'sb.Append("var sURL = " & strURL & ";")
            'sb.Append("var windowFeatures = ""dialogWidth:"" + width + ""px;dialogHeight:"" + height + ""px;dialogLeft:"" + left + ""px;dialogTop:"" + top + ""px;"";")
            'sb.Append("var windowFeatures = ""dialogWidth:1024px;dialogHeight:640px;dialogLeft:10px;dialogTop:10px;"";")
            'sb.Append("var windowFeatures = ""dialogWidth:"" + 1024 + ""px;"" + ""dialogHeight:"" + 640 + ""px;"" + ""dialogLeft:"" + 10 + ""px;"" + ""dialogTop:"" + 10 + ""px;"" + ""status:yes;resizable:yes;scroll:no;"";")

            'sb.Append("window.showModalDialog(sURL, ""subWind"", windowFeatures);")
            'sb.Append("myWindow = window.open(""http://2ndstage.rocket21.com/workspaces/child#child=tab1"", ""subWind"", windowFeatures);")

            'sb.Append("myWindow.focus();")
            'sb.Append("return true;")
            'sb.Append("window.open('http://2ndstage.rocket21.com/workspaces/child#child=tab1', '', '');")
            sb.Append("</scri")
            sb.Append("pt>")

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "JSScript", sb.ToString())

        Catch ex As Exception
            Response.Write("<b>" & ex.Message & "</b>")
        End Try

    End Sub


    Private Sub PopulateCustomGroupUsers()
        Try
            Dim Group_IDs As String = ""
            Group_IDs = GetListBoxContent(ListCustomGroupsNew)

            Dim sUserLst As String = ""
            'sUserLst = GetCheckBoxContent(chkUsers)

            Dim sSQL As String = ""
            'sSQL = GetGroupSQL(Group_IDs)

            If Group_IDs <> "" Then
                sSQL = GetCustomGroupSQL(Group_IDs)
                Call PopulateGroupListBox(ListUsersNew, sSQL)
            End If
            If Group_IDs = "" Then
                Call RemoveItems(ListUsersNew)
            End If
            hidUsers.Value = GetListBoxContent(ListUsersNew)
            lblCount.Text = " (" & ListUsersNew.Items.Count.ToString & ")"
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
            Exit Sub
        End Try

    End Sub
    Private Function GetCustomGroupSQL(ByVal Groups As String) As String
        Dim sSQL As String, sSQLMain As String
        'U.profile_type= 'ChildProfile' AND
        'sSQLMain = "SELECT DISTINCT U.id, U.login+CASE profile_type WHEN 'ChildProfile' THEN ' (C)' WHEN 'ExecutiveProfile' THEN ' (P)' ELSE '' END AS Name FROM Rocket21.R21EY.users U JOIN Rocket21.R21EY.interest_banks E ON U.id = E.user_id WHERE E.interest_id IN (" & Interests & ") "
        sSQLMain = "SELECT cgi.UserID AS user_id, " & _
                   "u.login + ' (C)' as login " & _
                   "FROM CustomGroupItems cgi " & _
                    "JOIN R21EY.users u " & _
                    "ON cgi.UserID = u.id " & _
                    "WHERE cgi.GroupID IN (" & Groups & ") " & _
                    "GROUP BY cgi.UserID, u.login " & _
                    "ORDER BY u.login"

        sSQL = sSQLMain
        GetCustomGroupSQL = sSQL

    End Function

    Protected Sub btnRemoveGroupCustom_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveGroupCustom.Click
        Try
            If ListCustomGroupsNew.SelectedIndex > -1 Then
                MoveItems(ListCustomGroupsNew, ListGroups)
                Call PopulateCustomGroupUsers()
                hidGroups.Value = GetListBoxContent(ListCustomGroupsNew)
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub btnAddGroupCustom_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddGroupCustom.Click
        Try
            If ListCustomGroups.SelectedIndex > -1 Then
                MoveItems(ListCustomGroups, ListCustomGroupsNew)
                Call PopulateCustomGroupUsers()
                hidGroups.Value = GetListBoxContent(ListCustomGroupsNew)
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try

    End Sub

    Protected Sub btnAddCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAddCategory.Click
        Try
            If ListCategory.SelectedIndex > -1 Then
                MoveItems(ListCategory, ListCategoryNew)
                'Call PopulateCategoryUsers()
                SDSInterestList.SelectParameters("CategoryID").DefaultValue = ListCategoryNew.Items(0).Value
                ListCategoryInterest.DataBind()
                Dim lstItem As ListItem
                For Each lstItem In ListCategoryInterest.Items
                    Dim iIntID As Integer = lstItem.Value
                    ListInterests.Items.FindByValue(iIntID).Selected = True

                Next
                hidGroups.Value = GetListBoxContent(ListCategoryNew)
                Call MoveItems(ListInterests, ListInterestsNew)
                hidMembers.Value = GetListBoxContent(ListInterestsNew)
                Call PopulateUsers()
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub btnRemoveCategory_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemoveCategory.Click
        Try
            If ListCategoryNew.SelectedIndex > -1 Then
                Dim lstItem As ListItem
                For Each lstItem In ListCategoryInterest.Items
                    Dim iIntID As Integer = lstItem.Value
                    ListInterestsNew.Items.FindByValue(iIntID).Selected = True
                Next
                ListCategoryInterest.Items.Clear()

                MoveItems(ListCategoryNew, ListCategory)
                hidGroups.Value = GetListBoxContent(ListCategoryNew)

                Call MoveItems(ListInterestsNew, ListInterests)
                hidMembers.Value = GetListBoxContent(ListInterestsNew)
                Call PopulateUsers()

            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        Dim sSQL As String, sBody As String, sUsers As String, DraftID As Integer, sMembers As String, sSubject As String, sMsg As String
        Dim sWrapper As String, sMedia As String, sIconURL As String, sCPID As String, sMediaType As String, sGroups As String

        sUsers = hidUsers.Value  'Request.Form("hidUsers")
        sMembers = hidMembers.Value
        sGroups = hidGroups.Value
        sSubject = txtSubject.Text  'Request.Form("txtSubject")
        sMsg = txtMsg.Value
        sWrapper = txtWrapper.Text 'Request.Form("txtWrapper")
        sMedia = txtMedia.Text 'Request.Form("txtMedia")
        sIconURL = txtIconURL.Text  'Request.Form("txtIconURL")
        sMediaType = MediaType.Value
        sCPID = CPID.Value

        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString

        'Try
        'Dim myConnection = New SqlConnection(sConn)
        'myConnection.Open()
        'Dim cmdMesage As New SqlCommand
        'cmdMesage.Connection = myConnection
        'cmdMesage.CommandType = CommandType.StoredProcedure
        'cmdMesage.CommandText = "sp_SendLogs_Ins"
        'cmdMesage.Parameters.AddWithValue("@CPID", sCPID)
        'cmdMesage.Parameters.AddWithValue("@SenderName", "Concierge")
        'cmdMesage.Parameters.AddWithValue("@IconURL", sIconURL)
        'cmdMesage.Parameters.AddWithValue("@WrapperText", sWrapper)
        'cmdMesage.Parameters.AddWithValue("@Title", sSubject)
        'cmdMesage.Parameters.AddWithValue("@Body", sMsg)
        'cmdMesage.Parameters.AddWithValue("@MediaText", sMedia)
        'cmdMesage.Parameters.AddWithValue("@MediaType", sMediaType)
        'cmdMesage.Parameters.AddWithValue("@Reciepients", sUsers)
        'cmdMesage.Parameters.AddWithValue("@SenderGroups", sMembers)
        'cmdMesage.Parameters.AddWithValue("@ConciergeGroups", sGroups)
        'cmdMesage.Parameters.Add("@DraftID", SqlDbType.Int)
        'cmdMesage.Parameters("@DraftID").Direction = ParameterDirection.Output
        'cmdMesage.ExecuteNonQuery()
        'DraftID = cmdMesage.Parameters("@DraftID").Value
        'cmdMesage.Dispose()
        'myConnection.Close()
        'Catch ex As Exception

        'End Try
        DraftID = 1
        Dim strURL As String = """../SendNew.aspx?draftid=" & DraftID & """"
        Dim sb As New StringBuilder
        sb.Append("<script>")
        sb.Append("var sURL = " & strURL & ";")
        sb.Append("var width = 800;")
        sb.Append("var height = 600;")
        sb.Append("var left = screen.availWidth;")
        sb.Append("var top = 0;")
        sb.Append("var windowFeatures = ""width="" + width + "",height="" + height + "",status,resizable=yes,scrollbars=yes,left="" + left + "",top="" + top + ""screenX="" + left + "",screenY="" + top;")
        sb.Append("new_window = window.open(sURL, 'send', windowFeatures);")
        sb.Append("if (new_window && !new_window.closed) window.new_window.focus();")
        sb.Append("</scri")
        sb.Append("pt>")

        Page.ClientScript.RegisterStartupScript(Me.GetType(), "JSScript", sb.ToString())

    End Sub
End Class
