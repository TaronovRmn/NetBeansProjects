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
import ru.bs.beans.NoteList;

/**
 *
 * @author TaronovR
 */
public class RemoveNote extends Dispatcher {
 @Override
 public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        boolean res = NoteList.removeNote(Integer.parseInt(request.getParameter("delid")));
        this.forward("/Shedule", request, response);

    }

}
