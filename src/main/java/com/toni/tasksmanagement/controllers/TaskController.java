package com.toni.tasksmanagement.controllers;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.Status;
import com.toni.tasksmanagement.models.Task;
import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.services.ProjectService;
import com.toni.tasksmanagement.services.TaskService;
import com.toni.tasksmanagement.services.UserService;
import com.toni.tasksmanagement.validators.TaskValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDate;
import java.util.List;


@Controller
public class TaskController {

    private final TaskService tService;

    private final UserService uService;

    private final ProjectService pService;

    public TaskController(TaskService tService, UserService uService, ProjectService pService, TaskValidator validator) {
        this.tService = tService;
        this.uService = uService;
        this.pService = pService;
        this.validator = validator;
    }

    private final TaskValidator validator;

    public  Long userSessionId(HttpSession session) {
        if(session.getAttribute("userId") == null)
            return null;
        return (Long)session.getAttribute("userId");
    }

    @GetMapping("/task/create")
    public String showEmptyTaskForm(@ModelAttribute("newTask") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        return "createNewTask";
    }

    @PostMapping("/task/create")
    public String createNewTask(@Valid @ModelAttribute("newTask") Task task, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return "createNewTask";
        }
        tService.createTask(task);
        return "redirect:/tasks";
    }

    @GetMapping("/tasks")
    public String showTasks( Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        List<Task> tasks = tService.findAllTasks();
        model.addAttribute("tasks",tasks);
        model.addAttribute("notCompleted", false);
        return "tasks";
    }

    @GetMapping("/tasks/notCompleted")
    public String showTasksNotCompleted( Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        List<Task> tasks = tService.findByStatusNotHaving("Completed");
        model.addAttribute("tasks",tasks);
        model.addAttribute("notCompleted", true);
        return "tasks";
    }

    @GetMapping("/task/{id}")
    public String editTask(@ModelAttribute("task") Task task, @PathVariable("id") Long id, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("task",this.tService.getTaskById(id));
        model.addAttribute("proj", this.pService.getAllProject());
        return "editTask";
    }

    @PostMapping("/task/{id}")
    public String updateTask(@Valid @ModelAttribute("task") Task task, BindingResult result, @RequestParam("targetDate") @DateTimeFormat(pattern="yyyy-MM-dd") LocalDate trDate, @PathVariable("id") Long id, @RequestParam("name") String name, @RequestParam("description") String desc ) {
        validator.validate(task,result);
        if(result.hasErrors()){
            return "editTask";
        }
        this.tService.updateTask(id,name,desc,trDate);
        return "redirect:/tasks";
    }

    @PostMapping("/addTaskToProj/{id}")
    public String addTaskToProject(@RequestParam("project") Long id, @PathVariable("id") Long taskId){
        Task taskToAddProjTo = this.tService.getTaskById(taskId);
        Project projectToAdd = this.pService.getProjectById(id);
        this.tService.addTaskToProj(taskToAddProjTo,projectToAdd);
        return "redirect:/task/{id}";
    }
    @GetMapping("/tasks/users")
    public String showTasksUser(@ModelAttribute("tasks") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }

        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("users",this.uService.getAllUsers());
        model.addAttribute("selectedUser", null);
        return "taskUserTasks";
    }

    @GetMapping("/tasks/seluser")
    public String showTasksSingleUser(@RequestParam("selectedUser") Long user_id, @ModelAttribute("tasks") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("users",this.uService.getAllUsers());
        User selectedUser = uService.findUserById(user_id);
        model.addAttribute("selectedUser", selectedUser);
        List<Task> ownerTasks = this.tService.findUserTaskOwner(selectedUser);
        model.addAttribute("taskedAssigned",ownerTasks);
        List<Task> freeTasks = this.tService.findFreeTasks();
        model.addAttribute("freeTasks",freeTasks);
        return "taskUserTasks";
    }

    @GetMapping("/task/assign/{id}/{user}")
    public String assignTask(@PathVariable("id") Long taskId,@PathVariable("user") Long user_id, HttpSession session){
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        Task taskToAssignOwner = this.tService.getTaskById(taskId);
        User userToAdd = this.uService.findUserById(user_id);
        this.tService.assignTask(taskToAssignOwner,userToAdd);
        return "redirect:/tasks/users";
    }

    @GetMapping("/task/unassign/{id}")
    public String unAssignTask(@PathVariable("id") Long taskId, HttpSession session){
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        Task taskToRemoveOwner = this.tService.getTaskById(taskId);
        this.tService.unAssignTask(taskToRemoveOwner);
        return "redirect:/tasks/users";
    }

    @GetMapping("delete/task/{id}")
    public String delTask(@PathVariable("id") Long id, @ModelAttribute("task") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("task",this.tService.getTaskById(id));
        return "delTask";
    }

    @PostMapping ("/delete/{id}")
    public String deleteTask(@PathVariable("id") Long id){
        this.tService.deleteTask(id);
        return "redirect:/tasks";
    }

    @GetMapping("/mytasks")
    public String showMyTasksNew(@ModelAttribute("newTasks") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("newTasks",this.tService.findTaskUserStatus(user,"New"));
        model.addAttribute("progTasks",this.tService.findTaskUserStatus(user,"In progress"));
        model.addAttribute("pendTasks",this.tService.findTaskUserStatus(user,"Pending"));
        model.addAttribute("status", Status.Statuses);
        return "myTasks";
    }
    @GetMapping("/mytasksupd/{id}")
    public String showMyTasksUpdated(@RequestParam("selectedStatus") String statusUp,@PathVariable("id") Long task_id ,@ModelAttribute("newTasks") Task task, Model model, HttpSession session) {
        Long userId = this.userSessionId(session);
        if (userId == null){
            return "redirect:/";
        }
        if(statusUp != null){
            this.tService.updateStatus(this.tService.getTaskById(task_id),statusUp);
        }
        User user = uService.findUserById((Long) session.getAttribute("userId"));
        model.addAttribute("user",user);
        model.addAttribute("newTasks",this.tService.findTaskUserStatus(user,"New"));
        model.addAttribute("progTasks",this.tService.findTaskUserStatus(user,"In progress"));
        model.addAttribute("pendTasks",this.tService.findTaskUserStatus(user,"Pending"));
        model.addAttribute("status", Status.Statuses);
        return "myTasks";
    }

}
