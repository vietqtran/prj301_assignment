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
import vietqtran.model.User;
import vietqtran.serviceInterface.IDAO;

/**
 *
 * @author tranq
 */
public class UserDAO extends DBContext implements IDAO<User> {

    @Override
    public void add(User t) {
        String sql = "INSERT INTO users (username, [password], firstName, lastName, email, phone, role, avatar)\n"
                + "VALUES(?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getUsernanme());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getFirstName());
            ps.setString(4, t.getLastName());
            ps.setString(5, t.getEmail());
            ps.setString(6, t.getPhone());
            ps.setInt(7, t.getRole());
            ps.setString(8, t.getAvatar());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public List<User> getAll() {
        List<User> result = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9));
                result.add(user);
            }
            return result;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public User get(long id) {
        String sql = "SELECT * FROM users WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getLong(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getInt(8),
                        rs.getString(9));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    @Override
    public void update(User t) {
        String sql = "UPDATE users "
                + "SET username = ?,"
                + "password = ?,"
                + "firstName = ?,"
                + "lastName = ?,"
                + "email = ?,"
                + "phone = ?,"
                + "role = ?,"
                + "avatar = ? "
                + "WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, t.getUsernanme());
            ps.setString(2, t.getPassword());
            ps.setString(3, t.getFirstName());
            ps.setString(4, t.getLastName());
            ps.setString(5, t.getEmail());
            ps.setString(6, t.getPhone());
            ps.setInt(7, t.getRole());
            ps.setString(8, t.getAvatar());
            ps.setLong(9, t.getId());
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    @Override
    public void delete(long id) {
        String sql = "DELETE FROM users WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setLong(1, id);
            ps.executeUpdate();
        } catch (SQLException err) {
            System.out.println(err);
        }
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        dao.add(new User("adminn", "admin", "", "adminn", "adminn", "0", 1, ""));
    }

}
