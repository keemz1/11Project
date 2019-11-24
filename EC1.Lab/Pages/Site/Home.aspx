<%@ Page Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EC1.Lab.Home" %>

<asp:Content ID="ContentHome" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="home">
        <h1 class="" style="padding: 10px">Welcome
            <br />
            to
            <br />
            <span class="">Book Repo </span>
        </h1>
        <div style="padding-bottom:100px;">
            <h2 class="slogan" style="font-style: italic">Don't just glance, Take a Peek
            </h2>
        </div>
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width:1280px; margin:auto; transition: .6s ease-in-out">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li> 
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="../../Images/carouselhome/c1.jpg" style="height: 600px;" alt="First slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Read on occassion</h5>
                        <p>...</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../../Images/carouselhome/c2.jpg" style="height: 600px;" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Collect all the best books</h5>
                        <p>...</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="../../Images/carouselhome/c3.png" style="height: 600px;" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Read for fun</h5>
                        <p>...</p>
                    </div>
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
        <br />
        <p style="text-align: center">
            Here we provide a variety of different products and services that suites
            <br />
            the needs of all our customers
        </p>

        <div style="float: none; align-content: center">
            <asp:Image ID="Image1" src="" runat="server" />
        </div>
        <div>
            <p>Not a Member? Register Today!</p>
            <asp:Button CssClass="btn btn-outline-dark btn-light btn-rounded" ID="btnform" runat="server" Text="Go to Registration Form" OnClick="btnform_Click" />
        </div>
    </div>
</asp:Content>
