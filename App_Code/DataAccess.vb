Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class DataAccess

    Public Shared Function GetData(ByVal sSQL As String) As DataTable
        Dim sConn As String = ConfigurationManager.ConnectionStrings("R21Conn").ConnectionString
        Dim da As New SqlDataAdapter(sSQL, sConn)
        Dim dt As New DataTable
        da.Fill(dt)
        da.Dispose()
        Return dt
    End Function

End Class
