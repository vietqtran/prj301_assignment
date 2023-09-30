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
public class Rate {

    private long id;
    private long userId;
    private long productId;
    private int start;
    private String content;
    private Date date;

    public Rate() {
    }

    public Rate(long id, long userId, long productId, int start, String content, Date date) {
        this.id = id;
        this.userId = userId;
        this.productId = productId;
        this.start = start;
        this.content = content;
        this.date = date;
    }

    public Rate(long userId, long productId, int start, String content, Date date) {
        this.userId = userId;
        this.productId = productId;
        this.start = start;
        this.content = content;
        this.date = date;
    }

    public Rate(long userId, long productId, int start, String content) {
        this.userId = userId;
        this.productId = productId;
        this.start = start;
        this.content = content;
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

    public long getProductId() {
        return productId;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Rate{" + "id=" + id + ", userId=" + userId + ", productId=" + productId + ", start=" + start + ", content=" + content + ", date=" + date + '}';
    }

}
