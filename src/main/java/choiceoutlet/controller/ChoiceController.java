package choiceoutlet.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import choiceoutlet.domain.Products;
import choiceoutlet.repo.ProductsRepository;
import java.util.List;

import javax.validation.Valid;

@RestController
@RequestMapping("/choiceoutlet")
public class ChoiceController {
	
	@Autowired
	ProductsRepository ProductsRepository;

	@RequestMapping(value="/products/add", method=RequestMethod.PUT)
    @ResponseBody
	public Products addProducts(@Valid @RequestBody Products pro) {
		return ProductsRepository.save(pro);
		
	}
	
	@RequestMapping(value="/products", method=RequestMethod.GET)
    @ResponseBody
	public List<Products> getAllProducts() {
		return ProductsRepository.findAll();
	}

//	@RequestMapping(value="/products/{bar_code}", method=RequestMethod.GET)
//    @ResponseBody
//	public ResponseEntity<Products> getProductsByBarCode(@Valid @PathVariable("bar_code") String bar_code) {
//		
//		Products prod=ProductsRepository.findOne(String(bar_code));
//		
//		if(prod == null) {
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
//		}
//		return ResponseEntity.ok().body(prod);
//	}
//
//	@RequestMapping(value="/products/{bar_code}", method=RequestMethod.PUT)
//    @ResponseBody
//	public ResponseEntity<Products> updateProduct(@PathVariable(value="bar_code") String bar_code, @Valid @RequestBody Products prodDetails) {
//		Products prod=ProductsRepository.findOne(String(bar_code));
//		
//		if(prod ==null) {
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
//		}
//		
//		prod.setUpc_number(prodDetails.getUpc_number());
//		prod.setBar_code(prodDetails.getBar_code());
//		prod.setLot_number(prodDetails.getLot_number());
//		prod.setQuantity(prodDetails.getQuantity());
//		prod.setRetail_price(prodDetails.getRetail_price());
//		prod.setCost(prodDetails.getCost());
//		prod.setExtra_cost(prodDetails.getExtra_cost());
//		prod.setDetails(prodDetails.getDetails());
//		prod.setLocation(prodDetails.getLocation());
//		prod.setCondition(prodDetails.getCondition());
//		prod.setDimension(prodDetails.getDimension());
//		prod.setRemaining_quantity(prodDetails.getRemaining_quantity());
//		
//		Products updatedProducts=ProductsRepository.save(prod);
//		return ResponseEntity.ok().body(updatedProducts);
//	}
//	
//	@RequestMapping(value="/products/{bar_code}", method=RequestMethod.DELETE)
//    @ResponseBody
//	public ResponseEntity<Products> deleteProduct(@PathVariable(value="bar_code") String bar_code) {
//		Products prod=ProductsRepository.findOne(String(bar_code));
//		
//		if(prod == null) {
//			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
//		}
//		
//		ProductsRepository.delete(prod);
//		
//		return ResponseEntity.status(HttpStatus.OK).body(null);
//	}
//
//	private Long String(String bar_code) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
	 @RequestMapping(value = "/index", method = RequestMethod.GET)
	   public String index() {
	      return "index";
	 }
	 
//	   @RequestMapping(value = "/redirect", method = RequestMethod.GET)
//	   public String redirect() {
//	      return "redirect:new";
//	   }
	
	
}