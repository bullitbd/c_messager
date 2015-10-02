<%@ Page Language="VB" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="HTMLEditor" %>
<%@ Register Namespace="ConciergeControls" tagprefix="custom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rocket21 Concierge Mailing System</title>    
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>    
    
    <link href="./css/StyleSheet.css" rel="stylesheet" type="text/css" />
     <script language="javascript" type="text/javascript" src="JavaScript/Maskdiv.js"></script>
    <script language="javascript" type="text/javascript">

        function Popup() {
            var width = 1024;
            var height = 640;
            var left = parseInt((screen.availWidth / 2) - (width / 2));
            var top = parseInt((screen.availHeight / 2) - (height / 2));
            var sURL = "http://2ndstage.rocket21.com/workspaces/child#child=tab1";
            var windowFeatures = "dialogWidth:" + width + "px;dialogHeight:" + height + "px;status;resizable=yes;scroll:yes;dialogLeft:" + left + "px;dialogTop=" + top + "px;";
            //myWindow = window.open("http://2ndstage.rocket21.com/workspaces/child#child=tab1", "subWind", windowFeatures);
            //myWindow.focus();
            //return false;
            window.showModalDialog(sURL, "subWind", windowFeatures);
            return true;         
        }


        
        function openPopUp() {
            document.forms[0].action = "Send.aspx";
            document.forms[0].method = "post";
            document.forms[0].__VIEWSTATE.name = 'NOVIEWSTATE';
            document.forms[0].submit;
        }
        function PreviewMsg() {
            new_window = window.open('preview.aspx', 'preview', 'width=600,height=600,scrollbars=yes,menubar=no,resizable=no');

            //document.forms[0].target = 'preview';
            //document.forms[0].action = "preview.aspx";
            //document.forms[0].__VIEWSTATE.name = 'NOVIEWSTATE';
            //document.forms[0].submit();
            return true;
        }
        function clearSubject() {
            if (document.forms[0].txtSubject.value == 'Enter Text...') document.forms[0].txtSubject.value = '';
        }
        function clearMsg() {
            if (document.forms[0].txtMsg.value == 'Enter Text...') document.forms[0].txtMsg.value = '';
        }
        function PreviewMsg1() {
            window.showModalDialog("preview.aspx", "Dialog", "dialogWidth:800px;dialogHeight:600px;");
            return false;
        }
        function clearConfirm() {
            var ans;
            ans = confirm("Clear entire Recipient List?");
            if (ans == true)
                return true;
            else
                return false;
        }

    </script>
</head>
<body>
 <script language="javascript" type="text/javascript">
     function SendMails() {
         var content = $find("<%=Editor.ClientID%>").get_content().replace(/<br\s?\/>(<br\s?\/>){0,1}/gmi, "</p><p>");
         //var content = document.forms[0].Editor.value;
         if (document.forms[0].hidUsers.value == "") { alert("Please select atleast one user"); return false; }
         else if (document.forms[0].txtSubject.value == "" || document.forms[0].txtSubject.value == "Enter Text...")
         { alert("Please enter the subject"); document.forms[0].txtSubject.focus(); return false; }
         else if (content == "")
         { alert("Please enter the Message"); document.forms[0].Editor.focus(); return false; }
         else {
             document.forms[0].txtMsg.value = content;
             document.forms[0].action = "Send.aspx";
             document.forms[0].method = "post";
             document.forms[0].__VIEWSTATE.name = 'NOVIEWSTATE';
             document.forms[0].submit;
             //window.open('Send.aspx', 'send', 'height=300,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,status=no');
             return true;
         }
     }
     function SaveDraft() {
         var content = $find("<%=Editor.ClientID%>").get_content().replace(/<br\s?\/>(<br\s?\/>){0,1}/gmi, "</p><p>");
         //var content = document.forms[0].Editor.value;
         if (document.forms[0].hidUsers.value == "") { alert("Please select atleast one user"); return false; }
         else if (document.forms[0].txtSubject.value == "" || document.forms[0].txtSubject.value == "Enter Text...")
         { alert("Please enter the subject"); document.forms[0].txtSubject.focus(); return false; }
         else if (content == "")
         { alert("Please enter the Message"); document.forms[0].Editor.focus(); return false; }
         else {
             document.forms[0].txtMsg.value = content;
             document.forms[0].action = "SaveDraft.aspx";
             document.forms[0].method = "post";
             document.forms[0].__VIEWSTATE.name = 'NOVIEWSTATE';
             document.forms[0].submit;
             //window.open('Send.aspx', 'send', 'height=300,width=400,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=no,status=no');
             return true;
         }
     }
</script>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
        
                <div style="border: solid 1px green; width: 900px; height: 740px; background-color: #FFFBD6; margin: 0 auto;">
                <div>
                <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="Default.aspx">Back</asp:HyperLink>
            </div>
                <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                color: White; height: 20px; text-align: center;">
                Rocket21 Concierge Mailing System</div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                     <div style="border: solid 0px green; padding: 10px 1px 1px 10px; width: 450px; float: left;">
                        <table border="0">
                            <tr>
                                <td colspan="2">
                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" 
                                        AssociatedUpdatePanelID="UpdatePanel1">
                                        <ProgressTemplate>
                                             <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; text-align: center;">
                                                <img src="./images/Refresh_animated.gif" style="padding-top: 250px;" alt="processing" />
                                             </div>
                                        </ProgressTemplate>
                                    </asp:UpdateProgress>
                                </td>
                            </tr>
                         </table>
                        <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                            color: White; display: none">
                            1.Select Interests
                                         <asp:CheckBoxList ID="chkInterests" runat="server" RepeatDirection="Horizontal">
                                            <asp:ListItem id="optPE" runat="server" Selected="True" Value="PE" />
                                            <asp:ListItem id="optGroup" runat="server" Selected="True" Value="Groups" />
                                            <asp:ListItem id="optSpecial" runat="server" Selected="True" Value="Special" />
                                            <asp:ListItem Selected="True">Demographics</asp:ListItem>
                                        </asp:CheckBoxList>
                           
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <span style="font-weight: bold;">SELECT GROUP (1 or more)</span><br />
                                        <asp:ListBox ID="ListGroups" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="60px" DataSourceID="SDSGroupList" DataTextField="Group_Name" 
                                            DataValueField="Group_Id"></asp:ListBox>
                                    </td>
                                    <td valign="middle" align="center" style="width: 30px">
                                        <asp:Button ID="btnAddGroup" runat="server" Text=">" Width="30px" /><br />
                                        <asp:Button ID="btnRemoveGroup" runat="server" Text="<" Width="30px" />
                                        <br />
                                    </td>
                                    <td>
                                        <span style="font-weight: bold;">MEMBERS OF</span><br />
                                        <asp:ListBox ID="ListGroupsNew" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="60px"></asp:ListBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="font-weight: bold;">SELECT CUSTOM GROUP (1 or more)</span><br />
                                        <asp:ListBox ID="ListCustomGroups" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="60px" DataSourceID="SDSCustomGroupList" DataTextField="Group_Name" 
                                            DataValueField="Group_Id"></asp:ListBox>
                                    </td>
                                    <td valign="middle" align="center" style="width: 30px">
                                        <asp:Button ID="btnAddGroupCustom" runat="server" Text=">" Width="30px" /><br />
                                        <asp:Button ID="btnRemoveGroupCustom" runat="server" Text="<" Width="30px" />
                                        <br />
                                    </td>
                                    <td>
                                        <span style="font-weight: bold;">MEMBERS OF</span><br />
                                        <asp:ListBox ID="ListCustomGroupsNew" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="60px"></asp:ListBox>
                                    </td>
                                </tr>                                
                            </table>                        
                            <table>
                                <tr>
                                    <td>
                                        <span style="font-weight: bold;">SELECT PE (1 or more)</span><br />
                                        <asp:ListBox ID="ListInterests" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="150px"></asp:ListBox>
                                    </td>
                                    <td valign="middle" align="center" style="width: 30px">
                                        <asp:Button ID="btnAddInterest" runat="server" Text=">" Width="30px" /><br />
                                        <asp:Button ID="btnRemoveInterest" runat="server" Text="<" Width="30px" />
                                        <br />
                                    </td>
                                    <td>
                                        <span style="font-weight: bold;">MEMBERS OF</span><br />
                                        <asp:ListBox ID="ListInterestsNew" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="150px"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br clear="all" />
                        <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                            color: White;">
                            2.Select Recipients
                                        <asp:CheckBoxList ID="chkUsers" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                                            <asp:ListItem id="option1" runat="server" Selected="True" Value="B3" />
                                            <asp:ListItem id="option2" runat="server" Selected="True" Value="T10" />
                                            <asp:ListItem id="option3" runat="server" Selected="True" Value="pGPS" />
                                        </asp:CheckBoxList>                        
                            </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <span style="font-weight: bold;">Users</span>
                                        <br />
                                        <asp:RadioButtonList ID="rdbProfileType" runat="server" AppendDataBoundItems="True"
                                            AutoPostBack="True" Font-Size="Small" RepeatDirection="Horizontal">
                                            <asp:ListItem Selected="True" Value="A">All</asp:ListItem>
                                            <asp:ListItem Value="C">Child</asp:ListItem>
                                            <asp:ListItem Value="P">Pro</asp:ListItem>
                                        </asp:RadioButtonList>
                                        <asp:ListBox ID="ListUsers" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="150px" DataSourceID="ObjectDataSource1" DataTextField="name" 
                                            DataValueField="id">
                                        </asp:ListBox>
                                    </td>
                                    <td valign="middle" align="center" style="width: 30px">
                                        <asp:Button ID="btnAddUsers" runat="server" Text=">" Width="30px" /><br />
                                        <asp:Button ID="btnRemoveUsers" runat="server" Text="<" Width="30px" />
                                        <asp:ImageButton ID="imgBtnClear" runat="server" 
                                            ImageUrl="~/images/clear_list01.jpg" onclientclick="return clearConfirm();" 
                                            ToolTip="Clear Recipient List" />
                                    </td>
                                    <td>
                                        <span style="font-weight: bold;">Recipient List:</span><asp:Label ID="lblCount" runat="server"
                                            Text=""></asp:Label>
                                        <br />
                                        <asp:Label ID="lblStatus" runat="server" ForeColor="#0033CC" BackColor="#FFFF66"></asp:Label>
                                        <br />
                                        <asp:ListBox ID="ListUsersNew" runat="server" SelectionMode="Multiple" Width="200px"
                                            Height="150px"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                            <asp:HiddenField ID="hidUsers" runat="server" />
                            <asp:HiddenField ID="hidMembers" runat="server" />
                            <asp:HiddenField ID="hidGroups" runat="server" />
                            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                                SelectMethod="GetData" TypeName="dsConciergeTableAdapters.sp_users_profile_getTableAdapter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="rdbProfileType" DbType="Object" DefaultValue="A"
                                        Name="profile_type" PropertyName="SelectedValue" Type="String" />
                                </SelectParameters>
                            </asp:ObjectDataSource>
                            <asp:SqlDataSource ID="SDSGroupList" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" 
                                SelectCommand="SELECT [Group_Id], [Group_Name] FROM [vw_Concierge_Group_Count]"></asp:SqlDataSource>
                            <asp:SqlDataSource ID="SDSCustomGroupUsers" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" 
                                SelectCommand="sp_Concierge_CustomGroup_Members" 
                                SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="group_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource> 
                            <asp:SqlDataSource ID="SDSGroupUsers" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" 
                                SelectCommand="sp_Concierge_Group_Members" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter Name="group_id" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="SDSCustomGroupList" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" 
                                SelectCommand="SELECT [Group_Id], [Group_Name] FROM [vw_Concierge_CustomGroup_Count]">
                            </asp:SqlDataSource>
                        </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div style="padding: 10px 1px 1px 1px; width: 420px; float: right;">
                    <div style="padding: 5px 1px 5px 5px; background-color: #990000; font-weight: bold;
                        color: White; height: 20px;">
                        3.Compose Messageessage</div>
                    <div>
                        <table>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="font-weight: bold;">TYPE/ICON</span><br />
                                    <asp:ListBox ID="lstType" runat="server" SelectionMode="Single" Width="100px" Height="50px" AutoPostBack="true">
                                    </asp:ListBox>
                                </td>
                                <td>
                                </td>
                                <td>
                                    <span style="font-weight: bold;">WRAPPER</span><br />
                                    <asp:ListBox ID="lstWrapper" runat="server" SelectionMode="Single" Width="300px"
                                        Height="50px" AutoPostBack="true"></asp:ListBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td colspan="3" valign="top">
                                    <table>
                                        <tr>
                                            <td><asp:TextBox ID="txtIconURL" runat="server" BorderWidth="1" Width="370px" ></asp:TextBox></td>
                                            <td><asp:Image ID="imgIcon" Width="25" Height="25" runat="server" /></td>

                                        </tr>
                                    </table>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:TextBox ID="txtWrapper" runat="server" BorderWidth="1" Width="400px" ></asp:TextBox>
                                </td>
                            </tr>
                          
                            <tr>
                                <td colspan="3">
                                    <span style="font-weight: bold;">SUBJECT:</span><br />
                                    <asp:TextBox ID="txtSubject" runat="server" BorderWidth="1" Width="400px" Text="Enter Text..."></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <span style="font-weight: bold;">MESSAGE:</span><br />
                                    <custom:MsgEditor runat="server" Id="Editor"  Height="200px" 
                                        InitialCleanUp="True" Font-Names="Arial,Helvetica,Sans-Serif" 
                                        Font-Size="6pt" DesignPanelCssPath="~/css/EditorFontOverrides.css" />
                                    <%--<HTMLEditor:Editor runat="server" Id="Editor"  Height="200px" />--%>
                                    <%--<asp:TextBox ID="Editor" runat="server" BorderWidth="1" Width="400px" 
                                                    TextMode="MultiLine" Rows="6"></asp:TextBox>--%>
                                </td>
                             </tr>
                             <tr>
                                <td colspan="3">
                                    <table>
                                        <tr valign="top">
                                            <td cMedia Text:</span></td>
                                        </tr>
                                        <tr valign="top">
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtMedia" runat="server" BorderWidth="1" Width="300px" 
                                                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:button id="btnInsertHTML" runat="server" text="Insert Content" />
                                                            <asp:Button ID="btnPreview" runat="server" Text="Preview" 
                                                                 />
                                                            <asp:Button ID="btnClear" runat="server" Text="Clear Content" />
                                                            <asp:Button ID="btnSaveDraft" runat="server" Text="Save Draft" />
                                                            <asp:Button ID="btnSend" runat="server" Text="Send" /><br />
                                                            <asp:HyperLink ID="hypPopup" runat="server" onclick="return Popup();" NavigateUrl="#" ImageUrl="images/r21_mini.png">Open Preview</asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <asp:Panel ID="pnlUpdate" runat="server" Visible="false">
                                                        <tr>
                                                            <td>
                                                                <table style="border: solid 1px green; background: yellow;">
                                                                    <tr>
                                                                        <td><span style="font-weight: normal;">Updated By</span></td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtUpdatedBy" runat="server" BorderWidth="1" Width="200px" 
                                                                                TextMode="SingleLine"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><span style="font-weight: normal;">Updated Notes</span></td>
                                                                        <td>
                                                                            <asp:TextBox ID="txtUpdatedNotes" runat="server" BorderWidth="1" Width="200px" 
                                                                                TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                     <tr>
                                                                        <td colspan="2" align="right"> <asp:Button ID="btnUpdateDraft" runat="server" Text="Update Draft" /></td>
                                                                        
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </asp:Panel>
                                                </table>
                                            </td>
                                            <td>
                                                <asp:Literal ID="litPreview" runat="server"></asp:Literal>
                                                <asp:HiddenField ID="txtMsg" runat="server" />
                                                <asp:HiddenField ID="CPID" runat="server" />
                                                <asp:HiddenField ID="MediaType" runat="server" />
                                                <asp:HiddenField ID="DraftID" runat="server" />
                                            </td>
                                        </tr>
                                  </table>
                                </td>
                            </tr>
                           
                        </table>
                    </div>
                </div>
            </div>
                <ajaxToolkit:modalpopupextender id="ModalPopupExtender1" runat="server" 
	    cancelcontrolid="btnCancel" 
	    targetcontrolid="btnInsertHTML" popupcontrolid="Panel1" 
	    popupdraghandlecontrolid="PopupHeader" drag="true" 
	    backgroundcssclass="ModalPopupBG">
        </ajaxToolkit:modalpopupextender>
                <asp:panel id="Panel1" style="display: none" runat="server">
	        <div class="Popup">
                    <div class="PopupHeader" id="PopupHeader">Select HTML Tags</div>
                    <div id="div1" style="Width:1200px; Height:500px; overflow:scroll;" runat="server">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                            BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                                            CellPadding="2" DataKeyNames="AutoID" 
                            DataSourceID="ODSTag" Font-Names="Arial" 
                                            Font-Size="X-Small" ForeColor="Black">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="AutoID" HeaderText="ID" 
                                                    SortExpression="AutoID" />
                                                <asp:TemplateField HeaderText="HTMLEmbedTag" SortExpression="HTMLEmbedTag">
                                                   <ItemTemplate>
                                                        <asp:Literal ID="litPreview1" Text=<%#Eval("HTMLEmbedTag")%> runat="server"></asp:Literal>                                                    
                                                    </ItemTemplate> 
                                                </asp:TemplateField>                                                 
                                                <asp:BoundField DataField="ModifiedOn" HeaderText="Modified On" 
                                                    SortExpression="ModifiedOn" dataformatstring="{0:d}" />
                                                <asp:BoundField DataField="SubmittedBy" HeaderText="Submitted By" 
                                                    SortExpression="SubmittedBy" />    
                                                <asp:BoundField DataField="MediaType" HeaderText="Type" 
                                                    SortExpression="MediaType" />
                                                <asp:BoundField DataField="Title" HeaderText="Title" 
                                                    SortExpression="Title" />
                                                <asp:BoundField DataField="Caption" HeaderText="Caption" 
                                                    SortExpression="Caption" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" 
                                                    SortExpression="Description" />   
                                                <asp:BoundField DataField="AssociatedPEName" HeaderText="PE" 
                                                    SortExpression="AssociatedPEName" />
                                                <asp:BoundField DataField="Interest_Category" HeaderText="Category" 
                                                    SortExpression="Interest_Category" />
                                                <asp:BoundField DataField="Interest_Group" HeaderText="Group" 
                                                    SortExpression="Interest_Group" />
                                                 <asp:BoundField DataField="Tags" HeaderText="Tags" 
                                                    SortExpression="Tags" /> 
                                                <asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                                                    SortExpression="Keywords" />  
                                              <asp:BoundField DataField="Notes" HeaderText="Notes" 
                                                    SortExpression="Notes" />    
                                            </Columns>
                                            <FooterStyle BackColor="Tan" />
                                            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                                HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                            <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                            <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                        </asp:GridView>
                    
                                        <asp:ObjectDataSource ID="ODSTag" runat="server" DeleteMethod="Delete" 
                                            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                            SelectMethod="GetData" 
                                            TypeName="dsConciergeTableAdapters.sp_ContentPicket_MediaGroup_getTableAdapter" 
                                            UpdateMethod="Update">
                                            <DeleteParameters>
                                                <asp:Parameter Name="AutoID" Type="Int32" />
                                            </DeleteParameters>
                                            <UpdateParameters>
                                                <asp:Parameter Name="AutoID" Type="Int32" />
                                                <asp:Parameter Name="WebSiteURL" Type="String" />
                                                <asp:Parameter Name="HTMLEmbedTag" Type="String" />
                                                <asp:Parameter Name="KeyWords" Type="String" />
                                                <asp:Parameter Name="AssociatedPE" Type="String" />
                                                <asp:Parameter Name="InternalNotes" Type="String" />
                                            </UpdateParameters>
                                            <SelectParameters>
                                                <asp:Parameter Name="DateFrom" Type="DateTime" />
                                                <asp:Parameter Name="DateTo" Type="DateTime" />
                                                <asp:Parameter Name="SubmittedBy" Type="String" />
                                                <asp:Parameter Name="KeyWords" Type="String" />
                                                <asp:Parameter Name="AccociatedPE" Type="String" />
                                            </SelectParameters>
                                            <InsertParameters>
                                                <asp:Parameter Name="SubmittedBy" Type="String" />
                                                <asp:Parameter Name="WebSiteURL" Type="String" />
                                                <asp:Parameter Name="HTMLEmbedTag" Type="String" />
                                                <asp:Parameter Name="KeyWords" Type="String" />
                                                <asp:Parameter Name="AssociatedPE" Type="String" />
                                                <asp:Parameter Name="InternalNotes" Type="String" />
                                            </InsertParameters>
                                        </asp:ObjectDataSource>
                    </div>
                    <div class="Controls">
                       <input id="btnCancel" type="button" value="Cancel" />
		            </div>
            </div>
        </asp:panel>
            
    </form>
</body>
</html>
