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
import vietqtran.global.Global;
import vietqtran.model.ShopReport;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShopReportDAO extends DBContext implements IDAO<ShopReport> {

    @Override
    public void add(ShopReport t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_SHOP_REPORT);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_SHOP_REPORT_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new ShopReport(
			rs.getLong(1),
			rs.getLong(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getDouble(5),
			rs.getLong(6),
			rs.getLong(7)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    public ShopReport getByShopId(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM shopReports WHERE shopId = ?;");
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new ShopReport(
			rs.getLong(1),
			rs.getLong(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getDouble(5),
			rs.getLong(6),
			rs.getLong(7)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    @Override
    public void update(ShopReport t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_SHOP_REPORT);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_SHOP_REPORT);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public List<ShopReport> getAll() throws SQLException {
	throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }
}
