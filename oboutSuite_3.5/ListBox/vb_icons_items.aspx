﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ListBox/ListBox.master" AutoEventWireup="true" CodeFile="vb_icons_items.aspx.vb" Inherits="ListBox_vb_icons_items" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br />
    
    <span class="tdText"><b>ASP.NET ListBox - Items with Icons</b></span>	
    
    <br /><br />
    <asp:PlaceHolder runat="server" ID="ListBox1Container" /> 
    
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT CustomerID, CompanyName FROM Customers"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can contain an icon next to the text. <br />
        The source of this image is specified using the <b>ImageUrl</b> property.<br /><br />
        
        <br /><br />
        
        You can display icons for items even when the ListBox is populated from a data source control.<br />
        In this case, the <b>ImageUrl</b> for each item can be set in the event handler of the <b>ItemDataBound</b> event.<br />
        
    </span>
</asp:Content>

