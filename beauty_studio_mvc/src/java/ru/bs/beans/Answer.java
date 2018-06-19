/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.beans;

/**
 *
 * @author TaronovR
 */
public class Answer {
    private int id;
    private String text;
    private int counter;
    private int percent;
    
    public Answer() {
        id = 0;
        text = null;
        counter = 0;
        percent = 0;
    }

    /**
     * @return the text
     */
    public String getText() {
        return text;
    }

    /**
     * @param text the text to set
     */
    public void setText(String text) {
        this.text = text;
    }

    /**
     * @return the counter
     */
    public int getCounter() {
        return counter;
    }

    /**
     * @param counter the counter to set
     */
    public void setCounter(int counter) {
        this.counter = counter;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the percent
     */
    public int getPercent() {
        return percent;
    }

    /**
     * @param percent the percent to set
     */
    public void setPercent(int percent) {
        this.percent = percent;
    }
    
    
}
