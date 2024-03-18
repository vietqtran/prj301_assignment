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
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import vietqtran.db.DBContext;
import vietqtran.global.Global;
import vietqtran.model.CartProduct;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class CartProductDAO extends DBContext implements IDAO<CartProduct> {

    @Override
    public void add(CartProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_CART_PRODUCT);
	    ps.setLong(1, t.getProductId());
	    ps.setLong(2, t.getCartId());
	    ps.setLong(3, t.getShopId());
	    ps.setInt(4, t.getQuantity());
	    ps.setLong(5, t.getSizeId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public long addToGetId(CartProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_CART_PRODUCT, Statement.RETURN_GENERATED_KEYS);
	    ps.setLong(1, t.getProductId());
	    ps.setLong(2, t.getCartId());
	    ps.setLong(3, t.getShopId());
	    ps.setInt(4, t.getQuantity());
	    ps.setLong(5, t.getSizeId());
	    ps.executeUpdate();
	    ResultSet rs = ps.getGeneratedKeys();
	    if (rs.next()) {
		return rs.getLong(1);
	    }
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return -1;
	}
    }

    @Override
    public List<CartProduct> getAll() throws SQLException {
	List<CartProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_CART_PRODUCTS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		CartProduct cartProduct = new CartProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getLong(4),
			rs.getInt(5),
			rs.getLong(6)
		);
		result.add(cartProduct);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public List<CartProduct> getAllByUserId(long userId) throws SQLException {
	List<CartProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT cp.*\n"
		    + "FROM cartProducts cp\n"
		    + "INNER JOIN carts c ON cp.cartId = c.id\n"
		    + "INNER JOIN shops s ON cp.shopId = s.id\n"
		    + "WHERE c.userId = ? \n"
		    + "AND s.active = 1;");
	    ps.setLong(1, userId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		CartProduct cartProduct = new CartProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getLong(4),
			rs.getInt(5),
			rs.getLong(6)
		);
		result.add(cartProduct);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    public List<CartProduct> getTop5ByUserId(long userId) throws SQLException {
	List<CartProduct> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT top 5 cp.*\n"
		    + "FROM cartProducts cp\n"
		    + "INNER JOIN carts c ON cp.cartId = c.id\n"
		    + "INNER JOIN shops s ON cp.shopId = s.id\n"
		    + "WHERE c.userId = ? \n"
		    + "AND s.active = 1 order by id desc");
	    ps.setLong(1, userId);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		CartProduct cartProduct = new CartProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getLong(4),
			rs.getInt(5),
			rs.getLong(6)
		);
		result.add(cartProduct);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public CartProduct get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_CART_PRODUCT_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new CartProduct(
			rs.getLong(1),
			rs.getLong(2),
			rs.getLong(3),
			rs.getLong(4),
			rs.getInt(5),
			rs.getLong(6)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	}
    }

    @Override
    public void update(CartProduct t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.UPDATE_CART_PRODUCT);
	    ps.setInt(1, t.getQuantity());
	    ps.setLong(2, t.getSizeId());
	    ps.setLong(3, t.getId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_CART_PRODUCT);
	    ps.setLong(1, id);
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	}
    }

    public Map<Long, List<CartProduct>> getCartProductToOrder(long[] ids) throws SQLException {
	Map<Long, List<CartProduct>> result = new HashMap<>();
	List<CartProduct> list = new ArrayList<>();
	for (long id : ids) {
	    list.add(get(id));
	}
	Set<Long> shopIds = new HashSet<>();
	for (CartProduct cp : list) {
	    long shopId = cp.getShopId();
	    if (!shopIds.contains(shopId)) {
		result.put(shopId, new ArrayList<>());
		shopIds.add(shopId);
	    }
	    result.get(shopId).add(cp);
	}
	return result;
    }

    public void closeConnection() throws SQLException {
	if (connection != null && !connection.isClosed()) {
	    connection.close();
	}
    }

}
