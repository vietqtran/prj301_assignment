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
import vietqtran.global.Global;
import vietqtran.model.CartProduct;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class CartProductDAO extends DBContext implements IDAO<CartProduct> {

    @Override
    public void add(CartProduct t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.INSERT_CART_PRODUCT);
            ps.setLong(1, t.getProductId());
            ps.setLong(2, t.getCartId());
            ps.setLong(3, t.getShopId());
            ps.setInt(4, t.getQuantity());
            ps.setDouble(5, t.getPrice());
            ps.setDouble(6, t.getSalePrice());
            ps.setDouble(7, t.getTotalPrice());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<CartProduct> getAll() throws SQLException {
        List<CartProduct> result = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_CART_PRODUCTS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartProduct cartProduct = new CartProduct(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getDouble(8)
                );
                result.add(cartProduct);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public CartProduct get(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_CART_PRODUCT_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new CartProduct(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getInt(5),
                        rs.getDouble(6),
                        rs.getDouble(7),
                        rs.getDouble(8)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(CartProduct t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.UPDATE_CART_PRODUCT);
            ps.setInt(1, t.getQuantity());
            ps.setDouble(2, t.getPrice());
            ps.setDouble(3, t.getSalePrice());
            ps.setDouble(4, t.getTotalPrice());
            ps.setLong(5, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.DELETE_CART_PRODUCT);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    public void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }

}
