<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CustomGroup.aspx.vb" Inherits="CustomGroup" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link type="text/css" rel="stylesheet" href="./css/Concierge.css" />
    <title>Rocket21 Concierge Custom Groups</title>
    <script type="text/javascript">
         function Validate() {
             var doc = document.forms[0];
             var msg = "";
             if (doc.txtGroupName.value == "") {
                 alert("Please enter a Group name");
                 doc.txtGroupName.focus();
                 return false;
             }
             if (doc.txtGroupUserIDs.value == "") {
                 alert("Please enter User IDs");
                 doc.txtGroupUserIDs.focus();
                 return false;
             }
         }
         function Popup() {
             //var width = 1024;
             //var height = 640;
             //var left = parseInt((screen.availWidth / 2) - (width / 2));
             //var top = parseInt((screen.availHeight / 2) - (height / 2));
             //var sURL = "http://silverlight.techmediaconsultant.com/default.aspx#/Child_PivotViewerPage";
             //var windowFeatures = "dialogWidth:" + width + "px;dialogHeight:" + height + "px;status;resizable=yes;scroll:yes;dialogLeft:" + left + "px;dialogTop=" + top + "px;";
             //window.showModalDialog(sURL, "subWind", windowFeatures);
             //return true;
             var width = 800;
             var height = 600;
             var sURL = "http://silverlight.techmediaconsultant.com/default.aspx#/Child_PivotViewerPage";
             var left = screen.availWidth;
             var top = 0;
             var windowFeatures = "width=" + width + ",height=" + height + ",status,resizable=yes,scrollbars=yes,left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top;
             new_window = window.open(sURL, 'silverlight', windowFeatures);
             new_window.focus();
         }
         
    </script>    
</head>
<body>
    <form id="form1" runat="server">     
     <div class="outerbox">    
        <div class="innerbox">
        <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="home.aspx">Back</asp:HyperLink>
            <div style="background-color:#990000; color: White; height:25px; text-align:center; font-weight:bold; padding:10px 5px 5px 10px; ">
                Conceirge CreatConceirge Create Custom Group                
            </div>
            <div style="padding-top:10px;"></div>
            <asp:Panel ID="pnlMsg" runat="server" Visible="false">
                <div style=" border:solid 1px #990000; text-align:center; color: Red; padding:10px 5px 5px 10px;">
                    <asp:Label ID="lblStatus" runat="server"></asp:Label> 
                </div>
            </asp:Panel>
            <table border="0">
                <tr>
                    <td valign="top">
                        <table border="0">
                            <tr>
                                <td colspan="2">
                                    <asp:LinkButton ID="lnkBtnTogglePanel" runat="server" OnClientClick="return Popup();">Show Research Tool</asp:LinkButton>
                                    <%--<asp:Panel ID="pnlSL" runat="server" Visible="False">
                                    <iframe id="iframeSL" src="http://silverlight.techmediaconsultant.com/#/Child_PivotViewerPage" frameborder="1" height="800" width="800" ></iframe>
                                    </asp:Panel>--%>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td style="width:150px;">
                                    <span class="smalltext">Enter Group Name</span><span class="red">*</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGroupName" runat="server" Width="300px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Enter Description</span>
                                    
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGroupDescription" runat="server" TextMode="MultiLine" Width="300px" Height="70px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            
                            
                            <tr>
                                <td valign="top">
                                    <span class="smalltext">Enter User ID's</span><span class="red">*</span><br />
                                    <span style="font-size:small; font-weight:normal; color:Gray;">(Copy/Paste the User ID column values from the csv file here.)</span>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtGroupUserIDs" runat="server" TextMode="MultiLine" Width="300px" Height="400px" CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td valign="top">
                                    &nbsp;
                                </td>
                                <td>
                                    <asp:Button ID="btnCreate" runat="server" Text="Create Group" OnClientClick="return Validate();" />
                                </td>
                            </tr>
                         </table>
                      </td>
                  </tr>
            </table>
            
         </div>
    </div>
    </form>
</body>
</html>
