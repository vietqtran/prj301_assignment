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
    private long userId;
    private String name;
    private String address;
    private Date createDate;
    private boolean active;
    private double rate;
    private String avatar;
    private String cover;

    public Shop() {
    }

    public Shop(long id, long userId, String name, String address, Date createDate, boolean active, double rate, String avatar, String cover) {
        this.id = id;
        this.userId = userId;
        this.name = name;
        this.address = address;
        this.createDate = createDate;
        this.active = active;
        this.rate = rate;
        this.avatar = avatar;
        this.cover = cover;
    }

    //For add
    public Shop(long userId, String name, String address, boolean active, double rate, String avatar, String cover) {
        this.name = name;
        this.userId = userId;
        this.address = address;
        this.active = active;
        this.rate = rate;
        this.avatar = avatar;
        this.cover = cover;
    }

    //For update
    public Shop(long id, long userId, String name, String address, boolean active, double rate, String avatar, String cover) {
        this.id = id;
        this.name = name;
        this.userId = userId;
        this.address = address;
        this.active = active;
        this.rate = rate;
        this.avatar = avatar;
        this.cover = cover;
    }

    public long getId() {
        return id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
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

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    @Override
    public String toString() {
        return "Shop{" + "id=" + id + ", userId=" + userId + ", name=" + name + ", address=" + address + ", createDate=" + createDate + ", active=" + active + ", rate=" + rate + ", avatar=" + avatar + ", cover=" + cover + '}';
    }

}
