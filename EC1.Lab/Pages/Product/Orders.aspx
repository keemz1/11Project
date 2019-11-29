<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="EC1.Lab.Pages.Product.Orders" %>

<%@ Register Src="~/Pages/Product/Sub-Pages/OrderGridView.ascx" TagName="WebControl" TagPrefix="AWebControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="align-items-center container-fluid">
        <h1>Orders</h1>
        <br />
        <br />
        <br />
        <div class="order-grid">
            <AWebControl:WebControl ID="ListView" runat="server" OnCommand="Item_Selected" />
        </div>
    </div>
    <div class="pb-3 pt-2">
        <asp:Button CssClass="btn btn-light btn-rounded btn-outline-success"
            ID="btnGoToCart" runat="server" Text="Back to Cart"
            OnClick="btnGoToCart_Click" />
    </div>
</asp:Content>
