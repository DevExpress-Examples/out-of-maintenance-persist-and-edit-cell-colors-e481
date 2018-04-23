using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxGridView;
using System.Drawing;

namespace WebApplication45
{
    public partial class _Default : System.Web.UI.Page
    {
        Hashtable cellColors;

        protected void Page_Load(object sender, EventArgs e)
        {
            cellColors  = Session["CC"] as Hashtable;
            if (cellColors == null)
            {
                cellColors = new Hashtable();
                Session["CC"] = cellColors;
            }
            DataTable dt = Session["DT"] as DataTable;
            if (dt == null)
            {
                dt = new DataTable();
                for (int c = 0; c < 5; c++)
                    dt.Columns.Add("Col" + c);
                for (int r = 0; r < 10; r++)
                    dt.Rows.Add(new object[dt.Columns.Count]);
                Session["DT"] = dt;
            }
            ASPxGridView1.DataSource = dt;
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            e.Cell.Attributes.Add("onclick", string.Format("OnCellClick(this,{0},{1});", e.DataColumn.Index, e.VisibleIndex));
            DataRow row = ASPxGridView1.GetDataRow(e.VisibleIndex);
            Point pt = new Point(e.DataColumn.Index, row.Table.Rows.IndexOf(row));
            string color = cellColors[pt] as string;
            if (color != null) e.Cell.Style["background-color"] = color;
        }

        protected void ASPxGridView1_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters.StartsWith("C|"))
            {
                string[] args = e.Parameters.Split('|');
                if(args.Length <3) return;
                for (int i = 2; i < args.Length; i++)
                {
                    string[] pt = args[i].Split(',');
                    DataRow row = ASPxGridView1.GetDataRow(Int32.Parse(pt[1]));
                    Point point = new Point(Int32.Parse(pt[0]), row.Table.Rows.IndexOf(row));
                    cellColors[point] = args[1];
                }
            }
        }

    }
}
