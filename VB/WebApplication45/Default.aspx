<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApplication45._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=B88D1754D700E49A"
	Namespace="DevExpress.Web" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=B88D1754D700E49A"
	Namespace="DevExpress.Web" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
	<title>Untitled Page</title>
	<script type="text/javascript">
	function SetCellColor(color){
	  grid.PerformCallback("C|"+selCol+"|"+selRow+"|"+color);
	}
	var oldCell;
	function OnCellClick(cell, c, r) {
	  if(oldCell!=null) oldCell.style.borderColor="";
	  cell.style.borderColor="Fuchsia";
	  oldCell = cell;
	  selCol = c;
	  selRow = r;
	}
	</script>
</head>
<body>
	<form id="form1" runat="server">
	<div>
	<dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" ClientInstanceName="grid" OnCustomCallback="ASPxGridView1_CustomCallback">
	</dxwgv:ASPxGridView>
		&nbsp;
		<dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Red">
			<ClientSideEvents Click="function(s, e) {
	SetCellColor('red');
}" />
		</dxe:ASPxButton>
	</div>
		<dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Green">
			<ClientSideEvents Click="function(s, e) {
	SetCellColor('green');
}" />
		</dxe:ASPxButton>
		<dxe:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" Text="Blue">
			<ClientSideEvents Click="function(s, e) {
	SetCellColor('blue');
}" />
		</dxe:ASPxButton>
	</form>

</body>
</html>
