<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Media_Group.aspx.vb" Inherits="Media_Group" ValidateRequest="false"%>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="./css/Concierge.css" />
    <link href="http://r21concierge.s3.amazonaws.com/css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>
    <title>Rocket21 Concierge Add New Group</title>
     <style type="text/css">
     #litPreview img
     {
     padding-right:5px;
     }
     </style>
     <script type="text/javascript">
         function Validate() {
             var doc = document.forms[0];
             var msg = "";
             if (doc.txtGroup.value == "") {
                 alert("Please enter a Group name");
                 doc.txtGroup.focus();
                 return false;
             }

//             if (doc.txtTitle.value == "") {
//                 alert("Please enter a Title");
//                 doc.txtTitle.focus();
//                 return false;
//             }

//             if (doc.txtCaption.value == "") {
//                 alert("Please enter a Caption");
//                 doc.txtCaption.focus();
//                 return false;
//             }

         }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="outerbox">
            <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="Default.aspx">Back</asp:HyperLink>
    </div>
    <div class="outerbox">
     <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
         <ContentTemplate>
         <div class="innerbox">
            <div style="background-color:#990000; color: White; height:25px; text-align:center; font-weight:bold; padding:10px 5px 5px 10px; ">
                Conceirge Managing Media Groups
            </div>
            <div style="padding-top:10px;"></div>
            <asp:Panel ID="pnlMsg" runat="server" Visible="false">
                <div style=" border:solid 1px #990000; text-align:center; color: Red; padding:10px 5px 5px 10px;">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label> 
                </div>
               
            </asp:Panel>
            <div style="text-align:center;padding:10px 5px 5px 10px;">
                <span class="smalltext">Modify Existing Group</span>&nbsp;&nbsp;
                        <asp:DropDownList ID="ddlExistingGroup" runat="server" CssClass="box" AutoPostBack="true"></asp:DropDownList>&nbsp;&nbsp;
                        <asp:LinkButton ID="lnkCreate" runat="server">Create a New Group</asp:LinkButton>
            </div>
            
            <asp:Panel ID="pnlMain" runat="server" Visible="false">
            <div style="background-color:#7f7e84; color: White; height:25px; text-align:center; font-weight:bold; padding:10px 5px 5px 10px; ">
                <asp:Label ID="lblHeader" runat="server"></asp:Label>
            </div>
            <table border="0">
                <tr>
                    <td valign="top">
                        <table border="0">
                            <tr>
                                <td colspan="2">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                             <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center;">
                                                <img src="./images/Refresh_animated.gif" style="padding-top: 250px;" alt="processing" />
                                             </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                            <tr>
                                <td style="width:120px;">
                                    <span class="smalltext">Enter Name</span><span class="red">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGroup" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="smalltext">Enter Title</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTitle" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="smalltext">Enter Caption</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCaption" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="smalltext">Enter Keywords</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtKeywords" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <span class="smalltext">Enter Tags</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtTags" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Enter Description</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="300px" Height="30px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Enter Notes</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtNotes" runat="server" TextMode="MultiLine" Width="300px" Height="40px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Display As</span>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rblDisplayAs" runat="server" CellPadding="0" CellSpacing="0"
                                                CssClass="buttonlist" RepeatDirection="Horizontal">
                                                <asp:ListItem Selected="True">Gallery</asp:ListItem>
                                                <asp:ListItem>Slideshow</asp:ListItem>
                                            </asp:RadioButtonList>                                
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Display Size</span>
                                </td>
                                <td>
                                <asp:TextBox ID="txtImgSize" runat="server" CssClass="box floatleft"></asp:TextBox>
                                    <%--<asp:RadioButtonList ID="rblImgSize" runat="server" RepeatDirection="Horizontal"
                                            CssClass="buttonlist" CellPadding="0" CellSpacing="0">
                                            <asp:ListItem Selected="True">Fullscreen</asp:ListItem>
                                            <asp:ListItem>Native</asp:ListItem>
                                            <asp:ListItem>Custom</asp:ListItem>
                                        </asp:RadioButtonList>   --%>  
                                                               
                                    
                                    <asp:TextBox ID="txtMaxPosition" cssclass="box floatright" width="35px" runat="server"></asp:TextBox>
                                                               <span class="smalltext floatright">Max Thumbs&nbsp;&nbsp;</span>
                                </td>
                                
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">At Slideshow End:</span>
                                </td>
                                <td>
                                    <asp:RadioButtonList ID="rblShowEnd" runat="server" CellPadding="0" CellSpacing="0"
                                               RepeatDirection="Horizontal" CssClass="buttonlist"  >
                                                <asp:ListItem Selected="True">Exit</asp:ListItem>
                                                <asp:ListItem>Loop</asp:ListItem>
                                                <asp:ListItem>Stop</asp:ListItem>
                                            </asp:RadioButtonList>                       
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtFloat" runat="server" TextMode="MultiLine" Width="422px" Height="60px" CssClass="box" Visible="false"></asp:TextBox>
                                </td>
                            </tr>
                            
                        </table>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td valign="top">
                        <table>
                            <tr>
                            <td align="left">
                                        <asp:Label ID="lblCount" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px; font-weight:bold;"></asp:Label>
                                    </td>
                            </tr>
                           
                            <tr>
                                <td align="right">
                                        <asp:Button ID="btnAdd" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px;" Text="Add Members" Visible="false"/>
                                    </td>
                            </tr>
                            <tr>
                               <td align="right">
                                        <asp:Button ID="btnCreate" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px;" Text="Create Group" OnClientClick="return Validate();" />
                                    </td>     
                             </tr>
                             <tr>
                               <td align="right">
                                        <asp:Button ID="btnSave" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px;" Text="Save Group" OnClientClick="return Validate();" Visible="false"/>
                                    </td>     
                             </tr>
                             <tr>
                               <td align="right">
                                        <asp:Button ID="btnFloat" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px;" Text="Refresh Group" Visible="false"/>
                                    </td>     
                             </tr>
                             <tr>
                               <td align="right">
                                        <asp:Button ID="btnSaveFlot" runat="server" Style="height: 24px; width: 100px; float: right;
                                            margin-right: 10px;" Text="Save Floatbox" Visible="false"/>
                                    </td>     
                             </tr>
                        </table>
                    </td>
                    
                </tr>
            </table>
            <table border="0">
            <tr>
                            <td colspan="2">
                            <asp:Literal ID="litPreview" runat="server" />
                            </td>
                            </tr>
                            </table>
            </asp:Panel>
        </div>
        <ajaxToolkit:modalpopupextender id="ModalPopupExtender1" runat="server" 
	    cancelcontrolid="btnCancel" 
	    OkControlID="btnOK"
	    targetcontrolid="btnAdd" popupcontrolid="Panel1" 
	    popupdraghandlecontrolid="PopupHeader" drag="true" 
	    backgroundcssclass="ModalPopupBG">
    </ajaxToolkit:modalpopupextender>

    <asp:panel id="Panel1" style="display: none" runat="server">
	<div class="Popup">
                <div class="PopupHeader" id="PopupHeader">Select Members</div>
                <asp:UpdateProgress ID="UpdateProgress2" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                            <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center;">
                                                <img src="./images/Refresh_animated.gif" style="padding-top: 100px;" alt="processing" />
                                             </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                <div id="div1" style="Width:600px; Height:400px; overflow:scroll;" runat="server">
                <asp:GridView ID="gvwMembers" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                CellPadding="2" DataKeyNames="AutoID" Font-Names="Arial" Font-Size="X-Small" ForeColor="Black">
                    <columns>
                    <asp:TemplateField HeaderText="Select">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkSelect" Checked='<%# Bind("Selected") %>' runat="server" />
                    </ItemTemplate>
                    </asp:TemplateField>
                        <asp:BoundField DataField="AutoID" HeaderText="ID" />
                        <asp:BoundField DataField="MediaType" HeaderText="Media Type" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="HTMLEmbedTag" SortExpression="HTMLEmbedTag">
                            <ItemTemplate>
                                <asp:Literal ID="litPreview1" Text=<%#Eval("HTMLEmbedTag")%> runat="server"></asp:Literal>
                            </ItemTemplate> 
                        </asp:TemplateField> 
                    </columns>
                </asp:GridView>                   
                </div>
                <div class="Controls">
                    <asp:Button ID="btnAccept" runat="server" Text=" Save Members " OnClick="btnOK_Click" />&nbsp;&nbsp; 
                    <asp:Button ID="btnCancel" runat="server" Text=" Cancel " /> 
                    <asp:Button ID="btnOK" style="display:none" visibile="false" runat="server"  Text=" Save Members " /> 
   
     
		        </div>
        </div>
    </asp:panel>
        </ContentTemplate>
        </asp:UpdatePanel>
    </div>
   
     
    </form>
</body>
</html>
