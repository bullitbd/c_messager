<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StagePost.aspx.vb" Inherits="StagePost" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sample Message: Stage</title>
    <style type="text/css">
        .style1
        {
            width: 50%;
            background-color: #C0C0C0;
        }
        .style2
        {
            background-color: #C0C0C0;
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
        </tr>
        <tr>
            <td>
                Sender Name</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="sender_name" runat="server" Width="98px">Concierge</asp:TextBox>
&nbsp; (sender_name)</td>
        </tr>
        <tr>
            <td>
                Icon URL</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="icon_url" runat="server" Width="402px">http://r21concierge.s3.amazonaws.com/images/concierge.jpg</asp:TextBox>
                <br />
                (icon_url)</td>
        </tr>
        <tr>
            <td>
                Recipient</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="recipient_ids" runat="server" Width="35px">18</asp:TextBox>
&nbsp;(Child7 = 18, Child9 = 20) (recipient_ids)</td>
        </tr>
        <tr>
            <td>
                Wrapper Text</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="wrapper_text" runat="server" Width="399px">R21 Recommends</asp:TextBox>
                <br />
                (wrapper_text)</td>
        </tr>
        <tr>
            <td>
                Subject</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="title" runat="server" Width="406px">Test message from API Test Utility</asp:TextBox>
                <br />
                (title)</td>
        </tr>
        <tr>
            <td>
                Body</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="body"  name="body" runat="server" Rows="5" TextMode="MultiLine" 
                    Width="406px"></asp:TextBox>
                <br />
                (body)</td>
        </tr>
        <tr>
            <td>
                Media Text</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="media_text" runat="server" Width="399px">media text</asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Public</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="public" runat="server" Width="79px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                api_key</td>
            <td>
                :</td>
            <td>
                <asp:TextBox ID="api_key" runat="server" Width="51px">123</asp:TextBox>
            &nbsp;(api_key)</td>
        </tr>
        <tr>
            <td>
                Submit</td>
            <td>
                :</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" 
                    PostBackUrl="http://2ndstage.rocket21.com/admin/concierge_messages" 
                    Text="Submit" />
            </td>
        </tr>
    </table>
    </form>
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
</body>
</html>
