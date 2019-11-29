<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderGridView.ascx.cs" Inherits="EC1.Lab.Pages.Product.Sub_Pages.OrderGridView" %>

<asp:HiddenField ID="hfUserId" runat="server" />
<asp:GridView ID="ordersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID">
    <Columns>
        <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
        <asp:BoundField DataField="CustomerID" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" HeaderText="CustomerID" SortExpression="CustomerID" />
        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" SortExpression="SubTotal" />
        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        <asp:BoundField DataField="ProductID" HeaderText="ProductID" SortExpression="ProductID" />
        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
        <asp:TemplateField>
            <ItemTemplate>
                <input type="button" value="Remove Order" id="btnRemoveOrder" runat="server"
                    text="Save Item" title="Remove item from Order"
                    class="rounded btn btn-outline-danger"
                    onserverclick="btnRemoveOrder_ServerClick" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

<style type="text/css">
    .hiddencol {
        display: none;
    }
</style>
