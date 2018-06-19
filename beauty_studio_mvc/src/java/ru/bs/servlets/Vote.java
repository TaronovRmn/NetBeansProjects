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
public class Vote extends Dispatcher {
    
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int answer = Integer.parseInt(request.getParameter("vote"));
        HttpSession session = request.getSession(false);
        User user;
        user = (User) session.getAttribute("user");
        if (!Voting.isUserVoted(user)) Voting.userVote(user, answer);
        this.forward("/index", request, response);
        
    }
    
}
