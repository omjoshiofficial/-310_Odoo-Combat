<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Furniture.Master" AutoEventWireup="true" CodeBehind="my_furniture_list.aspx.cs" Inherits="furniture_rent.pages.my_furniture_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="content">
        <div class="content-heading d-flex justify-content-between align-items-center">
            <span>My Furniture List <small class="d-none d-sm-inline">(<asp:Label Text="45" runat="server" />)</small>
            </span>

        </div>

        <div class="block block-rounded">
            <div class="block-content block-content-full">
                <table class="table table-borderless table-striped">
                    <thead>
                        <tr>
                            <th style="width: 100px;">ID</th>
                            <th>Status</th>
                            <th class="d-none d-sm-table-cell">Submitted</th>
                            <th class="d-none d-sm-table-cell">Furniture Name</th>

                            <th class="d-none d-sm-table-cell">Value</th>
                            <th class="d-none d-sm-table-cell text-end">Action</th>

                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater runat="server" ID="show_furniture_list">
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <a class="fw-semibold"><%# Container.ItemIndex + 1 %></a>
                                    </td>
                                    <td>
                                        <span class="badge bg-danger"><%#Eval("fstatus") %></span>
                                    </td>
                                    <td class="d-none d-sm-table-cell"><%#Eval("datetime") %>              </td>
                                    <td class="d-none d-sm-table-cell">
                                        <a href="#"><%#Eval("fname") %></a>
                                    </td>

                                    <td class="d-none d-sm-table-cell"><i class="fa fa-indian-rupee"></i><%#Eval("fprice") %></td>

                                    <td class="d-none d-sm-table-cell text-end">
                                        <a href='AddFurniture.aspx?edit=<%#Eval("fid") %>'><i class="fa fa-edit"></i></a>
                                        <a href='my_furniture_list.aspx?delete=<%#Eval("fid") %>'><i class="fa fa-trash text-danger ms-1"></i></a>
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
