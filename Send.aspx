<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Send.aspx.vb" Inherits="Send" ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Send Email</title>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>    
    <link href="http://r21concierge.s3.amazonaws.com/css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>    
    <script language="javascript" type="text/javascript">

        function SelectAllCheckboxes(spanChk) {

            // Added as ASPX uses SPAN for checkbox
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ?
        spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;

            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" &&
              elm[i].id != theBox.id) {
                //elm[i].click();
                if (elm[i].checked != xState)
                    elm[i].click();
                //elm[i].checked=xState;
            }
        }
        function radioConfirm() {
            var ans = confirm("Are you sure you want to send the message to the selected recipients on Production?");
            if (ans == true)
                return true;
            else
                return false;
        }
</script>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            font-weight: bold;
            background-color: #CCCCCC;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="style1">
        <tr>
            <td>

                <%--<asp:HyperLink ID="hypBack" runat="server" 
                    NavigateUrl="javascript:history.back();">Back</asp:HyperLink>--%>
            </td>
        </tr>
        <tr>
            <td>

    <div style="border:solid 1px green; padding:10px 10px 10px 20px; background-color:#FFFBD6;">
      &nbsp;<asp:Image ID="imgWrapper" runat="server" />
&nbsp;<br />
        <b>Wrapper:</b>
        <asp:Label ID="lblWrapper" runat="server"></asp:Label>
        <br />
      <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>&nbsp;&nbsp;<br />
        <asp:Button ID="btnHome" runat="server" Text="Close Window" OnClientClick="return window.close();" Visible="false"/>
        <br />
        <asp:TextBox ID="txtMessage" runat="server" Height="91px" TextMode="MultiLine" 
            Visible="False" Width="238px"></asp:TextBox>
    </div>
            </td>
        </tr>
        <tr>
            <td>
    <asp:Panel ID="Panel1" runat="server">
        <div style="border:solid 1px green; ">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             CellPadding="4" ForeColor="#333333">
             <Columns>
              <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                   <asp:CheckBox ID="chkSelect" runat="server" Checked="true"/>
                </ItemTemplate>
               <HeaderTemplate>
                    <input id="chkAll" onclick="javascript:SelectAllCheckboxes(this);" runat="server" type="checkbox" />
                </HeaderTemplate>
               </asp:TemplateField>
               <asp:BoundField DataField="id" HeaderText="ID"  ReadOnly="True" />
               <asp:BoundField DataField="Name" HeaderText="Name"  ReadOnly="True" />
               <asp:BoundField DataField="login" HeaderText="Screen Name"  />
              
            </Columns>

             <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
             <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
             <PagerStyle BackColor="#FFCC66" ForeColor="#333333" 
                                       HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
             <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
             <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
        
        <div>
            <br />
            <span class="style4">Select the server:</span>
            <asp:RadioButton id="radStage" Text="Staging" Checked="True" 
            GroupName="Server" runat="server" BackColor="#00CC00"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton id="radProduction" Text="Production"
            GroupName="Server" runat="server" BackColor="Red"/>
        </div>
        
     </asp:Panel>    
            </td>
        </tr>
        
        <tr>
            <td>
        <div>
            <br />
            <br />
            <asp:Button ID="btnSendBottom" runat="server" 
                Text="Send Concierge Message To Selected Users" />
        </div>
            </td>
        </tr>
        <tr>
            <td>
        <asp:HiddenField ID="hidUsers1" runat="server" />
             <asp:HiddenField ID="txtSubject1" runat="server" />
             <asp:HiddenField ID="txtMsg1" runat="server" />
             <asp:HiddenField ID="txtWrapper1" runat="server" />
             <asp:HiddenField ID="txtMedia1" runat="server" />
             <asp:HiddenField ID="txtIconURL1" runat="server" />
             <asp:HiddenField ID="CPID1" runat="server" />
             <asp:HiddenField ID="MediaType1" runat="server" />
             <asp:HiddenField ID="hidMembers1" runat="server" />
             <asp:HiddenField ID="hidGroups1" runat="server" />
            </td>
        </tr>
        
    </table>

    </form>
</body>
</html>
