package choiceoutlet.controller;

import org.hibernate.annotations.Synchronize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import choiceoutlet.domain.Categories;
import choiceoutlet.domain.Products;
import choiceoutlet.domain.Order;
import choiceoutlet.domain.OrderDetails;
import choiceoutlet.domain.Inventory;
import choiceoutlet.repo.ProductsRepository;
import choiceoutlet.repo.CategoriesRepo;
import choiceoutlet.repo.OrderRepo;
import choiceoutlet.repo.OrderDetailsRepo;
import choiceoutlet.repo.InventoryRepo;
import java.util.List;

import javax.validation.Valid;

@Controller
@RequestMapping("/choiceoutlet")
public class ChoiceController {
	
	@Autowired
	ProductsRepository ProductsRepository;
	
	@Autowired
	CategoriesRepo CategoriesRepo;
	
	@Autowired
	OrderRepo OrderRepo;
	
	@Autowired
	OrderDetailsRepo OrderDetailsRepo;
	
	@Autowired
	InventoryRepo InventoryRepo;
	
	//Product add/get/update/delete ------------------------------------------------------------------------------------
	
	@RequestMapping(value="/products/add", method=RequestMethod.PUT)	
    @ResponseBody
	public Products addProducts(@Valid @RequestBody Products pro) throws Exception {
		return ProductsRepository.save(pro);
		
	}
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
    @ResponseBody
	public List<Products> getAllProducts() {
		return ProductsRepository.findAll();
	}



	@RequestMapping(value="/products/{bar_code}", method=RequestMethod.PUT)
    @ResponseBody
	public ResponseEntity<Products> updateProduct(@PathVariable(value="bar_code") Long bar_code, @Valid @RequestBody Products prodDetails) throws Exception {
        
		Products prod = ProductsRepository.findOne((long) Long.valueOf(bar_code));
		
		if(prod == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		prod.setUpc_number(prodDetails.getUpc_number());
		prod.setBar_code(prodDetails.getBar_code());
		prod.setRetail_price(prodDetails.getRetail_price());
		prod.setCost(prodDetails.getCost());
		prod.setExtra_cost(prodDetails.getExtra_cost());
		prod.setProduct_name(prodDetails.getProduct_name());
		prod.setDetails(prodDetails.getDetails());
		prod.setLocation(prodDetails.getLocation());
		prod.setCondition(prodDetails.getCondition());
		prod.setDimension(prodDetails.getDimension());
		prod.setCat_id(prodDetails.getCat_id());
		prod.setQuantity(prodDetails.getQuantity());
		
		Products updatedProducts = ProductsRepository.save(prod);
		return ResponseEntity.ok().body(updatedProducts);
	}
	
	@RequestMapping(value="/products/{bar_code}", method=RequestMethod.DELETE)
    @ResponseBody
	public ResponseEntity<Products> deleteProduct(@PathVariable(value="bar_code") Long bar_code) {
		Products prod=ProductsRepository.findOne((long) Long.valueOf(bar_code));
		
		if(prod == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		ProductsRepository.delete(prod);
		
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}
	
	@RequestMapping(value="/product/{bar_code}", method=RequestMethod.GET)
    @ResponseBody
	public ResponseEntity<Products> getProductByBarCode(@PathVariable(value="bar_code") Long bar_code) throws Exception {
        
		Products prod = ProductsRepository.findOne((long) Long.valueOf(bar_code));
		
		if(prod == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		return ResponseEntity.ok().body(prod);
	}
	
	//Category add/get/update/delete -------------------------------------------------------------------------------------
	
	@RequestMapping(value="/category/add", method=RequestMethod.PUT)	
    @ResponseBody
	public Categories addCategories(@Valid @RequestBody Categories cat) {
		return CategoriesRepo.save(cat);
		
	}
	
	@RequestMapping(value="/categories", method=RequestMethod.GET)
    @ResponseBody
	public List<Categories> getAllCategories() {
		return CategoriesRepo.findAll();
	}



	@RequestMapping(value="/category/{cat_id}", method=RequestMethod.PUT)
    @ResponseBody
	public ResponseEntity<Categories> updateCategory(@PathVariable(value="cat_id") Long cat_id, @Valid @RequestBody Categories catDetails) {
        
		Categories cat = CategoriesRepo.findOne(cat_id);
		
		if(cat == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		cat.setCat_id(catDetails.getCat_id());
		cat.setCat_name(catDetails.getCat_name());
		
		Categories updatedCategory = CategoriesRepo.save(cat);
		return ResponseEntity.ok().body(updatedCategory);
	}
	
	@RequestMapping(value="/category/{cat_id}", method=RequestMethod.DELETE)
    @ResponseBody
	public ResponseEntity<Categories> deleteCategory(@PathVariable(value="cat_id") Long cat_id) {
		Categories cat =  CategoriesRepo.findOne(cat_id);
		
		if(cat == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		CategoriesRepo.delete(cat);
		
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}
	
	//Order add/get/update/delete -----------------------------------------------------------------------------------
	
	@RequestMapping(value="/order/add", method=RequestMethod.PUT)
    @ResponseBody
	public Order addOrder(@Valid @RequestBody Order order) 
	{
		System.out.println(order);
		return OrderRepo.save(order);
	
		
	}

	@RequestMapping(value="/orders", method=RequestMethod.GET)
    @ResponseBody
	public List<Order> getAllOrders() {
		return OrderRepo.findAll();
	}
	
	@RequestMapping(value="/order/{order_id}", method=RequestMethod.GET)
    @ResponseBody
	public ResponseEntity<Order> getOrderById(@PathVariable(value="order_id") Long order_id) {
        
		Order ord = OrderRepo.findOne(order_id);
		
		if(ord == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		return ResponseEntity.ok().body(ord);
	}

	@RequestMapping(value="/order/{order_id}", method=RequestMethod.PUT)
    @ResponseBody
	public ResponseEntity<Order> updateOrder(@PathVariable(value="order_id") Long order_id, @Valid @RequestBody Order orderDetails) {
        
		Order ord = OrderRepo.findOne(order_id);
		
		if(ord == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		ord.setDate_blocked(orderDetails.getDate_blocked());
		ord.setOrder_id(orderDetails.getOrder_id());
		ord.setPlatform(orderDetails.getPlatform());
		ord.setBuyer_state(orderDetails.getBuyer_state());
		ord.setOrder_price(orderDetails.getOrder_price());
		ord.setProfit_loss(orderDetails.getProfit_loss());
		ord.setSales_tax(orderDetails.getSales_tax());
		ord.setCustomer_name(orderDetails.getCustomer_name());
		ord.setPhone(orderDetails.getPhone());
		ord.setEmail(orderDetails.getEmail());
		ord.setStatus(orderDetails.getStatus());
		ord.setDelivery_date(orderDetails.getDelivery_date());
		
		Order updatedOrder = OrderRepo.save(ord);
		return ResponseEntity.ok().body(updatedOrder);
	}
	
	@RequestMapping(value="/order/{order_id}", method=RequestMethod.DELETE)
    @ResponseBody
	public ResponseEntity<Order> deleteOrder(@PathVariable(value="order_id") Long order_id) {
		Order ord =  OrderRepo.findOne(order_id);
		
		if(ord == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		OrderRepo.delete(ord);
		
		
		
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}

	//Order Details add/get/update/delete -----------------------------------------------------------------------------------
	
	@RequestMapping(value="/order/details/add", method=RequestMethod.PUT)	
    @ResponseBody
	public synchronized  OrderDetails addOrderDetails(@Valid @RequestBody OrderDetails ordDetails) {
		return OrderDetailsRepo.save(ordDetails);
	}
	
	@RequestMapping(value="/order/details", method=RequestMethod.GET)
    @ResponseBody
	public List<OrderDetails> getAllOrderDetails() {
		return OrderDetailsRepo.findAll();
	}

	@RequestMapping(value="/order/details/{order_id}", method=RequestMethod.PUT)
    @ResponseBody
	public ResponseEntity<OrderDetails> updateOrderDetails(@PathVariable(value="order_id") Long order_id, @Valid @RequestBody OrderDetails orderDetails) {
        
		OrderDetails ord = OrderDetailsRepo.findOne(order_id);
		
		if(ord == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		ord.setOrder_id(orderDetails.getOrder_id());
		ord.setBar_code(orderDetails.getBar_code());
		ord.setQuantity(orderDetails.getQuantity());
		
		OrderDetails updatedOrderDetails = OrderDetailsRepo.save(ord);
		return ResponseEntity.ok().body(updatedOrderDetails);
	}
	
	@RequestMapping(value="/order/details/{order_id}", method=RequestMethod.DELETE)
    @ResponseBody
	public ResponseEntity<OrderDetails> deletOrderDetails(@PathVariable(value="order_id") Long order_id) {
		OrderDetails ord =  OrderDetailsRepo.findOne(order_id);
		
		if(ord == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		OrderDetailsRepo.delete(ord);
		
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}
	
	//Inventory add/get/update/delete -----------------------------------------------------------------------------------
	
	@RequestMapping(value="/inventory/add", method=RequestMethod.PUT)	
    @ResponseBody
	public Inventory addinventory(@Valid @RequestBody Inventory inv) {
		return InventoryRepo.save(inv);
		
	}
	
	@RequestMapping(value="/inventories", method=RequestMethod.GET)
    @ResponseBody
	public List<Inventory> getAllInventories() {
		return InventoryRepo.findAll();
	}

	@RequestMapping(value="/inventory/{lot_number}", method=RequestMethod.PUT)
    @ResponseBody
	public ResponseEntity<Inventory> updateInventory(@PathVariable(value="lot_number") Long lot_number, @Valid @RequestBody Inventory invBody) {
        
		Inventory inv = InventoryRepo.findOne(lot_number);
		
		if(inv == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
    	}
		
		inv.setLot_number(invBody.getLot_number());
		inv.setBar_code(invBody.getBar_code());
		inv.setQuantity(invBody.getQuantity());
		inv.setDate(invBody.getDate());
		
		Inventory updatedInventory = InventoryRepo.save(inv);
		return ResponseEntity.ok().body(updatedInventory);
	}
	
	@RequestMapping(value="/inventory/{lot_number}", method=RequestMethod.DELETE)
    @ResponseBody
	public ResponseEntity<Inventory> deletInventory(@PathVariable(value="lot_number") Long lot_number) {
		Inventory inv =  InventoryRepo.findOne(lot_number);
		
		if(inv == null) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		
		InventoryRepo.delete(inv);
		
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}
	
	//Page Navigation -----------------------------------------------------------------------------------
	   @RequestMapping(value = "/", method = RequestMethod.GET)
	   public String index() {
	      return "index";
	   }
	   
	   @RequestMapping(value = "/productList", method = RequestMethod.GET)
	   public String productList() {
	      return "productList";
	   }
	   
	   @RequestMapping(value = "/product", method = RequestMethod.GET)
	   public String product() {
	      return "product";
	   }
	   
	   @RequestMapping(value = "/updateOrder", method = RequestMethod.GET)
	   public String updateOrder() {
	      return "updateOrder";
	   }
}
