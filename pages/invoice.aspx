<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="furniture_rent.pages.invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">

        <h2 class="content-heading">Products <small>(5)</small></h2>
        <div class="block block-rounded">
            <div class="block-content block-content-full">
                <div class="table-responsive">
                    <table class="table table-borderless table-striped mb-0">
                        <thead>
                            <tr>
                                <th style="width: 100px;">ID</th>
                                <th>Product</th>
                                <th class="text-end">Rent Time</th>

                                <th class="text-end" style="width: 40%;">PRICE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <a class="fw-semibold" href="#">
                                        <asp:Literal Text="1" runat="server" />
                                    </a>
                                </td>
                                <td>
                                    <a href="#">
                                        <asp:Literal Text="Chair" runat="server" />
                                    </a>
                                </td>
                                <td class="text-end">
                                    <asp:Literal Text="7" runat="server" />
                                    Days
                                </td>

                                <td class="text-end">
                                    <i class="fa fa-indian-rupee"></i>
                                    <asp:Literal Text="999" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end fw-semibold">Total Price:</td>
                                <td class="text-start">
                                    <i class="fa fa-indian-rupee"></i>999

                                </td>



                            </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
