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
public class Order {

    private long id;
    private long userId;
    private long shopId;
    private long shipperId;
    private double totalPrice;
    private double saleTotalPrice;
    private Date orderDate;
    private Date successDate;
    private String phone;
    private String address;
    private long voucherId;
    private String status;
    private String note;
    private String deliveryChecking;

    public Order() {
    }

    public Order(long id, long userId, long shopId, long shipperId, double totalPrice, double saleTotalPrice, Date orderDate, Date successDate, String phone, String address, long voucherId, String status, String note, String deliveryChecking) {
	this.id = id;
	this.userId = userId;
	this.shopId = shopId;
	this.shipperId = shipperId;
	this.totalPrice = totalPrice;
	this.saleTotalPrice = saleTotalPrice;
	this.orderDate = orderDate;
	this.successDate = successDate;
	this.phone = phone;
	this.address = address;
	this.voucherId = voucherId;
	this.status = status;
	this.note = note;
	this.deliveryChecking = deliveryChecking;
    }

    public Order(long userId, long shopId, long shipperId, double totalPrice, double saleTotalPrice, Date successDate, String phone, String address, long voucherId, String note, String deliveryChecking) {
	this.userId = userId;
	this.shopId = shopId;
	this.shipperId = shipperId;
	this.totalPrice = totalPrice;
	this.saleTotalPrice = saleTotalPrice;
	this.successDate = successDate;
	this.phone = phone;
	this.address = address;
	this.voucherId = voucherId;
	this.note = note;
	this.deliveryChecking = deliveryChecking;
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

    public long getShopId() {
	return shopId;
    }

    public void setShopId(long shopId) {
	this.shopId = shopId;
    }

    public long getShipperId() {
	return shipperId;
    }

    public void setShipperId(long shipperId) {
	this.shipperId = shipperId;
    }

    public double getTotalPrice() {
	return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
	this.totalPrice = totalPrice;
    }

    public double getSaleTotalPrice() {
	return saleTotalPrice;
    }

    public void setSaleTotalPrice(double saleTotalPrice) {
	this.saleTotalPrice = saleTotalPrice;
    }

    public Date getOrderDate() {
	return orderDate;
    }

    public Date getSuccessDate() {
	return successDate;
    }

    public void setSuccessDate(Date successDate) {
	this.successDate = successDate;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getAddress() {
	return address;
    }

    public void setAddress(String address) {
	this.address = address;
    }

    public long getVoucherId() {
	return voucherId;
    }

    public void setVoucherId(long voucherId) {
	this.voucherId = voucherId;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }

    public String getNote() {
	return note;
    }

    public void setNote(String note) {
	this.note = note;
    }

    public String getDeliveryChecking() {
	return deliveryChecking;
    }

    public void setDeliveryChecking(String deliveryChecking) {
	this.deliveryChecking = deliveryChecking;
    }

    @Override
    public String toString() {
	return "Order{" + "id=" + id + ", userId=" + userId + ", shopId=" + shopId + ", shipperId=" + shipperId + ", totalPrice=" + totalPrice + ", saleTotalPrice=" + saleTotalPrice + ", orderDate=" + orderDate + ", successDate=" + successDate + ", phone=" + phone + ", address=" + address + ", voucherId=" + voucherId + ", status=" + status + ", note=" + note + ", deliveryChecking=" + deliveryChecking + '}';
    }

}
