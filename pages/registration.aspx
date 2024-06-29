<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="furniture_rent.pages.registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Furniture Renting</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <link rel="shortcut icon" href="assets/media/favicons/favicon.png" />
    <link rel="icon" type="image/png" sizes="192x192" href="assets/media/favicons/favicon-192x192.png" />
    <link rel="apple-touch-icon" sizes="180x180" href="assets/media/favicons/apple-touch-icon-180x180.png" />
    <link rel="stylesheet" href="assets/css/codebase.min-5.8.css" />

    <script>
        function validateEmail() {
            var email = document.getElementById('uemail').value;
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailPattern.test(email)) {
                alert('Please enter a valid email address.');
                return false;
            }

            return true;
        }

        function validatePassword() {
            var password = document.getElementById('upassword').value;

            // Check if the password meets the criteria
            if (password.length < 8) {
                alert('Password must be at least 8 characters long.');
                return false;
            }

            // Add more criteria as needed (e.g., uppercase, lowercase, digits, special characters)

            return true;
        }

        function validateForm() {
            // Combine validations for both email and password
            return validateEmail() && validatePassword();
        }
    </script>

</head>

<body>

    <div id="page-container" class="main-content-boxed">

        <main id="main-container">
            <div class="bg-image" style="background-image: url('assets/media/photos/photo34%402x.jpg');">
                <div class="row mx-0 bg-earth-op">
                    <div class="hero-static col-md-6 col-xl-8 d-none d-md-flex align-items-md-end">
                        <div class="p-4">
                            <p class="fs-3 fw-semibold text-white mb-1">
                                We're very happy you are joining our community!
                           
                            </p>
                            <p class="fs-5 text-white fw-medium">
                                <i class="fa fa-angle-right opacity-50"></i>Create your account today and receive 50% off.
                           
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
                                <h1 class="h3 fw-bold mt-4 mb-2">Create New Account</h1>
                                <h2 class="h5 fw-medium text-muted mb-0">Please add your details</h2>
                            </div>
                            <form class="js-validation-signup px-4" onsubmit="return validateForm()" runat="server">

                                <div class="form-floating mb-4">
                                    <asp:TextBox runat="server" class="form-control" required="required" ID="uname" name="signup-username" placeholder="Enter your Username" />

                                    <label class="form-label" for="signup-username">Username</label>
                                </div>
                                <div class="form-floating mb-4">


                                    <asp:TextBox runat="server" class="form-control" required="required" ID="uemail" name="signup-username" placeholder="Enter your Username" />

                                    <label class="form-label" for="signup-email">Email</label>

                                </div>
                                <div class="form-floating mb-4">
                                    <asp:TextBox runat="server" class="form-control" required="required" ID="upassword" name="signup-username" placeholder="Enter your Username" />

                                    <label class="form-label" for="signup-password">Password</label>


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

                                <div class="mb-4">
                                    <div class="form-check">
                                        <input type="checkbox" runat="server" class="form-check-input" id="chk_terms" name="signup-terms" value="1" />
                                        <label class="form-check-label" for="signup-terms">I agree to Terms</label>
                                    </div>
                                </div>
                                <div class="mb-4">

                                    <asp:Button Text="Create Account" ID="add_btn" OnClick="add_btn_Click" class="btn btn-lg btn-alt-primary fw-semibold" runat="server" />

                                    <div class="mt-4">
                                        <a class="fs-sm fw-medium link-fx text-muted me-2 mb-1 d-inline-block" href="#" data-bs-toggle="modal" data-bs-target="#modal-terms">Read Terms
                                        </a>
                                        <a class="fs-sm fw-medium link-fx text-muted me-2 mb-1 d-inline-block" href="login.aspx">Sign In
                                        </a>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="modal-terms" tabindex="-1" role="dialog" aria-labelledby="modal-terms" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-slidedown" role="document">
                        <div class="modal-content">
                            <div class="block block-rounded shadow-none mb-0">
                                <div class="block-header block-header-default">
                                    <h3 class="block-title">Terms &amp; Conditions</h3>
                                    <div class="block-options">
                                        <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="block-content fs-sm">
                                    <h5 class="mb-2">1. General</h5>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.
                                   
                                    </p>
                                    <h5 class="mb-2">2. Account</h5>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.
                                   
                                    </p>
                                    <h5 class="mb-2">3. Service</h5>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.
                                   
                                    </p>
                                    <h5 class="mb-2">4. Payments</h5>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.
                                   
                                    </p>
                                </div>
                                <div class="block-content block-content-full block-content-sm text-end border-top">
                                    <button type="button" class="btn btn-alt-secondary" data-bs-dismiss="modal">
                                        Close
                                   
                                    </button>
                                    <button type="button" class="btn btn-alt-primary" data-bs-dismiss="modal">
                                        Done
                                   
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <script src="assets/js/codebase.app.min-5.8.js"></script>
    <script src="assets/js/lib/jquery.min.js"></script>
    <script src="assets/js/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script src="assets/js/pages/op_auth_signup.min.js"></script>
    <script src="assets/js/plugins/sweetalert2/sweetalert2.min.js"></script>
    <script src="assets/js/pages/be_comp_dialogs.min.js"></script>
</body>
</html>
