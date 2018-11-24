package choiceoutlet.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import choiceoutlet.domain.Order;

public interface OrderRepo extends JpaRepository<Order, Long> {

	Order findOne(Long order_id);
	
}
