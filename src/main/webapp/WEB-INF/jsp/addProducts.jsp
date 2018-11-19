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
        <td>{{upc_number}}</td>
        <td>{{bar_code}}</td>
        <td>{{retail_price}}</td>
        <td>{{cost}}</td>
        <td>{{extra_cost}}</td>
        <td>{{product_name}}</td>
		<td>{{details}}</td>
		<td>{{location}}</td>
		<td>{{product_condition}}</td>
		<td>{{dimension}}</td>
		<td>{{cat_id}}</td>
		<td>{{quantity}}</td>
		<td>


				<form method="POST" enctype="multipart/form-data" id="fileUploadForm">
					<div class="form-group">
						<label class="control-label" for="uploadfile">Upload File:</label>
						<input type="file" class="form-control" id="uploadfile" placeholder="Upload File"  name="uploadfile"></input>
					</div>
					
			        <button type="submit" class="btn btn-default" id="btnSubmit">Upload</button>
			        <button type="button" class="btn btn-default" id="btnGetFiles">Files</button>
				</form>


		</td>
        <td>
    		<div class="text-center buttonEditWrapper">
    			<button class="btn btn-info btn-rounded btn-sm buttonEdit" data-toggle="modal" data-target="" onclick="editTable(this, event)" value="{{order_id}}">Edit<i class="fa fa-pencil-square-o ml-1"></i></button>
				<button class="btn btn-danger btn-sm btn-rounded buttonDelete" data-toggle="modal" data-target="#deleteProductModel" onclick="deleteProduct(this, event)" value="{{bar_code}}">Delete<i class="fa fa-times ml-1"></i></button>    
			</div>
        </td>
      </tr>
	{{/each}}
</script>



	<div class="wrapper-modal-editor">

  <div class="block my-4">
    <div class="d-flex justify-content-center">
      <p class="h5 text-primary createShowP">Add, Update and Delete products.</p>
    </div>
  </div>

  <div class="row d-flex justify-content-center modalWrapper">
    <div class="modal fade addNewInputs" id="addProductModel" tabindex="-1" role="dialog" aria-labelledby="modalAdd"
      aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold text-primary ml-5">Add New Item</h4>
            <button type="button" class="close text-primary" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
           <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <input type="text" id="addProductModelUpcNumberInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="">UPC Number</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelBarCodeInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formOfficeEdit">Bar Code</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelRetailPriceInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formAgeEdit">Retail Price</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelCostInput" class="form-control datepicker">
              <label data-error="wrong" data-success="right" for="formDateEdit">Cost</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelExtraCostInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Extra Cost</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelNameInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Name</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="addProductModelDetailsInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Details</label>
            </div>
            
            <div class="md-form mb-5">
              <input type="text" id="addProductModelLocationInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Location</label>
            </div>
            
  			<div class="md-form mb-5">
              <input type="text" id="addProductModelConditionInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Condition</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addProductModelDimensionInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Dimension</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addProductModelCategoryInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Category</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="addProductModelQuantityInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Quantity</label>
            </div>                      
          </div>
          <div class="modal-footer d-flex justify-content-center buttonAddFormWrapper">
            <button class="btn btn-outline-primary btn-block buttonAdd" data-dismiss="modal" onclick="addProduct()">Add Item
              <i class="fa fa-paper-plane-o ml-1"></i>
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="text-center buttonEditWrapper">
      <!-- <button href="" class="btn btn-info btn-rounded btn-sm">Add<i class="fa fa-plus-square ml-1"></i></button> -->
      <button class="btn btn-info btn-rounded btn-sm" data-toggle="modal" data-target="#addProductModel">Add<i class="fa fa-plus-square ml-1"></i></button>   
    </div>

    <div class="modal fade modalEditClass" id="editProductModel" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header text-center">
            <h4 class="modal-title w-100 font-weight-bold text-secondary ml-5">Update Products</h4>
            <button type="button" class="close text-secondary" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body mx-3">
            <div class="md-form mb-5">
              <input type="text" id="editProductModelUpcNumberInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formNameEdit">UPC Number</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelRetailPriceInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formPositionEdit">Bar Code</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelRetailPriceInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formOfficeEdit">Retail Price</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelCostInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formAgeEdit">Cost</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelExtraCostInput" class="form-control datepicker">
              <label data-error="wrong" data-success="right" for="formDateEdit">Extra Cost</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelNameInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Name</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelDetailsInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Details</label>
            </div>

            <div class="md-form mb-5">
              <input type="text" id="editProductModelLocationInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Location</label>
            </div>
            
            <div class="md-form mb-5">
              <input type="text" id="editProductModelConditionInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Condition</label>
            </div>
            
  			            <div class="md-form mb-5">
              <input type="text" id="editProductModelDimensionInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Dimension</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="editProductModelCategoryInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Category</label>
            </div>
            <div class="md-form mb-5">
              <input type="text" id="editProductModelQuantityInput" class="form-control validate">
              <label data-error="wrong" data-success="right" for="formSalaryEdit">Quantity</label>
            </div>                      
          </div>
          <div class="modal-footer d-flex justify-content-center editInsideWrapper">
            <button class="btn btn-outline-secondary btn-block editInside" data-dismiss="" onclick="updateProduct()">Update
              <i class="fa fa-paper-plane-o ml-1"></i>
            </button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="deleteProductModel" tabindex="-1" role="dialog" aria-labelledby="modalDelete"
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
            <button type="button" class="btn btn-danger btnYesClass" id="deleteProductModelYesButton" data-dismiss="modal">Yes</button>
            <button type="button" class="btn btn-primary btnNoClass" id="btnNo" data-dismiss="modal">No</button>
          </div>
        </div>
      </div>
    </div>
  </div>

  <table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
		<tr>
			<th class="th-sm">UPC Number<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Bar Code<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Retail Price<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Cost<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Extra Cost<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Name<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Details<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Location<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Condition<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Dimension<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Category<i class="fa fa-sort float-right"
				aria-hidden="true"></i>
			</th>
			<th class="th-sm">Quantity<i class="fa fa-sort float-right"
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
        <th>UPC Number
        </th>
        <th>Bar Code
        </th>
        <th>Retail Price
        </th>
        <th>Cost
        </th>
        <th>Extra Cost
        </th>
        <th>Name
        </th>
        <th>Details
        </th>
        <th>Location
        </th>
        <th>Condition
        </th>
        <th>Dimension
        </th>
        <th>Category
        </th>
        <th>Quantity 
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
 			
 		    $("#btnSubmit").click((event) => {
 		        //stop submit the form, we will post it manually.
 		        event.preventDefault();
 		        doAjax();
 		    });
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
		                	$('#editProductModel').modal('show');
		                	$("#orderModal .x-error-msg").hide();

		    	 			
		                	$("#editProductModelUpcNumberInput").val(data.upc_number);
		                	$("#editProductModelRetailPriceInput").val(data.bar_code);
		                	$("#editProductModelRetailPriceInput").val(data.retail_price);
		                	$("#editProductModelCostInput").val(data.cost);
		                	$("#editProductModelExtraCostInput").val(data.extra_cost);
		                	$("#editProductModelNameInput").val(data.product_name);
		                	$("#editProductModelDetailsInput").val(data.details);
		                	$("#editProductModelLocationInput").val(data.location);
		                	$("#editProductModelConditionInput").val(data.product_condition);
		                	$("#editProductModelDimensionInput").val(data.dimension);
		                	$("#editProductModelCategoryInput").val(data.cat_id);
		                	$("#editProductModelQuantityInput").val(data.quantity);
		              	}
		       		});
 		}
 		
 		function updateProduct () {
 			var data = {};
 			data.upc_number = $("#addProductModelUpcNumberInput").val();
 			data.bar_code = $("#addProductModelBarCodeInput").val();
 			data.retail_price = $("#addProductModelRetailPriceInput").val();
 			data.cost = $("#addProductModelCostInput").val();
 			data.extra_cost = $("#addProductModelExtraCostInput").val();
 			data.product_name = $("#addProductModelNameInput").val();
 			data.details = $("#addProductModelDetailsInput").val();
 			data.location = $("#addProductModelLocationInput").val();
 			data.condition = $("#addProductModelConditionInput").val();
 			data.dimension = $("#addProductModelDimensionInput").val();
 			data.category = $("#addProductModelCategoryInput").val().toUpperCase();
 			data.quantity = $("#addProductModelQuantityInput").val();
 			
 			
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
                	$('#editProductModel').modal('hide');
                	loadOrderData();
              	}
       		});
 		}	
 		
 		function deleteProduct (e, e1) {
 			deleteProductId = $(e).attr("value");

 		}
 		
	        $("#deleteProductModelYesButton").click(function(){
 		        $.ajax({ 
 	        		type: "DELETE",
 	                url: "/choiceoutlet/products/" + deleteProductId,
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
 	                	$('#deleteProductModel').modal('hide');
 	                	loadOrderData();
 	              	}
 	       		});
 	           }
 	        )
	        
	        function addProduct () {
	        	console.log("Add Product");
	        	var data = {};
	 			data.upc_number = $("#addProductModelUpcNumberInput").val();
	 			data.bar_code = $("#addProductModelBarCodeInput").val();
	 			data.retail_price = $("#addProductModelRetailPriceInput").val();
	 			data.cost = $("#addProductModelCostInput").val();
	 			data.extra_cost = $("#addProductModelExtraCostInput").val();
	 			data.product_name = $("#addProductModelNameInput").val();
	 			data.details = $("#addProductModelDetailsInput").val();
	 			data.location = $("#addProductModelLocationInput").val();
	 			data.condition = $("#addProductModelConditionInput").val();
	 			data.dimension = $("#addProductModelDimensionInput").val();
	 			data.category = $("#addProductModelCategoryInput").val().toUpperCase();
	 			data.quantity = $("#addProductModelQuantityInput").val();
	 			
	 			
		        $.ajax({ 
	        		type: "PUT",
	                url: "/choiceoutlet/products/add",
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
	                	$('#addProductModel').modal('hide');
	                	loadOrderData();
	              	}
	       		});
	        }
	        
 	        function loadOrderData () {
	        	$.ajax({ type: "GET",
		       		 contentType: "application/json",
		       			url: "/choiceoutlet/products",
		                async: false,
		                dataType: 'json',
		                cache: false,
		                timeout: 600000,
		                success : function(data)
		                {	
		                	$('#orderListData').html(orderListTemplate(data));		                	
		              	}
		       		});
	        }
 	        
/*  	       $("#btnSubmit").click((event) => {
 	          //stop submit the form, we will post it manually.
 	          event.preventDefault();
 	          doAjax();
 	      }); */
 	       
 	       
 	     function doAjax() {
 	    	 
 	    	    // Get form
 	    	    var form = $('#fileUploadForm')[0];
 	    	    var data = new FormData(form);
 	    	 
 	    	    $.ajax({
 	    	        type: "POST",
 	    	        async: false,
 	    	        enctype: 'multipart/form-data',
 	    	        url: "/choiceoutlet/upload",
 	    	        data: data,
 	    	        processData: false, //prevent jQuery from automatically transforming the data into a query string
 	    	        contentType: false,
 	    	        cache: false,
 	    	       success : function(data) {
 	    	            $("#listFiles").text(data);
 	    	        },
 	    	       error : function(e) {
 	    	            $("#listFiles").text(e.responseText);
 	    	        }
 	    	    });
 	    	}
 	        
 	        
/*  	        function uploadImage () {
 	        	 $.ajax({ 
 	        		type: "POST",
 	                url: "/upload",
 	              	async: false,
 	             //  dataType: 'json',
 	             	//data: JSON.stringify(data),
 	           		cache: false,
 	                timeout: 600000,
 	                //contentType: "appl",
 	              /*   	headers: {
 	                "Accept": "application/json",
 	                "Content-Type": "application/json"
 	                }, */
 	       /*          success : function()
 	                {	
 	              	}
 	       		});
 	        } */
	</script>
</html>