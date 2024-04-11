<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="CrudRegistration.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        TextBox{
            width:300px;
        }
        
    </style>

    <form>
        <h1>ADD NEW STUDENT</h1>
        <div class="container">
            <div class="form-group">
                <label for="exampleInputEmail1">Student ID</label><asp:RequiredFieldValidator runat="server" ErrorMessage="Please enter ID" ForeColor="Red" ControlToValidate="Sid"></asp:RequiredFieldValidator>
                <asp:TextBox type="text" class="form-control" ID="Sid" aria-describedby="emailHelp" runat="server" placeholder="Enter id"></asp:TextBox>

                <label for="exampleInputEmail1">First Name</label>
                <asp:TextBox type="text" class="form-control" ID="Sname" aria-describedby="emailHelp" runat="server" placeholder="Enter name"></asp:TextBox>
                
                <label for="exampleInputEmail1">Middle Name</label>
                <asp:TextBox type="text" class="form-control" ID="Mname" aria-describedby="emailHelp" runat="server" placeholder="Enter name"></asp:TextBox>
                
                <label for="exampleInputEmail1">Last Name</label>
                <asp:TextBox type="text" class="form-control" ID="Lname" aria-describedby="emailHelp" runat="server" placeholder="Enter name"></asp:TextBox>

                <label for="exampleInputPassword1">Address</label>
                <asp:TextBox type="text" class="form-control" runat="server" ID="Saddress" placeholder="Address"></asp:TextBox>

                <label for="exampleInputPassword1">Age</label>
                <asp:TextBox type="text" class="form-control" runat="server" ID="Sage" placeholder="Age"></asp:TextBox>

                <label for="exampleInputPassword1">Contact</label>
                <asp:TextBox type="text" class="form-control" runat="server" ID="Scontact" placeholder="Contact"></asp:TextBox><asp:RegularExpressionValidator ID="ContactValidator" runat="server"
                    ControlToValidate="Scontact"
                    ForeColor="Red"
                    ErrorMessage="Please enter a valid contact number"
                    ValidationExpression="^\d{10}$" />  
            </div>
        <asp:Button type="submit" class="btn btn-primary" Text="Submit" runat="server" ID="btnsave" OnClick="btnsave_Click" Style="width: 310px; padding: 8px; border:none;margin:5px;background-color: #212529"></asp:Button>
<%--        <asp:Button type="submit" class="btn btn-primary" Text="Show List" runat="server" ID="btnshow" OnClick="btnshow_Click" Style="width: 300px; padding: 8px; border:none; background-color: #212529;"></asp:Button>--%>
        </div>
        <br />
    </form>

</asp:Content>
