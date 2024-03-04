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
import vietqtran.model.Color;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ColorDAO extends DBContext implements IDAO<Color> {

    @Override
    public void add(Color t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_COLOR);
	    ps.setString(1, t.getName());
	    ps.setString(2, t.getCode());
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    @Override
    public List<Color> getAll() throws SQLException {
	List<Color> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_COLORS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Color colors = new Color(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3));
		result.add(colors);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public Color get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_COLOR_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Color(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3));
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public void update(Color t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_COLOR);
	    ps.setString(1, t.getName());
	    ps.setString(2, t.getCode());
	    ps.setLong(3, t.getId());
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
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_COLOR);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }

}
