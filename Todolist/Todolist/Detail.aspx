﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Todolist.Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Todo list</h1>
    <fieldset>
        <div>Task name:</div>
        <asp:TextBox ID="txtTaskName" runat="server"></asp:TextBox>
        <br /><br />
        <div>Due Date:</div>
        <asp:TextBox ID="txtDueDate" TextMode="Date" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </fieldset>
    <br />
    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
</asp:Content>
