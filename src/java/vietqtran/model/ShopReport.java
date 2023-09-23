/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.model;

/**
 *
 * @author tranq
 */
public class ShopReport {

    private long id;
    private long shopId;
    private double profit; //Loi nhuan
    private double revenue; //Doanh thu
    private double expense; //Chi phi
    private long amountOrders;
    private long amountProducts;

    public ShopReport() {
    }

    public ShopReport(long id, long shopId, double profit, double revenue, double expense, long amountOrders, long amountProducts) {
        this.id = id;
        this.shopId = shopId;
        this.profit = profit;
        this.revenue = revenue;
        this.expense = expense;
        this.amountOrders = amountOrders;
        this.amountProducts = amountProducts;
    }

    public ShopReport(long shopId, double profit, double revenue, double expense, long amountOrders, long amountProducts) {
        this.shopId = shopId;
        this.profit = profit;
        this.revenue = revenue;
        this.expense = expense;
        this.amountOrders = amountOrders;
        this.amountProducts = amountProducts;
    }

    public long getId() {
        return id;
    }

    public long getShopId() {
        return shopId;
    }

    public double getProfit() {
        return profit;
    }

    public void setProfit(double profit) {
        this.profit = profit;
    }

    public double getRevenue() {
        return revenue;
    }

    public void setRevenue(double revenue) {
        this.revenue = revenue;
    }

    public double getExpense() {
        return expense;
    }

    public void setExpense(double expense) {
        this.expense = expense;
    }

    public long getAmountOrders() {
        return amountOrders;
    }

    public void setAmountOrders(long amountOrders) {
        this.amountOrders = amountOrders;
    }

    public long getAmountProducts() {
        return amountProducts;
    }

    public void setAmountProducts(long amountProducts) {
        this.amountProducts = amountProducts;
    }

    @Override
    public String toString() {
        return "ShopReport{" + "shopId=" + shopId + ", profit=" + profit + ", revenue=" + revenue + ", expense=" + expense + ", amountOrders=" + amountOrders + ", amountProducts=" + amountProducts + '}';
    }

}
