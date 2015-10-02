<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Catalog_JGbd.aspx.vb" Inherits="Catalog_JG"  ValidateRequest="false"%>
<%@ Register Assembly="obout_ComboBox" Namespace="Obout.ComboBox" TagPrefix="cc2" %>
<%@ Register Assembly="obout_Interface" Namespace="Obout.Interface" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>
    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/css/concierge.css" />
    <link href="./css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="./css/concierge_edit.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" type="text/css" href="./css/Catalog_New.css" />
    <title>Rocket21 Concierge Add Media</title>
    <script type="text/javascript">
        function clearTextBoxes(sname) {
            if (document.forms[0].txtContent.value == 'Enter Embedd URL etc.,' && sname == 'txtContent') document.forms[0].txtContent.value = '';
            if (document.forms[0].txtWebsite.value == 'Website URL (Generated)' && sname == 'txtWebsite') document.forms[0].txtWebsite.value = '';
            if (document.forms[0].txtURL.value == 'URL (Method Generated)' && sname == 'txtURL') document.forms[0].txtURL.value = '';
            if (document.forms[0].txtThumbURL.value == 'Thumb URL (Method Generated)' && sname == 'txtThumbURL') document.forms[0].txtThumbURL.value = '';
            if (document.forms[0].cboLinkText.value == 'View' && sname == 'cboLinkText') document.forms[0].cboLinkText.value = '';
            if (document.forms[0].txtTitle.value == 'Title Caption' && sname == 'txtTitle') document.forms[0].txtTitle.value = '';
            if (document.forms[0].txtCaption.value == 'Second Caption' && sname == 'txtCaption') document.forms[0].txtCaption.value = '';
            if (document.forms[0].txtFbMore.value == 'Additional FB Options (TEST)' && sname == 'txtFbMore') document.forms[0].txtFbMore.value = '';
            //            if (document.forms[0].txtMediaType.value == 'media_type' && sname == 'txtMediaType') document.forms[0].txtMediaType.value = '';
            if (document.forms[0].txtDescription.value == 'Description' && sname == 'txtDescription') document.forms[0].txtDescription.value = '';
            if (document.forms[0].txtTags.value == 'Tags' && sname == 'txtTags') document.forms[0].txtTags.value = '';
            if (document.forms[0].txtFB.value == 'FB text' && sname == 'txtFB') document.forms[0].txtFB.value = '';
            if (document.forms[0].txtNotes.value == 'Notes' && sname == 'txtNotes') document.forms[0].txtNotes = '';
        }
        function pageLoad(sender, args) {
            if (args.get_isPartialLoad()) {
                fb.activateElements();
            }
        }

        function showMore() {

            if (document.forms[0].cboMedia.value == "") {
                alert("Please select a Media Type");
                return false;
            }
            if (document.forms[0].txtContent.value == "") {
                alert("Please Enter Embedd Code");
                return false;
            }
        }
        function showCustom() {

            // document.forms[0].pnlShowMore.visibility = "visible";
            document.getElementById("pnlShowCustom").style.visibility = "visible";
            return false;
        }
        function showLess() {
            document.getElementById("pnlShowMore").style.visibility = "hidden";
            document.getElementById("pnlShowCustom").style.visibility = "hidden";
            return false;
        }
        function goBack() {
            history.go(-1);
            return false;
        }
        function ValidateForm() {
            if (document.forms[0].cboMedia.value == "") {
                alert("Please select a Media Type");
                return false;
            }
            if (document.forms[0].txtDescription.value == "") {
                alert("Please Enter a description");
                return false;
            }
            if (document.forms[0].txtContent.value == "") {
                alert("Please Enter Embedd Code");
                return false;
            }
        }
     </script>
    <style type="text/css">
        .style8
        {
            padding-top: 1px;
            text-transform: capitalize;
            font-weight: bold;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
    <%--//Topmost panel - item can be posted to catalog and/or Send Message --%>
    <asp:Panel ID="pnlMain" runat="server" Style="height: 585px;" class="panelDiv">
         <table width="100%">
            <tr>
                <td align="center">
                    <asp:Label ID="lblStatus" runat="server" ForeColor="#cc3300" Font-Bold="true"></asp:Label>
                 </td>
            </tr>
         </table>
    <span class="panelTitle">Concierge Catalog - Add Media</span>
        <div class="topWide">
            <table width="100%">
                <tr>
                    <td class="boxTitle">
                        Media Type <span class="reqdField">*</span>
                    </td>
                    <td class="boxTitle">
                        Submitter <span class="reqdField">*</span>
                    </td>
                    <td class="boxTitle">
                        Campaign <span class="reqdField">*</span>
                    </td>
                    <td class="boxTitle">
                        Type
                    </td>
                    <td class="boxTitle">
                        Modify Size To:
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc2:ComboBox ID="cboMedia" runat="server" 
                            FolderStyle="./css/oboutSuite/ComboBox/styles/plain" Width="100px" 
                             MenuWidth="100px">
                            <cc2:ComboBoxItem ID="cboMedia1" runat="server" Text="Video" Value="Video" />
                            <cc2:ComboBoxItem ID="cboMedia2" runat="server" Text="R21 Video" Value="R21 Video" />
                            <cc2:ComboBoxItem ID="cboMedia3" runat="server" Text="Image" Value="Image" />
                            
                        </cc2:ComboBox>
                        
                        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:Rocket21ConnectionString %>" 
                            SelectCommand="SELECT [type] FROM [Concierge_MediaType]">
                        </asp:SqlDataSource>--%>
                        <%--<cc1:OboutDropDownList ID="ddnMedia" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutDropDownList"
                            >
                        </cc1:OboutDropDownList>--%>
                    </td>
                    <td>
                         <cc2:ComboBox ID="cboSubmitted" runat="server" 
                            FolderStyle="./css/oboutSuite/ComboBox/styles/plain" Width="100px" 
                             MenuWidth="100px">
                            <cc2:ComboBoxItem ID="ComboBoxItem6" runat="server" Text="logged user" 
                                Value="logged user" />
                            <cc2:ComboBoxItem ID="ComboBoxItem11" runat="server" Text="admin" 
                                Value="admin" />
                            <cc2:ComboBoxItem ID="ComboBoxItem7" runat="server" Text="alleng" 
                                Value="alleng" />
                            <cc2:ComboBoxItem ID="ComboBoxItem8" runat="server" Text="bobd" 
                                Value="bobd" />
                        </cc2:ComboBox>
                    </td>
                    <td>
                        <cc2:ComboBox ID="cboOwner" runat="server" 
                            FolderStyle="./css/oboutSuite/ComboBox/styles/plain" Width="200px" 
                             MenuWidth="200px">
                            <cc2:ComboBoxItem ID="ComboBoxItem9" runat="server" Text="Camp Broadway
                            " 
                                Value="Camp Broadway"/>
                            <cc2:ComboBoxItem ID="ComboBoxItem10" runat="server" Text="Converse"
                                Value="Converse" />
                            <cc2:ComboBoxItem ID="ComboBoxItem12" runat="server" Text="Rocket21 Something" 
                                Value="Rocket21 Something" />
                            
                        </cc2:ComboBox>
                        
                    </td>
                    <td>
                        <cc1:OboutTextBox ID="txtOwnerType" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="80px" Text="SPONSOR"></cc1:OboutTextBox>
                    </td>
                    <td>
                        <%--<cc1:OboutDropDownList ID="ddnAddToGroup" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutDropDownList"
                            Width="80px">
                            <asp:ListItem> </asp:ListItem>
                        </cc1:OboutDropDownList>--%>
                        <cc1:OboutTextBox ID="txtPct" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="40px">
                        </cc1:OboutTextBox>&nbsp;% of Original
                    </td>
                </tr>
            </table>
        </div>
        <div class="topLeft">
            <table width="100%">
                <tr class="boxTitle">
                    <td>
                        R21 Categories
                    </td>
                </tr>
                <tr>
                    <td class="boxRow">
                        <cc2:ComboBox ID="lstCategory" runat="server" FolderStyle="./css/oboutSuite/ComboBox/styles/plain"
                            Width="90%" SelectionMode="Multiple" MultiSelectionSeparator=", " DataSourceID="ODSCategory"
                            DataTextField="name" DataValueField="id" EnableVirtualScrolling="True">
                        </cc2:ComboBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        Suggesed PEs
                    </td>
                </tr>
                <tr>
                    <td class="boxRow">
                        <cc2:ComboBox ID="ddlAssociatedPE" runat="server" FolderStyle="css/oboutSuite/ComboBox/styles/plain/style.css"
                            Width="90%" SelectionMode="Multiple" DataSourceID="ODSInterest" DataTextField="name"
                            DataValueField="id" MenuWidth="600px">
                        </cc2:ComboBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        Associations
                    </td>
                </tr>
                <tr>
                    <td class="boxRow">
                        <cc2:ComboBox ID="ddnAssociations" runat="server" FolderStyle="css/oboutSuite/ComboBox/styles/plain"
                            Width="90%" SelectionMode="Multiple" DataSourceID="ODSGroup" DataTextField="name"
                            DataValueField="id">
                        </cc2:ComboBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        Groups
                    </td>
                </tr>
                <tr>
                    <td class="boxRow2">
                        <cc2:ComboBox ID="listGroups" runat="server" Width="90%" FolderStyle="css/oboutSuite/ComboBox/styles/plain"
                            SelectionMode="Multiple">
                            <cc2:ComboBoxItem ID="ComboBox4Item1" runat="server" Text="someword" Value="1" />
                            <cc2:ComboBoxItem ID="ComboBox4Item2" runat="server" Text="another" Value="2" />
                            <cc2:ComboBoxItem ID="ComboBox4Item3" runat="server" Text="haberdasher" Value="3" />
                        </cc2:ComboBox>
                    </td>
                </tr>
                
            </table>
        </div>
        <div class="topRight">
            <table width="100%">
                <tr class="boxTitle">
                    <td>
                        Title
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtTitle" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            runat="server" TextMode="MultiLine" ToolTip="Appears at the Top Center  of the Media Frame."
                            Width="100%" Rows="2"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        2nd Caption
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtCaption" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            runat="server" TextMode="MultiLine" ToolTip="Appears at the Top Center  of the Media Frame."
                            Width="100%" Rows="2"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        Keywords
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="ddlKeywords" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            runat="server" ToolTip="Separate Keywords with Commas" Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr class="boxTitle">
                    <td>
                        Description <span class="reqdField">*</span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtDescription" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            runat="server" TextMode="MultiLine" ToolTip="Please be Descriptive" Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="centerWide">
        <table width="100%">
        <tr class="boxTitle">
        <td>Content Preview</td>
        <td width="80%">Embed Code <span class="reqdField">*</span></td>
        </tr>
        <tr>
        <td><asp:Literal ID="litPreview" runat="server"></asp:Literal>
        </td>
        <td width="80%">
            <cc1:OboutTextBox ID="txtContent" runat="server" Height="9em" TextMode="MultiLine"
                ToolTip="Place Media Embed Code or Page URL Here." Width="100%" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox">
            </cc1:OboutTextBox>
            </td></tr>
            </table>
        </div>
        <div class="bottomButtons">
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnPrevious" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="BACK" OnClientClick="return goBack();" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnMore" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="MORE" OnClientClick="return showMore();" Width="86px" >
                     </cc1:OboutButton>
                     <%--<input type="button" value="More" id="btnMore"  onclick="showMore();" />--%></div>
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnPreview" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="PREVIEW" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnRightGroup">
                <cc1:OboutButton ID="btnSubmit" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="SUBMIT" Width="86px" OnClientClick="return ValidateForm();">
                </cc1:OboutButton></div>
            <div class="btnRightGroup">
                <cc1:OboutButton ID="btnDirect" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="SEND" Width="86px">
                </cc1:OboutButton></div>
        </div>
    </asp:Panel>
       <asp:Panel ID="pnlShowMore" runat="server" class="panelDiv2" 
        Style="height: 550px;">
            <span class="panelTitle">Catalog Add Content Additional Settings</span> <%--This should reflect the mediaType.value--%>

        <div class="topWide">
<%-- //////Top of ShowMore Panel//////////////////////////////////////////////////////////////--%>
            <table class="tableTop">
                <tr>
                    <td class="boxTitleNoPad">
                        Website
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtWebsite" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="300px">
                        </cc1:OboutTextBox>&nbsp;&nbsp; 
                    </td>
                    <td>
                        <cc1:OboutTextBox ID="txtWidth" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="40px">
                        </cc1:OboutTextBox>&nbsp;px W&nbsp;&nbsp;x
                    </td>
                    <td>
                        <cc1:OboutTextBox ID="txtHeight" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="40px">
                        </cc1:OboutTextBox>&nbsp;px H&nbsp;&nbsp;
                    </td>
                    <td>
                        <%--<cc1:OboutTextBox ID="txtPct" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="40px">
                        </cc1:OboutTextBox>&nbsp;% of Original--%>
                    </td>
                </tr>
                <tr>
                <td class= "style8">
                Content URL
                </td>
                </tr>
                <tr>
                <td colspan="4">
                    <cc1:OboutTextBox ID="txtURL" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                </td>
                </tr>
                <tr>
                <td class="boxTitleNoPad">
                    Thumb URL</td>
                </tr>
                <tr>
                <td colspan="4">
                    <cc1:OboutTextBox ID="txtThumbURL" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                </td>
                </tr>
            </table>
        </div>
       
        <div class="bottomLeft">
        
            <table width="100%">
                <tr>
                    <td class="boxTitleNoPad">
                        Link Style</td>
                        </tr>
                        <tr>
                    <td>
                        <cc1:OboutDropDownList ID="ddnLinkStyle" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutDropDownList"
                            Width="100%">
                            <asp:ListItem Text="Thumbnail" Selected="True" />
                        </cc1:OboutDropDownList>
                    </td>
                    </tr>
                    <tr><td>
                        
                    </td></tr>
                    </table>
                    </div>
                    <div class="bottomMiddle">
                    <table width="100%">
                    <tr>
                    <td class="boxTitleNoPad">
                        Link Text</td>
                </tr>
                <tr>
                    <td>
                        <cc2:ComboBox ID="cboLinkText" runat="server" FolderStyle="css/oboutSuite/ComboBox/styles/plain"
                            Width="100%">
                        </cc2:ComboBox>
                    </td>
                </tr>
                <tr>
                    
                    <td class="boxTitleNoPad">
                        Alt &amp; Hover Text</td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtAlt" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    
                    <td class="boxTitleNoPad">
                        Notes</td>
                </tr>
                <tr>
                    <td>
                        <cc1:OboutTextBox ID="txtNotes" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    
                    <td class="boxTitleInfoOnly">
                        Title</td>
                </tr>
                <tr>
                    
                    <td>
                        <cc1:OboutTextBox ID="txtInfoTitle" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
                <tr>
                    
                    <td class="boxTitleInfoOnly">
                        Description</td>
                </tr>
                <tr>
                    
                    <td>
                        <cc1:OboutTextBox ID="txtInfoDescription" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
            </table>
            </div>
        <div class="bottomRight" id="rdoGroupShowAs">
        
        <table width="100%">
        <tr><td class="boxTitleNoPad" style="padding:0 0 10px 10px;">Show As:</td></tr>
        <tr><td style="padding:0 0 10px 0;"><cc1:OboutRadioButton ID="rbGallery" runat="server" Checked="True" 
                GroupName="rblDisplayAs" Text="&nbsp;Gallery" Width="100%" 
                FolderStyle="css/oboutSuite/Interface/styles/plain/OboutRadioButton" 
                TextAlign="Left">
            </cc1:OboutRadioButton></td></tr>
        <tr><td style="padding:0 0 10px 0;"><cc1:OboutRadioButton ID="rbSlideshow" runat="server" GroupName="rblDisplayAs" 
                Text="&nbsp;Slideshow" 
                FolderStyle="css/oboutSuite/Interface/styles/plain/OboutRadioButton" 
                TextAlign="Left" Width="100%">
            </cc1:OboutRadioButton></td></tr>
            
            
            </table>
        </div>
        <div class="bottomRight" id="rdoGroupDisplayOps">
        
        <table width="100%">
        <tr><td class="boxTitleNoPad" style="padding:0 0 10px 0px;">Display Options:</td></tr>
        <tr><td style="padding:0 0 10px 0;"><cc1:OboutRadioButton ID="rbNative" runat="server" Checked="True" 
                GroupName="rblImgSize" Text="&nbsp;Native Size" Width="100%" 
                FolderStyle="css/oboutSuite/Interface/styles/plain/OboutRadioButton" 
                TextAlign="Left">
            </cc1:OboutRadioButton></td></tr>
        <tr><td style="padding:0 0 10px 0;"><cc1:OboutRadioButton ID="rbFullscreen" runat="server" GroupName="rblImgSize" 
                Text="&nbsp;Fit Screen" 
                FolderStyle="css/oboutSuite/Interface/styles/plain/OboutRadioButton" 
                TextAlign="Left" Width="100%">
            </cc1:OboutRadioButton></td></tr>
            <tr><td style="padding:0 0 10px 0;"><cc1:OboutRadioButton ID="rbCustom" runat="server" GroupName="rblImgSize" 
                Text="&nbsp;Custom Size" 
                FolderStyle="css/oboutSuite/Interface/styles/plain/OboutRadioButton" 
                TextAlign="Left" Width="100%">
            </cc1:OboutRadioButton></td></tr>
            
            
            </table>
        </div>
        <div class="bottomButtons">
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnReturn1" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="BACK" onclientclick="return showLess();" Width="86px">
                </cc1:OboutButton>
                </div>
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnCustom" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="CUSTOM" OnClientClick="return showCustom();" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnPreview2" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="PREVIEW" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnRightGroup">
                <%--<cc1:OboutButton ID="OboutButton7" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="SUBMIT" Width="86px">
                </cc1:OboutButton>--%></div>
            
        </div>
    </asp:Panel>
    <br />
<%-- //////Top of ShowCustom Panel///////////////////////////////////////////////////////////--%>

    <asp:Panel ID="pnlShowCustom" runat="server" class="panelDiv3" Style="height: 250px;">
    <span class="panelTitle">Custom Floatbox Settings</span>
        <div class="topWide">
        <table class="tableTop">
            <tr>
                <td width="27px">
                    <cc1:OboutCheckBox ID="chkTip" runat="server" 
                        FolderStyle="css/oboutSuite/Interface/styles/plain/OboutCheckBox" 
                        Width="22px" ControlsToEnable="txtTip" 
                        >
                    </cc1:OboutCheckBox>
                </td>
                <td class="boxTitleNoPad">
                    Has Tooltip?</td>
            </tr>
            <tr>
                <td colspan="2">
                    <cc1:OboutTextBox ID="txtTip" runat="server" 
                        FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox" Width="100%"></cc1:OboutTextBox>
                </td>
            </tr>
            <tr>
                <td width="27px">
                    <cc1:OboutCheckBox ID="chkInfo" runat="server" 
                        FolderStyle="css/oboutSuite/Interface/styles/plain/OboutCheckBox" 
                        Font-Bold="False" Width="22px" ControlsToEnable="txtInfoLink">
                    </cc1:OboutCheckBox>
                </td>
                <td class="boxTitleNoPad">
                Has Info Link?
                </td>
            </tr>
            <tr>
                    <td colspan="2">
                        <cc1:OboutTextBox ID="txtInfoLink" runat="server" 
                            FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox" Width="100%"></cc1:OboutTextBox>
                    </td>
                </tr>
            
            
            <tr>
                <td width="27px">
                    <cc1:OboutCheckBox ID="chkPrint" runat="server" 
                        FolderStyle="css/oboutSuite/Interface/styles/plain/OboutCheckBox" 
                        Font-Bold="False" Width="22px" ControlsToEnable="txtPrint">
                    </cc1:OboutCheckBox>
                </td>
                <td class="boxTitleNoPad">
                Can Print?
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <cc1:OboutTextBox ID="txtPrint" runat="server" 
                        FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox" Width="100%"></cc1:OboutTextBox>
                </td>
            </tr>
        </table>
        </div>
        <%--<div class="bottomButtons">
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnReturn2" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="BACK" onclientclick="return showLess();" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnLeftGroup">
                <cc1:OboutButton ID="btnPreview3" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="PREVIEW" Width="86px">
                </cc1:OboutButton></div>
        </div>--%>
        </asp:Panel>
    <div>
        <asp:HiddenField ID="txtFB" runat="server" />
    </div>
    <asp:ObjectDataSource ID="ODSCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interest_categoriesTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interest_groupsTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSInterest" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interestsTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSMediaType" runat="server" OldValuesParameterFormatString="original_{0}"
                            selectmethod="GetData" TypeName="dsConciergeTableAdapters.Concierge_mediatypeTableAdapter">
                        </asp:ObjectDataSource>
    </form>
</body>
</html>
