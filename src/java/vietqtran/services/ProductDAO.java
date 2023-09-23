/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vietqtran.db.DBContext;
import vietqtran.model.Product;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ProductDAO extends DBContext implements IDAO<Product> {
    
    @Override
    public void add(Product t) throws SQLException {
        String sql = "INSERT INTO products ([name], price, salePrice, [description], city, rate, boughtQuantity, color, categoryId, shopCategoryId, shopId, createBy, [url])"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setDouble(2, t.getPrice());
            ps.setDouble(3, t.getSalePrice());
            ps.setString(4, t.getDescription());
            ps.setString(5, t.getCity());
            ps.setDouble(6, t.getRate());
            ps.setInt(7, t.getBoughtQuantity());
            ps.setLong(8, t.getColor());
            ps.setLong(9, t.getCategoryId());
            ps.setLong(10, t.getShopCategoryId());
            ps.setLong(11, t.getShopId());
            ps.setString(12, t.getCreateBy());
            ps.setString(13, t.getUrl());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public List<Product> getAll() throws SQLException {
        List<Product> result = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getLong(10),
                        rs.getLong(11),
                        rs.getLong(12),
                        rs.getLong(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16)
                );
                result.add(product);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public Product get(long id) throws SQLException {
        String sql = "SELECT * FROM products WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDouble(7),
                        rs.getDate(8),
                        rs.getInt(9),
                        rs.getLong(10),
                        rs.getLong(11),
                        rs.getLong(12),
                        rs.getLong(13),
                        rs.getString(14),
                        rs.getString(15),
                        rs.getString(16)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public void update(Product t) throws SQLException {
        String sql = "UPDATE products\n"
                + "SET\n"
                + "    [name] = ?,\n"
                + "    price = ?,\n"
                + "    salePrice = ?,\n"
                + "    [description] = ?,\n"
                + "    rate = ?,\n"
                + "    city = ?,\n"
                + "    [boughtQuantity] = ?,\n"
                + "    [url] = ?,\n"
                + "    color = ?,\n"
                + "    shopCategoryId = ?,\n,"
                + "    categoryId = ?\n,"
                + "    deleteBy = ?"
                + "WHERE\n"
                + "    id = ?; ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setDouble(2, t.getPrice());
            ps.setDouble(2, t.getSalePrice());
            ps.setString(4, t.getDescription());
            ps.setDouble(5, t.getRate());
            ps.setString(6, t.getCity());
            ps.setInt(7, t.getBoughtQuantity());
            ps.setString(8, t.getUrl());
            ps.setLong(9, t.getColor());
            ps.setLong(10, t.getShopCategoryId());
            ps.setLong(11, t.getCategoryId());
            ps.setString(12, t.getDeleteBy());
            ps.setLong(13, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM products WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    public static void main(String[] args) throws SQLException {
        ProductDAO dao = new ProductDAO();
//        dao.add(new Product("test product", 100000, 100000, "description", "Hanoi", 0, Date.valueOf("2003-03-13"), 0, 1, 1, 1, 1, "admin", "admin", "url"));
        dao.delete(1);
    }
    
}
