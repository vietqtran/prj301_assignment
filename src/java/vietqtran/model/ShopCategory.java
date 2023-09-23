/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class ShopCategory {

    private long id;
    private String name;
    private long shopId;

    public ShopCategory() {
    }

    public ShopCategory(long id, String name, long shopId) {
        this.id = id;
        this.name = name;
        this.shopId = shopId;
    }

    public ShopCategory(String name, long shopId) {
        this.name = name;
        this.shopId = shopId;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getShopId() {
        return shopId;
    }

    public void setShopId(long shopId) {
        this.shopId = shopId;
    }

    @Override
    public String toString() {
        return "ShopCategory{" + "id=" + id + ", name=" + name + ", shopId=" + shopId + '}';
    }
}
