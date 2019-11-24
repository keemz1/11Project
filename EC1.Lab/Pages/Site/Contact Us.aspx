<%@ Page Title="" Language="C#" MasterPageFile="~/Pages/Main.Master" AutoEventWireup="true" CodeBehind="Contact Us.aspx.cs" Inherits="EC1.Lab.Contact_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div class="form-control container-fluid" style="height:auto">
        <h1 style="color:black">Contact Us
        </h1>
        <br />
        <br />
        <br />
        <p style="font-size: 20px">
            What's Up? Whats on your mind?
        </p>
        <div class="pb-3" >
            <textarea id="TextArea1" class="form-control rounded col-6 flex-row p-5 border-success" 
                cols="20" rows="2" style="margin:auto"></textarea>
        </div>
        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-outline-info"/>
        </div>
    </div>
</asp:Content>
