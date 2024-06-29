<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="furniture_rent.pages.demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

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

</head>
<body>
    <form id="form1" runat="server">
        <div>

            Enter Furniture Name :- <asp:TextBox runat="server" ID="fname"/> <br />
            Enter Furniture Price :- <asp:TextBox runat="server" TextMode="Number" ID="fprice"/> <br />

            <asp:DropDownList runat="server" ID="fstatus">
                <asp:ListItem Text="Active" />
                <asp:ListItem Text="DeActive" />
            </asp:DropDownList> <br /><br />

            <asp:FileUpload runat="server" OnChange="previewImage()" ID="fileupload" Style="width: 80%; background-color: ghostwhite" />


            <asp:Image ImageUrl="imageurl" Style="height: 60px; width: 60px;" ID="fimage" runat="server" /> <br /><br />

            Enter Furniture Desc :- <asp:TextBox runat="server" ID="fdesc" TextMode="MultiLine" />

            <asp:Button Text="Submit" ID="submit_btn" OnClick="submit_btn_Click" runat="server" />

        </div>
    </form>
</body>
</html>
