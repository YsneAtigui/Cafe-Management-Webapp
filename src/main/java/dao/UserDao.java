/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package dao;

/**
 *
 * @author yassine
 */
import dao.ConnectionProvider;
import dao.DbOperation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.User;

public class UserDao {

    public static void save(User user) throws SQLException {

        String query = "INSERT INTO user (name, email, mobileNumber, password, securityQuestion, answer, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        Connection con = ConnectionProvider.getConnection();
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getMobileNumber());
        ps.setString(4, user.getPassword());
        ps.setString(5, user.getSecurityQuestion());
        ps.setString(6, user.getAnswer());
        ps.setString(7, "false"); // Set status to false by default
        ps.executeUpdate();
        DbOperation.setDataOrDelete(query, "Registered Successfully");

    }

    public static User login(String email, String password) {
        User user = null;
        try {
            String query = "SELECT * FROM user WHERE email=? AND password=?";
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setMobileNumber(rs.getString("mobileNumber"));
                user.setPassword(rs.getString("password"));
                user.setSecurityQuestion(rs.getString("securityQuestion"));
                user.setAnswer(rs.getString("answer"));
                user.setStatus(rs.getString("status"));
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "Message", JOptionPane.ERROR_MESSAGE);
        }
        return user;
    }

    public static void update(String email, String newPassword) {
        String query = "update user set password = '" + newPassword + "' where email ='" + email + "'";
        DbOperation.setDataOrDelete(query, "Password Changed Successful");
    }

    public static void changePassword(String email, String oldPassword, String newPassword) throws SQLException {

        ResultSet rs = DbOperation.getData("select *from user where email='" + email + "' and password ='" + oldPassword + "'");
        if (rs.next()) {
            update(email, newPassword);
        }

    }

    public static User getSecurityQuestion(String email) throws SQLException {
        User user = null;

        ResultSet rs = DbOperation.getData("select *from user Where email = '" + email + "'");
        while (rs.next()) {
            user = new User();
            user.setSecurityQuestion(rs.getString("securityQuestion"));
            user.setAnswer(rs.getString("answer"));
        }

        return user;
    }
    
    public static User getAnswer(String email, String securityQuestion) throws SQLException {
        User user = null;

        ResultSet rs = DbOperation.getData("select *from user Where email = '" + email + "' and securityQuestion ='"+ securityQuestion + "'");
        while (rs.next()) {
            user = new User();
            user.setAnswer(rs.getString("answer"));
        }

        return user;
    }

}
