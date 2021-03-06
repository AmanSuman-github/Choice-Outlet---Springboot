<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Choice Outlet</title>

<!-- Bootstrap core CSS -->
<link
	href="<c:url value="/resources/vendor/bootstrap/css/bootstrap.min.css" />"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link
	href="<c:url value="/resources/vendor/font-awesome/css/font-awesome.min.css" />"
	rel="stylesheet">
<link href="/resources/fonts/droidSerif.css" rel="stylesheet"
	type="text/css">
<link href='/resources/fonts/kaushanScript.css' rel='stylesheet'
	type='text/css'>
<link href='/resources/fonts/montserrat.css' rel='stylesheet'
	type='text/css'>
<link href='/resources/fonts/roboto slab 400,100.css' rel='stylesheet'
	type='text/css'>

<!-- Custom styles for this template -->
<link href="<c:url value="/resources/css/agency.min.css" />"
	rel="stylesheet">

<!-- Handlebars Templates -->
<script src="<c:url value="/resources/js/handlebars.min.js" />"></script>

<!-- Core Style CSS OTHER-->
<link href="<c:url value="/resources/css/core-style.css" />"
	rel="stylesheet">

</head>

<body id="page-top">
	<script id="categories" type="text/x-handlebars-template">
		{{#each this}}
          <div class="col-md-4 col-sm-6 portfolio-item" onclick="navigateToProduct(this, event)">
            <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
              <div class="portfolio-hover">
                <div class="portfolio-hover-content">
                  <i class="fa fa-plus fa-3x"></i>
                </div>
              </div>
				 <img class="img-fluid" src="<c:url value="/resources/img/portfolio/04-thumbnail.jpg" />" alt="">
            </a>
            <div class="portfolio-caption">
              <h4 value="{{cat_name}}">{{cat_name}}</h4>
            </div>
          </div>
		{{/each}}
	</script>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Choice
				Outlet</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#home">Home</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">Shop</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">About</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#contact">Contact Us</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header id="home" class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-lead-in">Welcome To Choice Outlet!</div>
				<div class="intro-heading text-uppercase">It's Nice To Meet
					You</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger"
					href="#portfolio">Shop Now</a>
			</div>
		</div>
	</header>

	<!-- Portfolio Grid -  check portfolio JS and CSS -->
	<div id="portfolio" style="padding: 100px;">
		<div class="container">
			<div class="col-lg-12 text-center">
				<h2 class="section-heading text-uppercase">Categories</h2>
			</div>
			<div id="categories-list" class="row"></div>
		</div>
	</div>

	<!-- About -->
	<section id="about">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">About</h2>
					<h3 class="section-subheading text-muted">Lorem ipsum dolor
						sit amet consectetur.</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<ul class="timeline">
						<li>
							<div class="timeline-image">
								<img class="img-fluid"
									src="<c:url value="/resources/img/about/1.jpg" />" alt="">
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4>2009-2011</h4>
									<h4 class="subheading">Our Humble Beginnings</h4>
								</div>
								<div class="timeline-body">
									<p class="text-muted">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit. Sunt ut voluptatum eius
										sapiente, totam reiciendis temporibus qui quibusdam,
										recusandae sit vero unde, sed, incidunt et ea quo dolore
										laudantium consectetur!</p>
								</div>
							</div>
						</li>
						<li class="timeline-inverted">
							<div class="timeline-image">
								<img class="img-fluid"
									src="<c:url value="/resources/img/about/2.jpg" />" alt="">
							</div>
							<div class="timeline-panel">
								<div class="timeline-heading">
									<h4>March 2011</h4>
									<h4 class="subheading">An Agency is Born</h4>
								</div>
								<div class="timeline-body">
									<p class="text-muted">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit. Sunt ut voluptatum eius
										sapiente, totam reiciendis temporibus qui quibusdam,
										recusandae sit vero unde, sed, incidunt et ea quo dolore
										laudantium consectetur!</p>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- Contact -->
	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mx-auto text-center">
					<h2 class="section-heading">Let's Get In Touch!</h2>
					<hr class="my-4">
					<p class="mb-5">Planning to buy something from us?
						That's great! Give us a call or send us an email and we will get
						back to you as soon as possible!</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 ml-auto text-center">
					<i class="fa fa-phone fa-3x mb-3 sr-contact"></i>
					<p style="color: #a52a2a;size: 19px;">123-456-6789</p>
				</div>
				<div class="col-lg-4 mr-auto text-center">
					<i class="fa fa-envelope-o fa-3x mb-3 sr-contact"></i>
					<p>
						<a href="mailto:your-email@your-domain.com">feedback@choiceoutlet.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<span class="copyright">Copyright &copy; choiceOutlet.com
						2018</span>
				</div>
				<div class="col-md-4">
					<ul class="list-inline social-buttons">
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-facebook-f"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-linkedin-in"></i>
						</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<ul class="list-inline quicklinks">
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>

	<!-- Plugin JavaScript -->
	<script
		src="<c:url value="/resources/vendor/jquery-easing/jquery.easing.min.js" />"></script>

	<!-- Contact form JavaScript -->
	<script src="<c:url value="/resources/js/jqBootstrapValidation.js" />"></script>
	<script src="<c:url value="/resources/js/contact_me.js" />"></script>

	<!-- Custom scripts for this template -->
	<script src="<c:url value="/resources/js/agency.min.js" />"></script>

</body>
<script>
	var categoriesList = new Array();
	var source   = document.getElementById("categories").innerHTML;
	var template = Handlebars.compile(source);
		$(document).ready(function(){
			
			console.log("loaded");
	        $.ajax({ type: "GET",
	        		 contentType: "application/json",
	                 url: "/choiceoutlet/categories",
	                 async: false,
	                 dataType: 'json',
	                 cache: false,
	                 timeout: 600000,
	                 success : function(data)
	                 {	
	                	 categoriesList = data;              	 
	                	 var flags = [], output = [], l = data.length, i;
		                 for( i=0; i<l; i++) {
		                	    if( flags[data[i].cat_name]) continue;
		                	    flags[data[i].cat_name] = true;
		                	    output.push(data[i]);
		                	}
	                		 $('#categories-list').append(template(output));
	               	 }
	        });
	        
		});
		
        function navigateToProduct (e, e1) {
        	var selectedCatId;
        	var selectedCategory = String($(e).children("div .portfolio-caption").children().attr("value"));
        	console.log(selectedCategory);
        	for(var i=0; i<categoriesList.length; i++) {
        		if((categoriesList[i].cat_name == String(selectedCategory)) == true) {
        			selectedCatId = categoriesList[i].cat_id;
        		}
        	}
        	window.location.href='/choiceoutlet/productList?categoryId='+selectedCatId+ '&categoryName='+selectedCategory;
        }
</script>
</html>
