package choiceoutlet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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

import java.util.Date;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	
	public void sendMail(Order order) {
		  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		  // Get a Properties object
		     Properties props = System.getProperties();
// 			 Below are for gmail		     
//			 props.setProperty("mail.smtp.host", "smtp.gmail.com");
//		     props.setProperty("mail.smtp.port", "465");
//		     props.setProperty("mail.smtp.socketFactory.port", "465");
//			 props.put("mail.debug", "true");
//			 props.put("mail.store.protocol", "pop3");
//			Below are for outlook and few has to be removed while setting up gmail
	     	 props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
	     	 props.setProperty("mail.smtp.socketFactory.fallback", "true");
	         props.put("mail.smtp.starttls.enable", "true");
	         props.put("mail.smtp.host", "outlook.office365.com");
	         props.put("mail.smtp.port", "587");
		     props.put("mail.smtp.auth", "true");
		     props.put("mail.transport.protocol", "smtp");
		     final String username = "niranjan.srungarapu@fintellix.com";
		     final String password = "November@123";
		     try{
		     Session session = Session.getDefaultInstance(props, 
		                          new Authenticator(){
		                             protected PasswordAuthentication getPasswordAuthentication() {
		                                return new PasswordAuthentication(username, password);
		                             }});

		   // -- Create a new message --
		     Message msg = new MimeMessage(session);

		  // -- Set the FROM and TO fields --
		     msg.setFrom(new InternetAddress("niranjan.srungarapu@fintellix.com"));
		     msg.setRecipients(Message.RecipientType.TO, 
		                      InternetAddress.parse(order.getEmail()));
		     msg.setSubject("Regarding Joining Details");
		     msg.setText("Hi,"
		     		+ "\nYou can join our company from 28-11-2018 with an annual salary of 30 Lakhs.");
		     msg.setSentDate(new Date());
		     Transport.send(msg);
		     System.out.println("Message sent.");
		  }catch (MessagingException e){ 
			  System.out.println("Erroe is " + e);
		  }		

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
		if(order.getEmail()!= null) {
			sendMail(order);
		}
		 
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
	
	//File Upload -----------------------------------------------------------------------------------
	
	public static String uploadDirectory = System.getProperty("user.dir")+"/images";
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	  public String upload(Model model,@RequestParam("files") MultipartFile[] files) {
		  StringBuilder fileNames = new StringBuilder();
		  for (MultipartFile file : files) {
			  Path fileNameAndPath = Paths.get(uploadDirectory, file.getOriginalFilename());
			  fileNames.append(file.getOriginalFilename()+" ");
			  try {
				Files.write(fileNameAndPath, file.getBytes());
			} catch (IOException e) {
				e.printStackTrace();
			}
		  }
		  model.addAttribute("msg", "Successfully uploaded files "+fileNames.toString());
		  return null;
	  }
	
/*	@RequestMapping(value="/upload", method=RequestMethod.POST)
    public String uploadMultipartFile(@RequestParam("uploadfile") MultipartFile file) {
    	try {
    		fileStorage.store(file);
	    	return "File uploaded successfully! -> filename = " + file.getOriginalFilename();
		} catch (Exception e) {
			return "Error -> message = " + e.getMessage();
		}    
    }*/
	
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
	   
	   @RequestMapping(value = "/updateProduct", method = RequestMethod.GET)
	   public String updateProduct() {
	      return "addProducts";
	   }
}
