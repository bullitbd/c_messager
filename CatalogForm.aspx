<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CatalogForm.aspx.vb" Inherits="CatalogForm" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>R21 Concierge: Media Catalog</title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
        .style2
        {
            color: #FF0066;
        }
        .style3
        {
            width: 100%;
            background-color: #C0C0C0;
        }
        .style4
        {
            color: #FF0000;
        }
    </style>
    <script language="javascript" type="text/javascript">
        function validatePE() {
            alert("Hi there!");
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
    <table class="style1">
        <tr>
            <td style="background-color: #CCCCCC; text-align: right;">
                <asp:ImageButton ID="imgBtnClose" runat="server" 
                    ImageUrl="~/images/ClosePreviewHH.bmp" onclientclick="self.close();" 
                    ToolTip="Close" />
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC; text-align: center;">
                <h3>
                    Concierge : Media Catalog Tool</h3>
            </td>
        </tr>
        <tr>
            <td style="background-color: #CCCCCC">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <span class="style2">Refreshing data. Please wait...</span>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style3" border="1">
                            <tr>
                                <td>
                                    Action</td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:ImageButton ID="imgBtnNew" runat="server" 
                                        ImageUrl="~/images/AddTableHH.bmp" ToolTip="Add New" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Submitted By <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtSubmittedBy" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvSubmittedBy" runat="server" 
                                        ControlToValidate="txtSubmittedBy" ErrorMessage="Submitted By is Blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Web Site URL <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtWebSiteURL" runat="server" Width="420px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvWebSiteURL" runat="server" 
                                        ControlToValidate="txtWebSiteURL" ErrorMessage="Web-Site URL is blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    HTML Embed Tag <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtHTMLEmbedTag" runat="server" Height="70px" 
                                        TextMode="MultiLine" Width="420px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvHtmlTag" runat="server" 
                                        ControlToValidate="txtHTMLEmbedTag" ErrorMessage="HTML Embed Tag is Blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Keywords <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtKeywords" runat="server" Width="420px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvKeywords" runat="server" 
                                        ControlToValidate="txtKeywords" ErrorMessage="Keywords are Blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Associated PE <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:DropDownList ID="ddlAssociatedPE" runat="server" 
                                        DataSourceID="ODSInterest" DataTextField="name" DataValueField="id">
                                    </asp:DropDownList>
                                    <asp:CustomValidator ID="cvAssociatedPE" runat="server" ControlToValidate="ddlAssociatedPE" 
                                        ErrorMessage="Associated PE not Selected!"></asp:CustomValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Associated Categories</td>
                                <td>
                                    :</td>
                                <td>
                                    <asp:ListBox ID="lstCategory" runat="server" DataSourceID="ODSCategory" 
                                        DataTextField="name" DataValueField="id" SelectionMode="Multiple">
                                    </asp:ListBox>
                                </td>
                                <td>
                                    Interest Groups</td>
                                <td>
                                    :</td>
                                <td>
                                    <asp:ListBox ID="lstGroup" runat="server" DataSourceID="ODSGroup" 
                                        DataTextField="name" DataValueField="id" SelectionMode="Multiple">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Internal Notes</td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtInternalNotes" runat="server" Height="51px" 
                                        TextMode="MultiLine" Width="420px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Save Catalog</td>
                                <td>
                                    :</td>
                                <td colspan="2">
                                    <asp:ImageButton ID="imgBtnSave" runat="server" ImageUrl="~/images/SaveHH.bmp" 
                                        ToolTip="Save" />
                                    &nbsp;<asp:Label ID="lblStatus" runat="server" BackColor="#FF9900"></asp:Label>
                                </td>
                                <td style="text-align: right" colspan="2">
                                    <asp:ImageButton ID="imgBtnClose0" runat="server" 
                                        ImageUrl="~/images/ClosePreviewHH.bmp" onclientclick="self.close();" 
                                        style="text-align: right" ToolTip="Close" />
                                </td>
                            </tr>
                        </table>
                        <asp:ObjectDataSource ID="ODSContentPicker" runat="server" 
                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                            SelectMethod="GetData" 
                            TypeName="dsConciergeTableAdapters.sp_ContentPicket_getTableAdapter" 
                            DeleteMethod="Delete" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="AutoID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="AutoID" Type="Int32" />
                                <asp:Parameter Name="WebSiteURL" Type="String" />
                                <asp:Parameter Name="HTMLEmbedTag" Type="String" />
                                <asp:Parameter Name="KeyWords" Type="String" />
                                <asp:Parameter Name="AssociatedPE" Type="String" />
                                <asp:Parameter Name="InternalNotes" Type="String" />
                            </UpdateParameters>
                            <SelectParameters>
                                <asp:Parameter Name="DateFrom" Type="DateTime" />
                                <asp:Parameter Name="DateTo" Type="DateTime" />
                                <asp:Parameter Name="SubmittedBy" Type="String" />
                                <asp:Parameter Name="KeyWords" Type="String" />
                                <asp:Parameter Name="AccociatedPE" Type="String" />
                            </SelectParameters>
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtSubmittedBy" Name="SubmittedBy" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtWebSiteURL" Name="WebSiteURL" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtHTMLEmbedTag" Name="HTMLEmbedTag" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtKeywords" Name="KeyWords" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="ddlAssociatedPE" Name="AssociatedPE" 
                                    PropertyName="SelectedValue" Type="String" />
                                <asp:ControlParameter ControlID="txtInternalNotes" Name="InternalNotes" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="lblStatus" Direction="InputOutput" 
                                    Name="ContentID" PropertyName="Text" Type="Object" />
                            </InsertParameters>
                        </asp:ObjectDataSource>
                        <asp:SqlDataSource ID="SDSGroupIns" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:R21Conn %>" 
                            InsertCommand="sp_ConciergeGroup_ins" InsertCommandType="StoredProcedure" 
                            SelectCommand="SELECT [AutoID], [ContentPicketID], [GroupID] FROM [ConciergeGroup]">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="ContentPicketID" Type="Int32" />
                                <asp:Parameter Name="GroupID" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:ObjectDataSource ID="ODSCategory" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="dsConciergeTableAdapters.interest_categoriesTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:SqlDataSource ID="SDSCategoryIns" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:R21Conn %>" 
                            InsertCommand="ConciergeCategory_ins" InsertCommandType="StoredProcedure" 
                            SelectCommand="SELECT * FROM [ConciergeCategory]">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="ContentPicketID" Type="Int32" />
                                <asp:Parameter Name="CategoryID" Type="Int32" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <asp:ObjectDataSource ID="ODSGroup" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="dsConciergeTableAdapters.interest_groupsTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSInterest" runat="server" 
                            OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                            TypeName="dsConciergeTableAdapters.interestsTableAdapter">
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
