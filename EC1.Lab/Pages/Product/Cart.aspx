<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="EC1.Lab.Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="align-items-center container-fluid">
        <h1>Cart</h1>
        <br />
        <br />
        <br />
        <div class="card text-white bg-info mb-3" style="margin: auto">
            <asp:HiddenField ID="hfUserId" runat="server" />
            <asp:HiddenField ID="hfStatus" runat="server" />
            <asp:HiddenField ID="hfProductId" runat="server" />
            <asp:HiddenField ID="hfQuantity" runat="server" />
            <asp:HiddenField ID="hfProductName" runat="server" />
            <asp:HiddenField ID="hfTotalCost" runat="server" />
            <div class="card-header">My Item(s)</div>
            <div class="card-body">
                <div class="product-grid">
                    <asp:GridView ID="cartGridView" ForeColor="Black" runat="server" Height="195px" Width="379px"
                        ShowFooter="True" AutoGenerateColumns="False" DataKeyNames="CartId" OnSelectedIndexChanged="cartGridView_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="CartId" ReadOnly="true" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" SortExpression="CartId" InsertVisible="False" />
                            <asp:BoundField DataField="OrderID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" SortExpression="OrderID" />
                            <asp:BoundField DataField="ProductID" ReadOnly="false" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" SortExpression="ProductID" />
                            <%--<asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />--%>
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="ProductName" ReadOnly="false" HeaderText="ProductName" SortExpression="ProductName" />
                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                            <asp:BoundField DataField="ShippingCost" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" SortExpression="ShippingCost" />
                            <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" value="Save Item" ID="btnProductSave" runat="server"
                                        Text="Save Item" Title="This item will be saved for later"
                                        class="rounded btn btn-light btn-light btn-outline-dark" 
                                        onserverclick="btnSaveItem" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <input type="button" value="Put On Order List" ID="btnProdPurchase" runat="server"
                                        Text="Put On Order List" Title="This item will put the item up for purchase"
                                        class="rounded btn btn-light btn-outline-primary"
                                        onserverclick="btnStoreItem"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" class="alert-target btn btn-outline-success rounded"
                                        title="Order all items from cart" data-toggle="modal"
                                        data-target="#exampleModalCenter"
                                        style="margin: auto"
                                        runat="server"
                                        onServerClick="btnBuy">
                                        <i class="fa fa-shopping-cart fa-lg"
                                            aria-hidden="true"></i>
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <button type="button" class="alert-target btn btn-outline-danger rounded"
                                        title="Order all items from cart" data-toggle="modal"
                                        data-target="#exampleModalCenter"
                                        style="margin: auto"
                                        runat="server"
                                        onServerClick="btnBuy">
                                        <i class="fa fa-shopping-cart fa-lg"
                                            aria-hidden="true"></i>
                                    </button>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                </div>
                <div class="pb-3">
                    <div class="row" style="margin: auto">
                        <button type="button" class="btn btn-outline-light rounded"
                            title="Get All Saved Items" runat="server" onServerClick="btnGetSavedItems"
                            style="margin: auto">
                            <i class="fa fa-cart-arrow-down fa-lg"
                                aria-hidden="true"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle">Confirm Purchase Action:</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div>
                            <asp:Button ID="btnOrdersPage" runat="server" Text="See Your Orders" OnClick="btnOrdersPage_Click"/>
                        </div>
                    </div>
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
