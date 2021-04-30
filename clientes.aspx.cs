using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class clientes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        cargar();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        var row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            var description = row.Cells[1].Text;
            if (description.Length > 50)
            {
                row.Cells[1].Text = description.Substring(0, 20) + "...";
            }
        }

    }
    protected void consultar_Click(object sender, EventArgs e)
    {
        GridViewRow Gridview2 = (GridViewRow)(sender as Control).Parent.Parent;
        int rowIndex = Gridview2.RowIndex;
        string idcliente = Convert.ToString(GridView1.DataKeys[rowIndex].Values[0]);

        SqlConnection conexion2 = new SqlConnection();
        conexion2.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        SqlCommand comando2 = new SqlCommand();
        comando2.Connection = conexion2;
        comando2.CommandType = CommandType.StoredProcedure;
        comando2.CommandText = "examen.dbo.Busca_contacto";
        comando2.Parameters.AddWithValue("@idcliente", idcliente);
        SqlDataAdapter da = new SqlDataAdapter(comando2);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView2.DataSource = ds;
        GridView2.DataBind();
        if (ds.Tables[0].Rows.Count != 0)
        {
            GridView2.HeaderRow.Cells[0].Attributes["data-class"] = "expand";
            GridView1.HeaderRow.Cells[1].Attributes["data-hide"] = "phone,tab1,tablet,desck";
        }
        ScriptManager.RegisterStartupScript(this, GetType(), "displayalertmessage", "$('#myModal').modal()", true);
        //if (reader2.HasRows)
        //{
        //    while (reader2.Read())
        //    {
        //        if (reader2[0].ToString() == "1")
        //        {

        //            if (reader2.NextResult())
        //            {
        //                while (reader2.Read())
        //                {
        //                    asesor = reader2[1].ToString();


        //                }
        //            }

        //            if (reader2.NextResult())
        //            {
        //                while (reader2.Read())
        //                {
        //                    estatus = reader2[0].ToString();
        //                }
        //            }
        //        }
        //    }
        //}
        //reader2.Close();
        //reader2.Dispose();
        //comando2.Connection.Close();
        //comando2.Dispose();
        //conexion2.Dispose();

        //if (asesor != string.Empty & estatus == "En espera")
        //{
        //    SqlConnection conexion = new SqlConnection();
        //    conexion.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        //    SqlCommand comd = new SqlCommand();
        //    comd.Connection = conexion;
        //    comd.CommandType = CommandType.StoredProcedure;
        //    comd.CommandText = "Gestiones.dbo.actualizar_estatus";
        //    comd.Parameters.AddWithValue("@sEstatus", "En revisión");
        //    comd.Parameters.AddWithValue("@sTicket", ticket);
        //    comd.Parameters.AddWithValue("@sRevision", asesor);
        //    comd.Connection.Open();
        //    SqlDataReader reader = comd.ExecuteReader();
        //    reader.Close();
        //    reader.Dispose();
        //    comd.Connection.Close();
        //    comd.Dispose();
        //    conexion.Dispose();
        //}

        //Response.Redirect("~/visordeasesorias.aspx");

    }
    public void cargar()
    {
        SqlConnection conexion2 = new SqlConnection();
        conexion2.ConnectionString = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        SqlCommand comando2 = new SqlCommand();
        comando2.Connection = conexion2;
        comando2.CommandType = CommandType.StoredProcedure;
        comando2.CommandText = "Examen.dbo.busca_clientes";
        SqlDataAdapter da = new SqlDataAdapter(comando2);
        DataSet ds = new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
        GridView1.DataBind();
        if (ds.Tables[0].Rows.Count != 0)
        {
            GridView1.HeaderRow.Cells[0].Attributes["data-class"] = "expand";
            GridView1.HeaderRow.Cells[1].Attributes["data-hide"] = "phone,tab1,tablet,desck";
            GridView1.HeaderRow.Cells[2].Attributes["data-hide"] = "phone,tab1,tablet,desck";
            GridView1.HeaderRow.Cells[3].Attributes["data-hide"] = "phone,tab1,tablet,desck,desck2";
            GridView1.HeaderRow.Cells[4].Attributes["data-hide"] = "phone,tab1,tablet,desck,desck2";
            GridView1.HeaderRow.Cells[5].Attributes["data-hide"] = "phone,tab1,tablet";
            GridView1.HeaderRow.Cells[6].Attributes["data-hide"] = "phone,tab1,tablet,desck,desck2";
            GridView1.HeaderRow.Cells[7].Attributes["data-hide"] = "phone";
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        else
        {
            lbaseseorias.Text = "No tiene Clientes registrados";
            ClientScript.RegisterStartupScript(this.GetType(), "span", "Span('icon1');", true);

        }

        Hidden1.Value = "no";
                
    }

    protected void GridView2_RowDataBound1(object sender, GridViewRowEventArgs e)
    {
        var row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            var description = row.Cells[0].Text;
            if (description.Length > 50)
            {
                row.Cells[0].Text = description.Substring(0, 20) + "...";
            }
        }
    }
}