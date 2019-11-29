<%@ Page Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="EC1.Lab.Welcome" %>

<asp:Content ID="ContentRegister" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <h1>Welcome ;)</h1>
        <br />
        <br />
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" style="margin: auto">
                <div class="carousel-item active">
                    <img class="d-block" src="../Images/carousel/w1.jpg" style="height: 400px; width: 400px" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block" src="../Images/carousel/w2.jpg" style="height: 400px; width: 400px" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block" src="../Images/carousel/w3.jpg" style="height: 400px; width: 400px" alt="Third slide">
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br />
        <div class="pb-3 pt-2">
            <asp:Button CssClass="btn rounded btn-primary mt-3" ID="btnaddUser" runat="server" Text="Add a new User" OnClick="btnaddUser_Click" />
        </div>
        <div class="pb-2">
            <asp:Button CssClass="btn rounded btn-primary mt-3" ID="btnAddProduct" runat="server" Text="Add a new Product" OnClick="btnAddProduct_Click" />
        </div>
        <br />
        <div class="pb-3">
            <asp:Button CssClass="btn rounded btn-success"
                ID="btnprod" runat="server" Text="Let's Shop" OnClick="btnprod_Click" />
        </div>
        <div class="alert alert-success" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Success!</strong> You have signed in successfully!
       
        </div>
        <div>
            <asp:Button CssClass="btn rounded btn-outline-light mt-3" ID="btnEditUser"
                runat="server" Text="Edit User" OnClick="btnEditUser_Click" />
        </div>
    </div>

    <script type="text/javascript">
        window.setTimeout(function () {
            $(".alert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
    </script>
</asp:Content>
