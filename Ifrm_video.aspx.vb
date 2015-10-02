Imports System.IO
Imports System.Windows.Forms
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim siteRef, sInput As String
    Dim vHeight, vWidth, askText As String
    Dim newHeight, newWidth As Integer
    Dim multiply As Single

    Dim rWidth As Regex = New Regex("(?<=width[:="" ]+)\d{2,4}%?", RegexOptions.IgnoreCase)
    Dim rHeight As Regex = New Regex("(?<=height[:="" ]+)\d{2,4}%?", RegexOptions.IgnoreCase)
    Dim findHeight As New Regex("height[:""= ]{1,2}([1-9][0-9]{1,3})")
    Dim findWidth As New Regex("width[:""= ]{1,2}([1-9][0-9]{1,3})")
    Dim rWebsite As New Regex("https?://[^/]*(?=\/)")
    Dim rWebsite2 As New Regex("(?<=http://)([A-z0-9.]+?(.com|.org|.net))")
    Dim m As Match
    Dim testEmbed As String = "<script src=""http://videos.explore.org/player.js?embedCode=R4NmpiMjoLKTSdOyKiDbfsfaTmx0Il_z&hide=info&deepLinkEmbedCode=R4NmpiMjoLKTSdOyKiDbfsfaTmx0Il_z&width=640&autoplay=0&height=360""></script>"


  
    Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        topDiv.Attributes.Item("style") = "display:none"
        nextDiv.Attributes.Item("style") = "visibility:visible"
        'FOR DEBUG- default txtEmbedCode value
        sInput = txtEmbedCode.Text
        hidInput.Value = sInput
        ' Parse out embetText for website, height, width
        siteRef = GetWeb(sInput)
        hidSite.Value = siteRef
        'vHeight = GetHeight()
        hidVHeight.Value = GetHeight(sInput)
        'vWidth = GetWidth()
        hidVWidth.Value = GetWidth(sInput)
        newHeight = hidVHeight.Value
        newWidth = hidVWidth.Value
        Call showParse()
        hidFinal.Value = sInput
    End Sub
    Sub btnChangeSize_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnChangeSize.Click
        'Dim response As MsgBoxResult
        Dim style As MsgBoxStyle = MsgBoxStyle.OkOnly
        Dim msg As String = "Multiplier must be an integer between 40 and 400"
        Dim title As String = "Multiplier Value Error"

        Dim number As Single
        Dim s As String
        Dim fstyle As Globalization.NumberStyles

        s = txtMultiply.Text
        fstyle = Globalization.NumberStyles.AllowDecimalPoint
        Try
            number = Single.Parse(s, fstyle) / 100
            newHeight = Single.Parse(hidVHeight.Value, Globalization.NumberStyles.Integer) * number
            newWidth = Single.Parse(hidVWidth.Value, Globalization.NumberStyles.Integer) * number
            siteRef = hidSite.Value

            sInput = rWidth.Replace(hidInput.Value, newWidth)
            sInput = rHeight.Replace(sInput, newHeight)


            Call showParse()
        Catch ex As FormatException
            MsgBox(msg & vbCrLf & ex.Message, style, title)
        End Try


        hidFinal.Value = sInput
        Dim a As String = s

    End Sub
    Sub showParse()
        litVideo.Text = "<p>" & sInput & "</p>"

        askText = "<p>This video is from <b><u>" & siteRef & "</u></b>, with a Width of <b><u>" & newWidth
        askText = askText & "</u></b>px, and a Height of <b><u>" & newHeight & "</u></b>px.</p>"
        askText = askText & "<p>If you want to modify it's size, type a % multiplier in this box: <br />and click ""Change."""
        askText = askText & " Click ""Continue"" to save the file."
        litResponse.Text = askText



    End Sub

    Protected Function GetWeb(ByVal param As String) As String   'Parses website url
        m = rWebsite.Match(param)
        If Not m.Success Then
            Return "Unable to Parse Web Address"
        Else
            Return m.Value
        End If
    End Function
    '
    Protected Function GetHeight(ByVal param As String) As String  'Parses Height attribute (if exixts...)
        m = rHeight.Match(param)
        If Not m.Success Then
            Return "Unable to Parse Height Attribute"
        Else
            Return m.Value
        End If
    End Function
    '
    Protected Function GetWidth(ByVal param As String) As String   'Parses Width attribute (if exixts...)
        m = rWidth.Match(param)
        If Not m.Success Then
            Return "Unable to Parse Width Attribute"
        Else
            Return m.Value
        End If
    End Function
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSubmit.Click
        nextDiv.Attributes.Item("style") = "display:none"
        bottomDiv.Attributes.Item("style") = "visibility:visible"
        Dim docText As String
        Dim docDtd As String = "<!DOCTYPE HTML PUBLIC ""-//W3C//DTD HTML 4.01 Transitional//EN"" ""http://www.w3.org/TR/html4/loose.dtd"">"
        Dim sEmbed As String
        sInput = hidFinal.Value

        'Assemble file
        docText = docDtd
        docText = docText & "<html><head><title></title></head><body>" & sInput & "</body></html>"

        Dim rootPath As String = HttpContext.Current.Server.MapPath("~/") + "videos\"
        'Dim rootPath As String = "D:\Users\Bob Day\Documents\Visual Studio 2008\Websites\Concierge\videos\"

        Dim fileName As String
        Dim webRef As String = rWebsite2.Match(sInput).Value
        Dim sw As StreamWriter
        fileName = webRef.Replace(".", "-") & "_" & txtNameRef.Text.Replace(" ", "_") & "_" & DateTime.Now.ToString("yyyymmddhhmmss") & "_" & GetWidth(sInput) & "_" & GetHeight(sInput) & ".html"

        Try
            sw = File.CreateText(rootPath & fileName)
            sw.Write(docText)
            litFileName1.Text = "<p>Video has been saved as:" _
            & "<a href=""http://concierge.rocket21.com/videos/" & fileName & """>" & fileName _
            & "</a></p><p><i><b><u>The new embed code for this video is:</u></b></i></p>"
            txtNewEmbed.Text = "src=""http://concierge.rocket21.com/videos/" & fileName _
            & """_width=" & GetWidth(sInput) & "_height=" & GetHeight(sInput)
            litFileName2.Text = "<p>Copy and enter it as an <b>""R21Video""</b> Media Type.</p>"
            sw.Close()
        Catch ex As Exception
            txtNewEmbed.Text = "Creation failed. Call Bob. (" & ex.Message & ")"
        End Try


    End Sub

   
End Class
