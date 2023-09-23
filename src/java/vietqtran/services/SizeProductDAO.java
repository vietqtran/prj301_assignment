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
import vietqtran.model.SizeProduct;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class SizeProductDAO extends DBContext implements IDAO<SizeProduct> {

    @Override
    public void add(SizeProduct t) throws SQLException {
        String sql = "INSERT INTO sizesProduct (inventory, [name], productId)\n"
                + "VALUES (?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, t.getInventory());
            ps.setString(2, t.getName());
            ps.setLong(3, t.getProductId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<SizeProduct> getAll() throws SQLException {
        List<SizeProduct> result = new ArrayList<>();
        String sql = "SELECT * FROM sizesProduct";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SizeProduct size = new SizeProduct(rs.getLong(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getLong(4));
                result.add(size);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public SizeProduct get(long id) throws SQLException {
        String sql = "SELECT * FROM sizesProduct WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new SizeProduct(rs.getLong(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getLong(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(SizeProduct t) throws SQLException {
        String sql = "UPDATE sizesProduct\n"
                + "SET inventory = ?,\n"
                + "    [name] = ?,\n"
                + "    productId = ?\n"
                + "WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, t.getInventory());
            ps.setString(2, t.getName());
            ps.setLong(3, t.getProductId());
            ps.setLong(4, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM sizesProduct WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }


}
