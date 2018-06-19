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
public class RemoveUser extends Dispatcher {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean res = UserList.removeUser(request.getParameter("id"));
         request.setAttribute("reqtype", "remove");
        if (res) {
            request.setAttribute("result", "Пользователь успешно удален!");
        }  
        else {
            request.setAttribute("result", "Пользователь с таким ID не найден!");
        }
        UserList ul = new UserList();
        ul.getListFromDB();
        request.setAttribute("users", ul.getUserList());
        this.forward("/admin.jsp", request, response);

    }

}
