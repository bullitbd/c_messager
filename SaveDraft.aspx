<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SaveDraft.aspx.vb" Inherits="SaveDraft" ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rocket21 - Save Drtft</title>
    <link href="./css/StyleSheet.css" rel="stylesheet" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <div style="border: solid 1px green; width: 900px; height: 200px; background-color: #FFFBD6; margin: 0 auto;">
           <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                color: White; height: 20px; text-align: center;">
                Rocket21 Concierge Mailing System</div>
            <table width="900px">
                <tr>
                    <td align="center"><asp:Label ID="Label1" runat="server" Text="Your Draft Saved Successfully."></asp:Label></td>
                </tr>
                <tr>
                    <td align="center"> <asp:Button ID="btnHome" runat="server" Text="Back to Home"  Visible="false"/></td>
                </tr>
            </table>   
       </div>
    </form>
</body>
</html>
