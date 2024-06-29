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
    public partial class demo : System.Web.UI.Page
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
            if (Request.Cookies["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void submit_btn_Click(object sender, EventArgs e)
        {
            mycon();

            var uid = Request.Cookies["login"].Values["uid"].ToString();

            cmd = new SqlCommand("insert into Furniture_Master values (@fname,@fprice,@fstatus,@fimage,@fdesc,@uid,@dt)", cn);
            cmd.Parameters.AddWithValue("@fname", fname.Text);
            cmd.Parameters.AddWithValue("@fprice", fprice.Text);
            cmd.Parameters.AddWithValue("@fstatus", fstatus.SelectedValue);

            if (fileupload.HasFile)
            {
                if (fileupload.PostedFile.ContentLength <= 5 * 1024 * 1024)
                {
                    string path = "../images/" + fileupload.FileName;
                    fileupload.SaveAs(Server.MapPath(path));

                    fimage.ImageUrl = path;

                    cmd.Parameters.AddWithValue("@fimage", path);
                }
                else
                {
                    Response.Write("<script>alert('Upload Image Under 5 MB')</script>");

                }

            }

            cmd.Parameters.AddWithValue("@fdesc", fdesc.Text);
            cmd.Parameters.AddWithValue("@uid", uid);

            cmd.Parameters.AddWithValue("@dt",DateTime.Now.ToString());

            cmd.ExecuteNonQuery();
            
        }
    }
}