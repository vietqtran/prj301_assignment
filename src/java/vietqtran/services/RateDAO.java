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
import vietqtran.model.Rate;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class RateDAO extends DBContext implements IDAO<Rate> {

    @Override
    public void add(Rate t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_RATE);
	    ps.setLong(1, t.getUserId());
	    ps.setLong(2, t.getProductId());
	    ps.setInt(3, t.getStart());
	    ps.setString(4, t.getContent());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public List<Rate> getAll() throws SQLException {
	List<Rate> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_RATES);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Rate rate = new Rate(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getInt(4),
			rs.getString(5),
			rs.getDate(6)
		);
		result.add(rate);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public Rate get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_RATE_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Rate(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getInt(4),
			rs.getString(5),
			rs.getDate(6)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public void update(Rate t) throws SQLException {

    }

    public List<Rate> getRatesByProductId(long productId) throws SQLException {
	List<Rate> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM rates WHERE [productId] = ?;");
	    ps.setLong(1, productId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Rate rate = new Rate(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getInt(4),
			rs.getString(5),
			rs.getDate(6)
		);
		result.add(rate);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_RATE);
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
