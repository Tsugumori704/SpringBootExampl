package by.itstep.vasilevskij.controller;

import by.itstep.vasilevskij.domain.Car;
import by.itstep.vasilevskij.service.CarService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("cars")
public class CarController {

    @Autowired

    CarService carService;

    @GetMapping
    public String listOfCars(
            Model model,
            @RequestParam (required = false, defaultValue = "") Car editCar,
            @RequestParam (required = false, defaultValue = "") Car removeCar,
            @RequestParam (required = true, defaultValue = "") Car reaperCar,
            @PageableDefault(sort = {"mark"}, direction = Sort.Direction.ASC)Pageable pageable
            ) {
        Page<Car> page = carService.getAll(pageable);

        page.forEach(pgs -> log.debug("Car: {}", pgs.toString()));

        model.addAttribute("url", "/cars");
        model.addAttribute("page", page);

        /*
        Edit exists car
         */
        if (editCar != null) {
            model.addAttribute("oneCar", editCar);
        }
        /*
        Remove exists car
         */
        if (removeCar != null){
            carService.remove(removeCar);
        }
        /*
        Reaper exists car
         */
        if (reaperCar != null) {
            carService.reaper(reaperCar);
        }

        return "cars";
    }

    @PostMapping
    public String addOrUpdateCar(
            @Valid Car car,
            BindingResult bindingResult,
            Model model,
            @PageableDefault(sort = {"mark"}, direction = Sort.Direction.ASC)Pageable pageable
            ){
        Page<Car> page = carService.getAll(pageable);
        model.addAttribute("url", "/cars");
        model.addAttribute("page", page);
        if (bindingResult.hasErrors()){

            model.addAttribute("page", page);
            Map <String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("oneCar", car);

            return "cars";
        } else {

            if (carService.saveCar(car)) {
                return "redirect:cars";

            } else {
                model.addAttribute("page", page);
                model.addAttribute("savingReport", "Car with such VIN is exists!");
                model.addAttribute("oneCar", car);

                return "cars";
            }
        }
    }
}
