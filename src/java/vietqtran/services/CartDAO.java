/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vietqtran.services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import vietqtran.db.DBContext;
import vietqtran.global.Global;
import vietqtran.model.Cart;
import vietqtran.model.CartProduct;
import vietqtran.model.Shop;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class CartDAO extends DBContext implements IDAO<Cart> {

    @Override
    public void add(Cart t) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.INSERT_CART);
	    ps.setLong(1, t.getUserId());
	    ps.executeUpdate();
	} catch (SQLException err) {
	    System.out.println(err);
	} finally {
	    return;
	}
    }

    @Override
    public List<Cart> getAll() throws SQLException {
	List<Cart> result = new ArrayList<>();
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_CARTS);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		Cart cart = new Cart(
			rs.getLong(1),
			rs.getLong(2)
		);
		result.add(cart);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public Cart get(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.GET_CART_BY_ID);
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Cart(
			rs.getLong(1),
			rs.getLong(2)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    public Cart getByUserId(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement("SELECT * FROM carts WHERE userId = ?;");
	    ps.setLong(1, id);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		return new Cart(
			rs.getLong(1),
			rs.getLong(2)
		);
	    }
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    @Override
    public void update(Cart t) throws SQLException {

    }

    @Override
    public void delete(long id) throws SQLException {
	try {
	    PreparedStatement ps = connection.prepareStatement(Global.DELETE_CART);
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

    private Map<String, List<String>> getCartListRef(long userId) {
	Map<String, List<String>> result = new HashMap<>();
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
		List<String> list = result.get(rs.getString("shopId"));
		if (list == null || list.isEmpty()) {
		    list = new ArrayList<>();
		}
		list.add(rs.getString("id"));
		result.put(rs.getString("shopId"), list);
	    }
	    return result;
	} catch (SQLException e) {
	    System.out.println(e);
	} finally {
	    return null;
	}
    }

    public Map<Shop, List<CartProduct>> getCartList(long userId) throws SQLException {
	Map<String, List<String>> list = getCartListRef(userId);
	Map<Shop, List<CartProduct>> result = new HashMap<>();
	ShopDAO shopDao = new ShopDAO();
	CartProductDAO cartProductDao = new CartProductDAO();
	for (String shopId : list.keySet()) {
	    Shop shop = shopDao.get(Long.parseLong(shopId));
	    List<CartProduct> cartProducts = new ArrayList<>();
	    for (String cartProductId : list.get(shopId)) {
		cartProducts.add(cartProductDao.get(Long.parseLong(cartProductId)));
	    }
	    result.put(shop, cartProducts);
	}
	shopDao.closeConnection();
	cartProductDao.closeConnection();
	return result;
    }

}
