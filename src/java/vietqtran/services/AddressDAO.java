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
import vietqtran.model.Address;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class AddressDAO extends DBContext implements IDAO<Address> {

    @Override
    public void add(Address t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.INSERT_ADDRESS);
            ps.setString(1, t.getDetail());
            ps.setString(2, t.getTown());
            ps.setString(3, t.getDistrict());
            ps.setString(4, t.getCity());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Address> getAll() throws SQLException {
        List<Address> result = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_ADDRESS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Address address = new Address(rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
                result.add(address);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Address get(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ADDRESS_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Address(rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Address t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.UPDATE_ADDRESS);
            ps.setString(1, t.getDetail());
            ps.setString(2, t.getTown());
            ps.setString(3, t.getDistrict());
            ps.setString(4, t.getCity());
            ps.setLong(5, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.DELETE_ADDRESS);
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
