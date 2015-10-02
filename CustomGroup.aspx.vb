Imports DataAccess
Imports System.Data
Imports System.Data.SqlClient
Imports System.Net
Partial Class CustomGroup
    Inherits System.Web.UI.Page

    Private Function CreateNewGroup() As Integer
        Dim GroupID As Integer = 0

        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Try
            Dim sUserIDs As String = ""
            sUserIDs = Trim(txtGroupUserIDs.Text)
            sUserIDs = sUserIDs.Replace(Chr(13) + Chr(10), ",")
            sUserIDs = sUserIDs.Replace(vbCrLf, ",")
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMedGrps As New SqlCommand
            cmdMedGrps.Connection = myConnection
            cmdMedGrps.CommandType = CommandType.StoredProcedure
            cmdMedGrps.CommandText = "sp_CustomGroups_Ins"
            cmdMedGrps.Parameters.AddWithValue("@Name", Trim(txtGroupName.Text))
            cmdMedGrps.Parameters.AddWithValue("@Description", Trim(txtGroupDescription.Text))
            cmdMedGrps.Parameters.AddWithValue("@UserIDs", sUserIDs)
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

    Protected Sub btnCreate_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCreate.Click
        Dim GroupID As Integer
        Dim Result As String

        GroupID = CreateNewGroup()

        If GroupID = 0 Then
            Result = "Group with the same name exists. Please enter a different name for the group."

        Else
            Dim sSQL As String = "SELECT COUNT(*) FROM dbo.CustomGroupItems WHERE GroupID = " & CStr(GroupID)
            Dim dt As New DataTable
            dt = GetData(sSQL)
            Result = "Group created successfully. Group ID: " & GroupID.ToString & " Total Members: " & dt.Rows(0)(0).ToString
        End If
        lblStatus.Text = Result
        pnlMsg.Visible = True
    End Sub

    Protected Sub lnkBtnTogglePanel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lnkBtnTogglePanel.Click
        'If lnkBtnTogglePanel.Text = "Show Research Tool" Then
        '    pnlSL.Visible = True
        '    lnkBtnTogglePanel.Text = "Hide Research Tool"
        'Else
        '    pnlSL.Visible = False
        '    lnkBtnTogglePanel.Text = "Show Research Tool"
        'End If
        'Dim sb As New StringBuilder
        'sb.Append("<script>")
        'sb.Append("var width = 1024;")
        'sb.Append("var height = 640;")
        'sb.Append("var left = parseInt((screen.availWidth / 2) - (width / 2));")
        'sb.Append("var top = parseInt((screen.availHeight / 2) - (height / 2));")
        ''sb.Append("var sURL = ""http://dev-concierge.rocket21.com/SilverLight.aspx"";")
        'sb.Append("var sURL = ""http://silverlight.techmediaconsultant.com/default.aspx#/Child_PivotViewerPage"";")

        'sb.Append("var windowFeatures = ""dialogWidth:"" + width + ""px;dialogHeight:"" + height + ""px;dialogLeft:"" + left + ""px;dialogTop:"" + top + ""px;"";")
        ''sb.Append("var windowFeatures = ""dialogWidth:1024px;dialogHeight:640px;dialogLeft:10px;dialogTop:10px;"";")
        ''sb.Append("var windowFeatures = ""dialogWidth:"" + 1024 + ""px;"" + ""dialogHeight:"" + 640 + ""px;"" + ""dialogLeft:"" + 10 + ""px;"" + ""dialogTop:"" + 10 + ""px;"" + ""status:yes;resizable:yes;scroll:no;"";")

        'sb.Append("window.showModalDialog(sURL, ""subWind"", windowFeatures);")
        ''sb.Append("myWindow = window.open(""http://2ndstage.rocket21.com/workspaces/child#child=tab1"", ""subWind"", windowFeatures);")

        ''sb.Append("myWindow.focus();")
        ''sb.Append("return true;")
        ''sb.Append("window.open('http://2ndstage.rocket21.com/workspaces/child#child=tab1', '', '');")
        'sb.Append("</scri")
        'sb.Append("pt>")

        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "JSScript", sb.ToString())
    End Sub
End Class
