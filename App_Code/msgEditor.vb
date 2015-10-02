Imports AjaxControlToolkit.HTMLEditor

Namespace ConciergeControls

    Public Class MsgEditor
        Inherits Editor
        Protected Overrides Sub FillTopToolbar()
            'Dim options As String
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Undo())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Redo())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())

            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Bold())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Italic())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.Underline())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.StrikeThrough())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())


            Dim cyan = New AjaxControlToolkit.HTMLEditor.ToolbarButton.FixedForeColor()
            cyan.ID = "cyan"
            cyan.DefaultColor = "#00a98d"
            'cyan.ForeColor = Drawing.Color.DarkCyan
            'cyan.CssClass = "textColor"
            TopToolbar.Buttons.Add(cyan)

            Dim cyanColorSelector = New AjaxControlToolkit.HTMLEditor.ToolbarButton.ForeColorSelector()
            cyanColorSelector.FixedColorButtonId = "cyan"
            'cyanColorSelector.ForeColor = Drawing.Color.DarkCyan
            'cyanColorSelector.BackColor = Drawing.Color.DarkCyan
            ' textColorSelector.ForeColor = Drawing.Color.DarkCyan
            TopToolbar.Buttons.Add(cyanColorSelector)

            
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.ForeColorSelector())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.ForeColorClear())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.InsertLink())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.RemoveLink())

            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontName())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.FontSize())
            'TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HorizontalSeparator())
            TopToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.RemoveStyles())


        End Sub

        Protected Overrides Sub FillBottomToolbar()
            BottomToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignMode())
            BottomToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.HtmlMode())
            BottomToolbar.Buttons.Add(New AjaxControlToolkit.HTMLEditor.ToolbarButton.PreviewMode())
        End Sub
    End Class

End Namespace

