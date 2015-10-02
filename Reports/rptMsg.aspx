<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rptMsg.aspx.vb" Inherits="Reports_rptMsg" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Concierge: Sent Messages Report</title>
    <link type="text/css" rel="stylesheet" href="./floatbox/floatbox.css" />

    <script type="text/javascript" src="./floatbox/floatbox.js"></script>

    <script type="text/javascript" src="./floatbox/options.js"></script>

    <link href="./css/StyleSheet.css" rel="stylesheet" type="text/css" />

    <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx">Back</asp:HyperLink>
    
    </div>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" Height="609px" Width="1036px">
        <ServerReport ReportPath="/Rocket21/R21_Concierge_Message" 
            ReportServerUrl="http://W2008SRV.rocket21.com/reportserver" />
        <LocalReport ReportPath="G:\ftproot\Concierge\Reports\rptMessage.rdlc">
            <DataSources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                    Name="dsConcierge_vw_Concierge_Messages" />
            </DataSources>
        </LocalReport>
    </rsweb:ReportViewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetData" 
        TypeName="dsConciergeTableAdapters.vw_Concierge_MessagesTableAdapter">
    </asp:ObjectDataSource>
    </form>
</body>
</html>
