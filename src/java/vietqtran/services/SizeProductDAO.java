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
import vietqtran.model.SizeProduct;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class SizeProductDAO extends DBContext implements IDAO<SizeProduct> {

    @Override
    public void add(SizeProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_SIZE);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_SIZES);
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

    public List<SizeProduct> getAllByProductId(long productId) throws SQLException {
	List<SizeProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM [sizesProduct] WHERE [productId] = ?;");
	    ps.setLong(1, productId);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_SIZE_BY_ID);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_SIZE);
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
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_SIZE);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public void deleteByProductId(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("DELETE FROM [sizesProduct] WHERE [productId] = ?;");
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
