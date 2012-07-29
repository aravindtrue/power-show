﻿<%@ Page Title="" Language="VB" MasterPageFile="~/SuperForm/SuperForm.master" AutoEventWireup="true" CodeFile="vb_commands_customize.aspx.vb" Inherits="SuperForm_vb_commands_customize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET Super Form - Customize Command Buttons</b></span>
    
    <br /><br />
    
    <table>
        <tr>
            <td class="tdText" valign="top">
                Button Type:
            </td>
            <td>
                <obout:OboutRadioButton runat="server" ID="ButtonType1" GroupName="ButtonType" Text="Button" AutoPostBack="true" Checked="true" />
            </td>
            <td>
                <obout:OboutRadioButton runat="server" ID="ButtonType2" GroupName="ButtonType" Text="Image" AutoPostBack="true" />
            </td>
            <td>                                
                <obout:OboutRadioButton runat="server" ID="ButtonType3" GroupName="ButtonType" Text="Link" AutoPostBack="true" />
            </td>
            <td>&#160;</td>
        </tr>
        <tr>
            <td class="tdText" valign="top">
                Show Buttons:
            </td>
            <td>
                <obout:OboutCheckBox runat="server" ID="ShowEditButton" Text="Edit" AutoPostBack="true" Checked="true" />
            </td>
            <td>
                <obout:OboutCheckBox runat="server" ID="ShowDeleteButton" Text="Delete" AutoPostBack="true" Checked="true" />
            </td>
            <td>
                <obout:OboutCheckBox runat="server" ID="ShowInsertButton" Text="New" AutoPostBack="true" Checked="true" />
            </td>
            <td>
                <obout:OboutCheckBox runat="server" ID="ShowCancelButton" Text="Cancel" AutoPostBack="true" Checked="true" />
            </td>
        </tr>
    </table>

    <br /><br />
    <asp:PlaceHolder runat="server" ID="SuperForm1Container" />
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:NorthwindConnectionString.ProviderName %>" 
        SelectCommand="SELECT OrderID, ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, 
                        OrderDate, ShippedDate, RequiredDate, Sent FROM [Orders] ORDER BY OrderID DESC"
        UpdateCommand="UPDATE Orders SET ShipName=@ShipName, ShipCity=@ShipCity, ShipRegion=@ShipRegion, ShipCountry=@ShipCountry, 
                       ShipPostalCode=@ShipPostalCode, OrderDate=@OrderDate, ShippedDate=@ShippedDate, RequiredDate=@RequiredDate, Sent=@Sent
                       WHERE OrderID=@OrderID"
        InsertCommand="INSERT INTO Orders (ShipName, ShipCity, ShipRegion, ShipCountry, ShipPostalCode, OrderDate, ShippedDate, RequiredDate, Sent)
                        VALUES(@ShipName, @ShipCity, @ShipRegion, @ShipCountry, @ShipPostalCode, @OrderDate, @ShippedDate, @RequiredDate, @Sent)"
        DeleteCommand="DELETE FROM Orders WHERE OrderID = @OrderID">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        Use the <b>CommandField</b> class to manipulate the action buttons of a Super Form.<br />
        Using this class you can specify the type of the buttons and which buttons to be shown.<br /><br />

        The <b>CommandField</b> class exposes the <b>ButtonType</b> property that allows you to select the type of buttons to be used.<br />
        There are three options:<br />
        <ul>
            <li><b>Button</b> - the buttons will be generated using <b>OboutButton</b> objects.</li>
            <li><b>Image</b> - the buttons will be generated using <b>OboutImageButton</b> objects.</li>
            <li><b>ReadOnly</b> - the buttons will be generated using <b>LinkButton</b> objects.</li>
        </ul>
        
        The <b>AutoGenerateDeleteButton</b>, <b>AutoGenerateEditButton</b> and <b>AutoGenerateInsertButton</b> properties <br />
        of the Super Form need to be set to <span class="option2">false</span> when manually defining a <b>CommandField</b>.
    </span>
</asp:Content>
