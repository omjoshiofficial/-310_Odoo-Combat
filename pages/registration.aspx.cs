using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;

namespace furniture_rent.pages
{
    public partial class registration : System.Web.UI.Page
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

        protected void otpbtn_Click(object sender, EventArgs e)
        {
            // Generate a random 6-digit OTP
            Random random = new Random();
            int otp = random.Next(100000, 999999);

            // Email details
            string toEmail = uemail.Text; // Replace with recipient's email address
            string subject = "Your OTP for Verification By Furniture Rental";
            string body = $"Your OTP is {otp}. Please use this OTP to verify your account.";

            // Gmail SMTP settings
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "rajanupadhyaydeveloper@gmail.com"; // Replace with your Gmail address
            string smtpPassword = "zqge awja bazr qwgf";   // Replace with your Gmail password

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
                        // Optionally, you can store the OTP in session or database for verification
                        Session["OTP"] = otp;
                        Response.Write("<script>alert('OTP sent successfully.')</script>");
                        otpbtn.Visible = false;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error sending OTP')</script>");
                    }
                }
            }
        }

        protected void add_btn_Click(object sender, EventArgs e)
        {
            mycon();

            if (chk_terms.Checked)
            {
                if (Session["OTP"] != null)
                {
                    if (Session["OTP"].ToString() == otptxt.Text)
                    {
                        cmd = new SqlCommand("select * from User_Master where email=@email", cn);
                        cmd.Parameters.AddWithValue("@email", uemail.Text);

                        da = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        da.Fill(ds);

                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            Response.Write("<script>alert('Data Already Exits!!')</script>");
                        }
                        else
                        {
                            cmd = new SqlCommand("insert into User_Master values (@uname , @uemail , @pass , @dt)", cn);
                            cmd.Parameters.AddWithValue("@uname", uname.Text);
                            cmd.Parameters.AddWithValue("@uemail", uemail.Text);
                            cmd.Parameters.AddWithValue("@pass", upassword.Text);
                            cmd.Parameters.AddWithValue("@dt", DateTime.Now.ToString());

                            cmd.ExecuteNonQuery();
                            Response.Write("<script>alert('Data Added Successfully!!')</script>");
                            uname.Text = String.Empty;
                            uemail.Text = String.Empty;
                            upassword.Text = String.Empty;
                            otptxt.Text = String.Empty;
                            chk_terms.Checked = false;
                        }

                    }
                    else
                    {
                        Response.Write("<script>alert('OTP Does Not Match')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Click On Send OTP Button')</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Checked the Terms and Conditions')</script>");
            }

        }
    }
}