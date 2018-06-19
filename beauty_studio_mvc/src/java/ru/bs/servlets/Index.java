/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.servlets;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ru.bs.beans.*;

/**
 *
 * @author TaronovR
 */
public class Index extends Dispatcher {

        @Override
        public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext ctx = getServletContext();
        Voting voting = new Voting();
        request.setAttribute("voting", voting);
        HttpSession session = request.getSession(true);
        User user;
        user = (User) session.getAttribute("user");
        if (user == null) {
        request.setAttribute("votetype", "notlogged");
        } else if (Voting.isUserVoted(user)) {
            request.setAttribute("votetype", "voted");
        } else {
            request.setAttribute("votetype", "normal");
        }
        this.forward("/index.jsp", request, response);

    }

}
