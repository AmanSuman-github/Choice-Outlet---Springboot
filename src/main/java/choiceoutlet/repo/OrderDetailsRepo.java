package choiceoutlet.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import choiceoutlet.domain.OrderDetails;

public interface OrderDetailsRepo extends JpaRepository<OrderDetails, Long>  {

	OrderDetails findOne(Long order_id);

}
