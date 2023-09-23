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
import vietqtran.model.Color;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class ColorDAO extends DBContext implements IDAO<Color> {

    @Override
    public void add(Color t) throws SQLException {
        String sql = "INSERT INTO colors ([name], code) VALUES (?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getCode());
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<Color> getAll() throws SQLException {
        List<Color> result = new ArrayList<>();
        String sql = "SELECT * FROM colors";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Color colors = new Color(rs.getString(1),
                        rs.getString(2));
                result.add(colors);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public Color get(long id) throws SQLException {
        String sql = "SELECT * FROM colors WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Color(rs.getString(1),
                        rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(Color t) throws SQLException {
        String sql = "UPDATE colors "
                + "SET [name] = ?,"
                + "code = ? "
                + "WHERE id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getName());
            ps.setString(2, t.getCode());
            ps.setLong(3, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) throws SQLException {
        String sql = "DELETE FROM colors WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }
    
}
