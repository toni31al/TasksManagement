package com.toni.tasksmanagement.controllers;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.services.ProjectService;
import com.toni.tasksmanagement.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.util.List;

@Controller
public class ProjectController {
    @Autowired
    private ProjectService pService;
    @Autowired
    private UserService uService;

    public Long userSessionId(HttpSession session) {
        if(session.getAttribute("userId") == null)
            return null;
        return (Long)session.getAttribute("userId");
    }

    //new Project
    @GetMapping("/project/new")
    public String newProject(@ModelAttribute("newProject") Project project, Model model, HttpSession session){
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);
        return "newProject";
    }

    @PostMapping("/project/create")
    public String createProject(@Valid @ModelAttribute("newProject")Project project, BindingResult result){
        if(result.hasErrors()){
            return "newProject";
        }else{
            pService.createProject(project);
            return "redirect:/projects";
        }
    }

    @GetMapping("/projects")
    public String showMyProjects(Model model, HttpSession session){
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user", user);
        List<Project> projects = pService.getAllCreatorNotNull();
        model.addAttribute("projects",projects);
        return "showProjects";
    }

    @GetMapping("/project/{id}")
    public String editProject(@PathVariable("id") Long projectID, @ModelAttribute("project") Project project, Model model, HttpSession session){
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("project",this.pService.getProjectById(projectID));
        return "editProj";
    }
    //update project
    @PutMapping("/project/{id}")
    public String editProject(@Valid @ModelAttribute("project") Project project, BindingResult result){
        if(result.hasErrors()){
            return "editProj";
        }
        this.pService.createProject(project);
        return "redirect:/projects";
    }

    @GetMapping("/delete/proj/{id}")
    public String deleteProject(@PathVariable("id") Long id){
        pService.deleteProject(id);
        return "redirect:/projects";
    }

}
