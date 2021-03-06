﻿Imports Obout.SuperForm
Imports System.Data
Imports System.Data.OleDb
Imports System.Collections.Generic
Imports System.Web.UI.WebControls
Partial Class SuperForm_vb_fields_dropdownlistfield
    Inherits System.Web.UI.Page
    Dim SuperForm1 As Obout.SuperForm.SuperForm
    Sub Page_load(ByVal sender As Object, ByVal e As EventArgs)
        SuperForm1 = New SuperForm()
        SuperForm1.ID = "SuperForm1"
        SuperForm1.Title = "Order Details"
        SuperForm1.DataSourceID = "SqlDataSource1"
        SuperForm1.AutoGenerateRows = False
        SuperForm1.AutoGenerateInsertButton = True
        SuperForm1.AutoGenerateEditButton = True
        SuperForm1.AutoGenerateDeleteButton = True
        Dim keyNames1() As String = {"OrderID"}
        SuperForm1.DataKeyNames = keyNames1
        SuperForm1.AllowPaging = True
        SuperForm1.DefaultMode = DetailsViewMode.Edit

        Dim field1 As Obout.SuperForm.BoundField = New Obout.SuperForm.BoundField()
        field1.DataField = "OrderID"
        field1.HeaderText = "Order ID"
        field1.ReadOnly = True
        field1.InsertVisible = False

        Dim field2 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field2.DataField = "CustomerID"
        field2.DisplayField = "CompanyName"
        field2.HeaderText = "Customer"
        field2.DataSourceID = "SqlDataSource3"

        Dim field3 As Obout.SuperForm.DropDownListField = New Obout.SuperForm.DropDownListField()
        field3.DataField = "ShipCountry"
        field3.DisplayField = "ShipCountry"
        field3.HeaderText = "Country"
        field3.DataSourceID = "SqlDataSource2"

        SuperForm1.Fields.Add(field1)
        SuperForm1.Fields.Add(field2)
        SuperForm1.Fields.Add(field3)

        SuperForm1Container.Controls.Add(SuperForm1)
    End Sub
End Class
