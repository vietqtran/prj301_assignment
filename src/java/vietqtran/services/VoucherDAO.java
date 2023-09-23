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
import vietqtran.model.Voucher;
import vietqtran.db.DBContext;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class VoucherDAO extends DBContext implements IDAO<Voucher> {

    @Override
    public void add(Voucher t) throws SQLException {
        String sql = "INSERT INTO vouchers (priceCondition, price, [percent], createBy, deleteBy)\n"
                + "VALUES (?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, t.getPriceCondition());
            ps.setDouble(2, t.getPrice());
            ps.setInt(3, t.getPercent());
            ps.setString(4, t.getCreateBy());
            ps.setString(5, t.getDeleteBy());
            ps.executeUpdate();
            closeConnection();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Voucher> getAll() throws SQLException {
        List<Voucher> result = new ArrayList<>();
        String sql = "SELECT * FROM vouchers";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Voucher voucher = new Voucher(rs.getLong(1),
                        rs.getDouble(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6));
                result.add(voucher);
            }
            closeConnection();
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Voucher get(long id) throws SQLException {
        String sql = "SELECT * FROM vouchers WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Voucher(rs.getLong(1),
                        rs.getDouble(2),
                        rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6));
            }
            closeConnection();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Voucher t) throws SQLException {
        String sql = "UPDATE vouchers\n"
                + "SET priceCondition = ?,\n"
                + "    price = ?,\n"
                + "    [percent] = ?,\n"
                + "    createBy = ?,\n"
                + "    deleteBy = ?\n"
                + "WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, t.getPriceCondition());
            ps.setDouble(2, t.getPrice());
            ps.setInt(3, t.getPercent());
            ps.setString(4, t.getCreateBy());
            ps.setString(5, t.getDeleteBy());
            ps.setLong(6, t.getId());
            ps.executeUpdate();
            closeConnection();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM vouchers WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
            closeConnection();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    private void closeConnection() throws SQLException {
        if (connection != null && !connection.isClosed()) {
            connection.close();
        }
    }
}
