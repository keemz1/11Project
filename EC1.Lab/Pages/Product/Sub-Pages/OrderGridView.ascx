<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderGridView.ascx.cs" Inherits="EC1.Lab.Pages.Product.Sub_Pages.OrderGridView" %>

<asp:HiddenField ID="hfUserId" runat="server" />
<asp:GridView ID="ordersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1">
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
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookRepo %>" DeleteCommand="DELETE FROM [Orders] WHERE [OrderID] = @OrderID" InsertCommand="INSERT INTO [Orders] ([OrderID], [CustomerID], [SubTotal], [OrderDate], [Quantity], [TotalCost], [Status], [ProductID], [ProductName]) VALUES (@OrderID, @CustomerID, @SubTotal, @OrderDate, @Quantity, @TotalCost, @Status, @ProductID, @ProductName)" SelectCommand="SELECT * FROM [Orders] WHERE ([CustomerID] = @CustomerID)" UpdateCommand="UPDATE [Orders] SET [CustomerID] = @CustomerID, [SubTotal] = @SubTotal, [OrderDate] = @OrderDate, [Quantity] = @Quantity, [TotalCost] = @TotalCost, [Status] = @Status, [ProductID] = @ProductID, [ProductName] = @ProductName WHERE [OrderID] = @OrderID">
    <DeleteParameters>
        <asp:Parameter Name="OrderID" Type="Object" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderID" Type="Object" />
        <asp:Parameter Name="CustomerID" Type="String" />
        <asp:Parameter Name="SubTotal" Type="Decimal" />
        <asp:Parameter Name="OrderDate" Type="DateTime" />
        <asp:Parameter Name="Quantity" Type="String" />
        <asp:Parameter Name="TotalCost" Type="Decimal" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="ProductID" Type="Object" />
        <asp:Parameter Name="ProductName" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="hfUserId" DefaultValue="CustomerID" Name="CustomerID" PropertyName="Value" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="CustomerID" Type="String" />
        <asp:Parameter Name="SubTotal" Type="Decimal" />
        <asp:Parameter Name="OrderDate" Type="DateTime" />
        <asp:Parameter Name="Quantity" Type="String" />
        <asp:Parameter Name="TotalCost" Type="Decimal" />
        <asp:Parameter Name="Status" Type="String" />
        <asp:Parameter Name="ProductID" Type="Object" />
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="OrderID" Type="Object" />
    </UpdateParameters>
</asp:SqlDataSource>

<style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>