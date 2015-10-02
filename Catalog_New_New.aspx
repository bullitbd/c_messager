<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Catalog_New_New.aspx.vb" Inherits="Catalog_New_New" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="Stylesheet" type="text/css" href="css/Catalog_New.css" />
    <style type="text/css">
        </style>
</head>
<body>
     <form id="form1" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <div id="topWide">
        <table id="tableTop">
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Media Type" class="boxTitle" ToolTip='Select the type of content; for most video sites, you will simply select "Video".  For videos off the site, choose "R21Video"...'></asp:Label>
                    <span class="style2">&nbsp;*</span>
                </td>
                <td class="boxTitle">
                    Submitter <span class="style2">*</span>
                </td>
                <td class="boxTitle">
                    Owner <span class="style2">*</span>
                </td>
                <td class="boxTitle">
                    Owner Type
                </td>
                <td class="boxTitle">
                    Add to Group:
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="topLeft">
        <table class="style1">
            <tr class="boxTitle">
                <td>
                    R21 Categories
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Suggesed PEs
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Associations
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Groups
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Embed Code <span class="style2">*</span>
                </td>
            </tr>
        </table>
    </div>
    <div id="topRight">
        <table class="style1">
            <tr class="boxTitle">
                <td>
                    Title
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    2nd Caption
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Keywords
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr class="boxTitle">
                <td>
                    Description <span class="style2">*</span>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
    <div id="centerWide">
        <asp:TextBox ID="TextBox1" runat="server" CssClass="tboEmbed"></asp:TextBox>
    </div>
    <div id="bottomButtons">
        <asp:Button ID="Button1" runat="server" Text="back" CssClass="btnLeftGroup buttons" />
        <asp:Button ID="Button2" runat="server" Text="more" CssClass="btnLeftGroup buttons"
            ToolTip="ttMore" />
        <asp:Button ID="Button3" runat="server" Text="preview" CssClass="btnLeftGroup buttons" />
        <asp:Button ID="Button4" runat="server" Text="send" CssClass="btnRightGroup buttons" />
        <asp:Button ID="Button5" runat="server" Text="submit" CssClass="btnRightGroup buttons" />
    </div>
    </form>
</body>
</html>
