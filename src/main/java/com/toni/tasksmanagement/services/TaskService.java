package com.toni.tasksmanagement.services;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.Status;
import com.toni.tasksmanagement.models.Task;
import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.repositories.TaskRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

@Service
public class TaskService {
    private final TaskRepository tRepo;

    public TaskService(TaskRepository tRepo) {
        this.tRepo = tRepo;
    }

    public void assignTask(Task task, User user) {
        task.setTaskOwner(user);
        tRepo.save(task);
    }
    public void unAssignTask(Task task) {
        task.setTaskOwner(null);
        task.setStatus("New");
        tRepo.save(task);
    }

    public List<Task> findUserTaskOwner(User user){
        return tRepo.findByTaskOwner(user);
    }

    public List<Task> findUserTaskCreator(User user){
        return tRepo.findByTaskCreator(user);
    }

    public List<Task> findFreeTasks(){
        return tRepo.findByTaskOwnerIsNullAndStatusIsNotLike("Completed");
    }

    public Task createTask(Task task){
        return  this.tRepo.save(task);
    }

    public Task updateTask(Long id, String name, String description, LocalDate targetD) {
        Task task = getTaskById(id);
        task.setName(name);
        task.setDescription(description);
        task.setTargetDate(targetD);
        return this.tRepo.save(task);
    }

    public void updateStatus(Task task, String status){
        task.setStatus(status);
        this.tRepo.save(task);
    }

    public Task getTaskById(Long id){
        return this.tRepo.findById(id).orElse(null);
    }

    public List<Task> findAllTasks(){
        return this.tRepo.findAll();
    }

    public void addTaskToProj(Task task, Project project){
       task.setProject(project);
       task.setStatus(Status.Statuses[0]);
        this.tRepo.save(task);
    }

    public List<Task> findByStatus(String st){
        return this.tRepo.findByStatus(st);
    }

    public List<Task> findByStatusNotHaving(String st){
        return this.tRepo.findByStatusIsNot(st);
    }

    public void deleteTask(long id){
        this.tRepo.deleteById(id);
    }

    public List<Task> findTaskUserStatus(User user, String status){
        return this.tRepo.findByTaskOwnerAndStatusIsLike(user,status);
    }

}
