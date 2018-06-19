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
public class Registration extends Dispatcher {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext ctx = getServletContext();
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        User newUser = new User();
        newUser.setName(name);
        newUser.setPhone(phone);
        newUser.setEmail(email);
        newUser.setPassword(password);
        ctx.setAttribute("user", newUser);
        boolean res = UserList.addUser(newUser);

        if (res) {
            User user = UserList.findUser(email, password);
                    
            HttpSession session = request.getSession(true);
            session.setAttribute("user", user);
            this.forward("/success_registration.jsp", request, response);
        } else {
            this.forward("/error_registration.jsp", request, response);
        }

    }

}
