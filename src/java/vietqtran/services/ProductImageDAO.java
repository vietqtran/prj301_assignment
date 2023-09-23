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
import vietqtran.model.ProductImage;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ProductImageDAO extends DBContext implements IDAO<ProductImage> {
    
    @Override
    public void add(ProductImage t) throws SQLException {
        String sql = "INSERT INTO productImages (productId, imageUrl, [role])\n"
                + "VALUES (?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, t.getProductId());
            ps.setString(2, t.getImageUrl());
            ps.setInt(3, t.getRole());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public List<ProductImage> getAll() throws SQLException {
        List<ProductImage> result = new ArrayList<>();
        String sql = "SELECT * FROM productImages";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductImage image = new ProductImage(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getInt(4));
                result.add(image);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public ProductImage get(long id) throws SQLException {
        String sql = "SELECT * FROM productImages WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductImage(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getInt(4)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public void update(ProductImage t) throws SQLException {
        String sql = "UPDATE productImages "
                + "SET [imageUrl] = ?,"
                + "[role] = ? "
                + "WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getImageUrl());
            ps.setInt(2, t.getRole());
            ps.setLong(3, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM productImages WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    public static void main(String[] args) throws SQLException {
        ProductImageDAO dao = new ProductImageDAO();
        
        dao.add(new ProductImage(3, "url", 1));
        dao.delete(1);
//        dao.update(new ProductImage(1, 3, "url update", 2));
        for (ProductImage productImage : dao.getAll()) {
            System.out.println(productImage);
        }
        System.out.println(dao.get(2));
    }
    
}
