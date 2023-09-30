/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class Cart {

    private long id;
    private long userId;

    public Cart() {
    }

    public Cart(long id, long userId) {
        this.id = id;
        this.userId = userId;
    }
    
    public Cart(long userId) {
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Cart{" + "id=" + id + ", userId=" + userId + '}';
    }

}
