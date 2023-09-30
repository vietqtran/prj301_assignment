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
import vietqtran.model.Cart;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class CartDAO extends DBContext implements IDAO<Cart> {

    @Override
    public void add(Cart t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.INSERT_CART);
            ps.setLong(1, t.getUserId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Cart> getAll() throws SQLException {
        List<Cart> result = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_CARTS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart(
                        rs.getLong(1),
                        rs.getLong(2)
                );
                result.add(cart);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Cart get(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_CART_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(
                        rs.getLong(1),
                        rs.getLong(2)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Cart t) throws SQLException {

    }

    @Override
    public void delete(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.DELETE_CART);
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
