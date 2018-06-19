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

/**
 *
 * @author TaronovR
 */
public class SearchUsers extends Dispatcher {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        
        UserList ul = new UserList();
        boolean res = ul.searchUsers(email);
        request.setAttribute("users", ul.getUserList());
        request.setAttribute("reqtype", "search");
        request.setAttribute("size", ul.getUserList().size()); 
        this.forward("/admin.jsp", request, response);

    }

}
