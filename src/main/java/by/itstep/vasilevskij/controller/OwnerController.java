package by.itstep.vasilevskij.controller;

import by.itstep.vasilevskij.domain.Owner;
import by.itstep.vasilevskij.service.OwnerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.time.LocalDate;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("owners")
public class OwnerController {

    @Autowired
    OwnerService ownerService;

    @GetMapping
    public String ownerList(Model model,
                            @PageableDefault(sort = {"firstName"}, direction = Sort.Direction.ASC) Pageable pageable){
//        model.addAttribute("owners", ownerService.ownerList());

        Page<Owner> page = ownerService.getAll(pageable);
        ownerService.getAll(pageable);

        page.forEach(pgs -> log.debug("Owner: {}", pgs.toString()));

        model.addAttribute("url", "/owners");
        model.addAttribute("page", page);

        return "owners";
    }

    @PostMapping
    public String ownerSave(
            @Valid Owner owner,
            BindingResult bindingResult,
            Model model,
            @PageableDefault(sort = {"firstName"}, direction = Sort.Direction.ASC) Pageable pageable,
            @RequestParam("birth") String birthDate
            ){
//        Iterable<Owner> owners = ownerService.ownerList();

        Page<Owner> ownerPage = ownerService.getAll(pageable);
        model.addAttribute("url", "/owners");
        model.addAttribute("page", ownerPage);

        if (!birthDate.isEmpty()){
            owner.setBirthDate(LocalDate.parse(birthDate));
        }


        if (bindingResult.hasErrors() || birthDate.isEmpty()){

            if (birthDate.isEmpty()){
                model.addAttribute("birthDateError", "Please fill the correct date");
            } else {
                model.addAttribute("birthDateError", null);
            }


            model.addAttribute("birth", owner.getBirthDate());
            model.addAttribute("owners", ownerPage);
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("owner", owner);

            return "owners";

        } else {
            ownerService.saveOwner(owner);
            return "redirect:owners";
        }
    }
}
