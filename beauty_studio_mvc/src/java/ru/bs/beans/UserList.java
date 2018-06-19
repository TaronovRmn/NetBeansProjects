/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.beans;

import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TaronovR returning: -1 - DB error 0 - User exist 1 - success
 */
public class UserList implements Serializable {

    private List<User> userList = null;

    public UserList() {
        userList = new ArrayList<>();
    }

    public static boolean addUser(User user) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from users where email=?");
            pst.setString(1, user.getEmail());
            rs = pst.executeQuery();
            if (rs.next()) {
                return false;
            } else {
                String insertSQL = "INSERT INTO users (username, phone, email, password, role) VALUES (?,?,?,?,?)";
                pst = dbConnection.prepareStatement(insertSQL);
                pst.setString(1, user.getName());
                pst.setString(2, user.getPhone());
                pst.setString(3, user.getEmail());
                pst.setString(4, user.getPassword());
                pst.setString(5, "user");
                pst.executeUpdate();
                return true;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                pst.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public boolean getListFromDB() {
        Connection dbConnection = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            dbConnection
                    = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            statement = dbConnection.createStatement();
            rs = statement.executeQuery("select * from users");
            User user;
            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPhone(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setRole(rs.getString(6));
                this.userList.add(user);
            }
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                statement.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public boolean searchUsers(String key) {
        Connection dbConnection = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            statement = dbConnection.createStatement();
            rs = statement.executeQuery("select * from users where email like '" + key + "%'");
            User user;

            while (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPhone(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setRole(rs.getString(6));
                this.userList.add(user);
            }
            return !this.userList.isEmpty();
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                statement.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public static boolean removeUser(String key) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("select * from users where id=?");
            pst.setString(1, key);
            rs = pst.executeQuery();

            if (!rs.next()) {
                return false;
            }
            pst = dbConnection.prepareStatement("delete from users where id=?");
            pst.setString(1, key);
            pst.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return false;
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                pst.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public static User findUser(String email, String password) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        User user = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from users where email=? and password=?");
            pst.setString(1, email);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPhone(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setRole(rs.getString(6));
            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                pst.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
        return user;
    }
    public static User findUserID(int id) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        User user = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from users where id=?");
            pst.setInt(1, id);
            rs = pst.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt(1));
                user.setName(rs.getString(2));
                user.setPhone(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setPassword(rs.getString(5));
                user.setRole(rs.getString(6));
            }

        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                pst.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                rs.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
        return user;
    }

    /**
     * @return the userList
     */
    public List<User> getUserList() {
        return userList;
    }

    /**
     * @param userList the userList to set
     */
    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

}
