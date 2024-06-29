using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace furniture_rent.pages
{
    public partial class dashboard : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection cn;
        SqlDataAdapter da;
        DataSet ds;

        void mycon()
        {
            cn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;Initial Catalog=oodo;Integrated Security=True");
            cn.Open();
        }

        void fill_dash()
        {
            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("select count(*)as total from Furniture_Master where uid=@id", cn);
            cmd.Parameters.AddWithValue("@id",uid );

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                my_furniture_lbl.Text = ds.Tables[0].Rows[0]["total"].ToString();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mycon();
            fill_dash();
        }
    }
}