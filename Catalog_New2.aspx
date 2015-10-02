<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Catalog_New2.aspx.vb" Inherits="Catalog_New"
    ValidateRequest="false" %>

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

        //        function ShowGrp() {
        //            if (document.getElementById("ddnGroup").value == "New") {
        //                document.getElementById("divGroup").style.visibility = "visible";
        //                document.getElementById("divGroup").focus();
        //            }
        //            else {
        //                document.getElementById("divGroup").style.visibility = "hidden";
        //            }
        //        }

        function showMore() {

            // document.forms[0].pnlShowMore.visibility = "visible";
            document.getElementById("pnlShowMore").style.visibility = "visible";
            return false;
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
    <%--///////////////////////////////////////////////////////////////////////////////
T/////////Topmost panel - item can be posted to catalog and/or Send Message --%>
    <asp:Panel ID="pnlMain" runat="server" Style="height: 570px;" class="panelDiv">
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
                        Add to Group:
                    </td>
                </tr>
                <tr>
                    <td>
                        <cc2:ComboBox ID="cboMedia" runat="server" 
                            FolderStyle="./css/oboutSuite/ComboBox/styles/plain" Width="100px" 
                             MenuWidth="100px" DataTextField="type" 
                            DataValueField="id" >

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
                            Width="100px" Text="SPONSOR"></cc1:OboutTextBox>
                    </td>
                    <td>
                        <cc1:OboutDropDownList ID="ddnAddToGroup" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutDropDownList"
                            Width="80px">
                            <asp:ListItem> </asp:ListItem>
                        </cc1:OboutDropDownList>
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
                <tr class="boxTitle">
                    <td>
                        Embed Code <span class="reqdField">*</span>
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
            <cc1:OboutTextBox ID="txtContent" runat="server" Height="9em" TextMode="MultiLine"
                ToolTip="Place Media Embed Code or Page URL Here." Width="100%" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox">
            </cc1:OboutTextBox>
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
                    Text="SUBMIT" Width="86px">
                </cc1:OboutButton></div>
            <div class="btnRightGroup">
                <cc1:OboutButton ID="btnDirect" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutButton"
                    Text="SEND" Width="86px">
                </cc1:OboutButton></div>
        </div>
    </asp:Panel>
    <br />
    
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
                        <cc1:OboutTextBox ID="txtPct" runat="server" FolderStyle="css/oboutSuite/Interface/styles/plain/OboutTextBox"
                            Width="40px">
                        </cc1:OboutTextBox>&nbsp;% of Original
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
                        <asp:Literal ID="litPreview" runat="server"></asp:Literal>
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
    
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
    <div style="height:200px;">
    </div>
    <div class="outerbox">
        <asp:HyperLink ID="hypBack" runat="server" NavigateUrl="Default.aspx">Back</asp:HyperLink>
    </div>
    <div class="outerbox">
        <div class="innerbox">
            <span style="color: Maroon; font-size: small; font-style: italic;">test bd 11-13 (and
                /App_Code/ParseEmbed.vb)italic;">test bd 11-13 (and
                /App_Code/ParseEmbed.vb)                    <td valign="top">
                        <table>
                            <tr>
                                <td>
                                    <span class="smalltext">Paste URL, Video Embed Code or Content</span>
                                    <%--<asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="420px" Height="80px"
                                        CssClass="box"></asp:TextBox>--%>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    <span class="smalltext">Submitted By</span>
                                    <%--<asp:DropDownList ID="ddnSubmitted" runat="server" CssClass="box" Style="margin: 10px 0 0px 10px">
                                </asp:DropDownList>--%>
                                    <asp:TextBox ID="validstart" runat="server" Text="Please select a media type." Style="background-color: transparent;
                                        border-style: none;"></asp:TextBox>
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Media_Group.aspx" runat="server">Create Image Group</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td valign="top">
                        <table>
                            <tr>
                                <td>
                                    <%--<span class="smalltext">Media Type</span>
                                    <asp:ListBox ID="ddnMedia" runat="server" Width="120px" Height="85px" CssClass="box">
                                    </asp:ListBox>--%>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top: 5px">
                                    <asp:Button ID="btnNext" runat="server" Text="Next" Width="120px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <br class="clearfix" />
    <asp:Panel ID="panelMain" runat="server" Style="margin-right: 0px" Height="1156px">
        <div class="outerbox">
            <div id="parserdata" class="innerbox" runat="server">
                <table border="0" style="width: 580px">
                    <tr>
                        <td class="sectionlabel">
                            PARSE INFORMATION
                        </td>
                    </tr>
                    <tr>
                        <td class="">
                            <span class="smalltext">Website URL</span><br />
                            <asp:TextBox ID="txtWebsiteOld" Width="325px" runat="server" CssClass="boxout"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtWidthOld" Width="30px" Enabled="false" runat="server" CssClass="boxout"></asp:TextBox><span
                                class="sectionlabel">&nbsp;W&nbsp;&nbsp;</span>
                            <asp:TextBox ID="txtHeightOld" Width="30px" Enabled="false" runat="server" CssClass="boxout"></asp:TextBox><span
                                class="sectionlabel">&nbsp;H&nbsp;&nbsp;</span>
                            <asp:TextBox ID="txtRatio" Width="36px" Enabled="false" runat="server" CssClass="boxout"></asp:TextBox><span
                                class="sectionlabel">&nbsp;:&nbsp;&nbsp;</span>
                            <asp:TextBox ID="txtPercent" Width="30px" Enabled="true" runat="server" CssClass="box"></asp:TextBox><span
                                class="sectionlabel">&nbsp;%</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="smalltext">Media URL</span><br />
                            <asp:TextBox ID="txtURLOld" Width="574px" runat="server" CssClass="boxout"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="smalltext">Thumb URL</span><br />
                            <asp:TextBox ID="txtThumbURLOld" Width="574px" runat="server" CssClass="box" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <br class="clearfix" />
            <div class="innerbox">
                <table id="tblDisplayData" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" class="leftcol">
                            <table style="width: 80%; height: 100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="smalltext">Link style</span><br />
                                        <asp:DropDownList ID="ddnLinkStyleOld" runat="server" CssClass="box" 
                                            Height="18px" Width="93px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <%--<tr>
                                    <td valign="top" class="chkStyle">
                                        <asp:CheckBox ID="chkInfo" runat="server" Text="Info" CssClass="checkbox" /><br />
                                        <asp:CheckBox ID="chkTip" runat="server" Text="Tooltip" CssClass="checkbox" /><br />
                                        <asp:CheckBox ID="chkPrint" runat="server" Text="Print" CssClass="checkbox" /><br />
                                    </td>
                                </tr>--%>
                                <tr>
                                    <td valign="bottom" style="text-align: left;" class="style2">
                                        <%--<div id="grpshowas" runat="server" style="border: none;">
                                            <span class="grouplabelleft">End Show By:</span>
                                            <asp:RadioButtonList ID="rblshowend" runat="server" CellPadding="0" CellSpacing="0"
                                                Width="75px" Height="21px" BorderColor="#990000" BorderStyle="Solid" BorderWidth="1px">
                                                <asp:ListItem Selected="True">Stopping</asp:ListItem>
                                                <asp:ListItem>Looping</asp:ListItem>
                                                <asp:ListItem>Ending</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" class="centercol">
                            <table style="border: 0" width="100%">
                                <tr>
                                    <td align="center" height="30px">
                                        <asp:TextBox ID="txtDisplayLbl" CssClass="sectionlabel" runat="server" Text="DISPLAY INFORMATION" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="smalltext">Link Text</span>
                                        <%--<span class="smalltext" style="margin-left: 175px">Group
                                            Name</span>--%>
                                        <asp:TextBox ID="txtLinkTextOld" runat="server" CssClass="box floatleft" Height="22px"
                                            Width="225px"></asp:TextBox>
                                        <%--<asp:DropDownList ID="ddnGroup" runat="server"
                                                    CssClass="dropbox box floatright" Height="25px" Width="115px" onChange="ShowGrp()" >
                                                </asp:DropDownList>
                                        <div ID="divGroup" runat="server">    
                                           <asp:TextBox ID="txtGroupName" Height="22px" Width="110px" runat="server" CssClass="box floatleft"></asp:TextBox>
                                        </div>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Title</span><br />
                                        <%--<asp:TextBox ID="txtTitle" Width="345px" runat="server" CssClass="box" Height="24px"></asp:TextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Alt & Hover Text</span><br />
                                        <asp:TextBox ID="txtAltOld" Width="345px" runat="server" CssClass="box" 
                                            Height="24px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Caption</span><br />
                                        <%--<asp:TextBox ID="txtCaption" Width="345px" runat="server" CssClass="box" Height="22px"></asp:TextBox>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Notes</span><br />
                                        <asp:TextBox ID="txtNotesOld" runat="server" Height="50px" TextMode="MultiLine" CssClass="box"
                                            Width="345px"></asp:TextBox>
                                        <br class="clearfix" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" class="rightcol">
                            <table style="float: right; width: 110px; height: 100%">
                                <tr>
                                    <td class="toprow">
                                        <%--<div class="cntrtext" style="height:100%">
                                        &nbsp;Group Cnt&nbsp;=&nbsp;<asp:TextBox ID="txtGroupCnt" Text="3" runat="server"
                                            CssClass="grpcounter" Height="17px"></asp:TextBox></div>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding: 0px 0 5px 0; text-align: right;" valign="top" height="59px">
                                        <%--<div id="grpdisplayas" runat="server">
                                            <span class="grouplabel">Display As:</span><br />
                                            <asp:RadioButtonList ID="rbldisplayas" runat="server" CellPadding="0" CellSpacing="0"
                                                CssClass="buttonlist" TextAlign="Left" >
                                                <asp:ListItem Selected="True">Gallery</asp:ListItem>
                                                <asp:ListItem>Slideshow</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>--%>
                                        <%--<div id="normhasgrp" runat="server">
                                            <span class="smalltext" style="margin-right: 10px">Media Type</span><br />
                                            <asp:TextBox ID="txtMediaType" runat="server" CssClass="boxout" Style="width: 91px;
                                                margin-right: 10px"></asp:TextBox>
                                            <asp:CheckBox ID="chkHasGroup" runat="server" CssClass="checkbox" Height="20px" Style="margin: 5px 0 1px 0"
                                                Text="Group Member?" />
                                        </div>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <%--<td align="right" style="padding: 0px 0 0px 0;" valign="top" class="style7">
                                        <span class="grouplabel">Size:</span><br />
                                        <asp:RadioButtonList ID="rblImgSize" runat="server" CssClass="buttonlist" TextAlign="Left"
                                            CellPadding="0" CellSpacing="0">
                                            <asp:ListItem Selected="True">Native</asp:ListItem>
                                            <asp:ListItem>Fullscreen</asp:ListItem>
                                            <asp:ListItem>Custom</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>--%>
                                </tr>
                                <tr>
                                    <td align="right" class="memberbtn">
                                        <%--<asp:Button ID="btnEdit" runat="server" Style="height: 24px; width: 85px; float: right;
                                            margin-right: 10px;" Text="Members"/>--%>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <br class="clearfix" />
            <div class="innerbox">
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table border="0" style="width: 570px; height: 38px">
                            <tr>
                                <td align="center" width="120px">
                                    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default.aspx" Target="_self">Back</asp:HyperLink>
                                </td>
                                <td align="center" width="330px">
                                    <asp:TextBox ID="txtCatLbl" CssClass="sectionlabel" runat="server" Text="CATALOG INFORMATION"></asp:TextBox>
                                </td>
                                <td align="center" width="120px">
                                    <asp:HyperLink ID="lnkMore" runat="server" NavigateUrl="~/Catalog_new.aspx" Target="_self">More</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                        <table id="tblCatalogData" border="0" style="width: 570px; height: 237px">
                            <tr>
                                <td align="center" colspan="3">
                                    <asp:Label ID="lblStatus" runat="server" BackColor="#FF9900"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <span class="smalltext">Associated PE</span><br />
                                                <%--<asp:ListBox ID="ddlAssociatedPE" runat="server" CssClass="box" DataSourceID="ODSInterest"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">Categories</span><br />
                                                <%--<asp:ListBox ID="lstCategory" runat="server" CssClass="box" DataSourceID="ODSCategory"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">Interest Groups</span><br />
                                                <%--<asp:ListBox ID="lstGroup" runat="server" CssClass="box" DataSourceID="ODSGroup"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">System Keys</span><br />
                                                <%--<asp:ListBox ID="ddlKeyWords" runat="server" CssClass="box" DataSourceID="ODSGroup"
                                                    DataTextField="name" DataValueField="id" Height="65px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                </td>
                                <td valign="top">
                                    <table style="width: 416px; height: 313px;">
                                        <tr>
                                            <td>
                                                <%--<span class="smalltext">Owner</span><br />
                                                <asp:DropDownList ID="ddnOwner" runat="server" CssClass="box" Width="180px" Height="22px">
                                                </asp:DropDownList>--%>
                                            </td>
                                            <td>
                                                <%--<span class="smalltext">Owner Type</span><br />
                                                <asp:DropDownList ID="ddnOwnerType" runat="server" CssClass="box" Width="180px" Height="22px">
                                                </asp:DropDownList>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:DropDownList ID="ddnCampaign" runat="server" CssClass="box" Width="180px" Height="22px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtCalendar" runat="server" CssClass="boxout" Width="180px" Height="22px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span class="smalltext">Description &nbsp;&nbsp;&nbsp;</span>
                                                <%--<asp:TextBox ID="txtDescription" runat="server" CssClass="box" Height="40px" TextMode="MultiLine"
                                                    Width="409px"></asp:TextBox>--%><br />
                                                <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                                    ErrorMessage="Description is Blank!" CssClass="smalltext validate"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span class="smalltext">Tags &nbsp;&nbsp;</span><br />
                                                <asp:TextBox ID="txtTags" runat="server" CssClass="box" Height="40px" TextMode="MultiLine"
                                                    Width="408px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" colspan="2">
                                                <span class="smalltext">Addl FB Options</span><br />
                                                <asp:TextBox ID="txtFbMore" runat="server" CssClass="box" Font-Names="Arial" Height="44px"
                                                    TextMode="MultiLine" Width="408px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" valign="bottom">
                                                <span class="smalltext">
                                                    <%--<asp:Button ID="btnDirect" Style="margin: 5px 15px 0 5; height: 24px;" runat="server"
                                                        Text="Message" Width="85px" />--%>
                                                    <span class="smalltext">
                                                        <%--<asp:Button Style="height: 24px; margin: 0 5px 0px 0" ID="btnSubmit" runat="server"
                                                            Text="Submit" Width="85px" Height="24px" />--%>
                                                        <asp:Button Style="margin: 5px 5px 0 120px; height: 24;" ID="btnRefresh" runat="server"
                                                            BackColor="#D4D0C8" Text="Refresh" Width="85px" />
                                                    </span></span>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <span class="smalltext">Floatbox String (Embedded HTML)</span><br />
                                    <asp:TextBox ID="txtFBOld" runat="server" CssClass="boxout" Height="75px" TextMode="MultiLine"
                                        Width="568px" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <span class="smalltext">Preview Area</span><br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <asp:Literal ID="litPreviewOld" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                        <asp:ObjectDataSource ID="ODSCategory" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interest_categoriesTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSGroup" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interest_groupsTableAdapter">
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="ODSInterest" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetData" TypeName="dsConciergeTableAdapters.interestsTableAdapter">
                        </asp:ObjectDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <%--    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" CancelControlID="btnCancel"
        OkControlID="btnGroup" TargetControlID="btnEdit" PopupControlID="Panel1" PopupDragHandleControlID="PopupHeader"
        Drag="true" BackgroundCssClass="ModalPopupBG">
    </ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="Panel1" Style="display: none" runat="server">
        <div class="Popup">
            <div class="PopupHeader" id="PopupHeader">
                Select Group Members</div>
            <div id="div1" style="width: 600px; height: 400px; overflow: scroll;" runat="server">
                <asp:GridView ID="gvwMembers" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow"
                    BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="AutoID" Font-Names="Arial"
                    Font-Size="X-Small" ForeColor="Black">
                    <Columns>
                        <asp:TemplateField HeaderText="Select">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkSelect" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="AutoID" HeaderText="AutoID" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="HTMLEmbedTag" SortExpression="HTMLEmbedTag">
                            <ItemTemplate>
                                <asp:Literal ID="litPreview1" Text='<%#Eval("HTMLEmbedTag")%>' runat="server"></asp:Literal>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="Controls">
                <input id="btnGroup" type="button" value="Save Members" />
                <input id="btnCancel" type="button" value="Cancel" />
            </div>
        </div>
    </asp:Panel>--%>
    </form>
</body>
</html>
