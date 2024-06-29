<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="rental_history.aspx.cs" Inherits="furniture_rent.pages.rental_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="content-heading d-flex justify-content-between align-items-center">
            <span>Rental Furniture List <small class="d-none d-sm-inline">(<asp:Label Text="45" runat="server" />)</small>
            </span>

        </div>

        <div class="block block-rounded">
            <div class="block-content block-content-full">
                <table class="table table-borderless table-striped">
                    <thead>
                        <tr>
                            <th style="width: 100px;">ID</th>
                            <th>User Name</th>
                            <th class="d-none d-sm-table-cell">Time Line</th>
                            <th class="d-none d-sm-table-cell">Furniture Name</th>

                            <th class="d-none d-sm-table-cell">Value</th>
                            <th class="d-none d-sm-table-cell text-end">Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="show_rental_list">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <a class="fw-semibold"><%# Container.ItemIndex + 1 %></a>
                                    </td>
                                    <td>
                                        <span class="badge bg-danger"><%#Eval("username") %></span>
                                    </td>
                                    <td class="d-none d-sm-table-cell"><%#Eval("timeline") %>   Days         </td>
                                    <td class="d-none d-sm-table-cell">
                                        <a href="#"><%#Eval("fname") %></a>
                                    </td>

                                    <td class="d-none d-sm-table-cell"><i class="fa fa-indian-rupee"></i><%#Eval("fprice") %></td>

                                    <td class="d-none d-sm-table-cell text-end">

                                        
                                        <a href='rental_history.aspx?edit=<%#Eval("cid") %>&fid=<%#Eval("fid") %>'><i class="fa fa-edit"></i></a>
                                        <a href='rental_history.aspx?delete=<%#Eval("cid") %>'><i class="fa fa-trash text-danger ms-1"></i></a>
                                    </td>
                                </tr>

                            </ItemTemplate>
                        </asp:Repeater>


                    </tbody>
                </table>

            </div>
        </div>
    </div>

</asp:Content>
