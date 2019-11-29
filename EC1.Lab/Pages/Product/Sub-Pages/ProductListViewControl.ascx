<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListViewControl.ascx.cs" Inherits="EC1.Lab.Pages.Product.Sub_Pages.ProductListViewControl" %>



<div class="row align-content-center">

    <asp:ListView ID="ProductListView" DataKeyNames="ProductId" runat="server" DataSourceID="ProductListSource">
        <LayoutTemplate>
            <div runat="server" id="lstProducts">
                <div runat="server" id="itemPlaceholder"></div>
            </div>
            <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                </Fields>
            </asp:DataPager>
        </LayoutTemplate>

        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
        </EmptyItemTemplate>
        <ItemTemplate>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-4">
                            <asp:ImageButton ID="ProductImage" runat="server" CommandName="ImageClick" OnCommand="ProductImage_Click"
                                ImageUrl='<%# Eval("ImageFile") %>' Width="150px" Height="150px"
                                CommandArgument='<%# Eval("ProductId").ToString() + "," + Eval("Name").ToString() + "," + Eval("ShortDescription").ToString()  + "," + Eval("UnitPrice").ToString() %>' />
                        </div>
                        <div class="col-8">
                            <div class="row" style="text-align: left;">
                                <asp:Label ID="LongDescriptionLabel" runat="server" Text='<%# Eval("ShortDescription") %>' />
                            </div>
                            <div class="row" style="margin-top: 15px; font-size: 1.3em; font-weight: bold;">
                                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("UnitPrice", "{0:c}")%>' />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <%--<ItemTemplate>
            <asp:Button type="button" class="alert-target btn btn-outline-success rounded"
                title="Order all items from cart"
                style="margin: auto"
                runat="server"
                OnClick="btnBuy"
                Text="Add tp Cart"
                CommandArgument='<%# Eval("ProductId").ToString() + "," + Eval("Name").ToString() + "," + Eval("ShortDescription").ToString()  + "," + Eval("UnitPrice").ToString() %>'>
            </asp:Button>
        </ItemTemplate>--%>
    </asp:ListView>
    <asp:SqlDataSource ID="ProductListSource" runat="server" ConnectionString="<%$ ConnectionStrings:BookRepo %>"
        SelectCommand="SELECT [ProductId], [Name], [ShortDescription], [UnitPrice], [ImageFile] FROM [Product]"></asp:SqlDataSource>
</div>


