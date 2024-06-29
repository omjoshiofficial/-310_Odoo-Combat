<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="furniture_rent.forgot_password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Furniture Renting</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link rel="shortcut icon" href="assets/media/favicons/favicon.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="assets/media/favicons/favicon-192x192.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="assets/media/favicons/apple-touch-icon-180x180.png" />
    <link rel="stylesheet" href="assets/css/codebase.min-5.8.css" />

</head>
<body>
    <div id="page-container" class="main-content-boxed">
        <main id="main-container">
            <div class="bg-image" style="background-image: url('assets/media/photos/photo34%402x.jpg');">
                <div class="row mx-0 bg-default-op">
                    <div class="hero-static col-md-6 col-xl-8 d-none d-md-flex align-items-md-end">
                        <div class="p-4">
                            <p class="fs-3 fw-semibold text-white">
                                You are awesome! Build something amazing!
       
                            </p>
                            <p class="text-white-75 fw-medium">
                                Copyright &copy; <span data-toggle="year-copy"></span>
                            </p>
                        </div>
                    </div>
                    <div class="hero-static col-md-6 col-xl-4 d-flex align-items-center bg-body-extra-light">
                        <div class="content content-full">
                            <div class="px-4 py-2 mb-4">
                                <a class="link-fx fw-bold" href="index-2.html">
                                    <i class="fa fa-fire"></i>
                                    <span class="fs-4 text-body-color">Furniture</span><span class="fs-4">Renting</span>
                                </a>
                                <h1 class="h3 fw-bold mt-4 mb-2">Don’t worry, we’ve got your back</h1>
                                <h2 class="h5 fw-medium text-muted mb-0">Please enter your username or email</h2>
                            </div>
                            <form class="js-validation-reminder px-4" runat="server">
                                <div class="form-floating mb-4">
                                    <asp:TextBox runat="server" class="form-control" ID="emailtxt" name="reminder-credential" placeholder="Enter your email or username" />
                                    <label class="form-label" for="reminder-credential">Email</label>
                                </div>

                                <div class="form-floating mb-4">
                                    <div class="input-group">
                                        <div class="form-floating">

                                            <asp:TextBox runat="server" class="form-control" ID="otptxt" name="example-group3-floating2" placeholder="Email" />
                                            <label for="example-group3-floating2">Enter OTP</label>
                                        </div>
                                        <asp:Button Text="Send OTP" class="btn btn-secondary" ID="otpbtn" OnClick="otpbtn_Click" runat="server" />
                                    </div>
                                </div>

                                <div class="form-floating mb-4" id="newpass" runat="server" visible="false">

                                    <asp:TextBox runat="server" class="form-control" required="required" ID="passtxt" name="example-group3-floating2" placeholder="password" />
                                    <label for="example-group3-floating2">Enter New Password</label>
                                </div>

                                <div class="mb-4">

                                    <asp:Button Text="Reset Password" Visible="false" ID="reset_btn" OnClick="reset_btn_Click" class="btn btn-lg btn-alt-primary fw-semibold" runat="server" />

                                    <div class="mt-4">
                                        <a class="fs-sm fw-medium link-fx text-muted me-2 mb-1 d-inline-block" href="login.aspx">
                                            <i class="fa fa-arrow-left opacity-50 me-1"></i>Sign In
              </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script src="assets/js/codebase.app.min-5.8.js"></script>
    <script src="assets/js/lib/jquery.min.js"></script>
    <script src="assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="assets/js/pages/op_auth_reminder.min.js"></script>
</body>
</html>
