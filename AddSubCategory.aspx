<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="WebApp.AddSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="form-horizontal">
            <h2>Add Category</h2>
            <hr />
             <div class="form-group">
                           <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label"  Text="Main Category"></asp:Label>
                           <div class="col-md-3">
                               <asp:DropDownList ID="ddlCategory"  CssClass="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername"  CssClass="text-danger" runat="server" ErrorMessage="The field is Required !" ControlToValidate="ddlCategory"></asp:RequiredFieldValidator>
                           </div>
                       </div>
            <div class="form-group">
                           <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label"  Text="Sub Category"></asp:Label>
                           <div class="col-md-3">
                               <asp:TextBox ID="txtSubCatName"  CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  CssClass="text-danger" runat="server" ErrorMessage="The field is Required !" ControlToValidate="txtSubCatName"></asp:RequiredFieldValidator>
                           </div>
                       </div>
            <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn1 btn" OnClick="btnAdd_Click" /> 
                           </div>
                       </div>
            </div>
        <h1>Sub Categories</h1>
            <hr />
            <div class="panel panel-default">
                <!-- default panel content -->
                <div class="panel-heading">All Sub Categories</div>


                <asp:Repeater ID="rptrCategory" runat="server">
                    <HeaderTemplate>
                         <table class="table">
                         <thead>
                        <tr>
                            <th>#</th>
                            <th>Sub Category</th>
                            <th>Category</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <th><%# Eval("SubCatID") %></th>
                            <td><%# Eval("SubCatName") %></td>
                            <td><%# Eval("CatName") %></td>
                            <td>Edit</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                         </tbody>
                </table>
                    </FooterTemplate>
                </asp:Repeater>     
            </div>
        </div>

</asp:Content>
