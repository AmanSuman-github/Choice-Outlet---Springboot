package choiceoutlet.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="orders")
@EntityListeners(AuditingEntityListener.class)
public class Order {
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="date_blocked", nullable=true)
	Date date_blocked;
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name="order_id", nullable=false)
	Long order_id;

	@Column(name="platform", nullable=true)
	String platform;
	
	@Column(name="buyer_state", nullable=false)
	String buyer_state;
	
	@Column(name="order_price", nullable=false)
	BigDecimal order_price;
	
	@Column(name="profit_loss", nullable=true)
	BigDecimal profit_loss;
	
	@Column(name="sales_tax", nullable=true)
	BigDecimal sales_tax;
	
	@Column(name="customer_name", nullable=false)
	String customer_name;
	
	@Column(name="phone", nullable=false)
	String phone;
	
	@Column(name="email", nullable=false)
	String email;
	
	@Column(name="status", nullable=false)
	String status;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="delivery_date", nullable=true)
	Date delivery_date;
	
	@Column(name="bar_code", nullable=false)
	String bar_code;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Date date_blocked, Long order_id, String platform, String buyer_state, BigDecimal order_price,
			BigDecimal profit_loss, BigDecimal sales_tax, String customer_name, String phone, String email, String status,
			Date delivery_date, String bar_code) {
		super();
		this.date_blocked = date_blocked;
		this.order_id = order_id;
		this.platform = platform;
		this.buyer_state = buyer_state;
		this.order_price = order_price;
		this.profit_loss = profit_loss;
		this.sales_tax = sales_tax;
		this.customer_name = customer_name;
		this.phone = phone;
		this.email = email;
		this.status = status;
		this.delivery_date = delivery_date;
		this.bar_code = bar_code;
	}

	public Date getDate_blocked() {
		return date_blocked;
	}

	public void setDate_blocked(Date date_blocked) {
		this.date_blocked = date_blocked;
	}

	public Long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}

	public String getPlatform() {
		return platform;
	}

	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public String getBuyer_state() {
		return buyer_state;
	}

	public void setBuyer_state(String buyer_state) {
		this.buyer_state = buyer_state;
	}

	public BigDecimal getOrder_price() {
		return order_price;
	}

	public void setOrder_price(BigDecimal order_price) {
		this.order_price = order_price;
	}

	public BigDecimal getProfit_loss() {
		return profit_loss;
	}

	public void setProfit_loss(BigDecimal profit_loss) {
		this.profit_loss = profit_loss;
	}

	public BigDecimal getSales_tax() {
		return sales_tax;
	}

	public void setSales_tax(BigDecimal sales_tax) {
		this.sales_tax = sales_tax;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getDelivery_date() {
		return delivery_date;
	}

	public void setDelivery_date(Date delivery_date) {
		this.delivery_date = delivery_date;
	}

	public String getBar_code() {
		return bar_code;
	}

	public void setBar_code(String bar_code) {
		this.bar_code = bar_code;
	}
	
}
