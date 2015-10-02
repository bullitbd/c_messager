<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SendMessages.aspx.vb" Inherits="SendMessages"  ValidateRequest="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
     <title>Rocket21 Concierge Mailing System</title> 
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>    
    
    <link href="http://r21concierge.s3.amazonaws.com/css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
            <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />

     <div style="border: solid 1px green; width: 600px; background-color: #FFFBD6; margin: 0 auto;">
            
           <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                color: White; height: 20px; text-align: center;">
                Rocket21 Concierge Mailing System
           </div>
            <asp:Label ID="lblStatus" runat="server" ></asp:Label>
           <asp:Panel ID="pnlA" runat="server">
               <div style="padding: 10px 10px 10px 10px; font-family:Arial; font-size:medium;">
               <table>
                    <tr>
                        <td style="width:130px; height:10px;"></td>
                        <td style="width:400px;"></td>
                    </tr>
                    <tr>
                        <td valign="top">Wrapper Text</td>
                        <td>
                            <asp:TextBox ID="txtWrapper" runat="server" BorderWidth="1" Width="400px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Subject</td>
                        <td>
                            <asp:TextBox ID="txtSubject" runat="server" BorderWidth="1" Width="400px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">Message</td>
                        <td>
                            <asp:TextBox ID="txtMsg" runat="server" BorderWidth="1" Width="400px"  TextMode="MultiLine" Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td valign="top">Media Text</td>
                        <td>
                            <asp:TextBox ID="txtMedia" runat="server" BorderWidth="1" Width="400px"  TextMode="MultiLine" Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top"></td>
                        <td>
                            <asp:Literal ID="litPreview" runat="server"></asp:Literal>
                            <asp:HiddenField ID="HiddenField1" runat="server" />
                            <asp:HiddenField ID="CPID" runat="server" />
                            <asp:HiddenField ID="MediaType" runat="server" />
                            <asp:HiddenField ID="DraftID" runat="server" />
                        </td>
                    </tr>
                    
                      <tr>
                      <td valign="top"></td>
                       <td>
                            <asp:button id="btnInsertHTML" runat="server" text="Insert Content" />
                            <asp:Button ID="btnPreview" runat="server" Text="Preview" />
                         </td>
                    </tr>
               </table>
            </div>  
           </asp:Panel>  
           <asp:Panel ID="pnlB" runat="server" style="padding: 10px 10px 10px 10px; font-family:Arial; font-size:medium;">
               <table>
                    <tr>
                        <td style="width:130px; height:10px;"></td>
                        <td style="width:400px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color:yellow;">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr><td colspan="2" style="height:15px;"></td></tr>
                    <tr>
                        <td valign="top">Select Recipients</td>
                        <td>
                            <asp:RadioButtonList id="radRecipients" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem selected="true">All</asp:ListItem>
                               <asp:ListItem>Child</asp:ListItem>
                               <asp:ListItem>Pro</asp:ListItem>
                            </asp:RadioButtonList>
                         </td>
                    </tr>
                    <tr>
                        <td valign="top">Select Server</td>
                        <td>
                            <asp:RadioButtonList id="radServer" runat="server" RepeatDirection="Horizontal">
                               <asp:ListItem selected="true">Staging</asp:ListItem>
                               <asp:ListItem>Production</asp:ListItem>
                            </asp:RadioButtonList>
                         </td>
                    </tr>
                    <tr>
                      <td valign="top"></td>
                       <td>
                            <asp:button id="btnSend" runat="server" text="Send to All Recipients" />
                         </td>
                    </tr>
                </table>
          </asp:Panel> 
          <asp:Panel ID="pnlC" runat="server" style="padding: 10px 10px 10px 10px; font-family:Arial; font-size:medium;"> 
                <table>
                    <tr>
                        <td style="width:130px; height:10px;"></td>
                        <td style="width:400px;"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color:yellow;">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
          </asp:Panel>  
           
           
           
           
           <ajaxToolkit:modalpopupextender id="ModalPopupExtender1" runat="server" 
	    cancelcontrolid="btnCancel" 
	    targetcontrolid="btnInsertHTML" popupcontrolid="Panel1" 
	    popupdraghandlecontrolid="PopupHeader" drag="true" 
	    backgroundcssclass="ModalPopupBG">
        </ajaxToolkit:modalpopupextender>
                <asp:panel id="Panel1" style="display: none" runat="server">
	        <div class="Popup">
                    <div class="PopupHeader" id="PopupHeader">Select HTML Tags</div>
                    <div id="div1" style="Width:1200px; Height:500px; overflow:scroll;" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                            CellPadding="2" DataKeyNames="AutoID" 
                            DataSourceID="ODSTag" Font-Names="Arial" 
                                            Font-Size="X-Small" ForeColor="Black">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="AutoID" HeaderText="ID" 
                                                    SortExpression="AutoID" />
                                                <asp:TemplateField HeaderText="HTMLEmbedTag" SortExpression="HTMLEmbedTag">
                                                   <ItemTemplate>
                                                        <asp:Literal ID="litPreview1" Text=<%#Eval("HTMLEmbedTag")%> runat="server"></asp:Literal>                                                    
                                                    </ItemTemplate> 
                                                </asp:TemplateField>                                                 
                                                <asp:BoundField DataField="ModifiedOn" HeaderText="Modified On" 
                                                    SortExpression="ModifiedOn" dataformatstring="{0:d}" />
                                                <asp:BoundField DataField="SubmittedBy" HeaderText="Submitted By" 
                                                    SortExpression="SubmittedBy" />    
                                                <asp:BoundField DataField="MediaType" HeaderText="Type" 
                                                    SortExpression="MediaType" />
                                                <asp:BoundField DataField="Title" HeaderText="Title" 
                                                    SortExpression="Title" />
                                                <asp:BoundField DataField="Caption" HeaderText="Caption" 
                                                    SortExpression="Caption" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description" />   
                                                <asp:BoundField DataField="AssociatedPEName" HeaderText="PE" 
                                                    SortExpression="AssociatedPEName" />
                                                <asp:BoundField DataField="Interest_Category" HeaderText="Category" 
                                                    SortExpression="Interest_Category" />
                                                <asp:BoundField DataField="Interest_Group" HeaderText="Group" 
                                                    SortExpression="Interest_Group" />
                                                 <asp:BoundField DataField="Tags" HeaderText="Tags" 
                                                    SortExpression="Tags" /> 
                                                <asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                                                    SortExpression="Keywords" />  
                                              <asp:BoundField DataField="Notes" HeaderText="Notes" 
                                                    SortExpression="Notes" />    
                                            </Columns>
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                                HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
                    
                                        <asp:ObjectDataSource ID="ODSTag" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsConciergeTableAdapters.sp_ContentPicket_MediaGroup_getTableAdapter" 
                                            UpdateMethod="Update">
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
                                                <asp:Parameter Name="SubmittedBy" Type="String" />
                                                <asp:Parameter Name="WebSiteURL" Type="String" />
                                                <asp:Parameter Name="HTMLEmbedTag" Type="String" />
                                                <asp:Parameter Name="KeyWords" Type="String" />
                                                <asp:Parameter Name="AssociatedPE" Type="String" />
                                                <asp:Parameter Name="InternalNotes" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                    </div>
                    <div class="Controls">
                       <input id="btnCancel" type="button" value="Cancel" />
		            </div>
            </div>
        </asp:panel>
              
    </div>
    </form>
</body>
</html>
