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
import vietqtran.model.Shop;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShopDAO extends DBContext implements IDAO<Shop> {

    @Override
    public void add(Shop t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_SHOP);
	    ps.setString(1, t.getEmail());
	    ps.setString(2, t.getPassword());
	    ps.setString(3, t.getName());
	    ps.setString(4, t.getAddress());
	    ps.setBoolean(5, t.isActive());
	    ps.setString(6, t.getAvatar());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public long addWithGetIndex(Shop t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_SHOP, Statement.RETURN_GENERATED_KEYS);
	    ps.setString(1, t.getEmail());
	    ps.setString(2, t.getPassword());
	    ps.setString(3, t.getName());
	    ps.setString(4, t.getAddress());
	    ps.setBoolean(5, t.isActive());
	    ps.setString(6, t.getAvatar());
	    ps.executeUpdate();
	    ResultSet rs = ps.getGeneratedKeys();
	    if (rs.next()) {
		return rs.getInt(1);
	    }
	} catch (SQLException err) {
	    System.out.println(err);
	}
	return -1;
    }

    @Override
    public List<Shop> getAll() throws SQLException {
	List<Shop> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_SHOPS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Shop shop = new Shop(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getDate(6),
			rs.getBoolean(7),
			rs.getString(8));
		result.add(shop);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    @Override
    public Shop get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_SHOP_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Shop(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getDate(6),
			rs.getBoolean(7),
			rs.getString(8)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    public Shop get(String email, String password) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM shops WHERE email = ? AND password = ?;");
	    ps.setString(1, email);
	    ps.setString(2, password);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Shop(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getDate(6),
			rs.getBoolean(7),
			rs.getString(8)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    @Override
    public void update(Shop t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_SHOP);
	    ps.setString(1, t.getEmail());
	    ps.setString(2, t.getPassword());
	    ps.setString(3, t.getName());
	    ps.setString(4, t.getAddress());
	    ps.setBoolean(5, t.isActive());
	    ps.setString(6, t.getAvatar());
	    ps.setLong(7, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_SHOP);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public void disbleShop(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DISABLE_SHOP);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public void enableShop(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.ENABLE_SHOP);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public List<Shop> getSearchShops(String query) throws SQLException {
	List<Shop> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Shop shop = new Shop(
			rs.getLong(1),
			rs.getString(2),
			rs.getString(3),
			rs.getString(4),
			rs.getString(5),
			rs.getDate(6),
			rs.getBoolean(7),
			rs.getString(8));
		result.add(shop);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
	return null;
    }

    public long getShopId(String email) throws SQLException {
	for (Shop shop : getAll()) {
	    if (shop.getEmail().equals(email)) {
		return shop.getId();
	    }
	}
	return 0;
    }

    public boolean checkShopName(String name) throws SQLException {
	for (Shop shop : getAll()) {
	    if (shop.getName().equals(name)) {
		return true;
	    }
	}
	return false;
    }

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }

}
