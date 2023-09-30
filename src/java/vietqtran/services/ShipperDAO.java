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
import vietqtran.model.Shipper;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ShipperDAO extends DBContext implements IDAO<Shipper> {

    @Override
    public void add(Shipper t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.INSERT_SHIPPER);
            ps.setString(1, t.getUsername());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getFirstName());
            ps.setString(4, t.getLastName());
            ps.setString(5, t.getEmail());
            ps.setString(6, t.getPhone());
            ps.setString(7, t.getAvatar());
            ps.setString(8, t.getShipCompany());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Shipper> getAll() throws SQLException {
        List<Shipper> result = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_ALL_SHIPPERS);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Shipper shipper = new Shipper(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getLong(8),
                        rs.getString(9),
                        rs.getString(10)
                );
                result.add(shipper);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Shipper get(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.GET_SHIPPER_BY_ID);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Shipper(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getLong(8),
                        rs.getString(9),
                        rs.getString(10)
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Shipper t) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.UPDATE_SHIPPER);
            ps.setString(1, t.getUsername());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getFirstName());
            ps.setString(4, t.getLastName());
            ps.setString(5, t.getEmail());
            ps.setString(6, t.getPhone());
            ps.setString(7, t.getAvatar());
            ps.setString(8, t.getShipCompany());
            ps.setLong(9, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        try {
            PreparedStatement ps = connection.prepareStatement(Global.DELETE_SHIPPER);
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
