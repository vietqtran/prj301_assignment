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
import vietqtran.model.ProductImage;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ProductImageDAO extends DBContext implements IDAO<ProductImage> {

    @Override
    public void add(ProductImage t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_PRODUCT_IMAGE);
	    ps.setLong(1, t.getProductId());
	    ps.setString(2, t.getImageUrl());
	    ps.setInt(3, t.getRole());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public List<ProductImage> getAll() throws SQLException {
	List<ProductImage> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_PRODUCT_IMAGES);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ProductImage image = new ProductImage(
			rs.getLong(1),
			rs.getLong(2),
			rs.getString(3),
			rs.getInt(4));
		result.add(image);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public List<ProductImage> getAllSubImage(long productId) throws SQLException {
	List<ProductImage> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM [productImages] where [productId] = ? AND [role] = 2;");
	    ps.setLong(1, productId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ProductImage image = new ProductImage(
			rs.getLong(1),
			rs.getLong(2),
			rs.getString(3),
			rs.getInt(4));
		result.add(image);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public List<ProductImage> getAllProductImage(long productId) throws SQLException {
	List<ProductImage> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM [productImages] where [productId] = ? ORDER BY [role];");
	    ps.setLong(1, productId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ProductImage image = new ProductImage(
			rs.getLong(1),
			rs.getLong(2),
			rs.getString(3),
			rs.getInt(4));
		result.add(image);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public ProductImage get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_PRODUCT_IMAGE_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new ProductImage(
			rs.getLong(1),
			rs.getLong(2),
			rs.getString(3),
			rs.getInt(4)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public ProductImage getMainImage(long productId) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM [productImages] where [productId] = ? AND [role] = 1;");
	    ps.setLong(1, productId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new ProductImage(
			rs.getLong(1),
			rs.getLong(2),
			rs.getString(3),
			rs.getInt(4)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public void update(ProductImage t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_PRODUCT_IMAGE);
	    ps.setString(1, t.getImageUrl());
	    ps.setInt(2, t.getRole());
	    ps.setLong(3, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_PRODUCT_IMAGE);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public void deleteByProductId(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("DELETE FROM [productImages] WHERE [productId] = ?;");
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
