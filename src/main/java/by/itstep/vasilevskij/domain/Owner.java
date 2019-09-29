package by.itstep.vasilevskij.domain;

import by.itstep.vasilevskij.domain.AbstractClasses.AbstractEntity;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

@Data
@Table(name = "owner")
@Entity
public class Owner extends AbstractEntity {

    @NotBlank(message = "Заполни поле")
    private String firstName;

    @NotBlank(message = "Заполни поле")
    private String lastName;

    @NotBlank(message = "Заполни поле")
    private String surName;

    private LocalDate birthDate;

}
