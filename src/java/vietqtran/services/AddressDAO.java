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
import vietqtran.model.Address;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class AddressDAO extends DBContext implements IDAO<Address> {

    @Override
    public void add(Address t) throws SQLException {
        String sql = "INSERT INTO address ([detail], [town], [district], [city])\n"
                + "VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getDetail());
            ps.setString(2, t.getTown());
            ps.setString(3, t.getDistrict());
            ps.setString(4, t.getCity());
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Address> getAll() throws SQLException {
        List<Address> result = new ArrayList<>();
        String sql = "SELECT * FROM address";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
        String sql = "SELECT * FROM address WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
        String sql = "UPDATE address "
                + "SET [detail] = ?,"
                + "town = ?,"
                + "district = ?,"
                + "[city] = ? "
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
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
        String sql = "DELETE FROM address WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

}
