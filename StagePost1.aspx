<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StagePost1.aspx.vb" Inherits="StagePost1" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sample Message: Stage</title>
    <style type="text/css">
        .style1
        {
            width: 93%;
            background-color: #C0C0C0;
        }
        .style2
        {
            background-color: #C0C0C0;
        }
        .style3
        {
            width: 320px;
        }
        .style4
        {
            width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h2>
            <span class="style2">Sample: Post Message to Stage using API</span></h2>
    
    </div>
    <table class="style1">
        <tr>
            <td colspan="3" style="background-color: #FFFF99">
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </td>
            <td style="background-color: #FFFF99" rowspan="9" valign="top">
                API Response :<br />
                <asp:Label ID="lblResponse" runat="server" ForeColor="#0066FF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4">
                Sender Name</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="sender_name" runat="server" Width="98px">Concierge</asp:TextBox>
&nbsp; (sender_name)</td>
        </tr>
        <tr>
            <td class="style4">
                Icon URL</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="icon_url" runat="server" Width="402px">http://www.rocket21.com/images/concierge_avatar.png</asp:TextBox>
                <br />
                (icon_url)</td>
        </tr>
        <tr>
            <td class="style4">
                Recipient</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="recipient_ids" runat="server" Width="35px">18</asp:TextBox>
&nbsp;(Child7 = 18, Child9 = 20) (recipient_ids)</td>
        </tr>
        <tr>
            <td class="style4">
                Wrapper Text</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="wrapper_text" runat="server" Width="399px">R21 Recommends</asp:TextBox>
                <br />
                (wrapper_text)</td>
        </tr>
        <tr>
            <td class="style4">
                Subject</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="title" runat="server" Width="406px"></asp:TextBox>
                <br />
                (title)</td>
        </tr>
        <tr>
            <td class="style4">
                Body</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="body"  name="body" runat="server" Rows="5" TextMode="MultiLine" 
                    Width="406px"></asp:TextBox>
                <br />
                (body)</td>
        </tr>
        <tr>
            <td class="style4">
                api_key</td>
            <td>
                :</td>
            <td class="style3">
                <asp:TextBox ID="api_key" runat="server" Width="51px">123</asp:TextBox>
            &nbsp;(api_key)</td>
        </tr>
        <tr>
            <td class="style4">
                Submit</td>
            <td>
                :</td>
            <td class="style3">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
            </td>
        </tr>
    </table>
    <div style="background-color: #CCFF66">
        Example:<br />
        &gt; curl -d 
        &#39;sender_name=Concierge&amp;icon_url=http://rocket21.com/images/concierge_avatar.png 
        &amp;wrapper_text=R21+Recommends&amp;title=test&amp;body=testbody&amp;to_all=true 
        &amp;recipient=assigned&amp;api_key=123&#39; http://host>//admin/messages
    </div>
    <p>
        &nbsp;</p>
    <div style="background-color: #CCFF66">
        &gt; curl -d &#39;mail_user=10&amp;title=test&amp;body=testbody&amp;recipient_ids=2,3,4 
        &amp;api_key=123&#39; http://<host>/admin/messages
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    </form>
    </body>
</html>
