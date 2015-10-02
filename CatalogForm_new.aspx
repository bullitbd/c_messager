<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CatalogForm_new.aspx.vb" Inherits="CatalogForm_New" ValidateRequest="false"%>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>R21 Concierge: Media Catalog</title>
    <link href="/css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>
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
    <div id="MaskedDiv" class="MaskedDiv">
        </div>
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
                                    Owner Type <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtOwnerType" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvOwnerType" runat="server" 
                                        ControlToValidate="txtOwnerType" ErrorMessage="Owner Type is Blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Description <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtDescription" runat="server" BorderWidth="1" Width="420px" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                        ControlToValidate="txtDescription" ErrorMessage="Description is Blank!"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Caption <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtCaption" runat="server" Width="420px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvCaption" runat="server" 
                                        ControlToValidate="txtCaption" ErrorMessage="Caption is blank!"></asp:RequiredFieldValidator>
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
                                    <asp:ListBox ID="ddlAssociatedPE" runat="server" SelectionMode="Multiple"
                                        DataSourceID="ODSInterest" DataTextField="name" DataValueField="id">
                                    </asp:ListBox>
                                    <asp:CustomValidator ID="cvAssociatedPE" runat="server" 
                                        ClientValidationFunction="ValidateListBox" 
                                        ErrorMessage="Select atleast one Associated PE!"></asp:CustomValidator>
                                        <script language="javascript" type="text/javascript">
                                            function ValidateListBox(sender, args) {
                                                var options = document.getElementById("<%=ddlAssociatedPE.ClientID%>").options;
                                                for (var i = 0; i < options.length; i++) {
                                                    if (options[i].selected == true) {
                                                        args.IsValid = true;
                                                        return;
                                                    }
                                                }
                                                args.IsValid = false;
                                            }      
                                        </script>
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
                                    Media URL <span class="style4">*</span></td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtMediaURL" runat="server" Width="420px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvMediaURL" runat="server" 
                                        ControlToValidate="txtMediaURL" ErrorMessage="Media URL is blank!"></asp:RequiredFieldValidator>
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
                                    Message</td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                
                                    <asp:TextBox ID="txtMessage" runat="server" Height="51px" 
                                        TextMode="MultiLine" Width="420px"></asp:TextBox>
                                
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    HTML Embed Tag <span class="style4">*</span> <br />
                                    
                                </td>
                                <td>
                                    :</td>
                                <td colspan="4">
                                    <asp:TextBox ID="txtHTMLEmbedTag" runat="server" Height="70px" 
                                        TextMode="MultiLine" Width="420px"></asp:TextBox>&nbsp;<a href="javascript:void(0);" onclick="javascript:OpenModelPopup('test');">Preview</a>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvHtmlTag" runat="server" 
                                        ControlToValidate="txtHTMLEmbedTag" ErrorMessage="HTML Embed Tag is Blank!"></asp:RequiredFieldValidator>
                                    
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
                                <asp:ControlParameter ControlID="txtMessage" Name="Message" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtOwnerType" Name="OwnerType" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtDescription" Name="Description" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtCaption" Name="Caption" 
                                    PropertyName="Text" Type="String" />
                                <asp:ControlParameter ControlID="txtMediaURL" Name="MediaURL" 
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
                        <asp:SqlDataSource ID="SDSPeIns" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:R21Conn %>" 
                            InsertCommand="sp_ConciergePE_ins" InsertCommandType="StoredProcedure" 
                            SelectCommand="SELECT * FROM [ConciergePE]">
                            <InsertParameters>
                                <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                                <asp:Parameter Name="ContentPicketID" Type="Int32" />
                                <asp:Parameter Name="PeID" Type="Int32" />
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
