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
import vietqtran.model.UserRole;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class UserRoleDAO extends DBContext implements IDAO<UserRole> {

    @Override
    public void add(UserRole t) throws SQLException {
        String sql = "INSERT INTO roles (userType)\n"
                + "VALUES (?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getUserType());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<UserRole> getAll() throws SQLException {
        List<UserRole> result = new ArrayList<>();
        String sql = "SELECT * FROM roles";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserRole role = new UserRole(rs.getLong(1),
                        rs.getString(2));
                result.add(role);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public UserRole get(long id) throws SQLException {
        String sql = "SELECT * FROM roles WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new UserRole(rs.getLong(1),
                        rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(UserRole t) throws SQLException {
        String sql = "UPDATE roles\n"
                + "SET userType = ?\n"
                + "WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getUserType());
            ps.setLong(2, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM roles WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

}
