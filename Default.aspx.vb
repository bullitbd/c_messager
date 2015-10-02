'TODO reference all css and js from Amazon;
'TODO General text cleanup
'TODO Edit dialog cleanup
'TODO Catalog broken item 2...
'TODO Catalog Default view wider


Partial Class _Default
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If (Request.Cookies("LoginAuth") Is Nothing) Then
                Response.Redirect("Login.aspx")
            End If
        End If
    End Sub

    Protected Sub lbkBtnLogout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles lbkBtnLogout.Click
        Session("login") = 0
        If (Not Request.Cookies("LoginAuth") Is Nothing) Then
            Dim myCookie As HttpCookie
            myCookie = New HttpCookie("LoginAuth")
            myCookie("Access") = "yes"
            myCookie.Expires = DateTime.Now.AddDays(-1)
            Response.Cookies.Add(myCookie)
        End If
        Response.Redirect("Login.aspx")
    End Sub
End Class
