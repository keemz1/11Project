<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="EC1.Lab.Pages.AdminStuff.EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="align-items-center container-fluid" style="min-height: 100%">
        <h1>Edit User</h1>
        <br />
        <br />
        <br />

        <div style="margin:auto" class="row pb-lg-4">
            <asp:Label ID="Label1" runat="server" Text="Search User ID"
                CssClass="pr-3"></asp:Label>
            <asp:TextBox ID="txtemail" runat="server" placeholder="me@mymail.com"
                class="form-control rounded col-4"></asp:TextBox>
            <asp:Button ID="btnSubmit" CssClass="btn rounded btn-light btn-outline-success"
                value="Submit" runat="server" OnClick="btnSubmit_Click"
                Text="Submit" />
        </div>

        <div class="card text-white bg-info mb-3" style="margin: auto">
            <asp:HiddenField ID="hfUserId" runat="server" />
            <asp:HiddenField ID="hfStatus" runat="server" />
            <asp:HiddenField ID="hfProductId" runat="server" />
            <asp:HiddenField ID="hfQuantity" runat="server" />
            <asp:HiddenField ID="hfProductName" runat="server" />
            <asp:HiddenField ID="hfTotalCost" runat="server" />
            <div class="card-header">Users</div>
            <div class="card-body">
                <div class="product-grid">
                    <asp:GridView ID="userGridView" ForeColor="Black" runat="server" Height="195px" Width="379px"
                        ShowFooter="True" AutoGenerateColumns="False" DataKeyNames="Id"
                        OnRowDeleting="PendingRecordsGridview_RowDeleting" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" ReadOnly="True" />
                            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                            <%--<asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />--%>
                            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookRepo %>" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @Id" InsertCommand="INSERT INTO [AspNetUsers] ([Id], [FirstName], [LastName], [Address], [City], [Email], [DateOfBirth], [PhoneNumber], [UserName]) VALUES (@Id, @FirstName, @LastName, @Address, @City, @Email, @DateOfBirth, @PhoneNumber, @UserName)" SelectCommand="SELECT [Id], [FirstName], [LastName], [Address], [City], [Email], [DateOfBirth], [PhoneNumber], [UserName] FROM [AspNetUsers]" UpdateCommand="UPDATE [AspNetUsers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [Email] = @Email, [DateOfBirth] = @DateOfBirth, [PhoneNumber] = @PhoneNumber, [UserName] = @UserName WHERE [Id] = @Id">
                        <DeleteParameters>
                            <asp:Parameter Name="Id" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Id" Type="String" />
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="UserName" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="FirstName" Type="String" />
                            <asp:Parameter Name="LastName" Type="String" />
                            <asp:Parameter Name="Address" Type="String" />
                            <asp:Parameter Name="City" Type="String" />
                            <asp:Parameter Name="Email" Type="String" />
                            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
                            <asp:Parameter Name="PhoneNumber" Type="String" />
                            <asp:Parameter Name="UserName" Type="String" />
                            <asp:Parameter Name="Id" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>

    <style type="text/css">
        .hiddencol {
            display: none;
        }
    </style>

    <script type="text/javascript">
        $(".alert-target").click(function () {
            toastr["info"]("I was launched via jQuery!")
        });
    </script>
</asp:Content>
