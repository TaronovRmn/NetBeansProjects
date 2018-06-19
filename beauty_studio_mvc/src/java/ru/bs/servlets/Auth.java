/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ru.bs.servlets;

import ru.bs.beans.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TaronovR
 */
public class Auth extends Dispatcher {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext ctx = getServletContext();
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        User user = UserList.findUser(email, password);
        ctx.setAttribute("user", user);
        boolean res = user != null;
        if (res) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            response.sendRedirect("index");
        } else {
            this.forward("/auth_error.jsp", request, response);
        }

    }

}
