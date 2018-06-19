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
public class Shedule extends Dispatcher {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        NoteList nl = new NoteList();
        nl.getListFromDB();
        HttpSession session = request.getSession(false);
        User user;
        user = (User) session.getAttribute("user");
        if (user == null) {
        request.setAttribute("shtype", "notlogged");
        } else if ("user".equals(user.getRole())) {
            request.setAttribute("shtype", "user");
        } else if ("admin".equals(user.getRole())){
            request.setAttribute("shtype", "admin");
        }
        request.setAttribute("notes", nl.getNoteList());
        this.forward("/shedule.jsp", request, response);

    }

}
