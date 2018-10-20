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
              <h4>{{category}}</h4>
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
              <a class="nav-link js-scroll-trigger" href="#home">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#portfolio">Shop</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link js-scroll-trigger" href="#contact">Contact Us</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <header id="home" class="masthead">
      <div class="container">
        <div class="intro-text">
          <div class="intro-lead-in">Welcome To Choice Outlet!</div>
          <div class="intro-heading text-uppercase">It's Nice To Meet You</div>
          <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#portfolio">Shop Now</a>
        </div>
      </div>
    </header>
	
    <!-- Portfolio Grid -  check portfolio JS and CSS -->
    <div id="portfolio" style="padding: 100px; /*background-color: #cc2d2d*/"> 
      <div class="container">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">Categories</h2>
          </div>
        <div id="categories-list" class="row">
          
        </div>
      </div>
    </div>

    <!-- About -->
    <section id="about">
      <div class="container">
        <div class="row">
          <div class="col-lg-12 text-center">
            <h2 class="section-heading text-uppercase">About</h2>
            <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <ul class="timeline">
              <li>
                <div class="timeline-image">
                  <img class="img-fluid" src="<c:url value="/resources/img/about/1.jpg" />" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>2009-2011</h4>
                    <h4 class="subheading">Our Humble Beginnings</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <img class="img-fluid" src="<c:url value="/resources/img/about/2.jpg" />" alt="">
                </div>
                <div class="timeline-panel">
                  <div class="timeline-heading">
                    <h4>March 2011</h4>
                    <h4 class="subheading">An Agency is Born</h4>
                  </div>
                  <div class="timeline-body">
                    <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p>
                  </div>
                </div>
              </li>
              <li class="timeline-inverted">
                <div class="timeline-image">
                  <h4>Be Part
                    <br>Of Our
                    <br>Story!</h4>
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
              <div class="col-lg-12 text-center">
                <h2 class="section-heading text-uppercase">Let's Get In Touch!</h2>
                <h3 class="section-subheading text-muted">In case you have any question or concern ? Give us a call or send us an email and we will get back to you as soon as possible!</h3>
              </div>
            </div>
            <div class="row">
              <div class="col-lg-12">
                <form id="contactForm" name="sentMessage" novalidate="novalidate">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <input class="form-control" id="name" type="text" placeholder="Your Name *" required="required" data-validation-required-message="Please enter your name.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <input class="form-control" id="email" type="email" placeholder="Your Email *" required="required" data-validation-required-message="Please enter your email address.">
                        <p class="help-block text-danger"></p>
                      </div>
                      <div class="form-group">
                        <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" required="required" data-validation-required-message="Please enter your phone number.">
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <textarea class="form-control" id="message" placeholder="Your Message *" required="required" data-validation-required-message="Please enter a message."></textarea>
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-lg-12 text-center">
                      <div id="success"></div>
                      <button id="sendMessageButton" class="btn btn-primary btn-xl text-uppercase" type="submit">Send Message</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>

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
	var source   = document.getElementById("categories").innerHTML;
	var template = Handlebars.compile(source);
		$(document).ready(function(){
			
			console.log("loaded");
	        $.ajax({ type: "GET",
	        		 contentType: "application/json",
	                 url: "/choiceoutlet/products",
	                 async: false,
	                 dataType: 'json',
	                 cache: false,
	                 timeout: 600000,
	                 success : function(data)
	                 {	
	                	 var flags = [], output = [], l = data.length, i;
		                 for( i=0; i<l; i++) {
		                	    if( flags[data[i].category]) continue;
		                	    flags[data[i].category] = true;
		                	    output.push(data[i]);
		                	}
	                		 $('#categories-list').append(template(output));
	               	 }
	        });
	        
		});
		
        function navigateToProduct (e, e1) {
        	var selectedCategory = $(e).children("div .portfolio-caption").children().text();
        	window.location.href='/choiceoutlet/productList?category='+selectedCategory;
        }
</script>
</html>
