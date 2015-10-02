Imports System
Imports System.Data
Imports System.Data.SqlClient
Partial Class SaveDraft
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim sUpdatedBy As String, DraftID As Integer, sUsers As String, sMembers As String, sSubject As String, sMsg As String
        Dim sWrapper As String, sMedia As String, sIconURL As String, CPID As String, sMediaType As String, sUpdateNotes As String, sGroups As String

        btnHome.Attributes.Add("onClick", "javascript:history.go(-1); return false;")
        sUsers = Request.Form("hidUsers")
        sMembers = Request.Form("hidMembers")
        sGroups = Request.Form("hidGroups")
        sSubject = Request.Form("txtSubject")
        sMsg = Request.Form("txtMsg")
        sWrapper = Request.Form("txtWrapper")
        sMedia = Request.Form("txtMedia")
        sIconURL = Request.Form("txtIconURL")
        CPID = Request.Form("CPID")
        If CPID = "" Then
            CPID = 0
        End If
        sMediaType = Request.Form("MediaType")
        DraftID = Request.Form("DraftID")
        sUpdatedBy = Request.Form("txtUpdatedBy")
        sUpdateNotes = Request.Form("txtUpdatedNotes")

        If DraftID = 0 Then
            Call InsertDraft(CPID, "Concierge", sUsers, sIconURL, sWrapper, sSubject, sMsg, sMedia, sMediaType, sMembers, sGroups)
        Else
            Call UpdateDraft(CPID, "Concierge", sUsers, sIconURL, sWrapper, sSubject, sMsg, sMedia, sMediaType, sMembers, DraftID, sUpdatedBy, sUpdateNotes, sGroups)
        End If

    End Sub


    Private Sub InsertDraft(ByVal ContentPickerID As Integer, ByVal SenderName As String, ByVal RecIDs As String, ByVal IconURL As String, ByVal WrapperText As String, ByVal Title As String, ByVal Body As String, ByVal MediaText As String, ByVal MediaType As String, ByVal MemberIDs As String, ByVal GroupIDs As String)
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Dim DraftID As Integer
        'Response.Write("ContentPickerID: " & ContentPickerID & "<br>")
        'Response.Write("SenderName: " & SenderName & "<br>")
        'Response.Write("RecIDs: " & RecIDs & "<br>")
        'Response.Write("IconURL: " & IconURL & "<br>")
        'Response.Write("WrapperText: " & WrapperText & "<br>")
        'Response.Write("Title: " & Title & "<br>")
        'Response.Write("Body: " & Body & "<br>")
        'Response.Write("MediaText: " & MediaText & "<br>")
        'Response.Write("MemberIDs: " & MemberIDs & "<br>")
        'Response.Write("GroupIDs: " & GroupIDs & "<br>")
        'Response.End()
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMesage As New SqlCommand
            cmdMesage.Connection = myConnection
            cmdMesage.CommandType = CommandType.StoredProcedure
            cmdMesage.CommandText = "sp_DraftLogs_Ins"
            cmdMesage.Parameters.AddWithValue("@CPID", ContentPickerID)
            cmdMesage.Parameters.AddWithValue("@SenderName", SenderName)
            cmdMesage.Parameters.AddWithValue("@IconURL", IconURL)
            cmdMesage.Parameters.AddWithValue("@WrapperText", WrapperText)
            cmdMesage.Parameters.AddWithValue("@Title", Title)
            cmdMesage.Parameters.AddWithValue("@Body", Body)
            cmdMesage.Parameters.AddWithValue("@MediaText", MediaText)
            cmdMesage.Parameters.AddWithValue("@MediaType", MediaType)
            cmdMesage.Parameters.AddWithValue("@RecIDs", RecIDs)
            cmdMesage.Parameters.AddWithValue("@MemberIDs", MemberIDs)
            cmdMesage.Parameters.AddWithValue("@GroupIDs", GroupIDs)
            cmdMesage.Parameters.Add("@DraftID", SqlDbType.Int)
            cmdMesage.Parameters("@DraftID").Direction = ParameterDirection.Output
            cmdMesage.ExecuteNonQuery()
            DraftID = cmdMesage.Parameters("@DraftID").Value
            cmdMesage.Dispose()
            myConnection.Close()
            Label1.Text = "Your Draft Saved Successfully. The draftid is: <b>" + DraftID.ToString + "</b><br />You can view your draft <a href=""./home.aspx?draftid=" + DraftID.ToString + """>here</a>"
        Catch ex As Exception
            Label1.Text = ex.Message
        End Try
    End Sub

    Private Sub UpdateDraft(ByVal ContentPickerID As Integer, ByVal SenderName As String, ByVal RecIDs As String, ByVal IconURL As String, ByVal WrapperText As String, ByVal Title As String, ByVal Body As String, ByVal MediaText As String, ByVal MediaType As String, ByVal MemberIDs As String, ByVal DraftID As Integer, ByVal UpdatedBy As String, ByVal UpdateNotes As String, ByVal GroupIDs As String)
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        'Response.Write("ContentPickerID: " & ContentPickerID & "<br>")
        'Response.Write("SenderName: " & SenderName & "<br>")
        'Response.Write("RecIDs: " & RecIDs & "<br>")
        'Response.Write("IconURL: " & IconURL & "<br>")
        'Response.Write("WrapperText: " & WrapperText & "<br>")
        'Response.Write("Title: " & Title & "<br>")
        'Response.Write("Body: " & Body & "<br>")
        'Response.Write("MediaText: " & MediaText & "<br>")
        'Response.Write("MemberIDs: " & MemberIDs & "<br>")
        'Response.Write("DraftID: " & DraftID & "<br>")
        'Response.Write("UpdatedBy: " & UpdatedBy & "<br>")
        'Response.Write("UpdateNotes: " & UpdateNotes & "<br>")
        'Response.End()
        Try
            Dim myConnection = New SqlConnection(sConn)
            myConnection.Open()
            Dim cmdMesage As New SqlCommand
            cmdMesage.Connection = myConnection
            cmdMesage.CommandType = CommandType.StoredProcedure
            cmdMesage.CommandText = "sp_DraftLogs_Upd"
            cmdMesage.Parameters.AddWithValue("@CPID", ContentPickerID)
            cmdMesage.Parameters.AddWithValue("@SenderName", SenderName)
            cmdMesage.Parameters.AddWithValue("@IconURL", IconURL)
            cmdMesage.Parameters.AddWithValue("@WrapperText", WrapperText)
            cmdMesage.Parameters.AddWithValue("@Title", Title)
            cmdMesage.Parameters.AddWithValue("@Body", Body)
            cmdMesage.Parameters.AddWithValue("@MediaText", MediaText)
            cmdMesage.Parameters.AddWithValue("@MediaType", MediaType)
            cmdMesage.Parameters.AddWithValue("@DraftID", DraftID)
            cmdMesage.Parameters.AddWithValue("@UpdatedBy", UpdatedBy)
            cmdMesage.Parameters.AddWithValue("@UpdateNotes", UpdateNotes)
            cmdMesage.Parameters.AddWithValue("@RecIDs", RecIDs)
            cmdMesage.Parameters.AddWithValue("@MemberIDs", MemberIDs)
            cmdMesage.Parameters.AddWithValue("@GroupIDs", GroupIDs)
            cmdMesage.ExecuteNonQuery()
            cmdMesage.Dispose()
            myConnection.Close()
            Label1.Text = "The Draft Updated Successfully. The draftid is: <b>" + DraftID.ToString + "</b><br />Click <a href=""./home.aspx?draftid=" + DraftID.ToString + """>here</a> to view the updated draft."
        Catch ex As Exception
            Label1.Text = ex.Message
        End Try
    End Sub


End Class
