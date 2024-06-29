using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace furniture_rent
{
    public partial class discover_list : System.Web.UI.Page
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

        void fill_list()
        {
            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("select * from Furniture_Master f join User_Master u on f.uid=u.uid where f.uid!=@id and f.fstatus='Available'", cn);
            cmd.Parameters.AddWithValue("@id", uid);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                show_discover_list.DataSource = ds;
                show_discover_list.DataBind();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mycon();

            if (Request.Cookies["login"]!=null)
            {
                fill_list();

            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
}