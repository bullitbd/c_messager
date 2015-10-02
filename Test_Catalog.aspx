<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Test_Catalog.aspx.vb" Inherits="Test_Catalog"
    ValidateRequest="false" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link type="text/css" rel="stylesheet" href="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.css" />

    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/floatbox.js"></script>

    <script type="text/javascript" src="http://r21concierge.s3.amazonaws.com/floatbox/options.js"></script>

    <link type="text/css" rel="stylesheet" href="./css/Concierge.css" />
    <link href="./css/StyleSheet.css" rel="stylesheet" type="text/css" />
    <title>Rocket21 Concierge Add Media</title>

    <script type="text/javascript">
        function clearTextBoxes(sname) {
            if (document.forms[0].txtContent.value == 'Enter Embedd URL etc.,' && sname == 'txtContent') document.forms[0].txtContent.value = '';
            if (document.forms[0].txtWebsite.value == 'Website URL (Generated)' && sname == 'txtWebsite') document.forms[0].txtWebsite.value = '';
            if (document.forms[0].txtURL.value == 'URL (Method Generated)' && sname == 'txtURL') document.forms[0].txtURL.value = '';
            if (document.forms[0].txtThumbURL.value == 'Thumb URL (Method Generated)' && sname == 'txtThumbURL') document.forms[0].txtThumbURL.value = '';
            if (document.forms[0].txtLinkText.value == 'View' && sname == 'txtLinkText') document.forms[0].txtLinkText.value = '';
            if (document.forms[0].txtTitle.value == 'Title Caption' && sname == 'txtTitle') document.forms[0].txtTitle.value = '';
            if (document.forms[0].txtCaption.value == 'Second Caption' && sname == 'txtCaption') document.forms[0].txtCaption.value = '';
            if (document.forms[0].txtFbMore.value == 'Additional FB Options (TEST)' && sname == 'txtFbMore') document.forms[0].txtFbMore.value = '';
            if (document.forms[0].txtMediaType.value == 'media_type' && sname == 'txtMediaType') document.forms[0].txtMediaType.value = '';
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

        function ShowGrp() {
            if (document.getElementById("ddnGroup").value == "New") {
                document.getElementById("divGroup").style.visibility = "visible";
                document.getElementById("divGroup").focus();
            }
            else {
                document.getElementById("divGroup").style.visibility = "hidden";
            }
        }

        

    </script>

    <style type="text/css">
        .clearfix
        {
            clear: both;
        }
        .buttonlist
        {
            font-size: x-small;
            text-align: right;
            margin-bottom: 3px;
        }
        #rblshowend
        {
            font-size: x-small;
            text-align: left;
            margin: 3px 0 5px 5px;
            float:left;
        }
        .checkbox
        {
            font-size: x-small;
            font-weight: bold;
            float: left;
            padding: 1px 5px;
        }
        .checkbox input, .buttonlist input
        {
            vertical-align: middle;
        }
        .grpcounter
        {
            background-color: #FFFBD6;
            border-style: none;
            height: 17px;
            width: 17px;
            color: #990000;
            font-weight: bold;
            font-size: 1.2em;
            margin-top:5px;
            
            
        }
        .cntrtext
        {
            font-size: .75em;
            font-weight: bold;
            float: right;
            margin-top: 5px;
            vertical-align:bottom;
            width: 100px;
            margin-bottom: 0px;
        }
        #validstart
        {
        color:#ff0000;
        font-weight:bold;
        font-size:.85em;
        margin-left:5px;
        text-align:center;
        width:200px;
        display:none;
                }
        
        .validate
        {
            text-align: center;
            z-index: 5;
        }
        .grouplabel, .grouplabelleft
        {
            font-size: .75em;
            font-weight: bold;
           
            margin: 0 10px 3px 0;
        }
        .grouplabelleft
        {
            float: left;
            margin: 7px 0 0 5px;
        }
        .sectionlabel
        {
            font-size: small;
            font-weight: bold;
            width:100%;
            text-align: center;
            background-color:transparent;
            border-style:none;
        }
        #parserdata
        {
        display:block;
        }
        #grpdisplayas
        {
            display: block;
        }
        #rbldisplayas
        {
            float:right;
        }
        #grpshowas
        {
            text-align: left;
            display: block;
        }
        #normhasgrp
        {
            display: none;
            text-align: left;
            vertical-align: top;
        }
        #tblDisplayData
        {
            width: 100%;
            height: 241px;
        }
        .groupcenterbox
        {
            width: 363px;
        }
        .groupcenter
        {
            width: 407px;
        }
        .memberbtn
        {
            height: 30px;
        }
        .centercol
        {
            width: 355px;
            
        }
        .leftcol
        {
            width: 110px;
            
            text-align:left;
        }
        .rightcol
        {
            width: 110px;
            
            text-align:right;
            
        }
        .toprow
        {
        height:40px;
        vertical-align:middle;
        }
       
        .style2
        {
            height: 9px;
        }
        .style3
        {
            height: 73px;
        }
       
        .style4
        {
            height: 59px;
        }
       
        .style7
        {
            height: 54px;
        }
       
        
       
        </style>
</head>
<body>
  
    <form id="form1" runat="server">
    <div class="outerbox">
        <div class="innerbox">
            <span style="color: Maroon; font-size: small; font-style: italic;">test bd 11-13 (and
                /App_Code/ParseEmbed.vb)</span>
            <table border="0">
                <tr>
                    <td valign="top">
                        <table>
                            <tr>
                                <td>
                                    <span class="smalltext">Paste URL, Video Embed Code or Content</span>
                                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Width="420px" Height="80px"
                                        CssClass="box"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle">
                                    <span class="smalltext">Submitted By</span>
                                    <asp:DropDownList ID="ddnSubmitted" runat="server" CssClass="box" Style="margin: 10px 0 0px 10px">
                                    </asp:DropDownList>
                                    <asp:TextBox ID="validstart" runat="server" 
                                        Text="Please select a media type." style="background-color:transparent; 
                                        border-style:none;"></asp:TextBox>
                                    
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
                                    <span class="smalltext">Media Type</span>
                                    <asp:ListBox ID="ddnMedia" runat="server" Width="120px" Height="85px" CssClass="box">
                                    </asp:ListBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-top:5px">
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
    <asp:Panel ID="pnlMain" runat="server" Style="margin-right: 0px" 
        Height="1156px">
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
                            <asp:TextBox ID="txtWebsite" Width="325px" runat="server" CssClass="boxout"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtWidth" Width="30px" Enabled="false" runat="server" CssClass="boxout"></asp:TextBox><span
                                class="sectionlabel">&nbsp;W&nbsp;&nbsp;</span>
                            <asp:TextBox ID="txtHeight" Width="30px" Enabled="false" runat="server" CssClass="boxout"></asp:TextBox><span
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
                            <asp:TextBox ID="txtURL" Width="574px" runat="server" CssClass="boxout"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span class="smalltext">Thumb URL</span><br />
                            <asp:TextBox ID="txtThumbURL" Width="574px" runat="server" CssClass="boxout" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <br class="clearfix" />
            <div class="innerbox">
                <table id="tblDisplayData" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td valign="top" class="leftcol">
                            <table style="width: 80%; height:100%">
                                <tr>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="smalltext">Link style</span><br />
                                        <asp:DropDownList ID="ddnLinkStyle" runat="server" CssClass="box" Height="18px" Width="93px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" class="style3">
                                        <asp:CheckBox ID="chkInfo" runat="server" Text="Info" CssClass="checkbox" /><br />
                                        <asp:CheckBox ID="chkTip" runat="server" Text="Tooltip" CssClass="checkbox" /><br />
                                        <asp:CheckBox ID="chkPrint" runat="server" Text="Print" CssClass="checkbox" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="bottom" style="text-align: left; " class="style2">
                                        <div id="grpshowas" runat="server" style="border:none;">
                                            <span class="grouplabelleft">End Show By:</span>
                                            <asp:RadioButtonList ID="rblshowend" runat="server" CellPadding="0" CellSpacing="0"
                                                Width="75px" Height="21px" BorderColor="#990000" BorderStyle="Solid" 
                                                BorderWidth="1px">
                                                <asp:ListItem Selected="True">Stopping</asp:ListItem>
                                                <asp:ListItem>Looping</asp:ListItem>
                                                <asp:ListItem>Ending</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                    </td>
                                </tr>
                                
                            </table>
                        </td>
                        <td valign="top" class="centercol">
                            <table style="border: 0" width="100%">
                                <tr>
                                    <td align="center" height="40px">
                                <asp:TextBox ID="txtDisplayLbl" cssclass="sectionlabel" runat="server" text="DISPLAY INFORMATION" />
                                </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span class="smalltext">Link Text</span><span class="smalltext" style="margin-left: 175px">Group
                                            Name</span><asp:TextBox ID="txtLinkText" runat="server" CssClass="box floatleft"
                                                Height="22px" Width="225px"></asp:TextBox><asp:DropDownList 
                                            ID="ddnGroup" runat="server"
                                                    CssClass="dropbox box floatright" Height="25px" Width="115px" onChange="ShowGrp()" >
                                                </asp:DropDownList>
                                        <div ID="divGroup" runat="server">    
                                           <asp:TextBox ID="txtGroupName" Height="22px" Width="110px" runat="server" CssClass="box floatleft"></asp:TextBox>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Title</span><br />
                                        <asp:TextBox ID="txtTitle" Width="345px" runat="server" CssClass="box" 
                                            Height="24px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Caption</span><br />
                                        <asp:TextBox ID="txtCaption" Width="345px" runat="server" CssClass="box" 
                                            Height="22px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="groupcenterbox">
                                        <span class="smalltext">Notes</span><br />
                                        <asp:TextBox ID="txtNotes" runat="server" Height="50px" TextMode="MultiLine" CssClass="box"
                                            Width="345px"></asp:TextBox>
                                        <br class="clearfix" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" class="rightcol">
                            <table style="float:right; width:110px; height:100%">
                                <tr>
                                    <td class="toprow">
                                    <div class="cntrtext" style="height:100%">
                                        &nbsp;Group Cnt&nbsp;=&nbsp;<asp:TextBox ID="txtGroupCnt" Text="3" runat="server"
                                            CssClass="grpcounter" Height="17px"></asp:TextBox></div>
                                        
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding: 0px 0 5px 0;text-align:right;" valign="top" 
                                        height="59px">
                                        <div id="grpdisplayas" runat="server">
                                            <span class="grouplabel">Display As:</span><br />
                                            <asp:RadioButtonList ID="rbldisplayas" runat="server" CellPadding="0" CellSpacing="0"
                                                CssClass="buttonlist" TextAlign="Left" >
                                                <asp:ListItem Selected="True">Gallery</asp:ListItem>
                                                <asp:ListItem>Slideshow</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </div>
                                        <div id="normhasgrp" runat="server">
                                            <span class="smalltext" style="margin-right:10px">Media Type</span><br />
                                            <asp:TextBox ID="txtMediaType" runat="server" CssClass="boxout" style="width:91px;margin-right:10px"></asp:TextBox>
                                            <asp:CheckBox ID="chkHasGroup" runat="server" CssClass="checkbox" Height="20px" Style="margin: 5px 0 1px 0"
                                                Text="Group Member?" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="padding: 0px 0 0px 0; " valign="top" class="style7">
                                        <span class="grouplabel">Size:</span><br />
                                        <asp:RadioButtonList ID="rblImgSize" runat="server"
                                            CssClass="buttonlist" TextAlign="Left" CellPadding="0" CellSpacing="0">
                                            <asp:ListItem Selected="True">Fullscreen</asp:ListItem>
                                            <asp:ListItem>Native</asp:ListItem>
                                            <asp:ListItem>Custom</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="memberbtn">
                                        <asp:Button ID="btnEdit" runat="server" Style="height: 24px; width: 85px; float: right;
                                            margin-right: 10px;" Text="Members"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <br class="clearfix" />
            <div class="innerbox">
                <ajaxToolkit:ToolkitScriptManager runat="Server" EnablePartialRendering="true" ID="ScriptManager1" />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table border="0" style="width: 570px; height: 38px">
                            <tr>
                                <td align="center" width="120px">
                                    <asp:HyperLink ID="lnkBack" runat="server" NavigateUrl="~/Default.aspx" Target="_self">Back</asp:HyperLink>
                                </td>
                                <td align="center" width="330px">
                                <asp:TextBox ID="txtCatLbl" cssclass="sectionlabel" runat="server" text="CATALOG INFORMATION"></asp:TextBox>
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
                                                <asp:ListBox ID="ddlAssociatedPE" runat="server" CssClass="box" DataSourceID="ODSInterest"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">Categories</span><br />
                                                <asp:ListBox ID="lstCategory" runat="server" CssClass="box" DataSourceID="ODSCategory"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">Interest Groups</span><br />
                                                <asp:ListBox ID="lstGroup" runat="server" CssClass="box" DataSourceID="ODSGroup"
                                                    DataTextField="name" DataValueField="id" Height="55px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <span class="smalltext">System Keys</span><br />
                                                <asp:ListBox ID="ddlKeyWords" runat="server" CssClass="box" DataSourceID="ODSGroup"
                                                    DataTextField="name" DataValueField="id" Height="65px" SelectionMode="Multiple"
                                                    Width="130px"></asp:ListBox>
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
                                                <span class="smalltext">Owner</span><br />
                                                <asp:DropDownList ID="ddnOwner" runat="server" CssClass="box" Width="180px" Height="22px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <span class="smalltext">Owner Type</span><br />
                                                <asp:DropDownList ID="ddnOwnerType" runat="server" CssClass="box" Width="180px" Height="22px">
                                                </asp:DropDownList>
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
                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="box" Height="40px" TextMode="MultiLine"
                                                    Width="409px"></asp:TextBox><br />
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
                                                        <asp:Button ID="btnDirect" 
                                                    style="margin: 5px 15px 0 5; height:24px;" 
                                                    runat="server"  Text="Message" Width="85px" /> 
                                                    <span class="smalltext">
                                                    <asp:Button Style="height:24px; margin:0 5px 0px 0" ID="btnSubmit" 
                                                    runat="server" Text="Submit"
                                                        Width="85px" Height="24px" />
                                                    
                                                        <asp:Button Style="margin: 5px 5px 0 120px; height:24;" ID="btnRefresh" runat="server"
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
                                    <asp:TextBox ID="txtFB" runat="server" CssClass="boxout" Height="75px" TextMode="MultiLine"
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
                                    <asp:Literal ID="litPreview" runat="server"></asp:Literal>
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
    <ajaxToolkit:modalpopupextender id="ModalPopupExtender1" runat="server" 
	    cancelcontrolid="btnCancel" 
	    targetcontrolid="btnEdit" popupcontrolid="Panel1" 
	    popupdraghandlecontrolid="PopupHeader" drag="true" 
	    backgroundcssclass="ModalPopupBG">
    </ajaxToolkit:modalpopupextender>

    <asp:panel id="Panel1" style="display: none" runat="server">
	<div class="Popup">
                <div class="PopupHeader" id="PopupHeader">Select HTML Tags</div>
                <div id="div1" style="Width:600px; Height:400px; overflow:scroll;" runat="server">
                <asp:GridView ID="gvwMembers" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                CellPadding="2" DataKeyNames="AutoID" Font-Names="Arial" Font-Size="X-Small" ForeColor="Black">
                    <columns>
                        <asp:BoundField DataField="AutoID" HeaderText="AutoID" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:TemplateField HeaderText="HTMLEmbedTag" SortExpression="HTMLEmbedTag">
                                               <ItemTemplate>
                                                   <asp:Literal ID="litPreview1" Text=<%#Eval("HTMLEmbedTag")%> runat="server"></asp:Literal>
                                                    
                                                </ItemTemplate> 
                                            </asp:TemplateField> 
                    </columns>
                </asp:GridView>                   
                </div>
                <div class="Controls">
                   <input id="btnCancel" type="button" value="Cancel" />
		        </div>
        </div>
    </asp:panel>
    
    </form>
</body>
</html>
