<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="WebApp.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Sign Up</title>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

    

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

  <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>
    <form id="form1" runat="server">
        <div>
                    <!-- header section starts      -->
            
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx"> <span> MBoutique</span></a>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="Default.aspx">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Contacts</a></li>
                        <li class="dropdwn">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Products<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="Products.aspx">All Products</a></li>
                                <li role="separator" class="divider"></li>
                                <asp:Repeater ID="rptCategory" runat="server">
                                    <ItemTemplate>
                                          <li><a class="main-cat" href="Products.aspx?cat=<%# Eval("CatID") %>"><%# Eval("CatName") %></a></li>
                                          <asp:HiddenField ID="hfCatId" runat="server" Value='<%# Eval("CatID") %>' />

                                         <asp:Repeater ID="rptSubCategories" runat="server" >
                                             <ItemTemplate>
                                                  <li><a href="Products.aspx?subcat=<%# Eval("SubCatID") %>"><%# Eval("SubCatName") %></a></li>
                                             </ItemTemplate>
                                             <FooterTemplate>
                                                 <li role="separator" class="divider"></li>
                                             </FooterTemplate>
                                         </asp:Repeater>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </li>
                            <li>
                                <button id="btnCart" class="btn btn-primary navbar-btn" type="button">
                                    Cart <span class="badge" id="pCount" runat="server"></span>
                                </button>
                            </li>
                        <li id="btnSignup" runat="server"><a href="SignUp.aspx">Sign Up</a></li>
                        <li id="btnSigin" runat="server"><a href="SignIn.aspx">Sign In</a></li>
                                     
                        </ul>
                </div> 
            </div>
        </div>
            
            <!-- header section ends      -->


             <!-- Sign Up starts     -->
            <div class="center-page">

                <label class="center-font">Username</label>
                <asp:TextBox ID="tbUname" runat="server" Class="center-body" placeholder="Username"></asp:TextBox>

                 <label class="center-font">Password</label>
                <asp:TextBox ID="tbPassword" runat="server" Class="center-body" placeholder="Password" TextMode="Password"></asp:TextBox>

                 <label class="center-font">Confrim Password</label>
                <asp:TextBox ID="tdCPass" runat="server" Class="center-body" placeholder="Confrim Password" TextMode="Password"></asp:TextBox>

                 <label class="center-font">Name</label>
                <asp:TextBox ID="tbName" runat="server" Class="center-body" placeholder="Name"></asp:TextBox>
                
                 <label class="center-font">Email</label>
                <asp:TextBox ID="tbEmail" runat="server" Class="center-body" placeholder="Email" TextMode="Email"></asp:TextBox>


                <asp:Button ID="btSignup" runat="server" Class="btn1 btn" Text="Sign Up"  OnClick="btSignup_Click1" />
                <asp:Label ID="lblMsg" runat="server" Class="center-font"></asp:Label>






            </div>

             <!-- Sign Up ends     -->


              <!-- footer section starts  -->


            
 <div class="footer-pos">

<section class="footer">

    <div class="box-container">

        <div class="box">
            <h3>SHOP</h3>
            <a href="#">Men</a>
            <a href="#">Women</a>
        </div>

        <div class="box">
            <h3>QUICK LINKS</h3>
            <a href="#">Home</a>
            <a href="#">About</a>
            <a href="#">Contacts</a>
          
        </div>

        <div class="box">
            <h3>CONTACT INFO</h3>
            <a href="#">+359884657777</a>
            <a href="#">+359892333355</a>
            <a href="#">MBoutique@gmail.com</a>
            
            
        </div>

        <div class="box">
            <h3>FOLLOW US</h3>
            <a href="#"><i class="fab fa-facebook"></i> Facebook</a>
            <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#"><i class="fab fa-instagram"></i> Instagram</a>
        </div>

    </div>
    

    <div class="credit"> Copyright @ 2022 by <span>MBoutique</span> </div>


</section>

     </div>

<!-- footer section ends -->

        </div>


  


          

    </form>
    
    <script>
        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "/Cart.aspx";
            });
        });
    </script>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    
    <script src="js/jquery-3.2.1.min.js"></script>
</body>
</html>
