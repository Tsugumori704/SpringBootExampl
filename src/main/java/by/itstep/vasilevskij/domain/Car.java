package by.itstep.vasilevskij.domain;

import by.itstep.vasilevskij.domain.AbstractClasses.AbstractEntity;
import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@Entity
public class Car extends AbstractEntity {

    @NotBlank(message = "Заполни поле")
    private String mark;

    @NotBlank(message = "Заполни поле")
    private String model;

    @Pattern(regexp = "[a-z0-9]{17}")
    private String vin;

    @NotBlank
    private String color;

    @Override
    public String toString() {
        return "Car{" +
                "mark='" + mark + '\'' +
                ", model='" + model + '\'' +
                ", vin='" + vin + '\'' +
                ", color='" + color + '\'' +
                ", id='" + getId() + '\'' +
                '}';
    }
}
