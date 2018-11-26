package choiceoutlet.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import choiceoutlet.domain.Categories;

public interface CategoriesRepo extends JpaRepository<Categories, Long> {
	
	<S extends Categories> List<S> save(Iterable<S> entities);
}
