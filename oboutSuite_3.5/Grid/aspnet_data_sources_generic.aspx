<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{				
	}
	
	void DeleteRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("DELETE FROM Orders WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
	void UpdateRecord(object sender, GridRecordEventArgs e)
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
		myConn.Open();
		OleDbCommand myComm = new OleDbCommand("UPDATE Orders SET ShipName='" + e.Record["ShipName"].ToString().Replace("'", "''") + "', ShipCity='" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', ShipCountry='" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "' WHERE OrderID = " + e.Record["OrderID"].ToString(), myConn);
		myComm.ExecuteNonQuery();
		myConn.Close();
	}
    void InsertRecord(object sender, GridRecordEventArgs e)
    {
        OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));
        myConn.Open();
        OleDbCommand myComm = new OleDbCommand("INSERT INTO Orders (ShipName, ShipCity, ShipCountry) VALUES('" + e.Record["ShipName"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCity"].ToString().Replace("'", "''") + "', '" + e.Record["ShipCountry"].ToString().Replace("'", "''") + "')", myConn);
        myComm.ExecuteNonQuery();
        myConn.Close();
    }
	</script>

<html>
	<head>
		<title>obout ASP.NET Grid examples</title>
		<style type="text/css">
			.tdText {
				font:11px Verdana;
				color:#333333;
			}
			.option2{
				font:11px Verdana;
				color:#0033cc;				
				padding-left:4px;
				padding-right:4px;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}

			a:hover {
				color:crimson;
			}
		</style>		
	</head>
	<body>	
		<form runat="server">
					
		<br />
		<span class="tdText"><b>ASP.NET Grid - Binding to Generic Collections</b></span>
		<br /><br />
		
		<asp:ObjectDataSource runat="server" ID="ods1" SelectMethod="GetGenericOrders" TypeName="OrdersGenericData"></asp:ObjectDataSource>		
		
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/premiere_blue" AllowFiltering="true" DataSourceID="ods1"
			OnInsertCommand="InsertRecord" OnDeleteCommand="DeleteRecord" OnUpdateCommand="UpdateRecord">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="200" runat="server"/>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="300" runat="server"/>				
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="250" runat="server" />				
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="250" runat="server" />
				<obout:Column HeaderText="EDIT" AllowEdit="true" AllowDelete="true" Width="175" runat="server" />
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		    The Grid can be bounded to .NET 2.0 generic collections like: <b>List</b>, <b>Stack</b>, <b>Queue</b> etc.
		</span>
		
		<br /><br /><br />
				 
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>
		
		</form>
	</body>
</html>