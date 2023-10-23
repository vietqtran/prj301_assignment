/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class ShipCompany {

    private long id;
    private String name;
    private double price;
    private String image;

    public ShipCompany() {
    }

    public ShipCompany(long id, String name, double price, String image) {
	this.id = id;
	this.name = name;
	this.price = price;
	this.image = image;
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

    public double getPrice() {
	return price;
    }

    public void setPrice(double price) {
	this.price = price;
    }

    public String getImage() {
	return image;
    }

    public void setImage(String image) {
	this.image = image;
    }

}
