<%@ Page Language="VB" AutoEventWireup="false" CodeFile="previewfb.aspx.vb" Inherits="previewfb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Float-box Preview</title>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />

    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>

    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>

    <link href="http://r21concierge.s3.amazonaws.com/css/StyleSheet.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="lblStatus" runat="server"></asp:Label> 
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
        GridLines="None" Height="55px" Width="216px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <Fields>
            <asp:TemplateField HeaderText="Float-Box Preview" SortExpression="media_text">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("media_text") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("media_text") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("media_text") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
       
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" SelectCommand="Select media_text
From vw_Concierge_Messages
WHERE MessageID = @msgid">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="47" Name="msgid" 
                QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    </form>
</body>
</html>
