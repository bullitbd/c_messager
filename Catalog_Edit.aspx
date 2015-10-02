<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Catalog_Edit.aspx.vb" Inherits="Catalog_Edit" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/css/concierge.css" />
    <link href="./css/concierge_edit.css" rel="stylesheet" type="text/css" />
    <title>Rocket21 Concierge Edit Media Catalog</title>
    <script type="text/javascript">

        function CheckedValue() {
//            if (document.getElementById('txtWebsite').value == "") { alert("Website canot be empty"); document.forms[0].txtWebsite.focus(); return false; }
//            if (document.getElementById('txtURL').value == "") { alert("URL canot be empty"); document.forms[0].txtURL.focus(); return false; }
//            if (document.getElementById('ddlAssociatedPE').value == "") { alert("Please select atlease one Associated PE."); return false; }
//            if (document.getElementById('txtKeywords').value == "") { alert("Keywords cannot be empty."); document.forms[0].txtKeywords.focus(); return false; }
//            if (document.getElementById('txtDescription').value == "") { alert("Description cannot be empty."); document.forms[0].txtDescription.focus(); return false; }
//            if (document.getElementById('txtTitle').value == "") { alert("Title cannot be empty."); document.forms[0].txtTitle.focus(); return false; }
//            if (document.getElementById('txtFB').value == "") { alert("Embeded HTML cannot be empty."); document.forms[0].txtFB.focus(); return false; }
        } 
    </script>
</head>

<body>
   <form id="form1" runat="server">
    <asp:Panel ID="Panel1" runat="server">
    <div class="outerbox">
        <div class="innerbox">
            <table>
                
                 <tr>
                <td style="text-align: center;">
                    <b> Concierge : Record updated successfully.</b> <a href="javascript:window.close();">Close</a>
                </td>
            </tr>
            </table>
        </div>
     </div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
    <div class="outerbox">
        
        <div class="innerbox">
            <table border="0">
                <tr>
                    <td align="center"><span style="font-size:small; font-weight:bold;">MODIFY MEDIA</span></td>
                </tr>
                 <tr>
                    <td style="height:10px;"></td>
                </tr>
                <tr>
                   <td align="left">
                        <span class="smalltext">Media Type</span>
                        <asp:DropDownList ID="ddnMedia" runat="server" CssClass="box"></asp:DropDownList>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="smalltext">Submitted By</span>
                        <asp:DropDownList ID="ddnSubmitted" runat="server" CssClass="box">
                        </asp:DropDownList>
                        
                    </td>
                </tr>
                
                <tr>
                    <td>
                        <span class="smalltext">Website URL</span><span class="red">*</span><br />
                        <asp:TextBox ID="txtWebsite" Width="300px" runat="server" CssClass="box"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtWidth" Width="35px" Enabled="false" runat="server" CssClass="box"></asp:TextBox><span style=" font-size:x-small; font-weight:bold;">W</span>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtHeight" Width="35px" Enabled="false" runat="server" CssClass="box"></asp:TextBox><span style=" font-size:x-small; font-weight:bold;">H</span>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="txtRatio" Width="35px" Enabled="false" runat="server" CssClass="box"></asp:TextBox>
                        : &nbsp;&nbsp;
                        <asp:TextBox ID="txtPercent" Width="35px" Enabled="true" runat="server" CssClass="box"></asp:TextBox>%
                     </td>
                </tr>
                <tr>
                    <td>
                        <span class="smalltext">Media URL</span><span class="red">*</span><br />
                       <asp:TextBox ID="txtURL" Width="560px" runat="server" CssClass="box"></asp:TextBox>
                    </td>        
                </tr>
                <tr>
                    <td>
                       <span class="smalltext">Thumb URL</span><br />
                       <asp:TextBox ID="txtThumbURL" Width="560px" runat="server" CssClass="box"></asp:TextBox>
                    </td>        
                </tr>
            </table>
        </div>
        <br clear="all" />
        
        <div class="innerbox">
            <table border="0">
                <tr>
                    <td></td>
                       <td align="center"><span style="font-size:small; font-weight:bold;">DISPLAY</span></td>
                     <td></td>
                     
                </tr>
                <tr>
                    <td valign="top">
                        <table>
                           <tr>
                                <td>
                                    <span class="smalltext">Link style</span><br />
                                    <asp:DropDownList ID="ddnLinkStyle" runat="server" Width="70px" CssClass="box">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                <asp:CheckBox ID="RadioButton2" runat="server" /><span style=" font-size:x-small; font-weight:bold;">Info </span><br />
                                <asp:CheckBox ID="RadioButton1" runat="server" /><span style=" font-size:x-small; font-weight:bold;">Tooltip </span><br />
                                <asp:CheckBox ID="RadioButton3" runat="server" /><span style=" font-size:x-small; font-weight:bold;">Print </span><br />
                                </td>
                            </tr>
                             <tr>
                                <td>
                                 <%--<asp:Button ID="btnDirect" runat="server" Text="Direct" />--%>
                                </td>
                            </tr>
                                
                        </table>
                    </td>
                    <td valign="top">
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <span class="smalltext">Link Text</span><br />
                                    <asp:TextBox ID="txtLinkText" Width="375px" runat="server" CssClass="box"></asp:TextBox> 
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <span class="smalltext">Title</span><span class="red">*</span><br />
                                    <asp:TextBox ID="txtTitle" Width="375px" runat="server" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span class="smalltext">Alt & Hover Text</span><span class="red">*</span><br />
                                    <asp:TextBox ID="txtAlt" Width="375px" runat="server" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <span class="smalltext">Caption</span><span class="red">*</span><br />
                                    <asp:TextBox ID="txtCaption" Width="375px" runat="server" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <span class="smalltext">Internal Notes</span><br />
                                    <asp:TextBox ID="txtFbMore" Width="375px"  Height="50px" TextMode="MultiLine" runat="server" CssClass="box"></asp:TextBox> <br clear="all" />
                                </td>
                            </tr>
                        </table>
                     </td>
                     <td valign="top">
                        <table>
                           <tr>
                                <td>
                                    <span class="smalltext">Media Type</span><br />
                                    <asp:TextBox ID="txtMediaType" Width="100px" runat="server" CssClass="box"></asp:TextBox>
                                 </td>
                            </tr>
                            <tr>
                                <td valign="middle">
<%--                                    <asp:CheckBox ID="CheckBox1" runat="server" /><span style=" font-size:x-small; font-weight:bold;">Group </span><asp:Button ID="btnEdit" runat="server" Text="Edit" />
--%>                                    
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    <asp:DropDownList ID="ddnGroup" runat="server" Width="100px" CssClass="box">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                <span style=" font-size:x-small; font-weight:bold;">Fullscreen </span><asp:CheckBox ID="CheckBox2" runat="server" /><br />
                                <span style=" font-size:x-small; font-weight:bold;">Native </span><asp:CheckBox ID="CheckBox3" runat="server" /><br />
                                <span style=" font-size:x-small; font-weight:bold;">Custom </span><asp:CheckBox ID="CheckBox4" runat="server" /><br />
                                </td>
                            </tr>
                         </table>
                     </td>
                </tr>
                
             </table>
        </div>
         <br clear="all" />
        <div class="innerbox">
        
       
           <table border="0">
               <tr>
                    <td colspan="3" align="center"><span style="font-size:small; font-weight:bold;">CATALOG INFORMATION</span></td>
                </tr>
                <tr>
                    <td colspan="3" align="center"><asp:Label ID="lblStatus" runat="server" BackColor="#FF9900"></asp:Label></td>
                </tr>
                 <tr>
                    <td valign="top">
                        <table border="0">
                            <tr>
                                <td>
                                    <span class="smalltext">Associated PE</span><span class="red">*</span><br />
                                    <asp:ListBox ID="ddlAssociatedPE" runat="server" SelectionMode="Multiple" CssClass="box" Width="130px" Height="55px">
                                    </asp:ListBox>
                                </td>
                             </tr>
                            
                             <tr>
                                 <td>
                                    <span class="smalltext">Categories</span><br />
                                    <asp:ListBox ID="lstCategory" runat="server" SelectionMode="Multiple" CssClass="box" Width="130px" Height="55px">                                        
                                    </asp:ListBox>
                                 </td>
                              </tr>
                              
                              <tr>
                                 <td>
                                    <span class="smalltext">Interest Groups</span><br />
                                     <asp:ListBox ID="lstGroup" runat="server" SelectionMode="Multiple" CssClass="box" Width="130px" Height="55px">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            
                             <tr>
                                 <td>
                                    <%--<asp:Button ID="btnRefresh" runat="server" Text="Refresh"></asp:Button><br clear="all" />--%>
                                </td>
                            </tr>
                        </table>  
                    </td>
                    <td style="width:25px"></td>
                    <td valign="top">
                        <table>
                            <tr>
                                <td>
                                    <span class="smalltext">Owner</span><br />
                                    <asp:DropDownList ID="ddnOwner" runat="server" CssClass="box" Width="150px"></asp:DropDownList>
                                </td>
                                <td>
                                    <span class="smalltext">Owner Type</span><br />
                                    <asp:DropDownList ID="ddnOwnerType" runat="server" CssClass="box" Width="150px"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:DropDownList ID="ddnCampaign" runat="server" CssClass="box" Width="150px"></asp:DropDownList>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCalendar" runat="server" CssClass="box" Width="150px"></asp:TextBox>
                                </td>
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <span class="smalltext">Description</span><span class="red">*</span><br />
                                    <asp:TextBox ID="txtDescription" TextMode="MultiLine"  runat="server" CssClass="box" Width="400px" Height="40px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server" 
                                        ControlToValidate="txtDescription" ErrorMessage="Description is Blank!"></asp:RequiredFieldValidator>
                                </td>
                              
                            </tr>
                             <tr>
                                <td colspan="2">
                                    <span class="smalltext">Tags</span><br />
                                    <asp:TextBox ID="txtTags" TextMode="MultiLine"  runat="server" CssClass="box" Width="400px" Height="40px"></asp:TextBox>
                                </td>
                              
                            </tr>
                            <tr>
                                <td>
                                    <span class="smalltext">Keywords</span><span class="red">*</span><br />
                                     <asp:TextBox ID="txtKeywords" runat="server" CssClass="box" Width="150px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Literal ID="litPreview" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </td>
                 </tr>
                 <tr>
                    <td colspan="3">
                        <span class="smalltext">Floatbox String (Embedded HTML)</span><span class="red">*</span><br />
                        <asp:TextBox ID="txtFB" runat="server" CssClass="box" Width="570px" Height="60px" TextMode="MultiLine"/>
                    </td>
                 </tr>
                 <tr>
                   <td colspan="3">
                        <asp:Button ID="btnSubmit" runat="server" Text="Modify"  OnClientClick="return CheckedValue();"/>
                   </td>
                </tr>
            </table>
                     
       
        
        </div>
        
        
     </div>
    </asp:Panel>
   
    </form>
</body>
</html>
