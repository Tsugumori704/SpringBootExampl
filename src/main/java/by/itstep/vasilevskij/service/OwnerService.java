package by.itstep.vasilevskij.service;

import by.itstep.vasilevskij.domain.Owner;
import by.itstep.vasilevskij.repository.OwnerRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OwnerService {

    @Autowired
    OwnerRepo ownerRepo;
    private Pageable pageable;

    public boolean saveOwner(Owner owner){

        ownerRepo.save(owner);
        return true;
    }

    public Iterable<Owner> ownerList(){
        return ownerRepo.findAll();
    }

    public Page<Owner> getAll(Pageable pageable){
        this.pageable = pageable;

        return  ownerRepo.findAll(pageable);
    }

}
