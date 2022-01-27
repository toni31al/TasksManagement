package com.toni.tasksmanagement.controllers;

import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.services.UserService;
import com.toni.tasksmanagement.validators.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class UserController {
    @Autowired
    private UserService uService;
    @Autowired
    private UserValidator validator;

   @GetMapping("/")
    public String index() {
        return "loginPage";
    }

    public  Long userSessionId(HttpSession session) {
        if(session.getAttribute("userId") == null)
            return null;
        return (Long)session.getAttribute("userId");
    }

    @GetMapping("/home")
    public String Home(Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
       return "Home";
    }

    @GetMapping("/login")
    public String login() {
        return "loginPage";
    }

   @GetMapping("/logout")
    public String logout(HttpSession session) {
        // invalidate session
        session.invalidate();
        // redirect to login page
        return ("redirect:/login");
    }

    @PostMapping("/login")
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        // if the user is authenticated, save their user id in session
        boolean isAuthenticated = uService.authenticateUser(email, password);
        if(isAuthenticated){
            User u = uService.findByEmail(email);
            session.setAttribute("userId",u.getId());
            session.setAttribute("fullname",u.getFirstName() + " " + u.getLastName());
            return "redirect:/home";
        }else {
            // else, add error messages and return the login page
            model.addAttribute("error","Invalid credentials. Please try again!");
            return "loginPage";
        }
    }

    @GetMapping("/registration")
    public String registerForm( @ModelAttribute("user") User user){
        return "registrationPage";
    }

    @PostMapping("/registration")
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session){
        validator.validate(user, result);
        if(result.hasErrors()){
            return "registrationPage";
        }
        uService.registerUserRole(user);
        return "redirect:/login";
    }

}
