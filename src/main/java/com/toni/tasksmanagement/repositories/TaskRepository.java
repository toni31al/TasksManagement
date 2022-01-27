package com.toni.tasksmanagement.repositories;

import com.toni.tasksmanagement.models.Task;
import com.toni.tasksmanagement.models.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaskRepository extends CrudRepository<Task,Long> {
    List<Task> findByTaskCreator(User user);
    List<Task> findByTaskOwner(User user);
    List<Task> findByTaskOwnerIsNullAndStatusIsNotLike(String status);
    List<Task> findAll();
    List<Task> findByProject(String project);
    List<Task> findByProjectIsNot(String project);
    List<Task> findByStatus(String status);
    List<Task> findByStatusIsNot(String status);
    List<Task> findByTaskOwnerAndStatusIsLike(User user, String status);
}
