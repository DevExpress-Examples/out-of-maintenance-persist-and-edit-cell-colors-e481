<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication45._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
    var selection = [];
    var cells = [];
    function SetCellColor(color){
      var str = "";
      for(var i=0; i<selection.length; i++){
        str += "|"+selection[i][0]+","+selection[i][1];
      }
      grid.PerformCallback("C|"+color+str);
      cells = [];
      selection = [];
    }
    function OnCellClick(cell, c, r) {
      var s = _aspxArrayIndexOf(cells, cell);
      if(s >= 0){
        _aspxArrayRemoveAt(selection, s);
        _aspxArrayRemoveAt(cells, s);
        cell.style.borderColor="";
      }else{
        cell.style.borderColor="Fuchsia";
        selection.push(new Array(c, r));
        cells.push(cell);
      }
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" ClientInstanceName="grid" OnCustomCallback="ASPxGridView1_CustomCallback">
        <SettingsBehavior AllowSort="False" />
    </dxwgv:ASPxGridView>
        &nbsp;
    </div>
    <table><tr>
    <td><dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" Text="Red">
            <ClientSideEvents Click="function(s, e) {
	SetCellColor('red');
}" />
        </dxe:ASPxButton></td>
    <td><dxe:ASPxButton ID="ASPxButton2" runat="server" AutoPostBack="False" Text="Green">
            <ClientSideEvents Click="function(s, e) {
	SetCellColor('green');
}" />
        </dxe:ASPxButton></td>
    <td><dxe:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" Text="Blue">
            <ClientSideEvents Click="function(s, e) {
	SetCellColor('blue');
}" />
        </dxe:ASPxButton></td>
    </tr></table>
    </form>
    
</body>
</html>
