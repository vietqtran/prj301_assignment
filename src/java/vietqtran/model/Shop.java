/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

import java.sql.Date;

/**
 *
 * @author tranq
 */
public class Shop {

    private long id;
    private String email;
    private String password;
    private String name;
    private String address;
    private Date createDate;
    private boolean active;
    private String avatar;

    public Shop() {
    }

    public Shop(long id, String email, String password, String name, String address, Date createDate, boolean active, String avatar) {
	this.id = id;
	this.email = email;
	this.password = password;
	this.name = name;
	this.address = address;
	this.createDate = createDate;
	this.active = active;
	this.avatar = avatar;
    }

    public Shop(String email, String password, String name, String address, boolean active, String avatar) {
	this.email = email;
	this.password = password;
	this.name = name;
	this.address = address;
	this.active = active;
	this.avatar = avatar;
    }

    public long getId() {
	return id;
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

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

    public Date getCreateDate() {
	return createDate;
    }

    public boolean isActive() {
	return active;
    }

    public void setActive(boolean active) {
	this.active = active;
    }

    public String getAvatar() {
	return avatar;
    }

    public void setAvatar(String avatar) {
	this.avatar = avatar;
    }
}
