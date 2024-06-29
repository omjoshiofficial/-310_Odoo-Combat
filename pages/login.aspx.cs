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
    public partial class login : System.Web.UI.Page
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
        }

        protected void login_btn_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select * from User_Master where email=@email and password=@pass", cn);
            cmd.Parameters.AddWithValue("@email", emailtxt.Text);
            cmd.Parameters.AddWithValue("@pass", passtxt.Text);

            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            HttpCookie loginck = new HttpCookie("login");


            if (ds.Tables[0].Rows.Count > 0)
            {
                loginck.Values.Add("uid", ds.Tables[0].Rows[0]["uid"].ToString());

                if (chk_cookie.Checked)
                {
                    DateTime expirationDate = DateTime.Now.AddDays(2);
                    loginck.Expires = expirationDate;
                    Response.Cookies.Add(loginck);

                }
                else
                {
                    Response.Cookies.Add(loginck);
                }

                Response.Write("<script>alert('Login Successfull!!')</script>");
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Enter Valid Email & Password!!')</script>");

            }
        }
    }
}