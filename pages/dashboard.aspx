<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="furniture_rent.pages.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="row">
            <div class="col-6 col-xl-4">
                <a class="block block-rounded block-link-shadow text-end" href="#">
                    <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                        <div class="d-none d-sm-block">
                            <i class="fa fa-shopping-bag fa-2x opacity-25"></i>
                        </div>
                        <div>
                            <div class="fs-3 fw-semibold">
                                <asp:Label Text="" ID="rental_list_lbl" runat="server" />
                            </div>
                            <div class="fs-sm fw-semibold text-uppercase text-muted">
                                <asp:Label Text="Rental Furniture List" runat="server" />
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-6 col-xl-4">
                <a class="block block-rounded block-link-shadow text-end" href="#">
                    <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                        <div class="d-none d-sm-block">
                            <i class="fa fa-wallet fa-2x opacity-25"></i>
                        </div>
                        <div>
                            <div class="fs-3 fw-semibold">
                                <i class="fa fa-indian-rupee"></i>
                                <asp:Label Text="" ID="earning_lbl" runat="server" />
                            </div>
                            <div class="fs-sm fw-semibold text-uppercase text-muted">
                                <asp:Label Text="Earnings" runat="server" />
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-6 col-xl-4">
                <a class="block block-rounded block-link-shadow text-end" href="#">
                    <div class="block-content block-content-full d-sm-flex justify-content-between align-items-center">
                        <div class="d-none d-sm-block">
                            <i class="fa fa-list-alt fa-2x opacity-25"></i>

                        </div>
                        <div>
                            <div class="fs-3 fw-semibold">
                                <asp:Label Text="" ID="my_furniture_lbl" runat="server" />
                            </div>
                            <div class="fs-sm fw-semibold text-uppercase text-muted">
                                <asp:Label Text="My Furniture List" runat="server" />
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>


        <div class="row">
            <div class="col-md-12">
                <a class="block block-rounded block-link-shadow overflow-hidden" href="#">
                    <div class="block-content block-content-full">
                        <i class="si si-briefcase fa-2x opacity-25"></i>
                        <div class="row g-5 py-3">
                            <div class="col-6 text-end border-end">
                                <div>
                                    <div class="fs-3 fw-semibold">
                                        <asp:Label Text="17" runat="server" />
                                    </div>
                                    <div class="fs-sm fw-semibold text-uppercase text-muted">Projects</div>
                                </div>
                            </div>
                            <div class="col-6">
                                <div>
                                    <div class="fs-3 fw-semibold">
                                        <asp:Label Text="2" runat="server" />
                                    </div>
                                    <div class="fs-sm fw-semibold text-uppercase text-muted">Active</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </div>

        </div>

    </div>

</asp:Content>
