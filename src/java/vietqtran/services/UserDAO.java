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
import vietqtran.model.User;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class UserDAO extends DBContext implements IDAO<User> {

    @Override
    public void add(User t) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_USER);
	    ps.setString(1, t.getUsername());
	    ps.setString(2, t.getPassword());
	    ps.setString(3, t.getName());
	    ps.setString(4, t.getEmail());
	    ps.setString(5, t.getPhone());
	    ps.setInt(6, t.getRole());
	    ps.setString(7, t.getAvatar());
	    ps.setString(8, t.getAddress());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public List<User> getAll() {
	List<User> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_USERS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		User user = new User(rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getString(6),
			rs.getInt(7),
			rs.getString(8),
			rs.getString(9)
		);
		result.add(user);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    @Override
    public User get(long id) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_USER_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new User(rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getString(6),
			rs.getInt(7),
			rs.getString(8),
			rs.getString(8)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    @Override
    public void update(User t) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_USER);
	    ps.setString(1, t.getUsername());
	    ps.setString(2, t.getPassword());
	    ps.setString(3, t.getName());
	    ps.setString(4, t.getEmail());
	    ps.setString(5, t.getPhone());
	    ps.setInt(6, t.getRole());
	    ps.setString(7, t.getAvatar());
	    ps.setString(8, t.getAddress());
	    ps.setLong(9, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_USER);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public User getLoginUser(String email, String password) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_LOGIN_USER);
	    ps.setString(1, email);
	    ps.setString(2, password);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new User(rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getString(6),
			rs.getInt(7),
			rs.getString(8),
			rs.getString(9)
		);
	    }

	} catch (SQLException e) {
	}
	return null;
    }

    public List<User> getSearchUsers(String query) {
	List<User> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		User user = new User(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getString(6),
			rs.getInt(7),
			rs.getString(8),
			rs.getString(9)
		);
		result.add(user);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    public boolean isExisted(String email) {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.CHECK_USER_EXISTED);
	    ps.setString(1, email);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return true;
	    }

	} catch (SQLException e) {
	}
	return false;
    }

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }
}
