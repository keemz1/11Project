<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="AddProducts.aspx.cs" Inherits="BookRepo.Project.Pages.AdminStuff.AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="container-fluid" style="height: auto;margin:auto">
        <div class="topic">
            <h1 style="color: black;">Add a Book</h1>
        </div>
        <div class="" style="width: 50%; margin: 0 auto;">
        </div>
        <div class="pt-5">
            Book name:<br>
            <asp:TextBox ID="txtname" runat="server" placeholder="Mickey Mouse"
                class="form-control rounded col-4"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ErrorMessage="Enter the name of the book" ControlToValidate="txtname
                    " ForeColor="Red">*</asp:RequiredFieldValidator>
            <br>
            Short Description:<br>
            <textarea id="txtdescription" class="form-control rounded"
                cols="30" rows="4"></textarea>
            <div class="col-1">
            </div>
            <br>
            <br>
            Price:<br>
            <asp:TextBox id="txtprice" placeholder="7.99"
                cssclass="form-control rounded col-4" runat="server">
                </asp:TextBox>
            <div class="col-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ErrorMessage="Enter a unique user name" ControlToValidate="txtprice"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
            <br>
            Image File:<br>
            <asp:FileUpload ID="upFile" runat="server" />
            <div class="col-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ErrorMessage="Enter a unique user name" ControlToValidate="upFile"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
            <br>
            Books in Stock:<br>
            <asp:TextBox id="txtstock" placeholder="Mouse"
                runat="server" CssClass="form-control rounded col-4">
                </asp:TextBox>
            <div class="col-1">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ErrorMessage="Enter a unique user name" ControlToValidate="txtstock"
                    ForeColor="Red">*</asp:RequiredFieldValidator>
            </div>
            <br>
            <br>
            <input type="button" class="btn rounded btn-outline-success" value="Submit">
        </div>
    </div>
</asp:Content>
