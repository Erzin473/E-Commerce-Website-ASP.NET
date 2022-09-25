<%@ Page Title="" Language="C#" MasterPageFile="~/GeneralLayout.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebApp.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
    <div class="row" style="padding-top:50px">
        <asp:Repeater  ID="rptrProducts" runat="server">
            <ItemTemplate>
  <div class="col-sm-3 col-md-3">
      <a style="text-decoration:none;" href="ProductView.aspx?PID=<%#Eval("PID") %>">
    <div class="thumbnail">
      <img src="Images/ProductImages/<%#Eval("PID") %>/<%#Eval("ImageName") %><%#Eval("Extention") %>" alt="<%#Eval("ImageName") %>" />
      <div class="caption">
        <div class="probrand"><%#Eval("BrandName") %> </div>
        <div class="proName"><%#Eval("PName") %></div> 
          <div class="proPrice"><span class="proOgPrice"><%#Eval("PPrice","{0:c}") %></span> <%#Eval("PSelPrice","{0:c}") %> <span class="proPriceDiscount">(<%#Eval("DiscAmount","{0:c}") %> OFF)</span></div>     
      </div>
    </div>
          </a>
  </div>
           </ItemTemplate>
        </asp:Repeater>
</div>
        </div>
</asp:Content>
