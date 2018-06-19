<%-- 
    Document   : logout
    Created on : 26.05.2018, 16:53:38
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>