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

  </head>

  <body id="page-top">
  	
	<script id="products" type="text/x-handlebars-template">
		{{#each this}}
          <div class="col-md-4 col-sm-6 portfolio-item" onclick="">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x"></i>
                </div>
              </div>
				 <img class="img-fluid" src="<c:url value="/resources/img/portfolio/04-thumbnail.jpg" />" alt="">
            </a>
            <div class="portfolio-caption">
              <h4>{{details}}</h4>
            </div>
          </div>
		{{/each}}
	</script>
	
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
	
    <!-- Portfolio Grid -  check portfolio JS and CSS -->
    <div id="portfolio" style="padding: 100px; /*background-color: #cc2d2d*/"> 
      <div class="container">
		<div class="col-lg-12 text-center">
	  		<!-- category name added here -->
		</div>
        <div id="products-list" class="row">
          
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
	 var productsTemplate = Handlebars.compile(document.getElementById("products").innerHTML);
 		$(document).ready(function(){
			
			console.log("loaded");	        
	        function getProductByCategory (sParam) {
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
	        var param = getProductByCategory("category");
	        $('#portfolio .container').children('div .text-center').append('<h2 class="section-heading text-uppercase">'+param+'</h2>');
	        
	        $.ajax({ type: "GET",
       		 contentType: "application/json",
                url: "/choiceoutlet/products",
                async: false,
                dataType: 'json',
                cache: false,
                timeout: 600000,
                success : function(data)
                {
               	 var output = [], i;
	                 for(i=0; i<data.length; i++) {
	                	    if( data[i].category.toUpperCase() == param.toUpperCase()) {
	                	    	output.push(data[i]);
	                	    }
	                	}
	                 console.log(output);
               		 $('#products-list').append(productsTemplate(output));
              	 }
       		});
		});
		
        function navigateToProduct (e, e1) {
        	var selectedCategory = $(e).children("div .portfolio-caption").children().text();
        	window.location.href='/choiceoutlet/productList?category='+selectedCategory;
        }
</script>
</html>
