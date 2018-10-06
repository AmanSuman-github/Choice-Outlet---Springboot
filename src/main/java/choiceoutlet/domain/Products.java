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
	String bar_code;
	
	@Column(name="lot_number", nullable=false)
	int lot_number;
	
	@Column(name="quantity", nullable=false)
	int quantity;
	
	@Column(name="retail_price", nullable=false)
	BigDecimal retail_price;
	
	@Column(name="cost", nullable=false)
	BigDecimal cost;
	
	@Column(name="extra_cost", nullable=false)
	BigDecimal extra_cost;
	
	@Column(name="details", nullable=false)
	String details;
	
	@Column(name="category", nullable=false)
	String category;
	
	@Column(name="location", nullable=false)
	String location;
	
	@Column(name="product_condition", nullable=false)
	String condition;
	
	@Column(name="dimension", nullable=false)
	String dimension;
	
	@Column(name="remaining_quantity", nullable=false)
	int remaining_quantity;

	public Products(String upc_number, String bar_code, int lot_number, int quantity, BigDecimal retail_price,
			BigDecimal cost, BigDecimal extra_cost, String details, String category, String location, String condition, String dimension, int remaining_quantity) {
		super();
		this.upc_number = upc_number;
		this.bar_code = bar_code;
		this.lot_number = lot_number;
		this.quantity = quantity;
		this.retail_price = retail_price;
		this.cost = cost;
		this.extra_cost = extra_cost;
		this.details = details;
		this.category = category;
		this.location = location;
		this.condition = condition;
		this.dimension = dimension;
		this.remaining_quantity = remaining_quantity;
	}

	public Products() {
		super();
		// TODO Auto-generated constructor stub
	}

public String getUpc_number() {
	return upc_number;
}

public void setUpc_number(String upc_number) {
	this.upc_number = upc_number;
}

public String getBar_code() {
	return bar_code;
}

public void setBar_code(String bar_code) {
	this.bar_code = bar_code;
}

public int getLot_number() {
	return lot_number;
}

public void setLot_number(int lot_number) {
	this.lot_number = lot_number;
}

public int getQuantity() {
	return quantity;
}

public void setQuantity(int quantity) {
	this.quantity = quantity;
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

public String getDetails() {
	return details;
}

public void setDetails(String details) {
	this.details = details;
}

public String getCategory() {
	return category;
}

public void setCategory(String category) {
	this.category = category;
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

public int getRemaining_quantity() {
	return remaining_quantity;
}

public void setRemaining_quantity(int remaining_quantity) {
	this.remaining_quantity = remaining_quantity;
}

}