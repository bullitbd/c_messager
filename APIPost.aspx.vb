Imports System.Net
Imports System.IO

Partial Class APIPost
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            txtTitle.Text = "API Test Message: " & Now.ToString
            txtBody.Text = "This is a test message from Message Post API, sent on " & Now.ToString
        End If

    End Sub

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            Dim postData As String
            'build postData string
            postData = "api_key=" & txtApiKey.Text
            postData += "&sender_name=" & txtConcierge.Text
            postData += "&icon_url=" & txtIconURL.Text
            postData += "&wrapper_text=" & txtWrapperText.Text
            postData += "&title=" & txtTitle.Text
            postData += "&body=" & HttpUtility.UrlEncode(txtBody.Text)
            postData += "&media_text=" & HttpUtility.UrlEncode(txtMediaText.Text)
            postData += "&recipient_ids=" & txtRecipient.Text
            'postData += "&public=" & txtPublic.Text

            Dim encoding As New ASCIIEncoding
            Dim data() As Byte = encoding.GetBytes(postData)

            'prepare web request
            Dim myReqeust As WebRequest = WebRequest.Create(txtAPIURL.Text)
            myReqeust.Method = "POST"
            myReqeust.ContentType = "application/x-www-form-urlencoded"
            myReqeust.ContentLength = data.Length
            'display myReuest in text box for debugging purposes
            txtAPIRequest.Text = postData
            txtAPIRequest.Visible = True

            Dim newSteam As Stream = myReqeust.GetRequestStream
            'send the data
            newSteam.Write(data, 0, data.Length)
            'close stream
            newSteam.Close()

            'get the response
            Dim response As WebResponse = myReqeust.GetResponse
            'display status
            lblStatus.Text = CType(response, HttpWebResponse).StatusDescription
            'Get the stream containing content returned by the server.
            newSteam = response.GetResponseStream
            ' Open the stream using a StreamReader for easy access.
            Dim reader As New StreamReader(newSteam)
            ' Read the content
            Dim responseFromServer As String = reader.ReadToEnd
            ' Display the content.
            txtResponse.Text = responseFromServer
            txtResponse.Visible = True
            ' Clean up the streams.
            reader.Close()
            newSteam.Close()
            response.Close()

            'lblStatus.Text = "Message posted successfully"
            lblStatus.ForeColor = Drawing.Color.Green
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub
End Class
