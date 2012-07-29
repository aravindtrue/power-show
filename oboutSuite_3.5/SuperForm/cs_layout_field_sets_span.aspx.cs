﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.Interface;
using Obout.ComboBox;
using System.Data.OleDb;

public partial class SuperForm_cs_layout_field_sets_span : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.Title = "Add new order";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Insert;
        SuperForm1.Width = Unit.Pixel(480);
        SuperForm1.ItemUpdating += SuperForm1_ItemUpdating;
        SuperForm1.ItemInserting += SuperForm1_ItemInserting;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;
        field1.FieldSetID = "FieldSet1";
        field1.Visible = false;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";
        field2.FieldSetID = "FieldSet1";

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCity";
        field3.HeaderText = "Ship City";
        field3.FieldSetID = "FieldSet1";


        Obout.SuperForm.DateField field4 = new Obout.SuperForm.DateField();
        field4.DataField = "OrderDate";
        field4.HeaderText = "Order Date";
        field4.DataFormatString = "{0:MM/dd/yyyy}";
        field4.ApplyFormatInEditMode = true;
        field4.FieldSetID = "FieldSet2";

        Obout.SuperForm.DropDownListField field5 = new Obout.SuperForm.DropDownListField();
        field5.DataField = "ShipCountry";
        field5.HeaderText = "Country";
        field5.DisplayField = "ShipCountry";
        field5.DataSourceID = "SqlDataSource2";
        field5.FieldSetID = "FieldSet2";

        Obout.SuperForm.TemplateField field6 = new Obout.SuperForm.TemplateField();
        field6.HeaderText = "Details";
        field6.FieldSetID = "FieldSet3";
        field6.ItemTemplate = new DetailsItemTemplate();
        field6.EditItemTemplate = new DetailsEditItemTemplate();

        Obout.SuperForm.FieldSetRow fieldSetRow1 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet1 = new Obout.SuperForm.FieldSet();
        fieldSet1.ID = "FieldSet1";
        fieldSet1.Direction = Direction.Horizontal;
        fieldSet1.CssClass = "field-set";
        fieldSetRow1.Items.Add(fieldSet1);

        Obout.SuperForm.FieldSetRow fieldSetRow2 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet2 = new Obout.SuperForm.FieldSet();
        fieldSet2.ID = "FieldSet2";
        fieldSet2.Direction = Direction.Horizontal;
        fieldSet2.CssClass = "field-set";
        fieldSetRow2.Items.Add(fieldSet2);

        Obout.SuperForm.FieldSetRow fieldSetRow3 = new Obout.SuperForm.FieldSetRow();
        Obout.SuperForm.FieldSet fieldSet3 = new Obout.SuperForm.FieldSet();
        fieldSet3.ID = "FieldSet3";
        fieldSet3.Direction = Direction.Horizontal;
        fieldSet3.CssClass = "field-set";
        fieldSetRow3.Items.Add(fieldSet3);

        SuperForm1.FieldSets.Add(fieldSetRow1);
        SuperForm1.FieldSets.Add(fieldSetRow2);
        SuperForm1.FieldSets.Add(fieldSetRow3);

        SuperForm1.FieldHeaderStyle.Width = Unit.Pixel(200);

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);
        SuperForm1.Fields.Add(field6);

        SuperForm1Container.Controls.Add(SuperForm1);
       
    }
    public class DetailsItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            Literal templatePlaceHolder = new Literal();
            container.Controls.Add(templatePlaceHolder);

            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            Literal templatePlaceHolder = sender as Literal;
            DetailsViewRow row = templatePlaceHolder.Parent.Parent as DetailsViewRow;
            SuperForm form = row.Parent.Parent as SuperForm;

            templatePlaceHolder.Text = DataBinder.Eval(form.DataItem, "AdditionalInformationHTML").ToString();
        }
    }
    public class DetailsEditItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Obout.Ajax.UI.HTMLEditor.Editor editor1 = new Obout.Ajax.UI.HTMLEditor.Editor();

            templatePlaceHolder.Controls.Add(editor1);


            editor1.ID = "Editor1";
            editor1.TopToolbar.Appearance = Obout.Ajax.UI.HTMLEditor.EditorTopToolbar.AppearanceType.Lite;
            editor1.Width = 450;
            editor1.Height = 270;


            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }
        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            DetailsViewRow row = templatePlaceHolder.Parent.Parent as DetailsViewRow;
            SuperForm form = row.Parent.Parent as SuperForm;
            Obout.Ajax.UI.HTMLEditor.Editor editor1 = templatePlaceHolder.Controls[0] as Obout.Ajax.UI.HTMLEditor.Editor;
            if (form.DataItem != null)
            {
                editor1.Content = DataBinder.Eval(form.DataItem, "AdditionalInformationHTML").ToString();
            }
            
        }
    }
    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["AdditionalInformationHTML"] = ((Obout.Ajax.UI.HTMLEditor.Editor)((DetailsViewRow)SuperForm1.Rows[5]).FindControl("Editor1")).Content;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["AdditionalInformationHTML"] = ((Obout.Ajax.UI.HTMLEditor.Editor)((DetailsViewRow)SuperForm1.Rows[5]).FindControl("Editor1")).Content;
    }
}