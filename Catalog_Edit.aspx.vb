Imports System.Data
Imports System.Data.Sql
Imports System.Data.SqlClient
Imports DataAccess
Imports System.Web.HttpUtility
Partial Class Catalog_Edit
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("~/Login.aspx")
            End If

            Panel1.Visible = False
            Panel2.Visible = True
            Dim sSQL As String
            Dim CID As Integer
            CID = Request.QueryString("id")
            sSQL = "SELECT * FROM [ContentPicker] WHERE AutoID = " & CID
            Dim cdt As DataTable = GetData(sSQL)

            txtDescription.Text = FixDBNull(cdt.Rows(0)("Description").ToString)
            txtTitle.Text = FixDBNull(cdt.Rows(0)("Title").ToString)
            txtCaption.Text = FixDBNull(cdt.Rows(0)("Caption").ToString)
            txtKeywords.Text = FixDBNull(cdt.Rows(0)("Keywords").ToString)
            Call PopulateListBox("ddlAssociatedPE", ddlAssociatedPE, CID)
            Call PopulateListBox("lstCategory", lstCategory, CID)
            Call PopulateListBox("lstGroup", lstGroup, CID)
            txtURL.Text = FixDBNull(cdt.Rows(0)("MediaURL").ToString)
            txtWebsite.Text = FixDBNull(cdt.Rows(0)("WebSiteURL").ToString)
            txtFbMore.Text = FixDBNull(cdt.Rows(0)("InternalNotes").ToString)
            txtTags.Text = FixDBNull(cdt.Rows(0)("Message").ToString)
            txtFB.Text = FixDBNull(cdt.Rows(0)("HTMLEmbedTag").ToString)
            txtTitle.Text = FixDBNull(cdt.Rows(0)("Title").ToString)
            txtThumbURL.Text = FixDBNull(cdt.Rows(0)("ThumbURL").ToString)
            txtLinkText.Text = FixDBNull(cdt.Rows(0)("LinkText").ToString)
            txtAlt.Text = FixDBNull(cdt.Rows(0)("AltText").ToString)

            litPreview.Text = FixDBNull(cdt.Rows(0)("HTMLEmbedTag").ToString)

            Call PopulateDropDown(ddnMedia, PopulateDropDownContent("ddnMedia"), FixDBNull(cdt.Rows(0)("MediaType").ToString))
            Call PopulateDropDown(ddnSubmitted, PopulateDropDownContent("ddnSubmitted"), FixDBNull(cdt.Rows(0)("SubmittedBy").ToString))
            Call PopulateDropDown(ddnLinkStyle, PopulateDropDownContent("ddnLinkStyle"), FixDBNull(cdt.Rows(0)("LinkStyle").ToString))
            Call PopulateDropDown(ddnOwnerType, PopulateDropDownContent("ddnOwnerType"), FixDBNull(cdt.Rows(0)("OwnerType").ToString))
            Call PopulateDropDown(ddnOwner, PopulateDropDownContent("ddnOwner"), FixDBNull(cdt.Rows(0)("Owner").ToString))

            ddnGroup.Items.Add("g_name")


            ddnCampaign.Items.Add("Campaign")



            cdt.Dispose()
        Else
            Dim sDescription As String = txtDescription.Text
            Dim sCaption As String = txtCaption.Text
            Dim sKeywords As String = txtKeywords.Text
            Dim sMediaURL As String = txtURL.Text
            Dim sWebSiteURL As String = txtWebsite.Text
            Dim sInternalNotes As String = txtFbMore.Text
            Dim sMessage As String = txtTags.Text
            Dim sHTMLEmbedTag As String = txtFB.Text
            Dim sMediaType As String = ddnMedia.SelectedValue
            Dim sTitle As String = txtTitle.Text
            Dim sThumbURL As String = txtThumbURL.Text
            Dim sLinkStyle As String = ddnLinkStyle.SelectedValue
            Dim sLinkText As String = txtLinkText.Text
            Dim sAltText As String = txtAlt.Text
            Dim sOwner As String = ddnOwner.SelectedValue
            Dim sOwnerType As String = ddnOwnerType.SelectedValue
            Dim sSubmittedBy As String = ddnSubmitted.SelectedValue

            Dim sCategory As String = ""
            Dim iCategory As Integer = lstCategory.SelectedIndex
            If iCategory > -1 Then
                Dim lstCatItem As New ListItem
                For Each lstCatItem In lstCategory.Items
                    If lstCatItem.Selected Then
                        sCategory = sCategory & lstCatItem.Value & ","
                    End If
                Next
            End If
            Dim sGroup As String = ""
            Dim iGroup As Integer = lstGroup.SelectedIndex
            If iGroup > -1 Then
                Dim lstGrpItem As New ListItem
                For Each lstGrpItem In lstGroup.Items
                    If lstGrpItem.Selected Then
                        sGroup = sGroup & lstGrpItem.Value & ","
                    End If
                Next
            End If
            Dim sAssociatedPE As String = ""
            Dim iPE As Integer = ddlAssociatedPE.SelectedIndex
            If iPE > -1 Then
                Dim lstPEItem As New ListItem
                For Each lstPEItem In ddlAssociatedPE.Items
                    If lstPEItem.Selected Then
                        sAssociatedPE = sAssociatedPE & lstPEItem.Value & ","
                    End If
                Next
            End If

            Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
            Try
                Dim myConnection = New SqlConnection(sConn)
                myConnection.Open()
                Dim myCommand = New SqlCommand
                myCommand.Connection = myConnection
                myCommand.CommandType = CommandType.StoredProcedure
                myCommand.CommandText = "sp_ContentPicker_upd"
                'parameters required for the stpred procedure
                myCommand.Parameters.AddWithValue("@AutoID", Request.QueryString("id"))
                myCommand.Parameters.AddWithValue("@Caption", sCaption)
                myCommand.Parameters.AddWithValue("@Description", sDescription)
                myCommand.Parameters.AddWithValue("@Message", sMessage)
                myCommand.Parameters.AddWithValue("@MediaURL", sMediaURL)
                myCommand.Parameters.AddWithValue("@WebSiteURL", sWebSiteURL)
                myCommand.Parameters.AddWithValue("@HTMLEmbedTag", sHTMLEmbedTag)
                myCommand.Parameters.AddWithValue("@KeyWords", sKeywords)
                myCommand.Parameters.AddWithValue("@InternalNotes", sInternalNotes)
                myCommand.Parameters.AddWithValue("@OwnerType", sOwnerType)
                myCommand.Parameters.AddWithValue("@MediaType", sMediaType)
                myCommand.Parameters.AddWithValue("@Title", sTitle)
                myCommand.Parameters.AddWithValue("@ThumbURL", sThumbURL)
                myCommand.Parameters.AddWithValue("@LinkStyle", sLinkStyle)
                myCommand.Parameters.AddWithValue("@LinkText", sLinkText)
                myCommand.Parameters.AddWithValue("@Owner", sOwner)
                myCommand.Parameters.AddWithValue("@SubmittedBy", sSubmittedBy)
                myCommand.Parameters.AddWithValue("@AltText", sAltText)

                myCommand.Parameters.AddWithValue("@Category", sCategory)
                myCommand.Parameters.AddWithValue("@Group", sGroup)
                myCommand.Parameters.AddWithValue("@AssociatedPE", sAssociatedPE)

                myCommand.ExecuteNonQuery()

                Panel1.Visible = True
                Panel2.Visible = False
            Catch ex As Exception
                Response.Write(ex.Message)
            End Try


        End If
    End Sub

    Private Sub PopulateListBox(ByVal lstName As String, ByVal lstBoxFrom As ListBox, ByVal id As Integer)

        Dim sSQL As String = ""
        If lstName = "lstCategory" Then
            sSQL = "SELECT ic.id, ic.name, 'Selected' Selected FROM ConciergeCategory cc JOIN R21EY.interest_categories ic ON cc.CategoryID = ic.id WHERE cc.ContentPicketID = " & id & " "
            sSQL = sSQL + "UNION SELECT [id], [name], 'NotSelected' FROM [Rocket21].[R21EY].[interest_categories] "
            sSQL = sSQL + "WHERE id NOT IN (SELECT ic.id FROM ConciergeCategory cc JOIN R21EY.interest_categories ic ON cc.CategoryID = ic.id WHERE cc.ContentPicketID = " & id & ") "
            sSQL = sSQL + "ORDER BY Selected DESC"
        ElseIf lstName = "lstGroup" Then
            sSQL = "SELECT ic.id, ic.name, 'Selected' Selected FROM ConciergeGroup cc JOIN R21EY.interest_groups ic ON cc.GroupID = ic.id WHERE cc.ContentPicketID = " & id & " "
            sSQL = sSQL + "UNION SELECT [id], [name], 'NotSelected' FROM [Rocket21].[R21EY].[interest_groups] "
            sSQL = sSQL + "WHERE id NOT IN (SELECT ic.id FROM ConciergeGroup cc JOIN R21EY.interest_groups ic ON cc.GroupID = ic.id WHERE cc.ContentPicketID = " & id & ") "
            sSQL = sSQL + "ORDER BY Selected DESC"
        Else
            sSQL = " SELECT ic.id, ic.name, 'Selected' Selected FROM ConciergePE cc JOIN R21EY.interests ic ON cc.PeID = ic.id WHERE cc.ContentPicketID = " & id & " "
            sSQL = sSQL + "UNION SELECT [id], [name], 'NotSelected' FROM [Rocket21].[R21EY].[interests] "
            sSQL = sSQL + "WHERE id NOT IN (SELECT ic.id FROM ConciergePE cc JOIN R21EY.interests ic ON cc.PeID = ic.id WHERE cc.ContentPicketID = " & id & ") "
            sSQL = sSQL + "ORDER BY Selected DESC"

        End If
        lstBoxFrom.DataSource = GetData(sSQL)
        lstBoxFrom.DataTextField = "name"
        lstBoxFrom.DataValueField = "id"
        lstBoxFrom.DataBind()

        Dim dt As DataTable = GetData(sSQL)
        For i = 0 To dt.Rows.Count - 1
            If dt.Rows(i)(2).ToString = "Selected" Then
                lstBoxFrom.Items(i).Selected = True
            End If
        Next
    End Sub

    Private Sub PopulateDropDown(ByVal drpName As DropDownList, ByVal sMembers As String, ByVal sSelected As String)
        
        Dim MyArray() As String = Split(sMembers, ",")
        drpName.DataSource = MyArray
        drpName.DataBind()
        For I As Integer = 0 To UBound(MyArray)
            If Trim(MyArray(I)) = Trim(sSelected) Then
                drpName.SelectedIndex = I
            End If
        Next
    End Sub

    Private Function PopulateDropDownContent(ByVal drpName As String) As String
        Dim sResult As String = ""
        Dim I As Integer
        Dim sSQL As String = ""
        If drpName = "ddnSubmitted" Then
            sSQL = "SELECT DISTINCT [SubmittedBy] FROM [ContentPicker]"
        ElseIf drpName = "ddnOwner" Then
            sSQL = "SELECT DISTINCT [Owner] FROM [ContentPicker]"
        ElseIf drpName = "ddnOwnerType" Then
            sSQL = "SELECT DISTINCT [OwnerType] FROM [ContentPicker]"
        ElseIf drpName = "ddnMedia" Then
            sSQL = "SELECT DISTINCT [MediaType] FROM [ContentPicker]"
        Else
            sSQL = "SELECT DISTINCT [LinkStyle] FROM [ContentPicker]"
        End If
        Dim odt As DataTable = GetData(sSQL)
        For I = 0 To odt.Rows.Count - 1
            sResult = sResult & "," & odt.Rows(I)(0).ToString
        Next
        If sResult <> "" Then
            sResult = Mid(sResult, 2)
        End If
       
        Return sResult
    End Function

    Private Function FixDBNull(ByVal sName As String) As String
        Dim sReturn As String = ""
        If Not IsDBNull(sName) Then
            sReturn = sName
        End If
        Return sReturn
    End Function
End Class
