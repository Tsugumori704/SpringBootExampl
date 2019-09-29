package by.itstep.vasilevskij.service;

import by.itstep.vasilevskij.domain.Car;
import by.itstep.vasilevskij.repository.CarRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;


@Service
@Slf4j
public class CarService {
    @Autowired
    CarRepo carRepo;
    private Pageable pageable;

    public boolean saveCar(Car car) {



        Car carFromDb = carRepo.findByVin(car.getVin());

        if (car.getId() == null) {
            if (carFromDb == null){
                carRepo.save(car);

                log.debug("Save NEW Car: {}", car.toString());

                return true;

            } else {
                return false;
            }
        }
        else {

            if (carFromDb == null
                    ||
                    carFromDb != null && car.getId() == carFromDb.getId() ) {

                carRepo.save(car);

                log.debug("Save NEW Car: {}", car.toString());

                return true;
            } else {

                return false;
            }
        }

    }

//    public Iterable<Car> getAll() {
//        return carRepo.findAll();
//    }

    public Page<Car> getAll(Pageable pageable){
        this.pageable = pageable;

        return  carRepo.findAll(pageable);
    }

    public void remove(Car removeCar) {
        removeCar.setDeleted(true);
        carRepo.save(removeCar);
    }

    public void reaper(Car reaperCar) {
        reaperCar.setDeleted(false);
        carRepo.save(reaperCar);
    }


}
