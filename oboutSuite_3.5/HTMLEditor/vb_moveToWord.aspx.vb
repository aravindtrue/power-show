﻿Imports System.IO
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports Obout.Ajax.UI.HTMLEditor
Imports Obout.Ajax.UI.HTMLEditor.ToolbarButton
Imports System.Collections.ObjectModel
Imports System.Globalization

Partial Public Class HTMLEditor_vb_moveToWord
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not Page.IsPostBack Then
            Dim input As StreamReader

            input = New StreamReader(System.Web.HttpContext.Current.Server.MapPath("contents/Content1.txt"), System.Text.Encoding.ASCII)
            editor.EditPanel.Content = input.ReadToEnd()
            input.Close()
        End If
    End Sub

    Protected Sub Submit_click(sender As Object, e As EventArgs)
        ScriptManager.RegisterClientScriptBlock(Me, Me.[GetType](), "EditorResponse", "alert('Submitted:\n\n" & editor.EditPanel.Content.Replace("""", "\""").Replace(vbLf, "\n").Replace(vbCr, "").Replace("'", "\'") & "');", True)
    End Sub
End Class
