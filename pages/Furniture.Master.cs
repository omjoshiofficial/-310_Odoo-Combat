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
    public partial class Furniture : System.Web.UI.MasterPage
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

        void fill_detail()
        {
            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("select * from User_Master where uid=@id", cn);
            cmd.Parameters.AddWithValue("@id", uid);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            cookie_name.Text = ds.Tables[0].Rows[0]["username"].ToString();
            cookie_uname.Text = ds.Tables[0].Rows[0]["username"].ToString();
            cookie_toogle.Text = ds.Tables[0].Rows[0]["username"].ToString();
            cookie_toogle_name.Text = ds.Tables[0].Rows[0]["username"].ToString();
            sideprofilename.Text = ds.Tables[0].Rows[0]["username"].ToString();
            sideoverlayprofileemail.Text = ds.Tables[0].Rows[0]["email"].ToString();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            mycon();
            if (Request.Cookies["login"]!=null)
            {
                fill_detail();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
            
        }

        protected void updateBtn_Click(object sender, EventArgs e)
        {
            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("select * from UserProfile  where Uid=@id", cn);
            cmd.Parameters.AddWithValue("@id", uid);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                cmd = new SqlCommand("update UserProfile set contact=@contact,address=@address,pincode=@pincode where Uid=@uid", cn);
                cmd.Parameters.AddWithValue("@contact", sideoverlayprofilecontact.Text);
                cmd.Parameters.AddWithValue("@address", sideoverlayprofileaddress.Text);
                cmd.Parameters.AddWithValue("@pincode", sideoverlayprofilepincode.Text);
                cmd.Parameters.AddWithValue("@uid", uid);

                Response.Write("<script>alert('Data Updated')</script>");


            }
            else
            {
                cmd = new SqlCommand("insert into UserProfile values(@contact,@address,@pincode,@uid)", cn);
                cmd.Parameters.AddWithValue("@contact", sideoverlayprofilecontact.Text);
                cmd.Parameters.AddWithValue("@address", sideoverlayprofileaddress.Text);
                cmd.Parameters.AddWithValue("@pincode", sideoverlayprofilepincode.Text);
                cmd.Parameters.AddWithValue("@uid", uid);

                Response.Write("<script>alert('Data Inserted')</script>");

            }
            cmd.ExecuteNonQuery();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {

            foreach (var cookieKey in Request.Cookies.AllKeys)
            {
                var cookie = new HttpCookie(cookieKey)
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(cookie);
            }
            Response.Redirect("login.aspx");


        }
    }
}