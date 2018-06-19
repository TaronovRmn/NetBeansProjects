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
import ru.bs.beans.*;

/**
 *
 * @author TaronovR
 */
public class Admin extends Dispatcher {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserList ul = new UserList();
        ul.getListFromDB();
        request.setAttribute("users", ul.getUserList());
        this.forward("/admin.jsp", request, response);

    }

}
