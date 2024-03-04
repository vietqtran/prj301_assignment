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
import vietqtran.model.Product;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ProductDAO extends DBContext implements IDAO<Product> {

    @Override
    public void add(Product t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_PRODUCT);
	    ps.setString(1, t.getName());
	    ps.setDouble(2, t.getPrice());
	    ps.setDouble(3, t.getSalePrice());
	    ps.setString(4, t.getDescription());
	    ps.setString(5, t.getCity());
	    ps.setDouble(6, t.getRate());
	    ps.setInt(7, t.getBoughtQuantity());
	    ps.setLong(8, t.getColor());
	    ps.setLong(9, t.getCategoryId());
	    ps.setLong(10, t.getShopCategoryId());
	    ps.setLong(11, t.getShopId());
	    ps.setString(12, t.getCreateBy());
	    ps.setString(13, t.getUrl());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    public long addWithGetIndex(Product t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_PRODUCT, Statement.RETURN_GENERATED_KEYS);
	    ps.setString(1, t.getName());
	    ps.setDouble(2, t.getPrice());
	    ps.setDouble(3, t.getSalePrice());
	    ps.setString(4, t.getDescription());
	    ps.setString(5, t.getCity());
	    ps.setDouble(6, t.getRate());
	    ps.setInt(7, t.getBoughtQuantity());
	    ps.setLong(8, t.getColor());
	    ps.setLong(9, t.getCategoryId());
	    ps.setLong(10, t.getShopCategoryId());
	    ps.setLong(11, t.getShopId());
	    ps.setString(12, t.getCreateBy());
	    ps.setString(13, t.getUrl());
	    ps.executeUpdate();
	    ResultSet rs = ps.getGeneratedKeys();
	    if (rs.next()) {
		return rs.getInt(1);
	    }
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return -1;
	}
    }

    @Override
    public List<Product> getAll() throws SQLException {
	List<Product> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_PRODUCTS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Product product = new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
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

    public List<Product> getAll(String query) throws SQLException {
	List<Product> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Product product = new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
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
    public Product get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_PRODUCT_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    public Product getShopProduct(long shopId, long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM products WHERE id = ? and shopId = ?;");
	    ps.setLong(1, id);
	    ps.setLong(2, shopId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public void update(Product t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_PRODUCT);
	    ps.setString(1, t.getName());
	    ps.setDouble(2, t.getPrice());
	    ps.setDouble(3, t.getSalePrice());
	    ps.setString(4, t.getDescription());
	    ps.setDouble(5, t.getRate());
	    ps.setString(6, t.getCity());
	    ps.setInt(7, t.getBoughtQuantity());
	    ps.setString(8, t.getUrl());
	    ps.setLong(9, t.getColor());
	    ps.setLong(10, t.getShopCategoryId());
	    ps.setLong(11, t.getCategoryId());
	    ps.setString(12, t.getDeleteBy());
	    ps.setLong(13, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_PRODUCT);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    public List<Product> getSearchProducts(String query) {
	List<Product> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Product product = new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
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

    public List<Product> getShopProducts(long shopId) {
	List<Product> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM products WHERE shopId = ?;");
	    ps.setLong(1, shopId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Product product = new Product(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getDouble(4),
			rs.getString(5),
			rs.getString(6),
			rs.getDouble(7),
			rs.getDate(8),
			rs.getInt(9),
			rs.getLong(10),
			rs.getLong(11),
			rs.getLong(12),
			rs.getLong(13),
			rs.getString(14),
			rs.getString(15),
			rs.getString(16)
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

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }

}
