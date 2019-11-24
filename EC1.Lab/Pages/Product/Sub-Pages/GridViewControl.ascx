<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GridViewControl.ascx.cs" Inherits="EC1.Lab.Pages.Product.Sub_Pages.GridViewControl" %>


<asp:GridView ID="dataProductsGrid" runat="server" Height="195px" Width="379px" OnRowDataBound="dataProductsGrid_RowDataBound"
    OnSelectedIndexChanged="OnSelectedIndexChanged" DataKeyNames="ProductId" DataSourceID="SqlDataSource1"
    OnClientClick="myfunction(); return false;" ShowFooter="True" AutoGenerateColumns="False">
    <Columns>
        <asp:BoundField DataField="ProductId" HeaderText="ProductId" ItemStyle-CssClass="hiddencol" HeaderStyle-CssClass="hiddencol" SortExpression="ProductId" ReadOnly="True" />
        <asp:BoundField DataField="ProductCode" HeaderText="ProductCode" SortExpression="ProductCode" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:BoundField DataField="ShortDescription" HeaderText="ShortDescription" SortExpression="ShortDescription" />
        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" />
        <%--<asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />--%>
        <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" />
        <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
        <%--<asp:BoundField DataField="ShippingCost" HeaderText="ShippingCost" SortExpression="ShippingCost" />--%>
        <asp:TemplateField HeaderText="Image">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server"
                    Text='<%# Bind("ImageFile") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("ImageFile") %>' Width="100px" Height="100px" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BookRepo %>" SelectCommand="SELECT * FROM [Product]" DeleteCommand="DELETE FROM [Product] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Product] ([ProductId], [ProductCode], [Name], [ShortDescription], [LongDescription], [UnitPrice], [ImageFile], [InStock]) VALUES (@ProductId, @ProductCode, @Name, @ShortDescription, @LongDescription, @UnitPrice, @ImageFile, @InStock)" UpdateCommand="UPDATE [Product] SET [ProductCode] = @ProductCode, [Name] = @Name, [ShortDescription] = @ShortDescription, [LongDescription] = @LongDescription, [UnitPrice] = @UnitPrice, [ImageFile] = @ImageFile, [InStock] = @InStock WHERE [ProductId] = @ProductId">
    <DeleteParameters>
        <asp:Parameter Name="ProductId" Type="Object" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="ProductId" Type="Object" />
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="ShortDescription" Type="String" />
        <asp:Parameter Name="UnitPrice" Type="Decimal" />
        <asp:Parameter Name="ImageFile" Type="String" />
        <asp:Parameter Name="InStock" Type="Int32" />
    </InsertParameters>
    <UpdateParameters>
        <asp:Parameter Name="Name" Type="String" />
        <asp:Parameter Name="ShortDescription" Type="String" />
        <asp:Parameter Name="UnitPrice" Type="Decimal" />
        <asp:Parameter Name="ImageFile" Type="String" />
        <asp:Parameter Name="InStock" Type="Int32" />
        <asp:Parameter Name="ProductId" Type="Object" />
    </UpdateParameters>
</asp:SqlDataSource>

<style type="text/css">
  .hiddencol
  {
    display: none;
  }
</style>