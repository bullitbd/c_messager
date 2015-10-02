Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess
Imports System.Net
Imports System.IO
Partial Class SendAjax
    Inherits System.Web.UI.Page
    Private Sub PostMessage(ByVal SenderName As String, ByVal RecID As String, ByVal WrapperText As String, ByVal Subject As String, ByVal Msg As String, ByVal Media As String, ByVal IconURL As String)
        Dim sStatus As String = ""
        Try

            Dim postData As String
            Dim APIKey As String = "123"
            'Dim IconURL As String = "http://r21concierge.s3.amazonaws.com/images/concierge.jpg"
            Dim APIURL As String = "http://2ndstage.rocket21.com/admin/concierge_messages"
            'build postData string
            postData = "api_key=" & APIKey
            postData += "&sender_name=" & SenderName
            postData += "&icon_url=" & IconURL
            postData += "&wrapper_text=" & WrapperText
            postData += "&title=" & Subject
            postData += "&body=" & HttpUtility.UrlEncode(Msg)
            postData += "&media_text=" & Media
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
            sStatus = "Posted Successfully"

            Dim iSeed As Integer = Today.Year + Today.Month + Today.Day + Today.Hour + Today.Minute + Today.Second
            Dim strRandom As String = New Random(iSeed).Next.ToString
            Dim strURL As String = "http://2ndstage.rocket21.com/workspaces/child#child=tab1&rnd=" & strRandom

            Response.Redirect(strURL)

        Catch ex As Exception
            sStatus = ex.Message

        End Try
        Label1.Text = sStatus
    End Sub

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        Call PostMessage("Concierge", "18", Request.Form("txtWrapper"), Request.Form("txtSubject"), Request.Form("txtMsg"), Request.Form("txtMedia"), Request.Form("txtIconURL"))

    End Sub
End Class
