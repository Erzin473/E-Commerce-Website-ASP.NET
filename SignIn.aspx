<%@ Page Language="C#"  MasterPageFile="~/GeneralLayout.Master" AutoEventWireup="true" CodeBehind="SignIn.aspx.cs" Inherits="WebApp.SignIn" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- Sign In start -->
        
               <div class="container">
                   <div class="form-horizontal">
                       <h2>Login</h2>
                       <hr />
                       <div class="form-group">
                           <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label"  Text="Username"></asp:Label>
                           <div class="col-md-3">
                               <asp:TextBox ID="UserName"  CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername"  CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                         <div class="form-group">
                           <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Password"></asp:Label>
                           <div class="col-md-3">
                               <asp:TextBox ID="Password"  CssClass="form-control"  TextMode="Password" runat="server"></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword"  CssClass="text-danger" runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="Password"></asp:RequiredFieldValidator>
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:CheckBox ID="CheckBox2" runat="server" />
                               <asp:Label ID="Label3" runat="server" CssClass=" control-label" Text="Remember me ?"></asp:Label>
                               
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn1 btn" OnClick="Button1_Click" />
                               <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/SignUp.aspx" OnClick="LinkButton1_Click">Sign Up</asp:LinkButton>
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:LinkButton ID="lbForgotPass" runat="server" PostBackUrl="~/ForgotPassword.aspx">Forgot Password !</asp:LinkButton>
                           </div>
                       </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                               </div>
                       </div>
                   </div>
               </div>
          
        <!-- Sign In end-->
    
</asp:Content> 
    

