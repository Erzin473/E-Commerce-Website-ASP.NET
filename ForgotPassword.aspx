<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/GeneralLayout.Master"  CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApp.ForgotPassword" %>
     
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

               <div class="container">
                   <div class="form-horizontal">
                <h2>Recover Password</h2>
                <hr />
                <h4>Please enter your email address, We will send you the instructions to reset your passwоrd.</h4>
                 <div class="form-group">
                     <asp:Label ID="lblEmail" runat="server" CssClass="col-md-2 control-label" Text="Your Email"></asp:Label>
                     <div class="col-md-3">
                         <asp:TextBox ID="tbEmailId" CssClass="form-control" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail"  CssClass="text-danger" runat="server" ErrorMessage="Please enter your email ID !" ControlToValidate="tbEmailId"></asp:RequiredFieldValidator>
                     </div>       
                    </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:Button ID="btPassRec" runat="server" CssClass="btn1 btn" Text="Send" OnClick="btPassRec_Click" />
                               <asp:Label ID="lblPassRec" runat="server" ></asp:Label>
                           </div>
                       </div>
                 </div>
                  </div>
        
     </asp:Content>  

  
     
