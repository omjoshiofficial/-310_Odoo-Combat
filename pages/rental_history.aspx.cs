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
    public partial class rental_history : System.Web.UI.Page
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
        protected void Page_Load(object sender, EventArgs e)
        {
            mycon();

            if (Request.QueryString["edit"]!=null)
            {
                cmd = new SqlCommand("update CartMaster set status=@st where cid=@cid", cn);
                cmd.Parameters.AddWithValue("@cid", Request.QueryString["edit"]);
                cmd.Parameters.AddWithValue("@st", "confirm");

                cmd.ExecuteNonQuery();

            }
            if (Request.QueryString["fid"]!=null)
            {
                cmd = new SqlCommand("update Furniture_Master set fstatus=@st where fid=@fid", cn);
                cmd.Parameters.AddWithValue("@fid", Request.QueryString["fid"]);
                cmd.Parameters.AddWithValue("@st", "Unavailable");

                cmd.ExecuteNonQuery();
            }

            if (Request.QueryString["delete"]!=null)
            {
                cmd = new SqlCommand("delete from CartMaster where cid=@cid", cn);
                cmd.Parameters.AddWithValue("@cid", Request.QueryString["delete"]);
                cmd.ExecuteNonQuery();
                Response.Redirect("rental_history.aspx");
            }


            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("select c.*,f.uid as oid,u.username , f.fname , f.fprice from CartMaster c join Furniture_Master f on c.fid=f.fid join User_Master u on u.uid=c.uid where f.uid=@id and c.status='pending'", cn);
            cmd.Parameters.AddWithValue("@id", uid);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                show_rental_list.DataSource = ds;
                show_rental_list.DataBind();
            }

        }

    }
}