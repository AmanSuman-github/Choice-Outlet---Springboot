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

<script id="orderListTemplate" type="text/x-handlebars-template">
	{{#each this}}
      <tr>
        <td>{{date_blocked}}</td>
        <td>{{order_id}}</td>
        <td>{{bar_code}}</td>
        <td>{{buyer_state}}</td>
        <td>{{order_price}}</td>
        <td>{{profit_loss}}</td>
		<td>{{sales_tax}}</td>
		<td>{{customer_name}}</td>
		<td>{{phone}}</td>
		<td>{{email}}</td>
		<td>{{platform}}</td>
		<td>{{status}}</td>
		<td>{{delivery_date}}</td>
        <td>
    		<div class="text-center buttonEditWrapper">
    			<button class="btn btn-info btn-rounded btn-sm buttonEdit" data-toggle="modal" data-target="" onclick="editTable(this, event)" value="{{order_id}}">Edit<i class="fa fa-pencil-square-o ml-1"></i></button>
				<button class="btn btn-danger btn-sm btn-rounded buttonDelete" data-toggle="modal" data-target="#deleteOrderModel" onclick="deleteTable(this, event)" value="{{order_id}}">Delete<i class="fa fa-times ml-1"></i></button>    
			</div>
        </td>
      </tr>
	{{/each}}
</script>



	<div class="wrapper-modal-editor">

  <div class="block my-4">
    <div class="d-flex justify-content-center">
      <p class="h5 text-primary createShowP">Input "DELIVERED" when product is delivered to customer.</p>
    </div>
  </div>

  <div class="row d-flex justify-content-center modalWrapper">
    <div class="modal fade addNewInputs" id="addOrderModel" tabindex="-1" role="dialog" aria-labelledby="modalAdd"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold text-primary ml-5">Add new form</h4>
            <button type="button" class="close text-primary" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
           <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <input type="text" id="addOrderModelDateBlockedInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="">Date Blocked</label>
            </div>

<!--             <div class="md-form mb-5">
              <input type="text" id="addOrderModelOrderIdInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formPositionEdit">OrderId</label>
            </div> -->

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelBarCodeInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formOfficeEdit">Bar Code</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelStateInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formAgeEdit">Buyer State</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelPriceInput" class="form-control datepicker">
              <label data-error="wrong" data-success="right" for="formDateEdit">Price</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelProfitOrLossInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Profit Or Loss</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelSalesTaxInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Sales Tax</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addOrderModelCustomerNameInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Customer Name</label>
            </div>
            
            <div class="md-form mb-5">
              <input type="text" id="addOrderModelPhoneInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Phone</label>
            </div>
            
  			<div class="md-form mb-5">
              <input type="text" id="addOrderModelEmailInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Email</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addOrderModelPlatformInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Platform</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addOrderModelStatusInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Status</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addOrderModelDeliveryDateInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Delivery Date</label>
            </div>                      
          </div>
          <div class="modal-footer d-flex justify-content-center buttonAddFormWrapper">
            <button class="btn btn-outline-primary btn-block buttonAdd" data-dismiss="modal" onclick="addOrder()">Add Order
              <i class="fa fa-paper-plane-o ml-1"></i>
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="text-center buttonEditWrapper">
      <!-- <button href="" class="btn btn-info btn-rounded btn-sm">Add<i class="fa fa-plus-square ml-1"></i></button> -->
      <button class="btn btn-info btn-rounded btn-sm" data-toggle="modal" data-target="#addOrderModel">Add<i class="fa fa-plus-square ml-1"></i></button>   
    </div>

    <div class="modal fade modalEditClass" id="editOrderModel" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold text-secondary ml-5">Edit Order Form</h4>
            <button type="button" class="close text-secondary" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <input type="text" id="editOrderModelDateBlockedInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formNameEdit">Date Blocked</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelOrderIdInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formPositionEdit">OrderId</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelBarCodeInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formOfficeEdit">Bar Code</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelStateInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formAgeEdit">Buyer State</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelPriceInput" class="form-control datepicker">
              <label data-error="wrong" data-success="right" for="formDateEdit">Price</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelProfitOrLossInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Profit Or Loss</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelSalesTaxInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Sales Tax</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editOrderModelCustomerNameInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Customer Name</label>
            </div>
            
            <div class="md-form mb-5">
              <input type="text" id="editOrderModelPhoneInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Phone</label>
            </div>
            
  			            <div class="md-form mb-5">
              <input type="text" id="editOrderModelEmailInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Email</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="editOrderModelPlatformInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Platform</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="editOrderModelStatusInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Status</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="editOrderModelDeliveryDateInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Delivery Date</label>
            </div>                      
          </div>
          <div class="modal-footer d-flex justify-content-center editInsideWrapper">
            <button class="btn btn-outline-secondary btn-block editInside" data-dismiss="" onclick="updateOrder()">Update
              <i class="fa fa-paper-plane-o ml-1"></i>
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="deleteOrderModel" tabindex="-1" role="dialog" aria-labelledby="modalDelete"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold ml-5 text-danger">Delete</h4>
            <button type="button" class="close text-danger" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <p class="text-center h4">Are you sure to delete selected row?</p>

          </div>
          <div class="modal-footer d-flex justify-content-center deleteButtonsWrapper">
            <button type="button" class="btn btn-danger btnYesClass" id="deleteOrderModelYesButton" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-primary btnNoClass" id="btnNo" data-dismiss="modal">No</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
		<tr>
			<th class="th-sm">Date Blocked<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">OrderId<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Bar Code<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Buyer State<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Price<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Profit/Loss<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Sales Tax<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Customer Name<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Phone<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Email<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Platform<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Status<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Delivery Date<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm"> <i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
		</tr>
	</thead>
    <tbody id="orderListData">
		<!-- Order Table Goes Here -->
    </tbody>
    <tfoot>
      <tr>
        <th>Date Blocked
        </th>
        <th>OrderId
        </th>
        <th>Bar Code
        </th>
        <th>Buyer State
        </th>
        <th>Price
        </th>
        <th>Profit Or Loss
        </th>
        <th>Sales Tax
        </th>
        <th>Customer Name
        </th>
        <th>Phone
        </th>
        <th>Email
        </th>
        <th>Platform
        </th>
        <th>Status 
        </th>
        <th>Delivery Date
        </th>
        <th>
        </th>
      </tr>
    </tfoot>
  </table>
</div>
	
	
	

</body>
	<script>
	var orderListTemplate = Handlebars.compile(document.getElementById("orderListTemplate").innerHTML);
	var deleteOrderId;
 		$(document).ready(function(){
 			console.log("Inside Ready");
 			loadOrderData();
		});
 		
 		function editTable (e, e1) {
 			var orderId = $(e).attr("value");
		        $.ajax({ type: "GET",
		       		 contentType: "application/json",
		                url: "/choiceoutlet/order/" + orderId,
		                async: false,
		                dataType: 'json',
		                cache: false,
		                timeout: 600000,
		                success : function(data)
		                {	
		                	$('#editOrderModel').modal('show');
		                	$("#orderModal .x-error-msg").hide();
		                	$("#editOrderModelDateBlockedInput").val(data.date_blocked);
		                	$("#editOrderModelOrderIdInput").val(data.order_id);
		                	$("#editOrderModelBarCodeInput").val(data.bar_code);
		                	$("#editOrderModelStateInput").val(data.buyer_state);
		                	$("#editOrderModelPriceInput").val(data.order_price);
		                	$("#editOrderModelProfitOrLossInput").val(data.profit_loss);
		                	$("#editOrderModelSalesTaxInput").val(data.sales_tax);
		                	$("#editOrderModelCustomerNameInput").val(data.customer_name);
		                	$("#editOrderModelPhoneInput").val(data.phone);
		                	$("#editOrderModelEmailInput").val(data.email);
		                	$("#editOrderModelPlatformInput").val(data.platform);
		                	$("#editOrderModelStatusInput").val(data.status);
		                	$("#editOrderModelDeliveryDateInput").val(data.delivery_date);
		              	}
		       		});
 		}
 		
 		function updateOrder () {
 			var data = {};
 			data.date_blocked = $("#editOrderModelDateBlockedInput").val();
 			data.order_id = $("#editOrderModelOrderIdInput").val();
 			data.bar_code = $("#editOrderModelBarCodeInput").val();
 			data.buyer_state = $("#editOrderModelStateInput").val();
 			data.order_price = $("#editOrderModelPriceInput").val();
 			data.profit_loss = $("#editOrderModelProfitOrLossInput").val();
 			data.sales_tax = $("#editOrderModelSalesTaxInput").val();
 			data.customer_name = $("#editOrderModelCustomerNameInput").val();
 			data.phone = $("#editOrderModelPhoneInput").val();
 			data.email = $("#editOrderModelEmailInput").val();
 			data.platform = $("#editOrderModelPlatformInput").val();
 			data.status = $("#editOrderModelStatusInput").val().toUpperCase();
 			data.delivery_date = $("#editOrderModelDeliveryDateInput").val();
 			
 			
	        $.ajax({ 
        		type: "PUT",
                url: "/choiceoutlet/order/" + data.order_id,
              	async: false,
             //  dataType: 'json',
             	data: JSON.stringify(data),
           		cache: false,
                timeout: 600000,
                contentType: "application/json",
              /*   	headers: {
                "Accept": "application/json",
                "Content-Type": "application/json"
                }, */
                success : function(data)
                {	
                	$('#editOrderModel').modal('hide');
                	loadOrderData();
              	}
       		});
	        
 			if ($("#editOrderModelStatusInput").val().toUpperCase() == "DELIVERED") {
 				console.log("Have to add the entry into order details for audit in future.");
 			}
 		}	
 		
 		function deleteTable (e, e1) {
 			deleteOrderId = $(e).attr("value");

 		}
 		
	        $("#deleteOrderModelYesButton").click(function(){
 		        $.ajax({ 
 	        		type: "DELETE",
 	                url: "/choiceoutlet/order/" + deleteOrderId,
 	              	async: false,
 	             //  dataType: 'json',
 	           		cache: false,
 	                timeout: 600000,
 	                contentType: "application/json",
 	              /*   	headers: {
 	                "Accept": "application/json",
 	                "Content-Type": "application/json"
 	                }, */
 	                success : function(data)
 	                {	
 	                	$('#deleteOrderModel').modal('hide');
 	                	loadOrderData();
 	              	}
 	       		});
 	           }
 	        )
	        
	        function addOrder () {
	        	console.log("Add Order");
	        	var data = {};
	 			data.date_blocked = $("#addOrderModelDateBlockedInput").val();
	 			/* data.order_id = $("#addOrderModelOrderIdInput").val(); */
	 			data.bar_code = $("#addOrderModelBarCodeInput").val();
	 			data.buyer_state = $("#addOrderModelStateInput").val();
	 			data.order_price = $("#addOrderModelPriceInput").val();
	 			data.profit_loss = $("#addOrderModelProfitOrLossInput").val();
	 			data.sales_tax = $("#addOrderModelSalesTaxInput").val();
	 			data.customer_name = $("#addOrderModelCustomerNameInput").val();
	 			data.phone = $("#addOrderModelPhoneInput").val();
	 			data.email = $("#addOrderModelEmailInput").val();
	 			data.platform = $("#addOrderModelPlatformInput").val();
	 			data.status = $("#addOrderModelStatusInput").val().toUpperCase();
	 			data.delivery_date = $("#addOrderModelDeliveryDateInput").val();
	 			
	 			
		        $.ajax({ 
	        		type: "PUT",
	                url: "/choiceoutlet/order/add",
	              	async: false,
	             //  dataType: 'json',
	             	data: JSON.stringify(data),
	           		cache: false,
	                timeout: 600000,
	                contentType: "application/json",
	              /*   	headers: {
	                "Accept": "application/json",
	                "Content-Type": "application/json"
	                }, */
	                success : function(data)
	                {	
	                	$('#addOrderModel').modal('hide');
	                	loadOrderData();
	              	}
	       		});
	        }
	        
 	        function loadOrderData () {
	        	$.ajax({ type: "GET",
		       		 contentType: "application/json",
		       			url: "/choiceoutlet/orders",
		                async: false,
		                dataType: 'json',
		                cache: false,
		                timeout: 600000,
		                success : function(data)
		                {	var a = {}
		                	for (var i=0; i<data.length; i++) {
		                		data[i].date_blocked = new Date(data[i].date_blocked).toISOString().split('T')[0];
			                	data[i].delivery_date = new Date(data[i].date_blocked).toISOString().split('T')[0];
		                	} 
		                	$('#orderListData').html(orderListTemplate(data));
		                	
		              	}
		       		});
	        }
	</script>
</html>