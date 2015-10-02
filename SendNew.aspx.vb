Imports System
Imports System.Data
Imports System.Data.SqlClient
Imports DataAccess
Imports System.Net
Imports System.IO
Partial Class SendNew
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        Dim sSQL As String, sBody As String, sUsers As String, sMembers As String, sSubject As String, sMsg As String
        Dim sWrapper As String, sMedia As String, sIconURL As String, CPID As String, sMediaType As String, sGroups As String

        If Not Page.IsPostBack Then
            sSQL = "SELECT * FROM SendLogs WHERE id = " & Request.QueryString("draftid").ToString
            Dim sData As DataTable = GetData(sSQL)

            sSubject = sData.Rows(0)("title").ToString
            sMsg = sData.Rows(0)("body").ToString
            sMedia = sData.Rows(0)("media_text").ToString
            sMediaType = sData.Rows(0)("media_type").ToString
            sWrapper = sData.Rows(0)("wrapper_text").ToString
            sIconURL = sData.Rows(0)("icon_url").ToString
            sUsers = sData.Rows(0)("reciepients").ToString
            sMembers = sData.Rows(0)("sender_groups").ToString
            sGroups = sData.Rows(0)("concierge_groups").ToString
            CPID = 0

            sSQL = "SELECT id, name + ' ' + surname name, login,email FROM ROCKET21.R21EY.users WHERE id in (" & sUsers & ") ORDER BY name"
            GridView1.DataSource = GetData(sSQL)
            GridView1.DataBind()
            'sBody = "Wrapper: <br>"
            'sBody = sBody + "<b>Subject:</b> " & sSubject & "<br /><b>Message:</b> " & Replace(sMsg, vbCrLf, "<br />")
            sBody = "<b>Subject:</b> " & sSubject & "<br /><b>Message:</b> " & sMsg & "<br />" & sMedia
            'sBody = sBody + "<br />Thanks, <br /> Rocket21 Staff"
            imgWrapper.ImageUrl = sIconURL
            Label1.Text = sBody
            hidUsers1.Value = sUsers
            hidMembers1.Value = sMembers
            hidGroups1.Value = sGroups
            txtMsg1.Value = sMsg
            txtSubject1.Value = sSubject
            txtWrapper1.Value = sWrapper
            txtMedia1.Value = sMedia
            txtIconURL1.Value = sIconURL
            CPID1.Value = CPID
            MediaType1.Value = sMediaType
        Else
            GridView1.Visible = False
            btnSendBottom.Visible = False
            Panel1.Visible = False
            btnHome.Visible = True
            Label1.Text = "The messages are sent successfully to the recipients"
        End If
    End Sub
    Protected Sub btnSendBottom_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSendBottom.Click
        Dim MyStr As New StringBuilder
        Dim sSQL As String = ""
        Dim sRecIDs As String = "", sMemberIDs As String = "", sGroupIDs As String = "", EyResponse As String = ""
        Dim I As Integer, CPID As Integer
        If CPID1.Value <> "" Then
            CPID = CPID1.Value
        Else
            CPID = 0
        End If

        For I = 0 To GridView1.Rows.Count - 1
            Dim row As GridViewRow = GridView1.Rows(I)
            Dim isChecked As Boolean = DirectCast(row.FindControl("chkSelect"), CheckBox).Checked
            If isChecked Then
                'Call InsertMySQL(15, "admin2", GridView1.Rows(I).Cells(1).Text, GridView1.Rows(I).Cells(3).Text, txtSubject1.Value, txtMsg1.Value)
                'Call InsertMySQL(694, "adminrg", GridView1.Rows(I).Cells(1).Text, GridView1.Rows(I).Cells(3).Text, txtSubject1.Value, txtMsg1.Value)
                sRecIDs = sRecIDs & "," & GridView1.Rows(I).Cells(1).Text
                'Call PostMessage("Concierge", GridView1.Rows(I).Cells(1).Text, txtWrapper1.Value, txtSubject1.Value, txtMsg1.Value, "")
            End If
        Next
        sRecIDs = Mid(Trim(sRecIDs), 2)
        sMemberIDs = hidMembers1.Value
        sGroupIDs = hidGroups1.Value
        'Call PostMessage("Concierge", sRecIDs, txtWrapper1.Value, txtSubject1.Value, txtMsg1.Value, txtMedia1.Value, txtIconURL1.Value)
        EyResponse = PostMessage1("Concierge", sRecIDs, txtWrapper1.Value, txtSubject1.Value, txtMsg1.Value, txtMedia1.Value, txtIconURL1.Value)
        Call InsertMessage(CPID, "Concierge", sRecIDs, txtIconURL1.Value, txtWrapper1.Value, txtSubject1.Value, txtMessage.Text, txtMedia1.Value, MediaType1.Value, sMemberIDs, sGroupIDs, EyResponse)
    End Sub
    Private Function PostMessage1(ByVal SenderName As String, ByVal RecID As String, ByVal WrapperText As String, ByVal Subject As String, ByVal Msg As String, ByVal Media As String, ByVal IconURL As String) As String

        'Response.Write(SenderName & "<br>")
        'Response.Write(RecID & "<br>")
        'Response.Write(WrapperText & "<br>")
        'Response.Write(Subject & "<br>")
        'Response.Write(Msg & "<br>")
        'Response.Write(Media & "<br>")
        'Response.Write(IconURL & "<br>")
        'Response.End()
        Dim postData As String
        Dim APIKey As String = "123"
        'Dim IconURL As String = "http://r21concierge.s3.amazonaws.com/images/concierge.jpg"
        Dim APIURL As String = ""
        If radStage.Checked Then
            APIURL = "http://2ndstage.rocket21.com/admin/concierge_messages"
        Else
            APIURL = "http://www.rocket21.com/admin/concierge_messages"
        End If
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

        'get the response
        Dim response As WebResponse = myReqeust.GetResponse
        'Get the stream containing content returned by the server.
        newSteam = response.GetResponseStream
        ' Open the stream using a StreamReader for easy access.
        Dim reader As New StreamReader(newSteam)
        ' Read the content
        Dim responseFromServer As String = reader.ReadToEnd

        ' Clean up the streams.
        reader.Close()
        newSteam.Close()
        response.Close()
        PostMessage1 = responseFromServer
    End Function
    Private Sub InsertMessage(ByVal ContentPickerID As Integer, ByVal SenderName As String, ByVal RecIDs As String, ByVal IconURL As String, ByVal WrapperText As String, ByVal Title As String, ByVal Body As String, ByVal MediaText As String, ByVal MediaType As String, ByVal MemberIDs As String, ByVal GroupIDs As String, ByVal EyResponse As String)
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        'Response.Write(ContentPickerID & "<br>")
        'Response.Write(SenderName & "<br>")
        'Response.Write(RecIDs & "<br>")
        'Response.Write(IconURL & "<br>")
        'Response.Write(WrapperText & "<br>")
        'Response.Write(Title & "<br>")
        'Response.Write(Body & "<br>")
        'Response.Write(MediaText & "<br>")
        'Response.End()
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMesage As New SqlCommand
            cmdMesage.Connection = myConnection
            cmdMesage.CommandType = CommandType.StoredProcedure
            cmdMesage.CommandText = "sp_MessageLogs_Ins"
            cmdMesage.Parameters.AddWithValue("@CPID", ContentPickerID)
            cmdMesage.Parameters.AddWithValue("@SenderName", SenderName)
            cmdMesage.Parameters.AddWithValue("@IconURL", IconURL)
            cmdMesage.Parameters.AddWithValue("@WrapperText", WrapperText)
            cmdMesage.Parameters.AddWithValue("@Title", Title)
            cmdMesage.Parameters.AddWithValue("@Body", Body)
            cmdMesage.Parameters.AddWithValue("@MediaText", MediaText)
            cmdMesage.Parameters.AddWithValue("@MediaType", MediaType)
            cmdMesage.Parameters.AddWithValue("@EyResponse", EyResponse)
            cmdMesage.Parameters.AddWithValue("@RecIDs", RecIDs)
            cmdMesage.Parameters.AddWithValue("@MemberIDs", MemberIDs)
            cmdMesage.Parameters.AddWithValue("@GroupIDs", GroupIDs)
            cmdMesage.ExecuteNonQuery()
            cmdMesage.Dispose()
            myConnection.Close()
        Catch ex As Exception
            Label1.Text = ex.Message
        End Try
    End Sub
End Class
