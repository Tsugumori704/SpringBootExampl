package by.itstep.vasilevskij.repository;

import by.itstep.vasilevskij.domain.Owner;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;

public interface OwnerRepo extends CrudRepository<Owner, Long> {

    Page<Owner> findAll(Pageable pageable);

}
