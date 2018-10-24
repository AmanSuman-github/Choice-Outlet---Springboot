package choiceoutlet.domain;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="products")
@EntityListeners(AuditingEntityListener.class)
public class Products {
	
	@Column(name="upc_number", nullable=false)
	String upc_number;
	
	@Id
	@Column(name="bar_code", unique=true, nullable=false)
	Long bar_code;
	
	@Column(name="retail_price", nullable=false)
	BigDecimal retail_price;
	
	@Column(name="cost", nullable=false)
	BigDecimal cost;
	
	@Column(name="extra_cost", nullable=false)
	BigDecimal extra_cost;
	
	@Column(name="product_name", nullable=false)
	String product_name;
	
	@Column(name="details", nullable=false)
	String details;
	
	@Column(name="location", nullable=false)
	String location;
	
	@Column(name="product_condition", nullable=false)
	String condition;
	
	@Column(name="dimension", nullable=false)
	String dimension;
	
	@Column(name="cat_id", nullable=false)
	int cat_id;
	
	@Column(name="quantity", nullable=false)
	int quantity;

	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Products(String upc_number, Long bar_code, BigDecimal retail_price, BigDecimal cost, BigDecimal extra_cost,
			String product_name, String details, String location, String condition, String dimension, int cat_id, int quantity) {
		super();
		this.upc_number = upc_number;
		this.bar_code = bar_code;
		this.retail_price = retail_price;
		this.cost = cost;
		this.extra_cost = extra_cost;
		this.product_name = product_name;
		this.details = details;
		this.location = location;
		this.condition = condition;
		this.dimension = dimension;
		this.cat_id = cat_id;
		this.quantity = quantity;
	}

	public String getUpc_number() {
		return upc_number;
	}

	public void setUpc_number(String upc_number) {
		this.upc_number = upc_number;
	}

	public Long getBar_code() {
		return bar_code;
	}

	public void setBar_code(Long bar_code) {
		this.bar_code = bar_code;
	}

	public BigDecimal getRetail_price() {
		return retail_price;
	}

	public void setRetail_price(BigDecimal retail_price) {
		this.retail_price = retail_price;
	}

	public BigDecimal getCost() {
		return cost;
	}

	public void setCost(BigDecimal cost) {
		this.cost = cost;
	}

	public BigDecimal getExtra_cost() {
		return extra_cost;
	}

	public void setExtra_cost(BigDecimal extra_cost) {
		this.extra_cost = extra_cost;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getDimension() {
		return dimension;
	}

	public void setDimension(String dimension) {
		this.dimension = dimension;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}