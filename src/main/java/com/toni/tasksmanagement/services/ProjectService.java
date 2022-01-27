package com.toni.tasksmanagement.services;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.Task;
import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.repositories.ProjectRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectService {

    private final ProjectRepository pRepo;

    public ProjectService(ProjectRepository pRepo) {
        this.pRepo = pRepo;
    }

    public List<Project> getAllProject(){
        return this.pRepo.findAll();
    }

    public Project createProject(Project project){
        return  this.pRepo.save(project);
    }

    public List<Project> getAllCreatorNotNull(){
        return this.pRepo.findByCreatorNotNull();
    }

    public Project getProjectById(Long id){
        return this.pRepo.findById(id).orElse(null);
    }

    public void deleteProject(long id){
        this.pRepo.deleteById(id);
    }



}
