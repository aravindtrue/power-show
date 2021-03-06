<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script language="C#" runat="server">	
	void Page_load(object sender, EventArgs e)
	{
		if (!Page.IsPostBack)
		{
			CreateGrid();
		}
	}
	
	void CreateGrid()
	{
		OleDbConnection myConn = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath("../App_Data/Northwind.mdb"));

		OleDbCommand myComm = new OleDbCommand("SELECT TOP 25 * FROM Orders ORDER BY OrderID DESC", myConn);
		myConn.Open();
		/*OleDbDataAdapter da = new OleDbDataAdapter();
		DataSet ds = new DataSet();
		da.SelectCommand = myComm;
		da.Fill(ds, "Orders");*/
		OleDbDataReader myReader = myComm.ExecuteReader();


		grid1.DataSource = myReader;
		grid1.DataBind();

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
		<span class="tdText"><b>ASP.NET Grid - Customizing the Filter Options for each Column</b></span>				
		
		<br /><br />
					
		<obout:Grid id="grid1" runat="server" CallbackMode="true" Serialize="true" AutoGenerateColumns="false"
			FolderStyle="styles/grand_gray" AllowFiltering="true" ShowLoadingMessage="true" AllowAddingRecords="false">
			<Columns>
				<obout:Column DataField="OrderID" ReadOnly="true" HeaderText="ORDER ID" Width="100" runat="server">
				    <FilterOptions>
				        <obout:FilterOption Type="NoFilter" />
				        <obout:FilterOption Type="EqualTo" />
				        <obout:FilterOption Type="SmallerThan" />
				        <obout:FilterOption Type="GreaterThan" />				        
				    </FilterOptions>
				</obout:Column>
				<obout:Column DataField="ShipName" HeaderText="NAME" Width="225" runat="server">
				    <FilterOptions>
				        <obout:FilterOption Type="NoFilter" />
				        <obout:FilterOption Type="Contains" />
				        <obout:FilterOption Type="DoesNotContain" />
				        <obout:FilterOption Type="StartsWith" />
				        <obout:FilterOption Type="EndsWith" />
				    </FilterOptions>
				</obout:Column>
				<obout:Column DataField="ShipCity" HeaderText="CITY" Width="175" runat="server">
				    <FilterOptions>
				        <obout:FilterOption Type="NoFilter" />
				        <obout:FilterOption Type="EqualTo" />
				        <obout:FilterOption Type="Contains" />
				        <obout:FilterOption Type="DoesNotContain" />
				        <obout:FilterOption Type="StartsWith" />
				        <obout:FilterOption Type="EndsWith" />
				        <obout:FilterOption Type="IsEmpty" />
				        <obout:FilterOption Type="IsNotEmpty" />
				    </FilterOptions>				    
				</obout:Column>
				<obout:Column DataField="ShipPostalCode" HeaderText="POSTAL CODE" Width="150" runat="server">
				    <FilterOptions>
				        <obout:FilterOption Type="NoFilter" />
				        <obout:FilterOption Type="Contains" />				        
				        <obout:FilterOption Type="IsEmpty" />
				        <obout:FilterOption Type="IsNotEmpty" />
				    </FilterOptions>
				</obout:Column>
				<obout:Column DataField="ShipCountry" HeaderText="COUNTRY" Width="175" runat="server">
				    <FilterOptions>
				        <obout:FilterOption Type="NoFilter" />
				        <obout:FilterOption Type="Contains" />				        
				        <obout:FilterOption Type="StartsWith" />
				        <obout:FilterOption Type="EndsWith" />
				    </FilterOptions>
				</obout:Column>
			</Columns>					
		</obout:Grid>
					
		<br /><br /><br />
		
		<span class="tdText">
		Use the <b>FilterOptions</b> property of the Column class to customize the Filter Options for each column.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=ASPNET">� Back to examples</a>
		
		</form>
	</body>
</html>