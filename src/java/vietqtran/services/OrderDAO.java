/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.services;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vietqtran.db.DBContext;
import vietqtran.model.Order;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class OrderDAO extends DBContext implements IDAO<Order> {
    
    @Override
    public void add(Order t) throws SQLException {
        String sql = "INSERT INTO [orders] ("
                + "[userId], "
                + "[shopId], "
                + "[shipperId], "
                + "[totalPrice], "
                + "[saleTotalPrice], "
                + "[successDate], "
                + "[phone], "
                + "[address], "
                + "[status], "
                + "[voucherId], "
                + "[note], "
                + "[deliveryChecking])\n"
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, t.getUserId());
            ps.setLong(2, t.getShopId());
            ps.setLong(3, t.getShipperId());
            ps.setDouble(4, t.getTotalPrice());
            ps.setDouble(5, t.getSaleTotalPrice());
            ps.setDate(6, t.getSuccessDate());
            ps.setString(7, t.getPhone());
            ps.setString(8, t.getAddress());
            ps.setString(9, t.getStatus());
            ps.setLong(10, t.getVoucherId());
            ps.setString(11, t.getNote());
            ps.setString(12, t.getDeliveryChecking());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public List<Order> getAll() throws SQLException {
        List<Order> result = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getLong(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14)
                );
                result.add(order);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public Order get(long id) throws SQLException {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getLong(3),
                        rs.getLong(4),
                        rs.getDouble(5),
                        rs.getDouble(6),
                        rs.getDate(7),
                        rs.getDate(8),
                        rs.getString(9),
                        rs.getString(10),
                        rs.getLong(11),
                        rs.getString(12),
                        rs.getString(13),
                        rs.getString(14)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    @Override
    public void update(Order t) throws SQLException {
        String sql = "UPDATE [orders]\n"
                + "SET\n"
                + "    [userId] = ?,\n"
                + "    [shipperId] = ?,\n"
                + "    [totalPrice] = ?,\n"
                + "    [saleTotalPrice] = ?,\n"
                + "    [successDate] = ?,\n"
                + "    [phone] = ?,\n"
                + "    [address] = ?,\n"
                + "    [voucherId] = ?,\n"
                + "    [status] = ?,\n"
                + "    [note] = ?,\n"
                + "    [deliveryChecking] = ?\n"
                + "WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, t.getUserId());
            ps.setLong(2, t.getShipperId());
            ps.setDouble(3, t.getTotalPrice());
            ps.setDouble(4, t.getSaleTotalPrice());
            ps.setDate(5, t.getSuccessDate());
            ps.setString(6, t.getPhone());
            ps.setString(7, t.getAddress());
            ps.setLong(8, t.getVoucherId());
            ps.setString(9, t.getStatus());
            ps.setString(10, t.getNote());
            ps.setString(11, t.getDeliveryChecking());
            ps.setLong(12, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM orders WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
    public static void main(String[] args) throws SQLException {
        OrderDAO dao = new OrderDAO();
        Order order = new Order(2, 2, 2, 1000, 900, null, "0399819939", "hanoi", 1, "prepare", "no", "nop");
//        dao.add(order);
//        Order orderUpdate = new Order(11, 2, 2, 2, 1000, 900, Date.valueOf("2023-09-23"), null, "0399819938", "hanoi update", 1, "prepare update", "no update", "nop update");
//        dao.update(orderUpdate);
//        System.out.println(dao.get(11));
//        for (Order order1 : dao.getAll()) {
//            System.out.println(order1);
//        }
        dao.delete(11);
    }
    
}
