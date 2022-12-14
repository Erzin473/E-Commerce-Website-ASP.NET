<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/GeneralLayout.Master" CodeBehind="RecoverPassword.aspx.cs" Inherits="WebApp.RecoverPassword" %>
      
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

               <div class="container">
                   <div class="form-horizontal"> 
                <h2>Reset Password</h2>
                <hr />
                <div class="form-group">
                     <asp:Label ID="lblMsg" runat="server" CssClass="col-md-2 control-label" Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                </div>

                 <div class="form-group">
                     <asp:Label ID="lblPassword" runat="server" CssClass="col-md-2 control-label" Text="New Password" Visible="False"></asp:Label>
                     <div class="col-md-3">
                         <asp:TextBox ID="tbNewPass" CssClass="form-control"  TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass"  CssClass="text-danger" runat="server" ErrorMessage="Please enter your new Password !" ControlToValidate="tbNewPass"></asp:RequiredFieldValidator>
                     </div>       
                    </div>
                        <div class="form-group">
                     <asp:Label ID="lblRetypePass" runat="server" CssClass="col-md-2 control-label" Text="Confrim Password" Visible="False"></asp:Label>
                     <div class="col-md-3">
                         <asp:TextBox ID="tbConfrimPass" CssClass="form-control"  TextMode="Password" runat="server" Visible="False"></asp:TextBox>               
                         <asp:CompareValidator ID="CompareValidatorPass" runat="server" CssClass="text-danger" ErrorMessage="Both Password must be same !" ControlToCompare="tbConfrimPass" ControlToValidate="tbNewPass"></asp:CompareValidator>
                     </div>       
                    </div>
                       <div class="form-group">
                           <div class="col-md-2"></div>
                           <div class="col-md-6">
                               <asp:Button ID="btRecPass" runat="server" CssClass="btn1 btn" Text="Reset" Visible="False" OnClick="btRecPass_Click"  />
                           </div>
                       </div>
                 </div>
                  </div>
       </asp:Content>  
