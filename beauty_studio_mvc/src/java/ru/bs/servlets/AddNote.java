/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ru.bs.beans.*;

/**
 *
 * @author TaronovR
 */
public class AddNote extends Dispatcher {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        HttpSession session = request.getSession(false);
        User user;
        user = (User) session.getAttribute("user");
        Note note = new Note();
        if (user != null) {
            note.setUserid(user.getId());
            note.setService(service);
            note.setTime(time);
            note.setDate(date);
            NoteList.addNote(note);
        }
        this.forward("/Shedule", request, response);

    }

}
