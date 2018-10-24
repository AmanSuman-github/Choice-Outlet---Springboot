package choiceoutlet.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="inventory")
@EntityListeners(AuditingEntityListener.class)
public class Inventory {
	
	@Id
	@Column(name="lot_number", nullable=false)
	Long lot_number;
	
	@Column(name="bar_code", nullable=false)
	Long bar_code;
	
	@Column(name="quantity", nullable=false)
	int quantity;
	
	@Column(name="date", nullable=false)
	Date date;

	public Inventory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Inventory(Long lot_number, Long bar_code, int quantity, Date date) {
		super();
		this.lot_number = lot_number;
		this.bar_code = bar_code;
		this.quantity = quantity;
		this.date = date;
	}

	public Long getLot_number() {
		return lot_number;
	}

	public void setLot_number(Long lot_number) {
		this.lot_number = lot_number;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}	
	
	
}
