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
import vietqtran.model.Category;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class CategoryDAO extends DBContext implements IDAO<Category> {

    @Override
    public void add(Category t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_CATEGORY);
	    ps.setString(1, t.getName());
	    ps.setString(2, t.getImage());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public List<Category> getAll() throws SQLException {
	List<Category> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_CATEGORIES);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Category category = new Category(
			rs.getInt(1),
			rs.getString(2),
			rs.getString(3));
		result.add(category);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public Category get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_CATEGORY_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Category(rs.getInt(1),
			rs.getString(2),
			rs.getString(3));
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public void update(Category t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_CATEGORY);
	    ps.setString(1, t.getName());
	    ps.setString(2, t.getImage());
	    ps.setLong(3, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_CATEGORY);
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
