/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author TaronovR
 */
public class Voting {

    private String question;
    private List<Answer> answers = null;
    private int votes;

    public Voting() {
        answers = new ArrayList<>();
        question = null;
        votes = 0;
        this.setVotes();
        this.setQuestion();
        this.setAnswers();

    }

    public final void setQuestion() {
        Connection dbConnection = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            statement = dbConnection.createStatement();
            rs = statement.executeQuery("select * from voting where type='question'");
            if (rs.next()) {
                this.question = rs.getString(3);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                statement.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public final void setAnswers() {
        Connection dbConnection = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            dbConnection
                    = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            statement = dbConnection.createStatement();
            rs = statement.executeQuery("select * from voting where type='answer'");
            Answer answer;
            while (rs.next()) {
                answer = new Answer();
                answer.setId(rs.getInt(1));
                answer.setText(rs.getString(3));
                answer.setCounter(rs.getInt(4));                
                answer.setPercent(answer.getCounter()*100/this.votes);
                this.answers.add(answer);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                statement.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

    public static void userVote(User user, int answer) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            String updateSQL = "UPDATE voting SET counter = counter + 1 WHERE id=?";
            pst = dbConnection.prepareStatement(updateSQL);
            pst.setInt(1, answer);
            pst.executeUpdate();

            String insertSQL = "INSERT INTO voters (voter_id, answer_id) VALUES (?,?)";
            pst = dbConnection.prepareStatement(insertSQL);
            pst.setInt(1, user.getId());
            pst.setInt(2, answer);
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
    
    public static boolean isUserVoted(User user) {
        Connection dbConnection = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            dbConnection = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            pst = dbConnection.prepareStatement("Select * from voters where voter_id=?");
            pst.setInt(1, user.getId());
            rs = pst.executeQuery();
            return rs.next();

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
        return false;
    }

    /**
     * @return the question
     */
    public String getQuestion() {
        return question;
    }

    /**
     * @return the userList
     */
    public List<Answer> getAnswers() {
        return answers;
    }

    /**
     * @return the votes
     */
    public int getVotes() {
        return votes;
    }

    /**
     * @param votes the votes to set
     */
    public void setVotes() {
        Connection dbConnection = null;
        Statement statement = null;
        ResultSet rs = null;

        try {
            dbConnection
                    = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio_mvc\\src\\db\\database.accdb");
            statement = dbConnection.createStatement();
            rs = statement.executeQuery("select * from voting where type='answer'");
            while (rs.next()) {
                this.votes = this.votes + rs.getInt(4);
            }
            if (this.votes == 0) this.votes = 1;
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        } finally {
            try {
                dbConnection.close();
            } catch (SQLException se) {
                /*can't do anything */ }
            try {
                statement.close();
            } catch (SQLException se) {
                /*can't do anything */ }
        }
    }

}
