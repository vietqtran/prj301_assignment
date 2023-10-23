/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class Address {

    private long id;
    private long userId;
    private String name;
    private String phone;
    private String detail;
    private String town;
    private String district;
    private String city;

    public Address() {
    }

    public Address(long id, long userId, String name, String phone, String detail, String town, String district, String city) {
	this.id = id;
	this.userId = userId;
	this.name = name;
	this.phone = phone;
	this.detail = detail;
	this.town = town;
	this.district = district;
	this.city = city;
    }

    public Address(long userId, String name, String phone, String detail, String town, String district, String city) {
	this.userId = userId;
	this.name = name;
	this.phone = phone;
	this.detail = detail;
	this.town = town;
	this.district = district;
	this.city = city;
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

    public String getName() {
	return name;
    }

    public void setName(String name) {
	this.name = name;
    }

    public String getPhone() {
	return phone;
    }

    public void setPhone(String phone) {
	this.phone = phone;
    }

    public String getDetail() {
	return detail;
    }

    public void setDetail(String detail) {
	this.detail = detail;
    }

    public String getTown() {
	return town;
    }

    public void setTown(String town) {
	this.town = town;
    }

    public String getDistrict() {
	return district;
    }

    public void setDistrict(String district) {
	this.district = district;
    }

    public String getCity() {
	return city;
    }

    public void setCity(String city) {
	this.city = city;
    }

}
