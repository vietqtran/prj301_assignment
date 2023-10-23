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
public class Product {

    private long id;
    private String name;
    private double price;
    private double salePrice;
    private String description;
    private String city;
    private double rate;
    private Date createDate;
    private int boughtQuantity;
    private long color;
    private long categoryId;
    private long shopCategoryId;
    private long shopId;
    private String createBy;
    private String deleteBy;
    private String url;

    public Product() {
    }

    public Product(long id, String name, double price, double salePrice, String description, String city, double rate, Date createDate, int boughtQuantity, long color, long categoryId, long shopCategoryId, long shopId, String createBy, String deleteBy, String url) {
	this.id = id;
	this.name = name;
	this.price = price;
	this.salePrice = salePrice;
	this.description = description;
	this.city = city;
	this.rate = rate;
	this.createDate = createDate;
	this.boughtQuantity = boughtQuantity;
	this.color = color;
	this.categoryId = categoryId;
	this.shopCategoryId = shopCategoryId;
	this.shopId = shopId;
	this.createBy = createBy;
	this.deleteBy = deleteBy;
	this.url = url;
    }

    public Product(String name, double price, double salePrice, String description, String city, double rate, int boughtQuantity, long color, long categoryId, long shopCategoryId, long shopId, String createBy, String deleteBy, String url) {
	this.name = name;
	this.price = price;
	this.salePrice = salePrice;
	this.description = description;
	this.city = city;
	this.rate = rate;
	this.boughtQuantity = boughtQuantity;
	this.color = color;
	this.categoryId = categoryId;
	this.shopCategoryId = shopCategoryId;
	this.shopId = shopId;
	this.createBy = createBy;
	this.deleteBy = deleteBy;
	this.url = url;
    }

    public long getId() {
	return id;
    }

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
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

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public String getCity() {
	return city;
    }

    public void setCity(String city) {
	this.city = city;
    }

    public double getRate() {
	return rate;
    }

    public void setRate(double rate) {
	this.rate = rate;
    }

    public Date getCreateDate() {
	return createDate;
    }

    public int getBoughtQuantity() {
	return boughtQuantity;
    }

    public void setBoughtQuantity(int boughtQuantity) {
	this.boughtQuantity = boughtQuantity;
    }

    public long getColor() {
	return color;
    }

    public void setColor(long color) {
	this.color = color;
    }

    public long getCategoryId() {
	return categoryId;
    }

    public void setCategoryId(long categoryId) {
	this.categoryId = categoryId;
    }

    public long getShopCategoryId() {
	return shopCategoryId;
    }

    public void setShopCategoryId(long shopCategoryId) {
	this.shopCategoryId = shopCategoryId;
    }

    public long getShopId() {
	return shopId;
    }

    public void setShopId(long shopId) {
	this.shopId = shopId;
    }

    public String getCreateBy() {
	return createBy;
    }

    public void setCreateBy(String createBy) {
	this.createBy = createBy;
    }

    public String getDeleteBy() {
	return deleteBy;
    }

    public void setDeleteBy(String deleteBy) {
	this.deleteBy = deleteBy;
    }

    public String getUrl() {
	return url;
    }

    public void setUrl(String url) {
	this.url = url;
    }

    @Override
    public String toString() {
	return "Product{" + "id=" + id + ", name=" + name + ", price=" + price + ", salePrice=" + salePrice + ", description=" + description + ", city=" + city + ", rate=" + rate + ", createDate=" + createDate + ", boughtQuantity=" + boughtQuantity + ", color=" + color + ", categoryId=" + categoryId + ", shopCategoryId=" + shopCategoryId + ", shopId=" + shopId + ", createBy=" + createBy + ", deleteBy=" + deleteBy + ", url=" + url + '}';
    }

}
