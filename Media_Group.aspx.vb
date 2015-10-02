Imports DataAccess
Imports System.Data
Imports System.Data.SqlClient
Partial Class Media_Group
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Session("login") <> 1 Then
            '    Response.Redirect("Login.aspx")
            'End If
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If

            PopulateDropDown(ddlExistingGroup, "SELECT DISTINCT GroupID ID, Name FROM MediaGroups ")
            ddlExistingGroup.Items.Insert(0, "Select a Group")
        End If
    End Sub
    Private Sub PopulateDropDown(ByVal lstBoxFrom As DropDownList, ByVal sSQL As String)
        lstBoxFrom.DataSource = GetData(sSQL)
        lstBoxFrom.DataTextField = "Name"
        lstBoxFrom.DataValueField = "ID"
        lstBoxFrom.DataBind()
    End Sub

    Protected Sub ddlExistingGroup_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlExistingGroup.SelectedIndexChanged
        If ddlExistingGroup.SelectedIndex > 0 Then
            Call RefreshData(ddlExistingGroup.SelectedValue)
            lblHeader.Text = "Modifying Group """ + ddlExistingGroup.SelectedItem.Text + """"
            btnCreate.Visible = False
            btnSave.Visible = True
            btnAdd.Visible = True
            btnSaveFlot.Visible = False
            'txtFloat.Visible = True
            lblStatus.Text = ""
            pnlMsg.Visible = False
            pnlMain.Visible = True
        Else
            Call ResetFields()
            pnlMain.Visible = False
        End If
    End Sub

    Private Sub ResetFields()
        txtGroup.Text = ""
        txtTitle.Text = ""
        txtCaption.Text = ""
        txtNotes.Text = ""
        txtKeywords.Text = ""
        txtTags.Text = ""
        txtMaxPosition.Text = "5"
        rblDisplayAs.SelectedValue = "Gallery"
        txtImgSize.Text = ""
        rblShowEnd.SelectedValue = "Exit"
        ddlExistingGroup.SelectedIndex = 0
        lblStatus.Text = ""
        lblCount.Text = ""
        txtFloat.Text = ""
        txtDescription.Text = ""
        txtFloat.Visible = False
        btnFloat.Visible = False
        btnSave.Visible = False
        btnAdd.Visible = False
        btnSaveFlot.Visible = False
        btnCreate.Visible = True
    End Sub

    Private Sub RefreshData(ByVal GroupID As Integer)
        Dim Members As Integer = 0
        Dim sSQL As String = "SELECT * FROM MediaGroups WHERE GroupID= " + GroupID.ToString
        Dim sData As DataTable = GetData(sSQL)
        txtGroup.Text = sData.Rows(0)("Name").ToString
        txtTitle.Text = sData.Rows(0)("Title").ToString
        txtCaption.Text = sData.Rows(0)("Caption").ToString
        txtNotes.Text = sData.Rows(0)("Notes").ToString
        txtKeywords.Text = sData.Rows(0)("Keywords").ToString
        txtTags.Text = sData.Rows(0)("Tags").ToString
        txtDescription.Text = sData.Rows(0)("Description").ToString
        txtFloat.Text = sData.Rows(0)("FlotBoxText").ToString
        rblDisplayAs.SelectedValue = sData.Rows(0)("Display").ToString
        txtImgSize.Text = sData.Rows(0)("DisplaySize").ToString
        rblShowEnd.SelectedValue = sData.Rows(0)("EndShowBy").ToString
        txtMaxPosition.Text = sData.Rows(0)("MaxPosition").ToString
        litPreview.Text = txtFloat.Text
        'Members = sData.Rows(0)("MaxPosition")
        sData.Dispose()

        'BD get member count
        sSQL = "SELECT COUNT(*) AS Members FROM MediaGroupItems WHERE MediaGroupItems.GroupID = " + GroupID.ToString
        sData = GetData(sSQL)
        Members = sData.Rows(0)("Members")
        lblCount.Text = Members.ToString + " Members"
        sData.Dispose()

        sSQL = "SELECT AutoID,MediaType,HTMLEmbedTag,[Description],'True' [Selected] FROM ContentPicker WHERE "
        sSQL = sSQL + "AutoID IN (SELECT itemid FROM MediaGroupItems WHERE GroupID = " + ddlExistingGroup.SelectedValue.ToString + ") "
        sSQL = sSQL + "UNION "
        sSQL = sSQL + "SELECT AutoID,MediaType,HTMLEmbedTag,[Description],'False' [Selected] FROM ContentPicker WHERE "
        sSQL = sSQL + "AutoID NOT IN (SELECT itemid FROM MediaGroupItems WHERE GroupID = " + ddlExistingGroup.SelectedValue.ToString + ") "

        gvwMembers.DataSource = GetData(sSQL)
        gvwMembers.DataBind()
        If Members > 0 Then
            btnFloat.Visible = True
            txtFloat.Visible = True
        Else
            btnFloat.Visible = False
            txtFloat.Visible = False
        End If
    End Sub

    Private Function CreateNewGroup() As Integer
        Dim GroupID As Integer = 0

        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMedGrps As New SqlCommand
            cmdMedGrps.Connection = myConnection
            cmdMedGrps.CommandType = CommandType.StoredProcedure
            cmdMedGrps.CommandText = "sp_MediaGroups_Ins"
            cmdMedGrps.Parameters.AddWithValue("@Name", Trim(txtGroup.Text))
            cmdMedGrps.Parameters.AddWithValue("@Title", Trim(txtTitle.Text))
            cmdMedGrps.Parameters.AddWithValue("@Caption", Trim(txtCaption.Text))
            cmdMedGrps.Parameters.AddWithValue("@Display", rblDisplayAs.Text)
            cmdMedGrps.Parameters.AddWithValue("@DisplaySize", txtImgSize.Text)
            cmdMedGrps.Parameters.AddWithValue("@EndShowBy", rblShowEnd.Text)
            cmdMedGrps.Parameters.AddWithValue("@Notes", Trim(txtNotes.Text))
            cmdMedGrps.Parameters.AddWithValue("@GroupItems", "")
            cmdMedGrps.Parameters.AddWithValue("@Keywords", Trim(txtKeywords.Text))
            cmdMedGrps.Parameters.AddWithValue("@Tags", Trim(txtTags.Text))
            cmdMedGrps.Parameters.AddWithValue("@Description", Trim(txtDescription.Text))
            cmdMedGrps.Parameters.AddWithValue("@MaxPosition", CInt(txtMaxPosition.Text)) 'BD
            cmdMedGrps.Parameters.Add("@Result", SqlDbType.Int)
            cmdMedGrps.Parameters("@Result").Direction = ParameterDirection.Output
            cmdMedGrps.ExecuteNonQuery()
            GroupID = cmdMedGrps.Parameters("@Result").Value
            cmdMedGrps.Dispose()
            myConnection.Close()
        Catch ex As Exception
            lblStatus.Text = ex.Message
            GroupID = 0
        End Try
        Return GroupID
    End Function
    Private Function UpdateGroup(ByVal GroupID As Integer) As Integer
        Dim Output As Integer = 0
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMedGrps As New SqlCommand
            cmdMedGrps.Connection = myConnection
            cmdMedGrps.CommandType = CommandType.StoredProcedure
            cmdMedGrps.CommandText = "sp_MediaGroups_Upd"
            cmdMedGrps.Parameters.AddWithValue("@GroupID", GroupID)
            cmdMedGrps.Parameters.AddWithValue("@Name", Trim(txtGroup.Text))
            cmdMedGrps.Parameters.AddWithValue("@Title", Trim(txtTitle.Text))
            cmdMedGrps.Parameters.AddWithValue("@Caption", Trim(txtCaption.Text))
            cmdMedGrps.Parameters.AddWithValue("@Display", rblDisplayAs.Text)
            cmdMedGrps.Parameters.AddWithValue("@DisplaySize", Trim(txtImgSize.Text))
            cmdMedGrps.Parameters.AddWithValue("@EndShowBy", rblShowEnd.Text)
            cmdMedGrps.Parameters.AddWithValue("@Notes", Trim(txtNotes.Text))
            cmdMedGrps.Parameters.AddWithValue("@GroupItems", "")
            cmdMedGrps.Parameters.AddWithValue("@Keywords", Trim(txtKeywords.Text))
            cmdMedGrps.Parameters.AddWithValue("@Tags", Trim(txtTags.Text))
            cmdMedGrps.Parameters.AddWithValue("@FlotBoxText", Trim(txtFloat.Text))
            cmdMedGrps.Parameters.AddWithValue("@Description", Trim(txtDescription.Text))
            cmdMedGrps.Parameters.AddWithValue("@MaxPosition", CInt(txtMaxPosition.Text)) 'BD
            cmdMedGrps.ExecuteNonQuery()
            cmdMedGrps.Dispose()
            myConnection.Close()

        Catch ex As Exception
            lblStatus.Text = ex.Message
            Output = 100
        End Try
        Return Output
    End Function
    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        Dim GroupID As Integer
        Dim Result As String
        GroupID = CreateNewGroup()

        If GroupID = 0 Then
            Result = "Group with the same name exists. Please enter a different name for the group."
        Else
            Result = "Group created successfully. Group ID: " & GroupID.ToString
            PopulateDropDown(ddlExistingGroup, "SELECT DISTINCT GroupID ID, Name FROM MediaGroups ")
            ddlExistingGroup.Items.Insert(0, "Select a Group")
            ddlExistingGroup.SelectedValue = GroupID
            Call RefreshData(GroupID)
            btnCreate.Visible = False
            btnSave.Visible = True
            btnAdd.Visible = True
        End If

        lblStatus.Text = Result
        pnlMsg.Visible = True
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        Dim Output As Integer
        Output = UpdateGroup(ddlExistingGroup.SelectedValue)

        If Output = 0 Then
            lblStatus.Text = "Group updated successfully."
            Call RefreshData(ddlExistingGroup.SelectedValue)
        Else
            lblStatus.Text = "There is a problem in updating this group. Group with same name already exists."
        End If

        pnlMsg.Visible = True
    End Sub

    'Changed text of button to "refresh"
    Protected Sub btnFloat_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFloat.Click
        pnlMsg.Visible = False
        txtFloat.Text = CreateFlotBox(ddlExistingGroup.SelectedValue)
        litPreview.Text = txtFloat.Text
        btnSaveFlot.Visible = False
    End Sub
    Private Function CreateFlotBox(ByVal GroupID As Integer) As String
        'This is for getting the group header information
        'Dim sSQL As String = "SELECT * FROM MediaGroups WHERE GroupID = " + GroupID.ToString
        Dim sSQL As String
        'Dim dtGroup As DataTable = GetData(sSQL)
        'Dim dtRow As DataRow = dtGroup.Rows(0)

        'Dim varName As String = dtRow("Name").ToString  ''
        'Dim varTitle As String = dtRow("Title").ToString ''Test in member loop
        'Dim varCaption As String = dtRow("Caption").ToString ''Test in member loop
        'Dim varDisplay As String = dtRow("Display").ToString ''
        'Dim varDisplaySize As String = dtRow("DisplaySize").ToString ''BD change to txtBox
        'Dim varEndShowBy As String = dtRow("EndShowBy").ToString ''BD change option names to 'stop' | 'exit' (default) | 'loop'
        'Dim varNotes As String = dtRow("Notes").ToString
        'Dim varKeywords As String = dtRow("Keywords").ToString
        'Dim varTags As String = dtRow("Tags").ToString
        'Dim varMaxPosition As String = dtRow("MaxPosition") ''Test in member loop - for max thumbs showing
        'Dim varDescription As String = dtRow("Description").ToString
        'Dim varWidth As String = "" 'BD
        'Dim varHeight As String = "" 'BD

        Dim varName As String = txtGroup.Text
        Dim varTitle As String = txtTitle.Text ''Test in member loop
        Dim varCaption As String = txtCaption.Text  ''Test in member loop
        Dim varDisplay As String = rblDisplayAs.SelectedItem.Text ''
        Dim varDisplaySize As String = txtImgSize.Text  ''BD change to txtBox
        Dim varEndShowBy As String = rblShowEnd.SelectedItem.Text  ''BD change option names to 'stop' | 'exit' (default) | 'loop'
        Dim varNotes As String = txtNotes.Text
        Dim varKeywords As String = txtKeywords.Text
        Dim varTags As String = txtTags.Text
        Dim varMaxPosition As String = txtMaxPosition.Text  ''Test in member loop - for max thumbs showing
        Dim varDescription As String = txtDescription.Text
        Dim varWidth As String = "" 'BD
        Dim varHeight As String = "" 'BD


        Dim rInteger As New Regex("^[1-9][0-9]{1,3}$")

        '[FB]  *****groupOpts – Grouping Options
        ' TODO refactor to the form: sGroupOps = (sThisGroup + " " + sDoSlide + " " + sDoShow + " " + sEndShow + " ")

        Dim sgroup As New StringBuilder
        sgroup.Append("<div class=""floatbox rcGroup"" data-fb-options=""")
        sgroup.Append("group:`" & varName & "` ")
        'check if slideshow
        If varDisplay = "Slideshow" Then
            sgroup.Append("doSlideShow:true ")
            'if so, how end?
            If varEndShowBy <> "Exit" Then
                sgroup.Append("endTask:`" & varEndShowBy & "` ")
            End If
        End If

        'check if DisplaySize specified;
        If Not String.IsNullOrEmpty(varDisplaySize) Then
            Select Case True
                Case rInteger.IsMatch(varDisplaySize)
                    varWidth = varDisplaySize
                Case InStr(varDisplaySize, "w") '---- for anchors if not varWidth is nothing...;
                    'Future use
                Case InStr(varDisplaySize, "%")
                    'Future use
                Case Else
                    varWidth = ""
            End Select
        End If
        sgroup.Append(""">")

        'dtGroup.Dispose()

        'This is for getting the group member details
        sSQL = "SELECT * FROM vw_MembersGroupList WHERE gp_GroupID = " + GroupID.ToString
        sSQL += "ORDER BY gp_Position" 'BD lines up members in proper order
        Dim sData As DataTable = GetData(sSQL)
        Dim I As Integer
        Dim sFloat As New StringBuilder

        Dim rTitle As New Regex("(?<=caption:`)[^`]+(?=`)", RegexOptions.IgnoreCase)
        Dim rCaption As New Regex("(?<=caption2:`)[^`]+(?=`)", RegexOptions.IgnoreCase)
        Dim rHideAnchor As New Regex("(?<=\<a.*\>).+(?=\<\/a\>)")
        Dim rWidth As New Regex("(?<=width:) ?[1-9][0-9]{1,3}")
        Dim rHeight As New Regex("(?<=height:) ?[1-9][0-9]{1,3}")

        Dim rDiv As New Regex("(?<=\<div.*\>).+(?=\<\/div\>)")
        Dim rFbInsert As New Regex("(data-fb-options="")")
        Dim sItemAnchor, sPrevAnchor As String

        For Each row In sData.Rows
            I += 1
            'test Title,Caption,Position,displaySize,
            sItemAnchor = row("cp_HTMLEmbedTag")
            sItemAnchor = rDiv.Match(sItemAnchor).Value
            sPrevAnchor = sItemAnchor
            If varTitle <> "" Then
                sItemAnchor = rTitle.Replace(sItemAnchor, Trim(varTitle))
                If sPrevAnchor = sItemAnchor Then
                    sItemAnchor = rFbInsert.Replace(sItemAnchor, "$1caption:`" & Trim(varTitle)) & "` "
                End If

                'If InStr(sItemAnchor, "caption:`", CompareMethod.Text) Then
                '    rTitle.Replace(sItemAnchor, Trim(varTitle))
                'Else
                '    sItemAnchor.Insert(InStr(sItemAnchor, "data-fb-options=") + 16, "caption:`" + txtTitle.Text + "` ")
                'End If
            End If
            sPrevAnchor = sItemAnchor
            If varCaption <> "" Then
                sItemAnchor = rCaption.Replace(sItemAnchor, Trim(varCaption))
                If sPrevAnchor = sItemAnchor Then
                    sItemAnchor = rFbInsert.Replace(sItemAnchor, "$1caption2:`" & Trim(varCaption) & "` ")
                End If
            End If

            If I > varMaxPosition Then
                sItemAnchor = rHideAnchor.Replace(sItemAnchor, "")
            Else
                sItemAnchor = Replace(sItemAnchor, "></a>", "> </a>")
                sItemAnchor = Replace(sItemAnchor, "data-fb-options", "alt=""" & rTitle.Match(sItemAnchor).Value & """ title=""" & rTitle.Match(sItemAnchor).Value & """ data-fb-options")
            End If

            sPrevAnchor = sItemAnchor
            If Not String.IsNullOrEmpty(varWidth) Then
                If Not IsDBNull(row("cp_Width")) Then
                    Dim w = Single.Parse(row("cp_Width"))
                    Dim h = Single.Parse(row("cp_Height"))
                    Dim r As Single
                    If Not (h <= 0 Or w <= 0) Then
                        r = (h / w * 100) 'CInt(varWidth) * 100)
                        varHeight = String.Format("{0:n0}", r) & "%w"
                        If rHeight.IsMatch(sItemAnchor) Then
                            sItemAnchor = rHeight.Replace(sItemAnchor, Trim(varHeight))
                        Else
                            sItemAnchor = rFbInsert.Replace(sItemAnchor, "$1height:" & Trim(varHeight) & " ")
                        End If
                        If rWidth.IsMatch(sItemAnchor) Then
                            sItemAnchor = rWidth.Replace(sItemAnchor, Trim(varWidth))
                        Else
                            sItemAnchor = rFbInsert.Replace(sItemAnchor, "$1width:" & Trim(varWidth) & " ")
                        End If
                    End If
                End If
            End If
            sFloat.Append(sItemAnchor)
        Next
        sData.Dispose()
        Return sgroup.ToString & sFloat.ToString & "</div>"

    End Function

    Protected Sub lnkCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkCreate.Click
        pnlMain.Visible = True
        lblHeader.Text = "Creating New Group"
        Call ResetFields()
    End Sub


    Protected Sub btnOK_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOK.Click
        Dim MemberIDs As String = ""
        Dim I As Integer
        Dim J As Integer = 0
        Dim TotalMembers As Integer = 0
        For I = 0 To gvwMembers.Rows.Count - 1
            Dim row As GridViewRow = gvwMembers.Rows(I)
            Dim isChecked As Boolean = DirectCast(row.FindControl("chkSelect"), CheckBox).Checked
            If isChecked Then
                MemberIDs = MemberIDs & "," & gvwMembers.Rows(I).Cells(1).Text
                J += 1
            End If
        Next
        MemberIDs = Mid(MemberIDs, 1)

        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMembers As New SqlCommand
            cmdMembers.Connection = myConnection
            cmdMembers.CommandType = CommandType.StoredProcedure
            cmdMembers.CommandText = "sp_CreateGroupMembers"
            cmdMembers.Parameters.AddWithValue("@GroupID", ddlExistingGroup.SelectedValue)
            cmdMembers.Parameters.AddWithValue("@GroupMembers", MemberIDs)
            cmdMembers.Parameters.Add("@Result", SqlDbType.Int)
            cmdMembers.Parameters("@Result").Direction = ParameterDirection.Output
            cmdMembers.ExecuteNonQuery()
            TotalMembers = cmdMembers.Parameters("@Result").Value
            cmdMembers.Dispose()
            myConnection.Close()
        Catch ex As Exception
            lblStatus.Text = ex.Message
        End Try
        'If TotalMembers > 6 Then
        '    lblStatus.Text = "Maximum members can be added to a group is limited to 6. You try to add " & TotalMembers.ToString + " Members to this group."
        '    pnlMsg.Visible = True
        '    Exit Sub
        'End If
        lblCount.Text = J.ToString + " Members" 'BD from TotalMembers
        'txtFloat.Text = ""
        If TotalMembers > 0 Then
            'btnFloat.Visible = True BD
            txtFloat.Text = CreateFlotBox(ddlExistingGroup.SelectedValue) 'BD
            litPreview.Text = txtFloat.Text
            txtFloat.Visible = True
            btnSaveFlot.Visible = False
            pnlMsg.Visible = False
        Else
            btnFloat.Visible = False
            txtFloat.Visible = False
            btnSaveFlot.Visible = False
            pnlMsg.Visible = False
        End If
    End Sub

    Protected Sub btnSaveFlot_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveFlot.Click
        Dim sSQL As String
        sSQL = "UPDATE MediaGroups SET FlotBoxText = '" & Replace(txtFloat.Text, "'", "''") & "' WHERE GroupID = " + ddlExistingGroup.SelectedValue.ToString
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdFlot As New SqlCommand
            cmdFlot.Connection = myConnection
            cmdFlot.CommandType = CommandType.Text
            cmdFlot.CommandText = sSQL
            cmdFlot.ExecuteNonQuery()
            cmdFlot.Dispose()
            myConnection.Close()
            lblStatus.Text = "Floatbox Created successfully."
            pnlMsg.Visible = True
        Catch ex As Exception
            lblStatus.Text = ex.Message
        End Try
    End Sub
End Class
