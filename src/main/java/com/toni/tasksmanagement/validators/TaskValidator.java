package com.toni.tasksmanagement.validators;

import com.toni.tasksmanagement.models.Task;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.time.LocalDate;

@Component
public class TaskValidator implements Validator {
    // 1
    public boolean supports(Class<?> clazz) {
        return Task.class.equals(clazz);
    }

    // 2

    public void validate(Object target, Errors errors) {
        Task task = (Task) target;

        LocalDate trDate = task.getTargetDate();


        if(trDate.isBefore(LocalDate.now())){
            errors.rejectValue("TargetDate","Date must be grater");
        }
    }
}
