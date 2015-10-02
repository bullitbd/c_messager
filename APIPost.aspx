<%@ Page Language="VB" AutoEventWireup="false" CodeFile="APIPost.aspx.vb" Inherits="APIPost" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Concierge API POST Test</title>
    <style type="text/css">
        .style1
        {
            width: 94%;
            border-style: solid;
            border-width: 1px;
            background-color: #C0C0C0;
        }
        .style2
        {
        }
        .style3
        {
            width: 149px;
        }
        .style4
        {
            width: 557px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color: #C0C0C0">
    
        <h2 style="text-align: center">
            CONCIERGE API POST TEST</h2>
    
    </div>
    <table class="style1">
        <tr>
            <td class="style2" colspan="3">
                <asp:Label ID="lblStatus" runat="server" BackColor="#FFFF66"></asp:Label>
            </td>
            <td class="style3">
                Response from Server:</td>
        </tr>
        <tr>
            <td class="style2">
                API URL</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtAPIURL" runat="server" Width="350px">http://2ndstage.rocket21.com/admin/concierge_messages</asp:TextBox>
            </td>
            <td class="style3" rowspan="11" valign="top">
                <asp:TextBox ID="txtResponse" runat="server" BackColor="#CCFFCC" Height="534px" 
                    style="margin-left: 0px" TextMode="MultiLine" Width="415px" 
                    Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
&nbsp;API key</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtApiKey" runat="server" Width="40px">123</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Sender Name
            </td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtConcierge" runat="server" Width="82px">Concierge</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Icon URL</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtIconURL" runat="server" Width="365px">http://r21concierge.s3.amazonaws.com/images/concierge.jpg</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Recipient ID</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtRecipient" runat="server" Width="40px">18</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Wrapper Text</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtWrapperText" runat="server" Width="286px">R21 Recommends</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Title</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtTitle" runat="server" Width="286px">API Message</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Message Body</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtBody" runat="server" Height="52px" TextMode="MultiLine" 
                    Width="286px">&lt;p&gt;This is a test message from API Post&lt;/p&gt;</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                Media Text</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtMediaText" runat="server" Width="279px" Height="51px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>               
        <tr>
            <td class="style2">
                Submit</td>
            <td>
                :</td>
            <td class="style4">
                <asp:Button ID="btnSubmit" runat="server" Text="Post Message" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style2">
                API Post Request</td>
            <td>
                :</td>
            <td class="style4">
                <asp:TextBox ID="txtAPIRequest" runat="server" Height="193px" 
                    TextMode="MultiLine" Visible="False" Width="557px"></asp:TextBox>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
