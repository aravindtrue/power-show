<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>

<script language="C#" runat="server">
    OboutDropDownList ddl1;

    void Page_load(object sender, EventArgs e)
    {
        ddl1 = new OboutDropDownList();
        ddl1.ID = "ddl1";
        ddl1.Width = Unit.Pixel(200);
        ddl1.Height = Unit.Pixel(200);
        ddl1.DataSourceID = "sds1";
        ddl1.DataTextField = "ShipCountry";
        ddl1.DataValueField = "ShipCountry";
        ddl1.AppendDataBoundItems = true;
        ddl1.FolderStyle = "styles/grand_gray/OboutDropDownList";

        ddl1.ClientSideEvents.OnSelectedIndexChanged = "onChange";

        ddl1.Items.Add(new ListItem("Select a country ..."));
        
        ddlPlaceHolder.Controls.Add(ddl1);
    }
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 

<html>
	<head>
		<title>obout Interface examples</title>
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
			
			.validator
			{
			    font:11px Verdana;
			}
		</style>
		<script type="text/javascript">
		    function onChange(sender, index) {
		        OboutTextBox1.value('A new country was selected: ' + sender.options[index].text + '\r\n' + OboutTextBox1.value());
		    }
		</script>		
	</head>
	<body>
		<form id="Form1" runat="server">
		
		<br /><br />
		
		<span class="tdText"><b>obout Interface - OboutDropDownList - Client-Side events</b></span>
		
		<br /><br />
		
		<obout:OboutTextBox runat="server" ID="OboutTextBox1" TextMode="MultiLine" Width="300" Height="150" />
		
		<br /><br />
				
		<asp:PlaceHolder runat="server" ID="ddlPlaceHolder" />
		
		<asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT DISTINCT ShipCountry FROM Orders ORDER BY ShipCountrY ASC"
		 ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
		
		<br /><br />
		
		<span class="tdText">
		    Use the <b>ClientSideEvents.OnSelectedIndexChanged</b> property to attach a client-side event handler that is executed when the selection is changed.
		</span>
		
		<br /><br /><br />
		
		<a href="Default.aspx?type=CSHARP">� Back to examples</a>		
		
		</form>    
	</body>
</html>