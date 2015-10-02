
Partial Class previewfb
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDataSource1.Selected
        'Try
        '    lblStatus.Text = e.AffectedRows.ToString
        'Catch ex As Exception
        '    lblStatus.Text = ex.Message
        '    lblStatus.ForeColor = Drawing.Color.Red
        'End Try
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Request.QueryString.Count = 0 Then
                lblStatus.Text = "Query-String Error!"
                lblStatus.ForeColor = Drawing.Color.Red
            End If
            'Else
            '    Dim arguments As New DataSourceSelectArguments
            '    arguments.AddSupportedCapabilities(DataSourceCapabilities.None)
            '    Dim returnValue As IEnumerable

            '    SqlDataSource1.SelectParameters("msgid").DefaultValue = Request.QueryString(0)

            '    returnValue = SqlDataSource1.Select(arguments)

            '    lblStatus.Text = returnValue.ToString

            'End If
        End If
    End Sub
End Class
