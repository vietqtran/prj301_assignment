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

    private long id;
    private long productId;
    private long cartId;
    private long shopId;
    private int quantity;
    private long sizeId;

    public CartProduct() {
    }

    public CartProduct(long id, long productId, long cartId, long shopId, int quantity, long sizeId) {
	this.id = id;
	this.productId = productId;
	this.cartId = cartId;
	this.shopId = shopId;
	this.quantity = quantity;
	this.sizeId = sizeId;
    }

    public CartProduct(long productId, long cartId, long shopId, int quantity, long sizeId) {
	this.productId = productId;
	this.cartId = cartId;
	this.shopId = shopId;
	this.quantity = quantity;
	this.sizeId = sizeId;
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

    public long getSizeId() {
	return sizeId;
    }

    public void setSizeId(long sizeId) {
	this.sizeId = sizeId;
    }

}
