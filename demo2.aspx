<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo2.aspx.cs" Inherits="furniture_rent.demo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table>
                <tbody>

            <asp:Repeater runat="server" ID="furniture_list">
                <ItemTemplate>

                    <tr>
                        <td> <asp:Label ID="lblRowNumber" Text='<%# Container.ItemIndex + 1 %>' runat="server" /> </td>
                        <td><%#Eval("fname") %></td>
                        <td><%#Eval("fprice") %></td>
                        <td><%#Eval("fstatus") %></td>
                        <td><%#Eval("fimage") %></td>
                        <td><%#Eval("fdesc") %></td>
                        <td><%#Eval("uid") %></td>
                        <td><%#Eval("datetime") %></td>


                    </tr>

                </ItemTemplate>
            </asp:Repeater>
            
                </tbody>
            </table>


        </div>
    </form>
</body>
</html>
