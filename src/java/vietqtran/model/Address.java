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
    private String detail;
    private String town;
    private String district;
    private String city;

    public Address() {
    }

    public Address(long id, String detail, String town, String district, String city) {
        this.id = id;
        this.detail = detail;
        this.town = town;
        this.district = district;
        this.city = city;
    }

    public Address(String detail, String town, String district, String city) {
        this.detail = detail;
        this.town = town;
        this.district = district;
        this.city = city;
    }

    public long getId() {
        return id;
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

    @Override
    public String toString() {
        return "Address{" + "id=" + id + ", detail=" + detail + ", town=" + town + ", district=" + district + ", city=" + city + '}';
    }

}
