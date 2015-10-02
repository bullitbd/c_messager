<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Ifrm_video.aspx.vb" Inherits="Default2"
    ValidateRequest="false" Debug="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Convert Embed Code</title>
    <style type="text/css">
        body
        {
            font-family: Arial,Sans-Serif;
            font-size: 11pt;
        }
       
        #form1
        {
         position:absolute;
            top: 10px;
            left:20px;   
        }
        #backText
        {
            font-size: .8em;
            font-weight: bold;
            margin-bottom:20px;
        }
        #openText
        {
            
            font-size:.9em;
            background-color: #FFFAEB;
            
            width: 545px;
            padding: 5px 0px 5px 5px;
            border: solid 1px;
            
        }
        #topDiv
        {
        }
        #nextDiv, #bottomDiv
        {
            visibility: hidden;
        }
        #txtEmbedCode
        {
            width: 600px;
            height: 100px;
            margin-top: 5px;
            margin-bottom: 20px;
        }
        #txtNameRef
        {
            margin-right: 15px;
            width: 240px;
        }
        #txtMultiply
        {
            width: 35px;
            height: 20px;
            text-align: right;
        }
        #txtNewEmbed
        {
            background-color: #FCFCE8;
            color: #00009B;
            font-family: "Courier New" , Courier, monospace;
            width: 600px;
            height: 80px;
            margin: 0;
            padding: 5px 10px;
        }
        .buttons
        {
            margin-right: 20px;
            margin-left: 20px;
        }
        .questionMark
        {
            position: relative;
            left: 10px;
            top: 0px;
            font-size: 14pt;
            height: 24px; /*dimensions of our image*/
            width: 24px;
            background-image: url(images/ttqmarksmall.png);
            background-repeat: no-repeat;
            background-position: center;
            margin-right: 20px;
        }
        .toolTip
        {
            position: absolute;
            left: 26px; /*Moves it to the right beside the question mark*/
            top: 0;
            display: none; /*The attributes below make it look pretty*/
            width: 250px;
            padding: 5px;
            border: 1px solid #ffffff;
            background-color: #eeeeee;
            font: .7em Arial, Helvetica, sans-serif;
        }
    </style>

    <script type="text/javascript">
        function switch1() {
            document.getElementById("topDiv").style.display = 'none';
            document.getElementById("nextDiv").style.display = 'block';
        }
         
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <table style="margin-bottom:25px;">
    <tr>
    <td style="padding-right:10px; padding-top:2px;"><a id="backText" href="Default.aspx">
                <img src="images/backarrow.png" border="0" alt="BACK" />
                </a>
    </td>
    <td id="openText">This tool will take an embed code not natively playable by Concierge, build & store
            an HTML<br />
            player file, and generate a new Embed Code to be used in the Concierge catalog.
    </td></tr>
    </table>
    
    
        <div id="topDiv" runat="server">
            Please paste your video embed code, file description and press &#39;Convert&#39;:
        <br />
        <asp:TextBox ID="txtEmbedCode" runat="server" TextMode="MultiLine"></asp:TextBox><br />
        Enter brief descriptive text <span onmouseover="document.getElementById('tt1').style.display='block'"
            onmouseout="document.getElementById('tt1').style.display='none'" class="questionMark">
            &nbsp;&nbsp;&nbsp; <span id="tt1" class="toolTip">Enter text to help make the file name
                recognizeable. Will appear as 'vimeo.com_<b><i>what_I_enter_here</i></b>_...html'.
                Enter only alphanumeric characters and spaces.</span> </span>
        <asp:TextBox ID="txtNameRef" runat="server"></asp:TextBox><asp:Button ID="Button1"
            runat="server" Text="Convert" Width="80px" CssClass="buttons" />
    </div>
    <div id="nextDiv" runat="server">
        <%--this div is hidden at first via css --%>
        <asp:HiddenField ID="hidVHeight" runat="server" />
        <asp:HiddenField ID="hidVWidth" runat="server" />
        <asp:HiddenField ID="hidInput" runat="server" />
        <asp:HiddenField ID="hidFinal" runat="server" />
        <asp:HiddenField ID="hidSite" runat="server" />
        <asp:Literal ID="litVideo" runat="server"></asp:Literal><br />
        <asp:Literal ID="litResponse" runat="server"></asp:Literal>
        <span onmouseover="document.getElementById('tt2').style.display='block'" onmouseout="document.getElementById('tt2').style.display='none'"
            class="questionMark">&nbsp;&nbsp;&nbsp; <span id="tt2" class="toolTip">You may change
                the displayed size of this video; put a value in from 40 to 400, and the video will
                display at this percentage of the original. You may change this as often as you
                wish.</span> </span>
        <asp:TextBox ID="txtMultiply" runat="server" CausesValidation="True">100</asp:TextBox>
        %
        <asp:Button ID="btnChangeSize" runat="server" Text="Change" Width="80px" CssClass="buttons" />
        <asp:Button ID="btnSubmit" runat="server" Text="Continue" CssClass="buttons" Width="80px" /><br />
    </div>
    <div id="bottomDiv" runat="server">
        <%--this div is hidden at first via css --%>
        <asp:Literal ID="litFileName1" runat="server"></asp:Literal><br />
        <asp:TextBox ID="txtNewEmbed" runat="server" TextMode="MultiLine"></asp:TextBox><br />
        <asp:Literal ID="litFileName2" runat="server"></asp:Literal>
    </div>
    </form>
</body>
</html>
