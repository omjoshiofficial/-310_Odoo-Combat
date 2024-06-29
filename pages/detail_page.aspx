<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="detail_page.aspx.cs" Inherits="furniture_rent.pages.detail_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">

        <div class="block block-rounded overflow-hidden">
            <div class="block-content block-content-full border-bottom d-flex justify-content-between align-items-center">
                <a class="btn btn-primary" href="MyList.aspx">
                    <i class="fa fa-arrow-left opacity-50 me-1 "></i>All Furniture
                </a>

            </div>
            <div class="block-content">
                <div class="row py-3">
                    <div class="col-sm-12">
                        <asp:Image class="img-fluid h-25" ImageUrl="imageurl" ID="fimg" runat="server" />
                        <table class="table table-striped table-borderless mt-3">
                            <tbody>
                                <tr>
                                    <td class="fw-semibold">Owner</td>
                                    <td>
                                        <asp:Label Text="" ID="ownerlbl" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-semibold">Price</td>
                                    <td>
                                        <i class="fa fa-indian-rupee"></i>
                                        <asp:Label Text="" ID="pricelbl" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-semibold">Item Name</td>
                                    <td>
                                        <asp:Label Text="" ID="itemnmlbl" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-semibold">Description</td>
                                    <td>
                                        <asp:Label Text="" ID="desclbl" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="fw-semibold">
                                        Time Period For Rent
                                    </td>
                                    <td>
                                        <asp:DropDownList class="form-select" ID="rtime" required="required" name="fstatus" aria-label="Floating label select example" runat="server">
                                            <asp:ListItem Text="Select an option" />
                                            <asp:ListItem Text="7 Days" Value="7" />
                                            <asp:ListItem Text="15 Days" Value="15" />
                                            <asp:ListItem Text="30 Days" Value="30" />

                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    
                                    <td>
                                        <asp:Button CssClass="btn btn-primary" Text="Add Cart" ID="cartBtn" OnClick="cartBtn_Click" runat="server" />
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </div>

</asp:Content>
