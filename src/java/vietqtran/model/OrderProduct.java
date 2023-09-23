/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class OrderProduct {

    private long id;
    private long orderId;
    private long productId;
    private double productPrice;
    private int quantity;
    private double totalPrice;
    private double salePrice;
    private String imageUrl;

    public OrderProduct() {
    }

    public OrderProduct(long id, long orderId, long productId, double productPrice, int quantity, double totalPrice, double salePrice, String imageUrl) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.salePrice = salePrice;
        this.imageUrl = imageUrl;
    }

    public OrderProduct(long orderId, long productId, double productPrice, int quantity, double totalPrice, double salePrice, String imageUrl) {
        this.orderId = orderId;
        this.productId = productId;
        this.productPrice = productPrice;
        this.quantity = quantity;
        this.totalPrice = totalPrice;
        this.salePrice = salePrice;
        this.imageUrl = imageUrl;
    }

    public long getId() {
        return id;
    }

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Override
    public String toString() {
        return "OrderProduct{" + "id=" + id + ", orderId=" + orderId + ", productId=" + productId + ", productPrice=" + productPrice + ", quantity=" + quantity + ", totalPrice=" + totalPrice + ", salePrice=" + salePrice + ", imageUrl=" + imageUrl + '}';
    }

}
