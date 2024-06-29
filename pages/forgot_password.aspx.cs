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

namespace furniture_rent
{
    public partial class forgot_password : System.Web.UI.Page
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

        protected void reset_btn_Click(object sender, EventArgs e)
        {
            mycon();

            if (Session["OTP"] != null)
            {
                if (Session["OTP"].ToString() == otptxt.Text)
                {
                    cmd = new SqlCommand("select * from User_Master where email=@email", cn);
                    cmd.Parameters.AddWithValue("@email", emailtxt.Text);

                    da = new SqlDataAdapter(cmd);
                    ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        cmd = new SqlCommand("update User_Master set password=@pass where email=@email", cn);
                        cmd.Parameters.AddWithValue("@email", emailtxt.Text);
                        cmd.Parameters.AddWithValue("@pass", passtxt.Text);

                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Data Update Successfully!!')</script>");


                    }
                    else
                    {
                        Response.Write("<script>alert('Email is Not Exist!!')</script>");
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

        protected void otpbtn_Click(object sender, EventArgs e)
        {
            // Generate a random 6-digit OTP
            Random random = new Random();
            int otp = random.Next(100000, 999999);

            // Email details
            string toEmail = emailtxt.Text; // Replace with recipient's email address
            string subject = "Your OTP for Verification By Furniture Rental";
            string body = $"Your OTP is {otp}. Please use this OTP to verify your account.";

            // Gmail SMTP settings
            string smtpServer = "smtp.gmail.com";
            int smtpPort = 587;
            string smtpUsername = "rajanupadhyaydeveloper@gmail.com"; // Replace with your Gmail address
            string smtpPassword = "***********";   // Replace with your Gmail password

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
                        reset_btn.Visible = true;
                        newpass.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error sending OTP')</script>");
                    }
                }
            }
        }
    }
}