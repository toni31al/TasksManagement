package com.toni.tasksmanagement.repositories;

import com.toni.tasksmanagement.models.Role;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleRepository extends CrudRepository<Role,Long> {
    List<Role> findAll();

    List<Role> findByName(String name);

}
