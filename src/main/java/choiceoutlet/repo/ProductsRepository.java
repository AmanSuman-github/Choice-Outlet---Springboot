package choiceoutlet.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import choiceoutlet.domain.Products;

public interface ProductsRepository extends JpaRepository<Products, Long> {
	
}
