/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import vietqtran.db.DBContext;
import vietqtran.global.Global;
import vietqtran.model.Order;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class OrderDAO extends DBContext implements IDAO<Order> {

    @Override
    public void add(Order t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_ORDER);
	    ps.setLong(1, t.getUserId());
	    ps.setLong(2, t.getShopId());
	    ps.setLong(3, t.getShipperId());
	    ps.setDouble(4, t.getTotalPrice());
	    ps.setDouble(5, t.getSaleTotalPrice());
	    ps.setDate(6, t.getSuccessDate());
	    ps.setString(7, t.getPhone());
	    ps.setString(8, t.getAddress());
	    ps.setLong(9, t.getVoucherId());
	    ps.setString(10, t.getNote());
	    ps.setString(11, t.getDeliveryChecking());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public long addToGetIndex(Order t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);
	    ps.setLong(1, t.getUserId());
	    ps.setLong(2, t.getShopId());
	    ps.setLong(3, t.getShipperId());
	    ps.setDouble(4, t.getTotalPrice());
	    ps.setDouble(5, t.getSaleTotalPrice());
	    ps.setDate(6, t.getSuccessDate());
	    ps.setString(7, t.getPhone());
	    ps.setString(8, t.getAddress());
	    ps.setLong(9, t.getVoucherId());
	    ps.setString(10, t.getNote());
	    ps.setString(11, t.getDeliveryChecking());
	    ps.executeUpdate();
	    ResultSet rs = ps.getGeneratedKeys();
	    if (rs.next()) {
		return rs.getLong(1);
	    }
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return -1;
	}
    }

    @Override
    public List<Order> getAll() throws SQLException {
	List<Order> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_ORDERS);
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
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return result;
	}
    }

    public List<Order> getAllByQuery(String query) throws SQLException {
	List<Order> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(query);
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
	} finally {
	    return null;
	}
    }

    @Override
    public Order get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ORDER_BY_ID);
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
	} finally {
	    return null;
	}
    }

    @Override
    public void update(Order t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_ORDER);
	    ps.setDate(1, t.getSuccessDate());
	    ps.setString(2, t.getStatus());
	    ps.setLong(3, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_ORDER);
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

    public List<Order> getAllByStatus(String status, long userId) {
	List<Order> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM orders WHERE status = ? AND [userId] = ? order by orderDate desc");
	    ps.setString(1, status);
	    ps.setLong(2, userId);
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
	} finally {
	    return null;
	}
    }

    public List<Order> getAllByShop(long shopId) {
	List<Order> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM orders WHERE shopId = ? order by orderDate desc");
	    ps.setLong(1, shopId);
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
	} finally {
	    return null;
	}
    }

    public void setSuccessDate(long id) {
	try {
	    PreparedStatement ps = connection.prepareStatement("UPDATE orders SET [successDate] = CAST(GETDATE() AS DATE) WHERE id = ?");
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public double getMonthRevenue(int month, long shopId) {
	List<Order> orders = getAllByShop(shopId);
	double revenue = 0;
	for (Order order : orders) {
	    java.sql.Date date = order.getOrderDate();
	    if (date.getMonth() == month && !order.getStatus().equals("canceled")) {
		revenue += order.getTotalPrice();
	    }
	}
	return revenue;
    }
}
