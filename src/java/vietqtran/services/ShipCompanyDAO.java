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
import vietqtran.model.ShipCompany;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShipCompanyDAO extends DBContext implements IDAO<ShipCompany> {

    @Override
    public void add(ShipCompany t) throws SQLException {

    }

    @Override
    public List<ShipCompany> getAll() throws SQLException {
	List<ShipCompany> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_SHIP_COMPANIES);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ShipCompany shipCompany = new ShipCompany(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getString(4)
		);
		result.add(shipCompany);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public ShipCompany get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_SHIP_COMPANY_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new ShipCompany(
			rs.getLong(1),
			rs.getString(2),
			rs.getDouble(3),
			rs.getString(4)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public void update(ShipCompany t) throws SQLException {

    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_SHIP_COMPANY);
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
