<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Detail.aspx.cs" Inherits="Todolist.Detail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Edit Todo list</h1>
    <fieldset>
        <div class="row mg">
            <div class="col-xs-12 col-sm-6">


                <div>Task name:</div>
                <asp:TextBox ID="txtTaskName" runat="server"></asp:TextBox>
                <br />
                <br />
                <div>Due Date:</div>
                <asp:TextBox ID="txtDueDate" TextMode="Date" runat="server"></asp:TextBox>
                <br />
                <br />
                <div>Description:</div>
                <asp:TextBox ID="txtDescription" TextMode="MultiLine" Rows="5" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </div>
        </div>
    </fieldset>
    <br />
    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
</asp:Content>
