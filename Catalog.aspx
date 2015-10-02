<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Catalog.aspx.vb" Inherits="Catalog" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Catalog Master List</title>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/css/Concierge.css" />
     <link href="css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>
    <script type="text/javascript">

        function pageLoad() {
        }

        function openNewCatalog() {
            window.open("Catalog_new.aspx", "wndCatalog", "top=10px,left=150px,height=500px,width=700px,scrollbars=yes,resizable=yes", true);
        }
        function delConfirm(id) {
            var ans;
            ans = confirm("Delete Item: " + id + " ?");
            if (ans == true)
                return true;
            else
                return false;
        }

        function CatalogEdit(cid) {
            window.open("Catalog_Edit.aspx?id=" + cid, "wndCatalog", "top=10px,left=150px,height=700px,width=580px,scrollbars=yes,resizable=yes", true);

        } 

    </script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            color: #FF6600;
        }
        .style3
        {
            width: 100%;
            background-color: #C0C0C0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="MaskedDiv" class="MaskedDiv"></div>
        <div id="ModalPopupDiv" class="ModalPopup">
            <table width="100%" cellpadding="2" cellspacing="0" border="0">
                <tr>
                    <td style="width: 98%; background-color: #D7EDF7; color: White; font-weight: bold;"
                        align="right" valign="top">
                        <a href="javascript:void(0);" onclick="javascript:CloseModelPopup();" style="color: Black;">
                            Close</a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 98%; background-color: #D7EDF7; color: black;"
                        align="center" valign="middle">
                        <div id="imgMaskShow"  />
                    </td>
                </tr>
                <tr>
                    <td style="width: 98%; background-color: #D7EDF7; color: Black; font-weight: bold;"
                        align="right" valign="top">
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
    <table class="style1">
        <tr>
            <td style="text-align: center; background-color: #C0C0C0;">
                <h3>
                    Concierge: External Media Catalog Master-List</h3>
            </td>
        </tr>
        <tr>
            <td style="text-align: center; background-color: #FFFFCC">
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                    AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <span class="style2">Refreshing data. Please wait..</span><img alt="refresh" 
                            longdesc="refresh" src="images/Refresh_animated.gif" 
                            style="width: 32px; height: 32px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </td>
        </tr>
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="style3">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="~/Default.aspx">Back</asp:HyperLink>
                                    &nbsp;|
                                    <asp:HyperLink ID="hypNew" runat="server" 
                                        NavigateUrl="#">New</asp:HyperLink>
                                    &nbsp;|
                                    <asp:ImageButton ID="imgBtnRefresh" runat="server" 
                                        ImageUrl="~/images/refresh.jpg" ToolTip="Refresh" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" BackColor="#FFFF99" Width="200px"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                        AllowSorting="True" AutoGenerateColumns="False" 
                                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                        CellPadding="2" DataKeyNames="AutoID" DataSourceID="odsContentPicker" 
                                        ForeColor="Black" EnableSortingAndPagingCallbacks="True" 
                                        Font-Names="Arial" Font-Size="X-Small" PageSize="20">
                                        <PagerSettings Position="TopAndBottom" />
                                        <RowStyle VerticalAlign="Top" />
                                        <Columns>
                                            <asp:BoundField DataField="AutoID" HeaderText="AutoID" InsertVisible="False" 
                                                ReadOnly="True" SortExpression="AutoID" />
                                            <asp:TemplateField HeaderText="Floatbox" SortExpression="HTMLEmbedTag">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblMediaText" runat="server" Text='<%# Eval("HTMLEmbedTag") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                                
                                            <asp:BoundField DataField="InsDtime" HeaderText="InsDtime" 
                                                SortExpression="InsDtime" DataFormatString="{0:d}" ReadOnly="True" />
                                            <asp:BoundField DataField="ModifiedOn" HeaderText="ModifiedOn" 
                                                SortExpression="ModifiedOn" />
                                            <asp:BoundField DataField="Owner" HeaderText="Owner" SortExpression="Owner" />
                                            <asp:BoundField DataField="SubmittedBy" HeaderText="SubmittedBy" 
                                                SortExpression="SubmittedBy" ReadOnly="True" />
                                            <asp:BoundField DataField="MediaType" HeaderText="MediaType" 
                                                SortExpression="MediaType" />
                                            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                                            <asp:BoundField DataField="Description" HeaderText="Description"
                                                SortExpression="Description" ReadOnly="True" />
                                            <asp:BoundField DataField="Caption" HeaderText="Caption"
                                                SortExpression="Caption" ReadOnly="True" />
                                            <asp:BoundField DataField="Tags" HeaderText="Tags" SortExpression="Tags" />
                                           <asp:BoundField DataField="KeyWords" HeaderText="KeyWords"
                                                SortExpression="KeyWords" ReadOnly="True" />     
                                           <asp:BoundField DataField="AssociatedPEName" HeaderText="AssociatedPE"
                                                SortExpression="AssociatedPEName" ReadOnly="True" />      
                                           <asp:BoundField DataField="Interest_Category" HeaderText="Interest Category"
                                                SortExpression="Interest_Category" ReadOnly="True" />  
                                           <asp:BoundField DataField="Interest_Group" HeaderText="Interest Group"
                                                SortExpression="Interest_Group" ReadOnly="True" /> 
                                           <asp:BoundField DataField="InternalNotes" HeaderText="InternalNotes"
                                                SortExpression="InternalNotes" ReadOnly="True" />   
                                          <asp:TemplateField HeaderText="MediaURL" SortExpression="MediaURL">
                                                <ItemTemplate>
                                                   <asp:Panel ID="pnlMediaURL" runat="server">
                                                        <asp:HyperLink ID="hypMediaURL" runat="server" 
                                                            NavigateUrl='<%# Eval("MediaURL") %>' Target="_blank" 
                                                            Text='Click Here'></asp:HyperLink>
                                                     </asp:Panel>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <asp:TemplateField HeaderText="WebSiteURL" SortExpression="WebSiteURL">
                                                <ItemTemplate>
                                                   <asp:Panel ID="pnlWebSiteURL" runat="server">
                                                        <asp:HyperLink ID="hypWebSiteURL" runat="server" 
                                                            NavigateUrl='<%# Eval("WebSiteURL") %>' Target="_blank" 
                                                            Text='Click Here'></asp:HyperLink>
                                                     </asp:Panel>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Message" HeaderText="Message"
                                                SortExpression="Message" ReadOnly="True" />                                                                                       
                                            <asp:TemplateField HeaderText="Update">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgBtnEdit" runat="server" CausesValidation="False" 
                                                        ImageUrl="~/images/EditInformation.bmp" ToolTip="Edit" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgBtnDel" runat="server" CausesValidation="False" 
                                                        CommandName="Delete" ImageUrl="~/images/delete.bmp" ToolTip="Delete" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="Tan" />
                                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                            HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                        <EditRowStyle VerticalAlign="Top" />
                                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ObjectDataSource ID="odsContentPicker" runat="server"
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
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="ODSInterests" runat="server" 
                                        SelectMethod="GetData" 
                                        TypeName="dsConciergeTableAdapters.interestsTableAdapter">
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="ODSGroup" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsConciergeTableAdapters.interest_groupsTableAdapter">
                                    </asp:ObjectDataSource>
                                    <asp:ObjectDataSource ID="ODSCategory" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="dsConciergeTableAdapters.interest_categoriesTableAdapter">
                                    </asp:ObjectDataSource>
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
