<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Concierge Management: Main Menu</title>

    <script type="text/javascript">

        function pageLoad() {
        }
    
    </script>

    <style type="text/css">
        .style1
        {
            width: 35%;
            background-color: #CCFF99;
        }
        .style3
        {
            height: 23px;
            text-align: center;
            background-color: #C0C0C0;
        }
        .style4
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div title="Concierge Management: Main Menu">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
    </div>
    <table class="style1">
        <tr>
            <td colspan="3" style="text-align: right">
                <asp:LinkButton ID="lbkBtnLogout" runat="server">Logout</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style3" colspan="3">
                <h3>
                    R21 Concierge Tool</h3>
            </td>
        </tr>
        <tr>
            <td>
                1.
            </td>
            <td>
                :
            </td>
            <td>
                <a href="home.aspx">Concierge Message Tool.</a>
            </td>
        </tr>
        <tr>
            <td class="style4">
                2.
            </td>
            <td class="style4">
                :
            </td>
            <td class="style4">
                <a href="Catalog.aspx">Catalog Management Tool</a>
            </td>
        </tr>
        <tr>
            <td>
                3.
            </td>
            <td>
                :
            </td>
            <td>
                <a href="Catalog_New.aspx">Add Media to Catalog</a>
            </td>
        </tr>
        <tr>
            <td>
                3b.
            </td>
            <td>
                :
            </td>
            <td>
                <a href="Catalog_New2.aspx"><i>New Add Media</i></a>
            </td>
        </tr>
        <tr>
            <td>
                4.
            </td>
            <td>
                :
            </td>
            <td>
                <a href="Media_Group.aspx">Conceirge Manage Media Group</a>
            </td>
        </tr>
        <tr>
            <td>
                5.
            </td>
            <td>
                :
            </td>
            <td>
                <a href="CustomGroup.aspx">Create Custom Group</a>
            </td>
        </tr>
        
        <tr>
            <td colspan="3" style="font-weight: 700">
                Reports
            </td>
        </tr>
        <tr>
            <td>
                1.:
            </td>
            <td>
                :
            </td>
            <td>
                <a href="http://daddyadmin.rocket21.com/WebReports/reports/rpt_concierge_draft.aspx">
                    Draft Messages Report</a>
            </td>
        </tr>
        <tr>
            <td>
                2
            </td>
            <td>
                :
            </td>
            <td>
                <a href="http://daddyadmin.rocket21.com/WebReports/reports/rpt_concierge_message.aspx">
                    Sent Messages Report</a>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="font-weight: 700">
                Utilities
            </td>
        </tr>
        <tr>
            <td>
                1.:
            </td>
            <td>
                :
            </td>
            <td>
                <a href="Ifrm_video.aspx">
                    Video Embed Converter</a>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
