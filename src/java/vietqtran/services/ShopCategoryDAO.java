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
import vietqtran.model.ShopCategory;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShopCategoryDAO extends DBContext implements IDAO<ShopCategory> {

    @Override
    public void add(ShopCategory t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.INSERT_SHOP_CATEGORY);
            ps.setString(1, t.getName());
            ps.setLong(2, t.getShopId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<ShopCategory> getAll() throws SQLException {
        List<ShopCategory> result = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_SHOP_CATEGORIES);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ShopCategory category = new ShopCategory(rs.getLong(1),
                        rs.getString(2),
                        rs.getLong(3));
                result.add(category);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public ShopCategory get(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_SHOP_CATEGORY_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ShopCategory(rs.getLong(1),
                        rs.getString(2),
                        rs.getLong(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(ShopCategory t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.UPDATE_SHOP_CATEGORY);
            ps.setString(1, t.getName());
            ps.setLong(2, t.getShopId());
            ps.setLong(3, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.DELETE_SHOP_CATEGORY);
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
