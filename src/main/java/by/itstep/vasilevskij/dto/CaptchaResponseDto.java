package by.itstep.vasilevskij.dto;

import com.fasterxml.jackson.annotation.JsonAlias;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;

import java.util.Set;
@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class CaptchaResponseDto {
    private boolean success;
    @JsonAlias("error-codes")
    private Set<String> errorCodes;
}