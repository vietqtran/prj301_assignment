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
import vietqtran.model.OrderProduct;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class OrderProductDAO extends DBContext implements IDAO<OrderProduct> {

    @Override
    public void add(OrderProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_ORDER_PRODUCT);
	    ps.setLong(1, t.getOrderId());
	    ps.setLong(2, t.getProductId());
	    ps.setDouble(3, t.getProductPrice());
	    ps.setInt(4, t.getQuantity());
	    ps.setDouble(5, t.getTotalPrice());
	    ps.setDouble(6, t.getSalePrice());
	    ps.setString(7, t.getImageUrl());
	    ps.setLong(8, t.getSizeId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} 
    }

    @Override
    public List<OrderProduct> getAll() throws SQLException {
	List<OrderProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_ORDER_PRODUCTS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		OrderProduct product = new OrderProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getDouble(4),
			rs.getInt(5),
			rs.getDouble(6),
			rs.getDouble(7),
			rs.getString(8),
			rs.getLong(9)
		);
		result.add(product);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    public List<OrderProduct> getByOrderId(long orderId) throws SQLException {
	List<OrderProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM orderProducts WHERE orderId = ?");
	    ps.setLong(1, orderId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		OrderProduct product = new OrderProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getDouble(4),
			rs.getInt(5),
			rs.getDouble(6),
			rs.getDouble(7),
			rs.getString(8),
			rs.getLong(9)
		);
		result.add(product);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public OrderProduct get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ORDER_PRODUCT_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new OrderProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getDouble(4),
			rs.getInt(5),
			rs.getDouble(6),
			rs.getDouble(7),
			rs.getString(8),
			rs.getLong(9)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public void update(OrderProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_ORDER_PRODUCT);
	    ps.setDouble(1, t.getProductPrice());
	    ps.setDouble(2, t.getSalePrice());
	    ps.setInt(3, t.getQuantity());
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
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_ORDER_PRODUCT);
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
