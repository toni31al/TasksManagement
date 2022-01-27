package com.toni.tasksmanagement.services;

import com.toni.tasksmanagement.models.Project;
import com.toni.tasksmanagement.models.User;
import com.toni.tasksmanagement.repositories.RoleRepository;
import com.toni.tasksmanagement.repositories.UserRepository;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository uRepo;
    private final RoleRepository rRepo;

    public UserService(UserRepository uRepo, RoleRepository rRepo) {
        this.uRepo = uRepo;
        this.rRepo = rRepo;
    }

    // register user role user and hash their password
    public User registerUserRole(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setRoles(rRepo.findByName("ROLE_USER"));
        user.setPassword(hashed);
        return uRepo.save(user);
    }

   // register user role admin and hash their password
    public User registerUserAdmin(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setRoles(rRepo.findByName("ROLE_ADMIN"));
        user.setPassword(hashed);
        return uRepo.save(user);
    }

    //// find user by email
    public User findByEmail(String email) {
        return uRepo.findByEmail(email);
    }

    // find user by id

    public User findUserById(Long id) {
        Optional<User> u = uRepo.findById(id);

        if (u.isPresent()) {
            return u.get();
        } else {
            return null;
        }
    }

    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = uRepo.findByEmail(email);
        // if we can't find it by email, return false
        if (user == null) {
            return false;
        } else {
            if (BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }

    public List<User> getAllUsers(){
        return this.uRepo.findAll();
    }
}
