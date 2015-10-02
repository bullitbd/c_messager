Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess
Imports System.Net
Imports System.IO
Imports System.Web.HttpUtility
Partial Class SendMessages
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtWrapper.Text = "R21 RECOMMENDS"
            pnlA.Visible = True
            pnlB.Visible = False
            pnlC.Visible = False
        End If

    End Sub
    Private Sub PostMessage(ByVal SenderName As String, ByVal RecID As String, ByVal WrapperText As String, ByVal Subject As String, ByVal Msg As String, ByVal Media As String, ByVal IconURL As String)
        Try
            pnlA.Visible = False
            pnlB.Visible = False
            pnlC.Visible = True

            Dim sBody As String
            sBody = SenderName & "<br>"
            sBody += RecID & "<br>"
            sBody += WrapperText & "<br>"
            sBody += Subject & "<br>"
            sBody += Media & "<br>"
            sBody += IconURL & "<br>"
            Label2.Text = sBody

            Exit Sub

            'Response.Write(SenderName & "<br>")
            'Response.Write(RecID & "<br>")
            'Response.Write(WrapperText & "<br>")
            'Response.Write(Subject & "<br>")
            'Response.Write(Msg & "<br>")
            'Response.Write(Media & "<br>")
            'Response.Write(IconURL & "<br>")
            'Response.End()

            'Dim postData As String
            'Dim APIKey As String = "123"
            'Dim APIURL As String = ""
            'If radServer.SelectedItem.Text = "Staging" Then
            '    APIURL = "http://2ndstage.rocket21.com/admin/concierge_messages"
            'Else
            '    APIURL = "http://www.rocket21.com/admin/concierge_messages"
            'End If
            ''build postData string
            'postData = "api_key=" & APIKey
            'postData += "&sender_name=" & SenderName
            'postData += "&icon_url=" & IconURL
            'postData += "&wrapper_text=" & WrapperText
            'postData += "&title=" & Subject
            'postData += "&body=" & HttpUtility.UrlEncode(Msg)
            'postData += "&media_text=" & Media
            'postData += "&recipient_ids=" & RecID
            ''postData += "&public=" & IsPublic

            'Dim encoding As New ASCIIEncoding
            'Dim data() As Byte = encoding.GetBytes(postData)

            ''prepare web request
            'Dim myReqeust As WebRequest = WebRequest.Create(APIURL)
            'myReqeust.Method = "POST"
            'myReqeust.ContentType = "application/x-www-form-urlencoded"
            'myReqeust.ContentLength = data.Length

            'Dim newSteam As Stream = myReqeust.GetRequestStream
            ''send the data
            'newSteam.Write(data, 0, data.Length)
            ''close stream
            'newSteam.Close()
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub


    Protected Sub btnPreview_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreview.Click
        pnlA.Visible = False
        pnlB.Visible = True
        pnlC.Visible = False
        Dim sBody As String
        sBody = "<b>Subject:</b> " & Request.Form("txtSubject") & "<br /><b>Message:</b> " & Request.Form("txtMsg") & "<br />" & Request.Form("txtMedia")
        Label1.Text = sBody

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
            txtMedia.Text = HtmlDecode(strTag)
            CPID.Value = AutoID
            MediaType.Value = sType
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub btnSend_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSend.Click
        Dim sSQL As String, sRecipients As String, sIconURL As String
        sIconURL = "http://r21concierge.s3.amazonaws.com/images/concierge.png"
        If radRecipients.SelectedItem.Text = "All" Then
            sSQL = "EXEC sp_GetUserIDs 'A'"
        ElseIf radRecipients.SelectedItem.Text = "Child" Then
            sSQL = "EXEC sp_GetUserIDs 'C'"
        Else
            sSQL = "EXEC sp_GetUserIDs 'P'"
        End If
        Dim sData As DataTable = GetData(sSQL)
        sRecipients = sData.Rows(0)(0).ToString
        sData.Dispose()

        Call PostMessage("Concierge", sRecipients, txtWrapper.Text, txtSubject.Text, txtMsg.Text, txtMedia.Text, sIconURL)

    End Sub
End Class
