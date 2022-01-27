package com.toni.tasksmanagement.validators;

import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.repositories.UserRepository;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class UserValidator implements Validator {
    private final UserRepository uRepo;

    public UserValidator(UserRepository uRepo) {
        this.uRepo = uRepo;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirmation", "Match");
        }
        if (this.uRepo.findByEmail(user.getEmail()) != null) {
            errors.rejectValue("email","Unique", "Email address already exists.");
        }
    }
}
