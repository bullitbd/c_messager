Imports System.Data
Imports System.Collections.Generic
Partial Class CatalogForm
    Inherits System.Web.UI.Page
    Dim iContentID As Integer
    Protected Sub cvAssociatedPE_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles cvAssociatedPE.ServerValidate
        Try
            If ddlAssociatedPE.SelectedIndex <= 0 Then
                args.IsValid = False
            Else
                args.IsValid = True
            End If
        Catch ex As Exception
            args.IsValid = False
        End Try
    End Sub

    Protected Sub imgBtnSave_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnSave.Click
        Try
            If Page.IsValid Then
                ODSContentPicker.InsertParameters("SubmittedBy").DefaultValue = txtSubmittedBy.Text
                ODSContentPicker.InsertParameters("WebSiteURL").DefaultValue = txtWebSiteURL.Text
                ODSContentPicker.InsertParameters("HTMLEmbedTag").DefaultValue = txtHTMLEmbedTag.Text
                ODSContentPicker.InsertParameters("KeyWords").DefaultValue = txtKeywords.Text
                ODSContentPicker.InsertParameters("AssociatedPE").DefaultValue = ddlAssociatedPE.SelectedValue
                ODSContentPicker.InsertParameters("InternalNotes").DefaultValue = txtInternalNotes.Text

                ODSContentPicker.Insert()
                If iContentID > 0 Then
                    'check for selected categories
                    Dim iCategory As Integer = lstCategory.SelectedIndex
                    If iCategory > -1 Then
                        Dim lstCatItem As New ListItem
                        For Each lstCatItem In lstCategory.Items
                            If lstCatItem.Selected Then
                                SDSCategoryIns.InsertParameters("ContentPicketID").DefaultValue = iContentID
                                SDSCategoryIns.InsertParameters("CategoryID").DefaultValue = lstCatItem.Value.ToString

                                SDSCategoryIns.Insert()

                            End If
                        Next
                    End If
                    'check for selected groups
                    Dim iGroup As Integer = lstGroup.SelectedIndex
                    If iGroup > -1 Then
                        Dim lstGrpItem As New ListItem
                        For Each lstGrpItem In lstGroup.Items
                            If lstGrpItem.Selected Then
                                SDSGroupIns.InsertParameters("ContentPicketID").DefaultValue = iContentID
                                SDSGroupIns.InsertParameters("GroupID").DefaultValue = lstGrpItem.Value

                                SDSGroupIns.Insert()
                            End If
                        Next
                    End If
                End If
                lblStatus.Text = "Record saved successfully | ContentID: " & iContentID.ToString
                imgBtnSave.Enabled = False
            End If
        Catch ex As Exception
            lblStatus.Text = ex.Message
            lblStatus.ForeColor = Drawing.Color.Red
        End Try
    End Sub

    Protected Sub imgBtnNew_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnNew.Click
        'reset all txtboxes for new entry
        txtHTMLEmbedTag.Text = ""
        txtInternalNotes.Text = ""
        txtKeywords.Text = ""
        txtWebSiteURL.Text = ""
        ddlAssociatedPE.SelectedIndex = -1
        imgBtnSave.Enabled = True
    End Sub

    Protected Sub ODSContentPicker_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles ODSContentPicker.Inserted
        iContentID = e.OutputParameters("ContentID")

    End Sub
End Class