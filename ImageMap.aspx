<%@ Page Language="VB"  %>
<%@ import Namespace = "System.Collections.Generic"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        'pageURL  = "ny.rocket21.com"
    
        ' Create ImageMap control..
        Dim info As New ImageMap 'has 4 hotspots
        With info
            .ImageUrl = "http://rocktopia.rocket21.com/boces/images/NY_Info.jpg"
            .AlternateText = "NY Boces Info"
            .HotSpotMode = HotSpotMode.Navigate
        End With

        ' Add image map control to page
        Page.Controls.Add(info)
        
        'Set up hotspot array strings.
        Dim loc(,) As Integer = {{259, 438, 459, 459}, {263, 945, 445, 965}, {267, 1018, 434, 1038}, {265, 1091, 438, 1112}}
        Dim alt() As String = {"Email", "Educator", "Parent", "Student"}
        Dim nav(,) As String = {{"mailto:educators@rocket21.com", "_blank"}, {"http://nyeducator.rocket21.com", "_blank"}, {"http://nyparent.rocket21.com", "_blank"}, {"http://nystudent.rocket21.com", "_blank"}}
        
        Dim i As Integer
        Dim hsarray(UBound(loc) - 1) As RectangleHotSpot
        For i = 0 To UBound(loc) - 1
            hsarray(i) = New RectangleHotSpot
            With hsarray(i)
                .Top = loc(i, 0)
                .Left = loc(i, 1)
                .Bottom = loc(i, 2)
                .Right = loc(i, 3)
                .AlternateText = alt(i)
                .NavigateUrl = nav(i, 0)
                .Target = nav(i, 1)
            End With
            'add hotspot to imagemap control
            info.HotSpots.Add(hsarray(i))
        Next
        
        
        'init object array
        'Dim i As Integer
        'Dim hsarray As RectangleHotSpot()
        'hsarray = New RectangleHotSpot(3) {}
             
        'loop through each instance & do stuff (make (hsarray.length) hotspots in info)
        'For Each hs As RectangleHotSpot In hsarray
        'With hs
        '.Top = loc(i, 0) 'getting "Object reference not set to instance of object error; ?????????
        '.Left = loc(i, 1)
        '.Bottom = loc(i, 2)
        '.Right = loc(i, 3)
        '.AlternateText = alt(i)
        '.NavigateUrl = nav(i, 0)
        '.Target = nav(i, 1)
        'End With
        'add hotspot to imagemap control
        'info.HotSpots.Add(hs)
        'Next
        
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
  <title>NY Boces Info</title>
</head>
  <body>
         
  </body>
</html>


