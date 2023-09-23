/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class UserRole {

    private long id;
    private String userType;

    public UserRole() {
    }

    public UserRole(long id, String userType) {
        this.id = id;
        this.userType = userType;
    }

    public UserRole(String userType) {
        this.userType = userType;
    }

    public long getId() {
        return id;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "UserRole{" + "id=" + id + ", userType=" + userType + '}';
    }

}
