<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>R21 Concierge: Login</title>
    <style type="text/css">
        .style1
        {
            width: 50%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; background-color: #C0C0C0">
    
        <h2>
            Rocket21 Concierge Login</h2>
    
    </div>
    <div style="text-align: center; background-color: #FFFF99">
    
        <table align="center" class="style1">
            <tr>
                <td>
    
        <asp:Login ID="Login1" runat="server" BackColor="#F7F7DE" BorderColor="#CCCC99" 
            BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/Default.aspx" 
            Font-Names="Verdana" Font-Size="10pt" Height="118px" Width="493px">
            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
        </asp:Login>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
