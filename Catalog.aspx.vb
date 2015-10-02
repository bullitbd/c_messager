'TODO Need FB and Preview on this page
Partial Class Catalog
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'If Session("login") <> 1 Then
            '    Response.Redirect("Login.aspx")
            'End If
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If

            hypNew.Attributes.Add("onclick", "openNewCatalog();")

        End If
    End Sub

    Protected Sub imgBtnRefresh_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnRefresh.Click
        Try
            odsContentPicker.Select()
            GridView1.PageIndex = 0
            GridView1.DataBind()

        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        'Try
        '    If e.Row.RowState = DataControlRowState.Edit Then
        '        Dim iRowIndex As Integer = e.Row.RowIndex
        '        Dim iContentPicketID As Integer = GridView1.DataKeys(iRowIndex).Value
        '        If iContentPicketID > 0 Then
        '            'fill selected properties for edit list boxes
        '            Dim lstCategoryEdit As ListBox = CType(e.Row.FindControl("lstCategoryEdit"), ListBox)
        '            If lstCategoryEdit Is Nothing Then
        '                lblStatus.Text = "No control found"
        '            Else
        '                lstCategoryEdit.Items(0).Selected = True
        '            End If

        '        End If

        '        lblStatus.Text = "Edit ID: " & iContentPicketID.ToString

        '    End If
        'Catch ex As Exception
        '    lblStatus.Text = ex.Message
        '    lblStatus.ForeColor = Drawing.Color.Red
        'End Try
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim imgBtnDel As ImageButton = CType(e.Row.FindControl("imgBtnDel"), ImageButton)
            imgBtnDel.OnClientClick = "return delConfirm(" & GridView1.DataKeys(e.Row.RowIndex).Value & ");"
            Dim imgBtnEdit As ImageButton = CType(e.Row.FindControl("imgBtnEdit"), ImageButton)
            imgBtnEdit.OnClientClick = "return CatalogEdit(" & GridView1.DataKeys(e.Row.RowIndex).Value & ");"
        End If
    End Sub

    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Try
            'get the AutoID for the row being deleted
            Dim iAutoID As Integer = GridView1.DataKeys(e.RowIndex).Value
            'set delete param of ODScontentpicker
            odsContentPicker.DeleteParameters("AutoID").DefaultValue = iAutoID
            'delete row
            odsContentPicker.Delete()
            lblStatus.Text = "Row deleted successfully."
            lblStatus.ForeColor = Drawing.Color.Green

        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try


    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Try
            'get all update param values
            Dim iAutoID As Integer = GridView1.DataKeys(e.RowIndex).Value
            Dim sWebSiteURL As String = e.NewValues(0)
            Dim sHTMLEmbedTag As String = e.NewValues(1)
            Dim sKeyWords As String = e.NewValues(2)
            Dim iAssociatedPE As Integer = e.NewValues(3)
            Dim sInternalNotes As String = e.NewValues(4)

            'assign values to corresponding update params
            odsContentPicker.UpdateParameters("AutoID").DefaultValue = iAutoID
            odsContentPicker.UpdateParameters("WebSiteURL").DefaultValue = sWebSiteURL
            odsContentPicker.UpdateParameters("HTMLEmbedTag").DefaultValue = sHTMLEmbedTag
            odsContentPicker.UpdateParameters("KeyWords").DefaultValue = sKeyWords
            odsContentPicker.UpdateParameters("AssociatedPE").DefaultValue = iAssociatedPE
            odsContentPicker.UpdateParameters("InternalNotes").DefaultValue = sInternalNotes

            odsContentPicker.Update()
            GridView1.EditIndex = -1
            lblStatus.Text = "Row updated successfully"
            lblStatus.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try


    End Sub

End Class
