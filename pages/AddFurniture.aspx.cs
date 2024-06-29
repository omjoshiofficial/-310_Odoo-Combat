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
    public partial class AddFurniture : System.Web.UI.Page
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

            if (IsPostBack==false)
            {

                if (Request.QueryString["edit"] != null)
                {
                    cmd = new SqlCommand("select * from Furniture_Master where fid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["edit"]);

                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        fname.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                        fprice.Text = ds.Tables[0].Rows[0]["fprice"].ToString();
                        fdesc.Text = ds.Tables[0].Rows[0]["fdesc"].ToString();
                        fimage.ImageUrl = ds.Tables[0].Rows[0]["fimage"].ToString();
                        fstatus.Text = ds.Tables[0].Rows[0]["fstatus"].ToString();
                    }

                }
            }

        }

        protected void addbtn_Click(object sender, EventArgs e)
        {
            mycon();

            if (Request.QueryString["edit"] != null)
            {
                if (fstatus.Text == "Select an option")
                {
                    Response.Write("<script>alert('Please Select a Option')</script>");
                    return;
                }
                else
                {

                    cmd = new SqlCommand("update Furniture_Master set fname=@fname , fprice=@fprice , fstatus=@fstatus , fimage=@fimage , fdesc=@fdesc where fid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["edit"]);
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
                            return;

                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@fimage", fimage.ImageUrl);
                    }

                    cmd.Parameters.AddWithValue("@fdesc", fdesc.Text);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Data Update Successfully!!')</script>");
                    Response.Redirect("my_furniture_list.aspx");
                }
            }
            else
            {
                if (fstatus.Text == "Select an option")
                {
                    Response.Write("<script>alert('Please Select a Option')</script>");
                }
                else
                {
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
                            return;

                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('Add Image!!')</script>");
                        return;
                    }

                    cmd.Parameters.AddWithValue("@fdesc", fdesc.Text);
                    cmd.Parameters.AddWithValue("@uid", uid);

                    cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString());

                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Data Added Successfully!!')</script>");

                    fname.Text = String.Empty;
                    fprice.Text = String.Empty;
                    fstatus.SelectedValue = String.Empty;
                    fdesc.Text = String.Empty;
                    fimage.ImageUrl = String.Empty;
                }
            }

        }
    }
}