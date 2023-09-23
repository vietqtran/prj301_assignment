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
import vietqtran.model.Shop;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShopDAO extends DBContext implements IDAO<Shop> {

    @Override
    public void add(Shop t) throws SQLException {
        String sql = "INSERT INTO shops (userId, [name], [address], active, rate, avatar, cover)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, t.getUserId());
            ps.setString(2, t.getName());
            ps.setString(3, t.getAddress());
            ps.setBoolean(4, t.isActive());
            ps.setDouble(5, t.getRate());
            ps.setString(6, t.getAvatar());
            ps.setString(7, t.getCover());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Shop> getAll() throws SQLException {
        List<Shop> result = new ArrayList<>();
        String sql = "SELECT * FROM shops";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Shop shop = new Shop(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9));
                result.add(shop);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Shop get(long id) throws SQLException {
        String sql = "SELECT * FROM shops WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Shop(
                        rs.getLong(1),
                        rs.getLong(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDate(5),
                        rs.getBoolean(6),
                        rs.getDouble(7),
                        rs.getString(8),
                        rs.getString(9)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Shop t) throws SQLException {
        String sql = "UPDATE shops\n"
                + "SET\n"
                + "    [name] = ?,\n"
                + "    [address] = ?,\n"
                + "    active = ?,\n"
                + "    rate = ?,\n"
                + "    avatar = ?,\n"
                + "    cover = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getAddress());
            ps.setBoolean(3, t.isActive());
            ps.setDouble(4, t.getRate());
            ps.setString(5, t.getAvatar());
            ps.setString(6, t.getCover());
            ps.setLong(7, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM shops WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    public static void main(String[] args) throws SQLException {
        ShopDAO dao = new ShopDAO();
        dao.add(new Shop(1, "shopname", "address", true, 1, "avatar", "cover"));
    }
}
