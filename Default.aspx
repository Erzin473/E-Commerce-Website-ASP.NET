<%@ Page Language="C#"  MasterPageFile="~/GeneralLayout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="Images/1.jpg" />
      </div>

      <div class="item">
        <img src="Images/2.jpg" />
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="Images/3.jpg" />
      </div>
    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>

    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
  </div>
</div>


            
    <!-- products section starts  -->

<section class="products" id="products">

    <h3 class="sub-heading"> Our Products </h3>
    <h1 class="heading"> top men and women clothing and footwear </h1>

    <div class="box-container">

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/DENIM SHIRT JACK&JONES ESSENTIALS01.jpg" alt="">
            <h3>DENIM SHIRT</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
           
            <a href="ProductView.aspx?PID=9" class="btn1 btn">Go</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/LONG SLEEVED SHIRT JACK&JONES PREMIUM01.jpg" alt="">
            <h3>LONG SLEEVED SHIRT</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            
            <a href="ProductView.aspx?PID=8" class="btn1 btn">Go</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/HALF PLANCKET SHIRT JACK&JONES PREMIUM01.jpg" alt="">
            <h3>PLANCKET SHIRT</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
           
            <a href="ProductView.aspx?PID=10" class="btn1 btn">Go</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/ROWAN01.jpg" alt="">
            <h3>ROWAN</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
           
            <a href="ProductView.aspx?PID=11" class="btn1 btn">Go</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/GLENN ICON JJ 857 SLIM FIT JEANS JACK&JONES JEANS INTELLIGENCE01.jpg" alt="">
            <h3> SLIM FIT JEANS</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            
            <a href="ProductView.aspx?PID=12" class="btn1 btn">Go</a>
        </div>

        <div class="box">
            <a href="#" class="fas fa-heart"></a>
            <a href="#" class="fas fa-eye"></a>
            <img src="Images/CANVAS OLD SKOOL01.jpg" alt="">
            <h3>CANVAS OLD SKOOL</h3>
            <div class="stars">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
            </div>
            
            <a href="ProductView.aspx?PID=13" class="btn1 btn">Go</a>
        </div>

    </div>
</section>



<!-- products section ends -->


            <!-- about section starts  -->

<section class="about" id="about">

    <h3 class="sub-heading"> About Us </h3>
    <h1 class="heading"> why choose us? </h1>

    <div class="row">

        <div class="image">
            <img src="Images/about.png" alt="">
        </div>

        <div class="content">
            <h3>Best Brands</h3>
            <p>MBoutique Group is a family of brands and businesses, making it possible for customers around the world to express themselves through fashion and design, and to choose a more sustainable lifestyle.</p>
            <p>We create value for people and society in general by delivering our customer offering and by developing with a focus on sustainable and profitable growth.</p>
            

            <div class="icons-container">
                <div class="icons">
                    <i class="fas fa-shipping-fast"></i>
                    <span>free delivery</span>
                </div>
                <div class="icons">
                    <i class="fas fa-dollar-sign"></i>
                    <span>easy payments</span>
                </div>
                <div class="icons">
                    <i class="fas fa-headset"></i>
                    <span>24/7 service</span>
                </div>
            </div>
            <a href="About.aspx" class="btn1 btn">Learn More</a>
        </div>

    </div>

</section>

<!-- about section ends -->


</asp:Content> 


   
