/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class ProductImage {

    private long id;
    private long productId;
    private String imageUrl;
    private int role; // 1-main, 2-sub, ...detail

    public ProductImage() {
    }

    public ProductImage(long id, long productId, String imageUrl, int role) {
        this.id = id;
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.role = role;
    }
    
     public ProductImage(long productId, String imageUrl, int role) {
        this.productId = productId;
        this.imageUrl = imageUrl;
        this.role = role;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "ProductImage{" + "id=" + id + ", productId=" + productId + ", imageUrl=" + imageUrl + ", role=" + role + '}';
    }
    
    
}
