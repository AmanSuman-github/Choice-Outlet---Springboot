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
    <link href="/resources/fonts/droidSerif.css" rel="stylesheet" type="text/css">
    <link href='/resources/fonts/kaushanScript.css' rel='stylesheet' type='text/css'>
    <link href='/resources/fonts/montserrat.css' rel='stylesheet' type='text/css'>
    <link href='/resources/fonts/roboto slab 400,100.css' rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/agency.min.css" />" rel="stylesheet">
    
    <!-- Handlebars Templates -->
    <script src="<c:url value="/resources/js/handlebars.min.js" />"></script>
	
	<!-- Core Style CSS OTHER-->
	    <link href="<c:url value="/resources/css/core-style.css" />" rel="stylesheet">
	<style>
	/* Product Price */
	.product-price {
		/* display: flex; */
		align-items: center;
	}
	
	.product-price span {
		font-size: 26px;
		font-weight: 300;
		color: #f44242;
		margin-right: -3px;
	}
	
	.cart-btn {
		display: inline-block;
		background-color: #ba390e;
		border-radius: 6px;
		font-size: 16px;
		color: #FFFFFF;
		text-decoration: none;
		padding: 12px 30px;
		transition: all .5s;
	}
	
	.cart-btn:hover {
		background-color: #04f448;
	}
	
	.div1 {
	    width: 452px;
	    height: 315px;
	    border: 1px solid red;
	    margin-top: 10px;
	    padding: 8px;
	    background-color: #edeff2;
	}
	
	.div1 li {
		list-style-position: inside;
	    list-style-type: square;
	    color: #383a3d;
	    font-size: 14px;
	    font-family: cursive;
	    text-align: justify;
	}
	
	.model-price {
		position: absolute;
		left: 24px;
		bottom: 16px;
		font-family: inherit;
		font-weight: 900;
		color: brown;
		font-size: x-large;
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
						<div class="product-price">
							<span id="product-val"></span>
							<span>$</span>
						</div>
						<div style="color: #f44242; font-size: 26px; font-weight: 300;">
			            	<span><!-- Product Condition Goes Here --></span>
			         	</div>
				    	<div class="product-price">
						    <button class="cart-btn" data-toggle="modal" data-target="#orderModal" id="cart">BLOCK ITEM FOR PICKUP</button>
					    </div>
					    <div class="div1" style="text-align: center; border-bottom: 5px solid black;">
					    	<div style="border-bottom: 1px solid #000;">Here's how to block this for yourself</div>
					    	<ul>
					    		<li>Click "BLOCK ITEM FOR PICKUP" if you are interested in purchasing this item above and fill in some relevant information.</li>
					    		<li>After confirming the order, you you get a response from us soon.</li>
					    		<li>We will block the item for you for 2 business days.</li>
					    		<li>Items you blocked can be picked up at our store, located at 1430 Clinton St, Buffalo, NY 14206.</li>
					    		<li>You are welcome to inpect the item  prior to purchasing.</li>
					    		<li style="color: #ed6e55;">NOTE: If you wish to have an item shipped, please contact us and we can provide a quote for shipping.</li>
							</ul>
					    </div>
					</div>
				</div>
			</div>
				<p class="text-black-50 mb-0" style="border-bottom: 1px solid #E1E8EE;  margin-bottom: 20px;">
				<!-- Product Details goes here -->
				
				</p>
		</div>
	</div>
	
	<!-- Confirm Order Model -->
  <div class="modal" id="orderModal">
    <div class="modal-dialog">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="font-family: -webkit-pictograph;">RESERVE ITEM FOR PICKUP FORM</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>        
        <!-- Modal body -->
        <div class="modal-body">
        <div class="form-group">
           <input type="text" class="form-control x-input x-input-highlight" placeholder="Please Enter Your Name" id="orderModalInputName">
           <!-- <div class='x-error-msg'>Name Required!</div> -->
        </div>
		<div class="form-group">
            <input type="tel" class="form-control x-input x-input-highlight" placeholder="Please Enter Your Phone Number" id="orderModalInputPhone">
            <!-- <div class='x-error-msg'>Phone Required!</div> -->
        </div>      
		<div class="form-group">
            <input type="email" class="form-control x-input x-input-highlight" placeholder="Please Enter Your Email" id="orderModalInputEmail">
            <!-- <div class='x-error-msg'>Email Required!</div> -->
        </div>  
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <div class="model-price"><!-- Product Price --></div>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button class="btn btn-danger" id="orderModalSaveBtn">Confirm</button>
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
                	$("#productDetailsDiv > div > h4").text(data.product_name);
                	$("#productDetailsDiv > div > h4").attr("value", data.bar_code);
                	$("#product > div > p").text(data.details);
                	$("#productDetailsDiv > div > div:nth-child(3) > span").text(data.condition);
                	$("#product-val").html(data.retail_price);
                	
              	}
       		});
		});
 		
 		$("#orderModal").on('shown.bs.modal', function(){
            $("#orderModal .x-error-msg").hide();
            $("#orderModalInputName").val("");
            $("#orderModalInputPhone").text("");
            $("#orderModalInputEmail").text("");
            $(this).find('#orderModalInputName').focus();
        });

		$("#orderModalSaveBtn").click(function() {
			console.log("inside");
			if ($("#orderModalInputName").val().trim() == "") {
				$("#collectionModal .x-error-msg").show();
				return false;
			} else if ($("#orderModalInputPhone").val().trim() == "") {
				$("#collectionModal .x-error-msg").show();
				return false;
			} else if ($("#orderModalInputEmail").val().trim() == "") {
				$("#collectionModal .x-error-msg").show();
				return false;
			} else {				
				var order = {};
				order.date_blocked = new Date().toISOString().split('T')[0];
				order.order_id = 1;
				order.platform = "WEB";
				order.customer_name = $("#orderModalInputName").val();
				order.phone = $("#orderModalInputPhone").val();
				order.email = $("#orderModalInputEmail").val();
				order.buyer_state = "NY";
				order.order_price = $("#product-val").text();
				order.status = "BLOCKED";
				order.delivery_date = new Date().toISOString().split('T')[0];
				order.bar_code = $("#productDetailsDiv > div > h4").attr("value");
				
		        $.ajax({ 
		        		type: "PUT",
		                url: "/choiceoutlet/order/add",
		              	async: false,
		             //  dataType: 'json',
		             	data: JSON.stringify(order),
		           		cache: false,
		                timeout: 600000,
		                contentType: "application/json",
		              	headers: {
		                "Accept": "application/json",
		                "Content-Type": "application/json"
		                }, 
		                success : function(data)
		                {	
		                	$('#orderModal').modal('hide');
		              	}
		       		});
			}
		});
	</script>
</html>