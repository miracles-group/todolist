<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Todolist.Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Todo list</h1>
    <fieldset>
        Task name:
        <asp:TextBox ID="txtTaskName" runat="server"></asp:TextBox>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </fieldset>
    <br />
    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
</asp:Content>
