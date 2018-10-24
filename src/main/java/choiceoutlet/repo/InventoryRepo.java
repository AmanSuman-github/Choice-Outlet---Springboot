package choiceoutlet.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import choiceoutlet.domain.Inventory;

public interface InventoryRepo extends JpaRepository<Inventory, Long> {

}
