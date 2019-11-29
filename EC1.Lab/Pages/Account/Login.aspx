<%@ Page Language="C#" MasterPageFile="~/Pages/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EC1.Lab.Login" %>



<asp:Content ID="ContentRegister" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="container-fluid" style="height: auto">
        <div class="topic">
            <h1 style="color: black;">Login</h1>
        </div>
        <div class="" style="width: 50%; margin: 0 auto;">
            <br />
            <br />
            <asp:Literal ID="StatusMessage" runat="server"></asp:Literal>
            <br />
            <div class="form-group row">
                <asp:Label ID="lblemail" runat="server" class="col-sm-4 col-form-label no-wrap" Text="Email Address"></asp:Label>

                <div class="col-4">
                    <asp:TextBox ID="txtemail" placeholder="myemail@gmail.com" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Enter your email address" ControlToValidate="txtemail" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Incorrect email format" ControlToValidate="txtemail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" SetFocusOnError="True">*</asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="lblpass" runat="server" class="col-sm-4 col-form-label no-wrap" Text="Password"></asp:Label>

                <div class="col-4">
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter your password" ControlToValidate="txtpass" ForeColor="Red">*</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="align-content-center" style="text-align: center">
                <div class="">
                    <asp:Button ID="btnSignin" runat="server" Text="Sign In" OnClick="btnSignin_Click" CssClass="form-control" Width="100px" Style="margin: auto" />
                </div>
            </div>
            <p class="pb-2 pt-4" style="color: black">
                Have'nt Signed Up?
           
            </p>
            <div style="margin: auto">
                <asp:Button ID="btnRegister" runat="server" Text="Register Now"
                    CssClass="btn rounded btn-outline-success"
                    OnClick="btnRegister_Click" />
            </div>
        </div>
    </div>
</asp:Content>
