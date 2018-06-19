/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.beans;

import java.io.Serializable;
import java.sql.*;

/**
 *
 * @author TaronovR
 */
public class ResponseHandler implements Serializable{

    private String name;
    private String phone;
    private String email;
    private String password;

    public ResponseHandler() {
        name = null;
        phone = null;
        email = null;
        password = null;

    }

    public int addUser() {
        Connection dbConnection = null;
        PreparedStatement pst = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from users where email=?");
            pst.setString(1, getEmail());
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return 0;
            } else {
                String insertSQL = "INSERT INTO users (username, phone, email, password) VALUES (?,?,?,?)";
                pst = dbConnection.prepareStatement(insertSQL);
                pst.setString(1, getName());
                pst.setString(2, getPhone());
                pst.setString(3, getEmail());
                pst.setString(4, getPassword());
                pst.executeUpdate();
                return 1;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return -1;
        }
    }

    public int findUser() {
        Connection dbConnection = null;
        PreparedStatement pst = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from users where email=? and password=?");
            pst.setString(1, getEmail());
            pst.setString(2, getPassword());
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                setName(rs.getString(2));
                setPhone(rs.getString(3));
                return 1;
            } else {
                return 0;
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return -1;
        }
    }

    public int removeUser() {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("select * from users where email=?");
            pst.setString(1, getEmail());
            ResultSet rs = pst.executeQuery();

            if (!rs.next()) {
                return 0;
            }
            pst = dbConnection.prepareStatement("delete from users where email=?");
            pst.setString(1, getEmail());
            pst.executeUpdate();
            return 1;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            return -1;
        }

    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
}
