
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Login1_Authenticate(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.AuthenticateEventArgs) Handles Login1.Authenticate
        Try
            If Login1.UserName = "r21concierge" Then
                If Login1.Password = "!Concierge123!" Then

                    Dim myCookie As HttpCookie
                    myCookie = New HttpCookie("LoginAuth")
                    myCookie("Access") = "yes"
                    myCookie.Expires = DateTime.Now.AddDays(1)
                    Response.Cookies.Add(myCookie)

                    Session("login") = 1
                    e.Authenticated = True
                Else
                    Login1.FailureText = "Invalid Password!"
                End If
            Else
                Login1.FailureText = "Invalid Login!"
            End If
        Catch ex As Exception
            Login1.FailureText = ex.Message
        End Try
    End Sub
End Class
