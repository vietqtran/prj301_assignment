/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class CartProduct {

    private long productId;
    private long cartId;
    private long shopId;
    private int quantity;
    private double price;
    private double salePrice;
    private double totalPrice;

    public CartProduct() {
    }

    public CartProduct(long productId, long cartId, long shopId, int quantity, double price, double salePrice, double totalPrice) {
        this.productId = productId;
        this.cartId = cartId;
        this.shopId = shopId;
        this.quantity = quantity;
        this.price = price;
        this.salePrice = salePrice;
        this.totalPrice = totalPrice;
    }

    public CartProduct(long cartId, long shopId, int quantity, double price, double salePrice, double totalPrice) {
        this.cartId = cartId;
        this.shopId = shopId;
        this.quantity = quantity;
        this.price = price;
        this.salePrice = salePrice;
        this.totalPrice = totalPrice;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public long getCartId() {
        return cartId;
    }

    public void setCartId(long cartId) {
        this.cartId = cartId;
    }

    public long getShopId() {
        return shopId;
    }

    public void setShopId(long shopId) {
        this.shopId = shopId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "CartProduct{" + "productId=" + productId + ", cartId=" + cartId + ", shopId=" + shopId + ", quantity=" + quantity + ", price=" + price + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + '}';
    }

}
