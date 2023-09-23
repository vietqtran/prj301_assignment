/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class SizeProduct {

    private long id;
    private int inventory;
    private String name;
    private long productId;

    public SizeProduct() {
    }

    public SizeProduct(long id, int inventory, String name, long productId) {
        this.id = id;
        this.inventory = inventory;
        this.name = name;
        this.productId = productId;
    }

    public SizeProduct(int inventory, String name, long productId) {
        this.inventory = inventory;
        this.name = name;
        this.productId = productId;
    }

    public long getId() {
        return id;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    @Override
    public String toString() {
        return "SizeProduct{" + "id=" + id + ", inventory=" + inventory + ", name=" + name + ", productId=" + productId + '}';
    }

}
