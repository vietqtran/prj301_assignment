/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import vietqtran.db.DBContext;
import vietqtran.model.ShopReport;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShopReportDAO extends DBContext implements IDAO<ShopReport> {

    @Override
    public void add(ShopReport t) throws SQLException {
        String sql = "INSERT INTO shopReports (shopId, profit, revenue, expense, amountOrders, amountProducts)\n"
                + "VALUES(?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, t.getShopId());
            ps.setDouble(2, t.getProfit());
            ps.setDouble(3, t.getRevenue());
            ps.setDouble(4, t.getExpense());
            ps.setLong(5, t.getAmountOrders());
            ps.setLong(6, t.getAmountProducts());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public ShopReport get(long id) throws SQLException {
        String sql = "SELECT * FROM shopReports WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ShopReport(
                        rs.getLong(1),
                        rs.getDouble(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getLong(5),
                        rs.getLong(6)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(ShopReport t) throws SQLException {
        String sql = "UPDATE shopReports\n"
                + "SET\n"
                + "    profit = ?,\n"
                + "    revenue = ?,\n"
                + "    expense = ?,\n"
                + "    amountOrders = ?,\n"
                + "    amountProducts = ?\n"
                + "WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setDouble(1, t.getProfit());
            ps.setDouble(2, t.getRevenue());
            ps.setDouble(3, t.getExpense());
            ps.setLong(4, t.getAmountOrders());
            ps.setLong(5, t.getAmountProducts());
            ps.setLong(6, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM shopReports WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    public static void main(String[] args) throws SQLException {
        ShopReportDAO dao = new ShopReportDAO();
    }

    @Override
    public List<ShopReport> getAll() throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
