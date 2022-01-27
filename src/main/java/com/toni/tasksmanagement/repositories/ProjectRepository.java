package com.toni.tasksmanagement.repositories;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProjectRepository extends CrudRepository<Project,Long> {
    List<Project> findAll();
    List<Project> findByCreatorNotNull();
}
