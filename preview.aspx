<%@ Page Language="VB" AutoEventWireup="false" CodeFile="preview.aspx.vb" Inherits="preview"  ValidateRequest="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Rocket21 Preview Message</title>
    <link rel="stylesheet" type="text/css" href="./css/Rocket21.css" />
    <script language="javascript" type="text/javascript">
        function get_data() {
            var Subject = window.opener.document.getElementById("txtSubject").value;
            var Msg = window.opener.document.getElementById("txtMsg").value;
            //Msg = Msg.replace(/(\r\n|\r|\n)/g, '<br>'); 
            document.getElementById("txtSubject").innerHTML = Subject;
            document.getElementById("txtMsg").innerHTML = Msg;
        }
</script>

 </head>
<body onload="javascript:get_data();">
    <form id="form1" runat="server">
    <div id="popupContent">
        <div class="longheaderBox b">
		    Preview Message:
	    </div><!--end longheaderBox-->
	    <div class="longBox">
	        <b>Subject:</b><br />
	        <div id="txtSubject"></div>
	        <br />Dear User <br />
	        <div id="txtMsg"></div>
            <br /><br />Regards, <br /> Rocket21 Staff
	    </div><!--end longBox div-->
     </div>
    </form>
</body>
</html>
