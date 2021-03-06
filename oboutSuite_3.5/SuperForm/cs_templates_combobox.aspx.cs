﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Obout.SuperForm;
using Obout.Interface;

public partial class SuperForm_cs_templates_combobox : System.Web.UI.Page
{
    private SuperForm SuperForm1;
    protected void Page_Load(object sender, EventArgs e)
    {
        SuperForm1 = new SuperForm();
        SuperForm1.ID = "SuperForm1";
        SuperForm1.DataSourceID = "SqlDataSource1";
        SuperForm1.AutoGenerateRows = false;
        SuperForm1.AutoGenerateInsertButton = true;
        SuperForm1.AutoGenerateEditButton = true;
        SuperForm1.AutoGenerateDeleteButton = true;
        SuperForm1.AutoGenerateDateFields = true;
        SuperForm1.DataKeyNames = new string[] { "OrderID" };
        SuperForm1.AllowPaging = true;
        SuperForm1.DefaultMode = DetailsViewMode.Edit;
        
        SuperForm1.ItemUpdating += SuperForm1_ItemUpdating;
        SuperForm1.ItemInserting += SuperForm1_ItemInserting;

        Obout.SuperForm.BoundField field1 = new Obout.SuperForm.BoundField();
        field1.DataField = "OrderID";
        field1.HeaderText = "Order ID";
        field1.ReadOnly = true;
        field1.InsertVisible = false;

        Obout.SuperForm.BoundField field2 = new Obout.SuperForm.BoundField();
        field2.DataField = "ShipName";
        field2.HeaderText = "Ship Name";

        Obout.SuperForm.BoundField field3 = new Obout.SuperForm.BoundField();
        field3.DataField = "ShipCity";
        field3.HeaderText = "Ship City";

        Obout.SuperForm.BoundField field4 = new Obout.SuperForm.BoundField();
        field4.DataField = "ShipRegion";
        field4.HeaderText = "Ship Region";

        Obout.SuperForm.TemplateField field5 = new Obout.SuperForm.TemplateField();
        field5.HeaderText = "Ship Country";
        field5.ItemTemplate = new ShipCountryItemTemplate();
        field5.EditItemTemplate = new ShipCountryEditItemTemplate();

        SuperForm1.Fields.Add(field1);
        SuperForm1.Fields.Add(field2);
        SuperForm1.Fields.Add(field3);
        SuperForm1.Fields.Add(field4);
        SuperForm1.Fields.Add(field5);

        SuperForm1Container.Controls.Add(SuperForm1);
       
    }
    protected void SuperForm1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        e.NewValues["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry")).SelectedValue;
    }

    protected void SuperForm1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        e.Values["ShipCountry"] = ((Obout.ComboBox.ComboBox)((DetailsViewRow)SuperForm1.Rows[4]).FindControl("ShipCountry")).SelectedValue;
    }

    public class ShipCountryItemTemplate : ITemplate
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

            templatePlaceHolder.Text = DataBinder.Eval(form.DataItem, "ShipCountry").ToString();
        }
    }

    public class ShipCountryEditItemTemplate : ITemplate
    {
        public void InstantiateIn(Control container)
        {
            PlaceHolder templatePlaceHolder = new PlaceHolder();
            container.Controls.Add(templatePlaceHolder);

            Obout.ComboBox.ComboBox comboBox = new Obout.ComboBox.ComboBox();
            templatePlaceHolder.Controls.Add(comboBox);

            comboBox.ID = "ShipCountry";
            comboBox.DataSourceID = "SqlDataSource2";
            comboBox.Height = Unit.Pixel(150);
            comboBox.Width = Unit.Percentage(100);
            comboBox.DataValueField = "ShipCountry";
            comboBox.DataTextField = "ShipCountry";

            templatePlaceHolder.DataBinding += new EventHandler(DataBindTemplate);
        }

        public void DataBindTemplate(object sender, EventArgs e)
        {
            PlaceHolder templatePlaceHolder = sender as PlaceHolder;
            DetailsViewRow row = templatePlaceHolder.Parent.Parent as DetailsViewRow;
            SuperForm form = row.Parent.Parent as SuperForm;

            Obout.ComboBox.ComboBox comboBox = templatePlaceHolder.Controls[0] as Obout.ComboBox.ComboBox;

            comboBox.SelectedValue = DataBinder.Eval(form.DataItem, "ShipCountry").ToString();
        }
    }

}
