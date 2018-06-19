/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.beans;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author TaronovR
 */
public class NoteList implements Serializable {

    private List<Note> noteList = null;

    public NoteList() {
        noteList = new ArrayList<>();
    }

    public static void addNote(Note note) {
        Connection dbConnection = null;
        PreparedStatement pst = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            String insertSQL = "INSERT INTO shedule (user_id, service, dates, time) VALUES (?,?,?,?)";
            pst = dbConnection.prepareStatement(insertSQL);
            pst.setInt(1, note.getUserid());
            pst.setString(2, note.getService());
            pst.setString(3, note.getDate());
            pst.setString(4, note.getTime());
            pst.executeUpdate();

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
            rs = statement.executeQuery("select * from shedule");
            Note note;
            while (rs.next()) {
                note = new Note();
                note.setId(rs.getInt(1));
                note.setUserid(rs.getInt(2));
                note.setService(rs.getString(3));
                note.setDate(rs.getString(4));
                note.setTime(rs.getString(5));
                this.getNoteList().add(note);
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
    public static boolean removeNote(int id) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            
            pst = dbConnection.prepareStatement("delete from shedule where id=?");
            pst.setInt(1, id);
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
        }
    }

    /**
     * @return the noteList
     */
    public List<Note> getNoteList() {
        return noteList;
    }

    /**
     * @param noteList the noteList to set
     */
    public void setNoteList(List<Note> noteList) {
        this.noteList = noteList;
    }

}
