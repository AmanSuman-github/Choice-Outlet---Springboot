<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Choice Outlet</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/agency.min.css" />" rel="stylesheet">
    
    <!-- Handlebars Templates -->
    <script src="<c:url value="/resources/js/handlebars.min.js" />"></script>
	
	<!-- Core Style CSS OTHER-->
	    <link href="<c:url value="/resources/css/core-style.css" />" rel="stylesheet">
	<style>
	/* Product Price */
	.product-price {
		display: flex;
		align-items: center;
	}
	
	.product-price span {
		font-size: 26px;
		font-weight: 300;
		color: #43474D;
		margin-right: 20px;
	}
	
	.cart-btn {
		display: inline-block;
		background-color: #7DC855;
		border-radius: 6px;
		font-size: 16px;
		color: #FFFFFF;
		text-decoration: none;
		padding: 12px 30px;
		transition: all .5s;
	}
	
	.cart-btn:hover {
		background-color: #64af3d;
	}
	</style>
</head>

  <body id="page-top">
	<!-- MODEL -->
	
	<!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand js-scroll-trigger" href="#page-top">Choice Outlet</a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fa fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ml-auto">
			      <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#team">Implement Search</a>
            </li>
            <li class="nav-item">
              <a href="#">
		          <span class="glyphicon glyphicon-shopping-cart"></span>
		        </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>	
	<!-- Will be hidden on load and will display a product in details	 -->
	<div id="product" style="padding: 100px;">
		<div class="container">
			<!-- Featured Project Row -->
			<div class="row align-items-center no-gutters mb-4 mb-lg-5">
				<div class="col-xl-8 col-lg-7">
					<img class="img-fluid mb-3 mb-lg-0" src="<c:url value="/resources/img/portfolio/bg-masthead.jpg" />" alt="">
				</div>
				<div id="productDetailsDiv" class="col-xl-4 col-lg-5" style="padding-left: 15px;">
					<div class="featured-text text-center text-lg-left">
						<h4>
						<!-- Product Name goes here -->
						 
						</h4>
						<p class="text-black-50 mb-0" style="border-bottom: 1px solid #E1E8EE;  margin-bottom: 20px;">
						<!-- Product Details goes here -->
						
						</p>
						<div style="font-family: cursive; color: orangered;">
			            	<span></span>
			         	</div>
			         	<div class="product-price">
						    <span></span>
						    <a href="#" class="cart-btn">Add to cart</a>
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
    <footer>
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <span class="copyright">Copyright &copy; choiceOutlet.com 2018</span>
          </div>
          <div class="col-md-4">
            <ul class="list-inline social-buttons">
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-twitter"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-facebook-f"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fab fa-linkedin-in"></i>
                </a>
              </li>
            </ul>
          </div>
          <div class="col-md-4">
            <ul class="list-inline quicklinks">
              <li class="list-inline-item">
                <a href="#">Privacy Policy</a>
              </li>
              <li class="list-inline-item">
                <a href="#">Terms of Use</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
    <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

    <!-- Contact form JavaScript -->
    <script src="<c:url value="/resources/js/jqBootstrapValidation.js" />"></script>
    <script src="<c:url value="/resources/js/contact_me.js" />"></script>

    <!-- Custom scripts for this template -->
    <script src="<c:url value="/resources/js/agency.min.js" />"></script>

  </body>
	<script>
	 var prodByCat = [];
 		$(document).ready(function(){
	        function getProductByBarCode (sParam) {
	        	var sPageURL = window.location.search.substring(1);
	        	    var sURLVariables = sPageURL.split('&');
	        	    for (var i = 0; i < sURLVariables.length; i++)
	        	    {
	        	        var sParameterName = sURLVariables[i].split('=');
	        	        if (sParameterName[0] == sParam)
	        	        {
	        	            return sParameterName[1];
	        	        }
	        	    }
	        }
	        var barCode = getProductByBarCode("barCode");
	        
	        console.log(barCode);
	        $.ajax({ type: "GET",
       		 contentType: "application/json",
                url: "/choiceoutlet/product/" + barCode,
                async: false,
                dataType: 'json',
                cache: false,
                timeout: 600000,
                success : function(data)
                {	
                	var a = data;
                	console.log(a.condition);
                	$("#productDetailsDiv > div > h4").text(a.product_name);
                	$("#productDetailsDiv > div > p").text(a.details);
                	$("#productDetailsDiv > div > div:nth-child(3) > span").text(a.condition);
                	$("#productDetailsDiv > div > div.product-price > span").text(a.retail_price+"$");
                	
              	}
       		});
		});

</script>
</html>
