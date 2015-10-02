Imports System
Imports System.IO
Imports System.Net
Imports System.Text
Partial Class StagePost1
    Inherits System.Web.UI.Page

    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        Try
            'Dim baseuri As New Uri("http://2ndstage.rocket21.com/admin/messages")
            'Dim myuri As New UriBuilder(baseuri)

            'myuri.Query = "sender_name=Concierge&icon_url=http://rocket21.com/images/concierge_avatar.png&wrapper_text=R21+Recommends&title=test&body=testbody&recipient_ids=18&api_key=123"


            'Dim request As WebRequest = WebRequest.Create(baseuri)
            ''Dim request As WebRequest = WebRequest.Create(strURL)
            '' If required by the server, set the credentials.
            'request.Credentials = CredentialCache.DefaultCredentials
            ''request.ContentType = "application/x-www-form-urlencoded"
            'request.Method = "POST"

            '' Get the response.
            'Dim response As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
            'lblResponse.Text = response.ToString

            makeWebRequest()

        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub
    Public Sub makeWebRequest()
        ' Create a request for the URL. 		
        Dim sURL As String
        sURL = "http://2ndstage.rocket21.com/admin/messages"
        'sURL = "http://www.rocket21.com/admin/messages?sender_name=Concierge&icon_url=http://rocket21.com/images/concierge_avatar.png&wrapper_text=R21+Recommends&title=test&body=testbody&recipient_ids=18&api_key=123"
        Dim request As WebRequest = WebRequest.Create(sURL)
        ' If required by the server, set the credentials.
        request.Credentials = CredentialCache.DefaultCredentials
        'request.Method = "POST"

        ' Get the response.
        Dim response As HttpWebResponse = CType(request.GetResponse(), HttpWebResponse)
        ' Display the status.
        Console.WriteLine(response.StatusDescription)
        ' Get the stream containing content returned by the server.
        Dim dataStream As Stream = response.GetResponseStream()
        ' Open the stream using a StreamReader for easy access.
        Dim reader As New StreamReader(dataStream)
        ' Read the content.
        Dim responseFromServer As String = reader.ReadToEnd()
        ' Display the content.
        Console.WriteLine(responseFromServer)
        ' Cleanup the streams and the response.
        reader.Close()
        dataStream.Close()
        response.Close()
    End Sub
End Class
