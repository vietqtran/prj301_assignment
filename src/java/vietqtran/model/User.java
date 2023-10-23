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
    private String username;
    private String password;
    private String name;
    private String email;
    private String phone;
    private int role;
    private String avatar;
    private String address;

    public User() {
    }

    public User(long id, String username, String password, String name, String email, String phone, int role, String avatar, String address) {
	this.id = id;
	this.username = username;
	this.password = password;
	this.name = name;
	this.email = email;
	this.phone = phone;
	this.role = role;
	this.avatar = avatar;
	this.address = address;
    }

    public User(String username, String password, String name, String email, String phone, int role, String avatar, String address) {
	this.username = username;
	this.password = password;
	this.name = name;
	this.email = email;
	this.phone = phone;
	this.role = role;
	this.avatar = avatar;
	this.address = address;
    }

    public long getId() {
	return id;
    }

    public String getUsername() {
	return username;
    }

    public void setUsername(String usernanme) {
	this.username = usernanme;
    }

    public String getPassword() {
	return password;
    }

    public void setPassword(String password) {
	this.password = password;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
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

    public String getAddress() {
	return address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

}
