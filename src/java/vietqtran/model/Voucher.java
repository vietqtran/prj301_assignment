/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class Voucher {

    private long id;
    private double priceCondition;
    private double price;
    private int percent;
    private String createBy;
    private String deleteBy;

    public Voucher() {
    }

    public Voucher(long id, double priceCondition, double price, int percent, String createBy, String deleteBy) {
        this.id = id;
        this.priceCondition = priceCondition;
        this.price = price;
        this.percent = percent;
        this.createBy = createBy;
        this.deleteBy = deleteBy;
    }

    public Voucher(double priceCondition, double price, int percent, String createBy, String deleteBy) {
        this.priceCondition = priceCondition;
        this.price = price;
        this.percent = percent;
        this.createBy = createBy;
        this.deleteBy = deleteBy;
    }

    public long getId() {
        return id;
    }

    public double getPriceCondition() {
        return priceCondition;
    }

    public void setPriceCondition(double priceCondition) {
        this.priceCondition = priceCondition;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getPercent() {
        return percent;
    }

    public void setPercent(int percent) {
        this.percent = percent;
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

    @Override
    public String toString() {
        return "Voucher{" + "id=" + id + ", priceCondition=" + priceCondition + ", price=" + price + ", percent=" + percent + ", createBy=" + createBy + ", deleteBy=" + deleteBy + '}';
    }

}
