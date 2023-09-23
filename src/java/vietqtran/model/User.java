/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class User {

    private long id;
    private String usernanme;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;
    private int role;
    private String avatar;

    public User() {
    }

    public User(long id, String usernanme, String password, String firstName, String lastName, String email, String phone, int role, String avatar) {
        this.id = id;
        this.usernanme = usernanme;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
    }

    public User(String usernanme, String password, String firstName, String lastName, String email, String phone, int role, String avatar) {
        this.usernanme = usernanme;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.avatar = avatar;
    }
    
    public long getId() {
        return id;
    }

    public String getUsernanme() {
        return usernanme;
    }

    public void setUsernanme(String usernanme) {
        this.usernanme = usernanme;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", usernanme=" + usernanme + ", password=" + password + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", phone=" + phone + ", role=" + role + ", avatar=" + avatar + '}';
    }

}
