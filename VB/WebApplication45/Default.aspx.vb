Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxGridView
Imports System.Drawing

Namespace WebApplication45
	Partial Public Class _Default
		Inherits System.Web.UI.Page
		Private cellColors As Hashtable

		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
			cellColors = TryCast(Session("CC"), Hashtable)
			If cellColors Is Nothing Then
				cellColors = New Hashtable()
				Session("CC") = cellColors
			End If
			Dim dt As DataTable = TryCast(Session("DT"), DataTable)
			If dt Is Nothing Then
				dt = New DataTable()
				For c As Integer = 0 To 4
					dt.Columns.Add("Col" & c)
				Next c
				For r As Integer = 0 To 9
					dt.Rows.Add(New Object(dt.Columns.Count - 1){})
				Next r
				Session("DT") = dt
			End If
			ASPxGridView1.DataSource = dt
			ASPxGridView1.DataBind()
		End Sub

		Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As ASPxGridViewTableDataCellEventArgs)
			e.Cell.Attributes.Add("onclick", String.Format("OnCellClick(this,{0},{1});", e.DataColumn.Index, e.VisibleIndex))
			Dim row As DataRow = ASPxGridView1.GetDataRow(e.VisibleIndex)
			Dim pt As New Point(e.DataColumn.Index, row.Table.Rows.IndexOf(row))
			Dim color As String = TryCast(cellColors(pt), String)
			If color IsNot Nothing Then
				e.Cell.Style("background-color") = color
			End If
		End Sub

		Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
			If e.Parameters.StartsWith("C|") Then
				Dim args() As String = e.Parameters.Split("|"c)
				Dim row As DataRow = ASPxGridView1.GetDataRow(Int32.Parse(args(2)))
				Dim pt As New Point(Int32.Parse(args(1)), row.Table.Rows.IndexOf(row))
				cellColors(pt) = args(3)
			End If
		End Sub
	End Class
End Namespace
