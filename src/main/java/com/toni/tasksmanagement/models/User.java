package com.toni.tasksmanagement.models;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Firstname must not be blank")
    private String firstName;

    @NotBlank(message = "Lastname Name must not be blank")
    private String lastName;

    @NotBlank(message ="Email must not be blank.")
    @Email(message="Email must be valid.")
    private String email;

    @NotBlank(message="Password must not be blank.")
    @Size(min =8,message = "Password must be at least 8 characters long .")
    private String password;

    @NotBlank(message="Password Confirm must not be blank.")
    @Transient
    private String passwordConfirmation;

    @Column(updatable=false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    private Date updatedAt;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="creator")
    private List<Project> projectCreated;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="taskCreator")
    private List<Task> taskCreated;

    @OneToMany(fetch=FetchType.LAZY, mappedBy="taskOwner")
    private List<Task> taskOwned;

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }

    public User() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordConfirmation() {
        return passwordConfirmation;
    }

    public void setPasswordConfirmation(String passwordConfirmation) {
        this.passwordConfirmation = passwordConfirmation;
    }


    public List<Project> getProjectCreated() {
        return projectCreated;
    }

    public void setProjectCreated(List<Project> projectCreated) {
        this.projectCreated = projectCreated;
    }

    public List<Task> getTaskCreated() {
        return taskCreated;
    }

    public void setTaskCreated(List<Task> taskCreated) {
        this.taskCreated = taskCreated;
    }

    public List<Task> getTaskOwned() {
        return taskOwned;
    }

    public void setTaskOwned(List<Task> taskOwned) {
        this.taskOwned = taskOwned;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }
}
