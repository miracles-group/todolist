<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Todolist._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Todo list</h1>
    <fieldset>
        <div>Task name:</div>
        <asp:TextBox ID="txtTaskName" runat="server"></asp:TextBox>
        <br /><br />
        <div>Due Date:</div>
        <asp:TextBox ID="txtDueDate" TextMode="Date" runat="server"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" />
    </fieldset>
    <br />
    <asp:Repeater ID="rptList" runat="server" OnItemCommand="rptList_ItemCommand">
        <HeaderTemplate>
            <table class="table">
                <tr>
                    <td>
                        <strong>#</strong>
                    </td>
                    <td>
                        <strong>Name</strong>
                    </td>
                    
                    <td>
                        <strong>Due Date</strong>
                    </td>
                    <td></td>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>

                <td>
                    <%# Container.ItemIndex + 1 %>
                </td>
                <td>
                    <%# Eval("Title") %>
                </td>
                <td>
                    <%# Eval("DueDate").ToString() %>
                </td>
                <td>
                    <a href="/Detail.aspx?id=<%# Eval("ID") %>">Edit</a> | 
                    <asp:LinkButton ID="lbtnDelete" CommandName="Delete" OnClientClick="javascript:if(!confirm('Delete this information? this will delete permanently'))return false;" CommandArgument='<%#Eval("ID") %>' runat="server">Delete</asp:LinkButton>

                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Label ID="lbMessage" runat="server" Text=""></asp:Label>
</asp:Content>
