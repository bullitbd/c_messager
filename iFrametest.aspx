<%@ Page Language="VB" AutoEventWireup="false" CodeFile="iFrametest.aspx.vb" Inherits="iFrametest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link type="text/css" rel="stylesheet" href="./floatbox/floatbox.css" />
    <script type="text/javascript" src="./floatbox/floatbox.js"></script>
    <script type="text/javascript" src="./floatbox/options.js"></script>    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <a href="http://www.rocket21.com" class="floatbox" data-fb-options="width:650 height:92% splitResize:auto disableScroll:true showNewWindow:true showPrint:true mobileNewWindow:true enableDragResize:true">Floatbox Instructions</a> 
        <a href="http://www.rocket21.com" class="floatbox" data-fb-options="type:ajax width:500 caption:`AJAX Content`">AJAX Content</a> 

    </div>
    </form>
</body>
</html>
