<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartItems.ascx.cs" Inherits="EC1.Lab.Pages.Product.Sub_Pages.CartItems" %>

<asp:HiddenField ID="hfUserId" runat="server" />
<asp:GridView ID="cartGridView" ForeColor="Black" runat="server" Height="195px" Width="379px" DataSourceID="SqlDataSource1"
    ShowFooter="True" AutoGenerateColumns="False" DataKeyNames="CartId" OnRowDataBound="cartGridView_RowDataBound" OnSelectedIndexChanged="cartGridView_SelectedIndexChanged">
    <Columns>
        <asp:BoundField DataField="CartId" readonly="true" Visible="false" HeaderText="CartId" SortExpression="CartId" InsertVisible="False" />
        <asp:BoundField DataField="OrderID" HeaderText="OrderID" Visible="false" SortExpression="OrderID" />
        <asp:BoundField DataField="ProductID" ReadOnly="false" Visible="false" HeaderText="ProductID" SortExpression="ProductID" />
        <%--<asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />--%>
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        <asp:BoundField DataField="ProductName" ReadOnly="false" HeaderText="ProductName" SortExpression="ProductName" />
        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
        <asp:BoundField DataField="TotalCost" HeaderText="TotalCost" SortExpression="TotalCost" />
        <asp:TemplateField>
            <ItemTemplate>
                <asp:Button ID="btnPurchase" runat="server" CausesValidation="false"
                    CommandName="PurchaseProduct"
                    Text="Purchase"
                    CssClass="rounded btn"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookRepo %>" 
    SelectCommand="SELECT * FROM [Carts] WHERE ([UserId] = @UserId AND [Status] = @Status)" 
    DeleteCommand="DELETE FROM [Carts] WHERE [CartId] = @CartId" 
    InsertCommand="INSERT INTO [Carts] ([OrderID], [ProductID], [Quantity], [ProductName], [UserId], [TotalCost]) VALUES (@OrderID, @ProductID, @Quantity, @ProductName, @UserId, @TotalCost)" 
    UpdateCommand="UPDATE [Carts] SET [OrderID] = @OrderID, [ProductID] = @ProductID, [Quantity] = @Quantity, [ProductName] = @ProductName, [UserId] = @UserId, [TotalCost] = @TotalCost WHERE [CartId] = @CartId">
<DeleteParameters>
        <asp:Parameter Name="CartId" Type="Int32" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="OrderID" Type="Object" />
        <asp:Parameter Name="ProductID" Type="Object" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="UserId" Type="Object" />
        <asp:Parameter Name="TotalCost" Type="Double" />
    </InsertParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="hfUserId" Name="UserId" PropertyName="Value" Type="String" />
        <asp:Parameter DefaultValue="New" DbType="String" Name="Status" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="OrderID" Type="Object" />
        <asp:Parameter Name="ProductID" Type="Object" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="ProductName" Type="String" />
        <asp:Parameter Name="UserId" Type="Object" />
        <asp:Parameter Name="TotalCost" Type="Double" />
        <asp:Parameter Name="CartId" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>

<style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>