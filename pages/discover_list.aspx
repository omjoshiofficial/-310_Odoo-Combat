<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="discover_list.aspx.cs" Inherits="furniture_rent.discover_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <h2 class="content-heading">Furniture List</h2>
        <div class="row items-push">

            <asp:Repeater runat="server" ID="show_discover_list">
                <ItemTemplate>

                    <div class="col-md-6 col-xl-4">
                        <div class="block block-rounded">
                            <div class="block-content p-0 overflow-hidden">
                                <a class="img-link" href="be_pages_real_estate_listing.html">
                                    <asp:Image class="img-fluid rounded-top" ImageUrl='<%#Eval("fimage") %>' runat="server" />
                                </a>
                            </div>
                            <div class="block-content border-bottom">
                                <h4 class="fs-5 mb-2">
                                    <a href="detail_page.aspx?fid=<%#Eval("fid") %>"><%#Eval("fname") %></a>
                                    
                                </h4>
                                <h5 class="fs-1 fw-light mb-1">
                                    <i class="fa fa-indian-rupee"></i>
                                    <asp:Label Text='<%#Eval("fprice") %>' runat="server" />
                                </h5>
                                <p class="text-muted">
                                    <i class="fa fa-map-pin me-1"></i>
                                    <asp:Label Text="383001" runat="server" />
                                </p>
                            </div>
                            <div class="block-content border-bottom">
                                <div class="row">

                                    <div class="col-6">
                                        <p>
                                            <i class="fa fa-user opacity-50 me-1"></i>
                                            <asp:Label Text='<%#Eval("username") %>' runat="server" />
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
