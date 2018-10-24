package choiceoutlet.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="order_details")
@EntityListeners(AuditingEntityListener.class)
public class OrderDetails {
	
	@Id
	@Column(name="order_id", nullable=false)
	Long order_id;
	
	@Column(name="bar_code", nullable=false)
	Long bar_code;
	
	@Column(name="quantity", nullable=false)
	int quantity;

	public OrderDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetails(Long order_id, Long bar_code, int quantity) {
		super();
		this.order_id = order_id;
		this.bar_code = bar_code;
		this.quantity = quantity;
	}

	public Long getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Long order_id) {
		this.order_id = order_id;
	}

	public Long getBar_code() {
		return bar_code;
	}

	public void setBar_code(Long bar_code) {
		this.bar_code = bar_code;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	

}
