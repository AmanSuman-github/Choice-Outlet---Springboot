package choiceoutlet.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.data.jpa.domain.support.AuditingEntityListener;

@Entity
@Table(name="categories")
@EntityListeners(AuditingEntityListener.class)
public class Categories {
	
	@Id
	@Column(name="cat_id", nullable=false)
	int cat_id;
	
	@Column(name="cat_name", nullable=false)
	String cat_name;

	public Categories() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Categories(int cat_id, String cat_name) {
		super();
		this.cat_id = cat_id;
		this.cat_name = cat_name;
	}

	public int getCat_id() {
		return cat_id;
	}

	public void setCat_id(int cat_id) {
		this.cat_id = cat_id;
	}

	public String getCat_name() {
		return cat_name;
	}

	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
	
}
