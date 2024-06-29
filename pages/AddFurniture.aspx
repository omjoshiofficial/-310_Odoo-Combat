<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="AddFurniture.aspx.cs" Inherits="furniture_rent.pages.AddFurniture" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function previewImage() {
            var file = document.getElementById('<%= fileupload.ClientID %>').files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                document.getElementById('<%= fimage.ClientID %>').src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    </script>

    <div class="content">
        <div class="block block-rounded">
            <div class="block-header block-header-default">
                <h3 class="block-title">
                    <i class="fa fa-edit me-1 text-muted"></i>Add Furniture
                </h3>
            </div>
            <div class="block-content">
                <div class="row items-push">
                    <div class="col-lg-12">
                        <div class="mb-4">
                            <label class="form-label" for="fname">Furniture Name</label>
                            <asp:TextBox class="form-control form-control-lg" required="required" ID="fname" name="fname" placeholder="Enter furniture name.." runat="server" />
                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="fprice">Price</label>
                            <asp:TextBox TextMode="Number" class="form-control form-control-lg" required="required" ID="fprice" name="fprice" placeholder="Enter price.." runat="server" />

                        </div>
                        <div class="mb-4">
                            <label class="form-label" for="fdesc">Description</label>

                            <asp:TextBox TextMode="MultiLine" class="form-control form-control-lg" required="required" ID="fdesc" name="fdesc" Rows="4" placeholder="Enter description.." runat="server" />

                        </div>
                        <div class="row mb-4">
                            <div class="col-md-10 col-xl-6">
                                <div class="push">

                                    <asp:Image class="img-avatar" ID="fimage" ImageUrl="imageurl" runat="server" />
                                </div>
                                <div class="mb-4">
                                    <label class="form-label" for="fimg">Choose Furniture Image</label>

                                    <asp:FileUpload class="form-control" ID="fileupload" OnChange="previewImage()" name="fimg" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="mb-4">

                            <label class="form-label" for="fstatus">Status</label>
                            <asp:DropDownList class="form-select" ID="fstatus" required="required" name="fstatus" aria-label="Floating label select example" runat="server">
                                <asp:ListItem Text="Select an option" />
                                <asp:ListItem Text="Available" />
                                <asp:ListItem Text="Unavailable" />

                            </asp:DropDownList>

                        </div>

                        <div class="mb-4">
                            <asp:Button Text="Add" class="btn btn-alt-primary" ID="addbtn" OnClick="addbtn_Click" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
