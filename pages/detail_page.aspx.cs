using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace furniture_rent.pages
{
    public partial class detail_page : System.Web.UI.Page
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
            if (Request.Cookies["login"] != null)
            {
                if (Request.QueryString["fid"] != null)
                {
                    cmd = new SqlCommand("select f.*,u.username from Furniture_Master f join User_Master u on f.uid=u.uid where fid=@id", cn);
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["fid"]);

                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        fimg.ImageUrl = ds.Tables[0].Rows[0]["fimage"].ToString();
                        ownerlbl.Text = ds.Tables[0].Rows[0]["username"].ToString();
                        pricelbl.Text = ds.Tables[0].Rows[0]["fprice"].ToString();
                        itemnmlbl.Text = ds.Tables[0].Rows[0]["fname"].ToString();
                        desclbl.Text = ds.Tables[0].Rows[0]["fdesc"].ToString();
                    }
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void cartBtn_Click(object sender, EventArgs e)
        {
            if (rtime.SelectedIndex == 0)
            {
                Response.Write("<script>alert('select dropdown')</script>");
            }
            else
            {
                var uid = Request.Cookies["login"].Values["uid"].ToString();
                cmd = new SqlCommand("insert into CartMaster values(@fid,@uid,@time,@dt)", cn);
                cmd.Parameters.AddWithValue("@fid", Request.QueryString["fid"]);
                cmd.Parameters.AddWithValue("@uid", uid);
                cmd.Parameters.AddWithValue("@time", rtime.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Data Added Suceessfully!!')</script>");
                email_send();
            }


        }

        void email_send()
        {
            cmd = new SqlCommand("select f.uid,u.email,f.fname from Furniture_Master f join User_Master u on f.uid=u.uid where fid=@id", cn);
            cmd.Parameters.AddWithValue("@id", Request.QueryString["fid"]);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                var email = ds.Tables[0].Rows[0]["email"].ToString();
                var fname = ds.Tables[0].Rows[0]["fname"].ToString();


                // Email details
                string toEmail = email; // Replace with recipient's email address
                string subject = $"You Have a Request for Rent of {fname}";
                string body = $"Please Check Your Rental History";

                // Gmail SMTP settings
                string smtpServer = "smtp.gmail.com";
                int smtpPort = 587;
                string smtpUsername = "rajanupadhyaydeveloper@gmail.com"; // Replace with your Gmail address
                string smtpPassword = "********";   // Replace with your Gmail password

                // Create an SMTP client
                using (SmtpClient smtpClient = new SmtpClient(smtpServer, smtpPort))
                {
                    smtpClient.EnableSsl = true;// Enable SSL/TLS
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential(smtpUsername, smtpPassword);

                    // Create an email message
                    using (MailMessage mailMessage = new MailMessage(smtpUsername, toEmail, subject, body))
                    {
                        mailMessage.IsBodyHtml = true;

                        try
                        {
                            // Send the email
                            smtpClient.Send(mailMessage);
                            Response.Write("<script>alert('Message sent successfully.')</script>");
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Something Want Wrong')</script>");
                        }
                    }
                }
            }
        }

    }
}