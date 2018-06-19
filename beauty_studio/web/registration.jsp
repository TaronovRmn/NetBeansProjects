<%-- 
    Document   : registration
    Created on : 26.05.2018, 14:15:38
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="1;url=index.jsp">
        <title>Регистрация</title>
    </head>
    <body>
        <jsp:useBean id="rhBean" scope="session" class="ru.bs.beans.ResponseHandler" />
        <jsp:setProperty name="rhBean" property="name" />
        <jsp:setProperty name="rhBean" property="phone" />
        <jsp:setProperty name="rhBean" property="email" />
        <jsp:setProperty name="rhBean" property="password" />
        
        <% int addUserResponse = rhBean.addUser();
            if (addUserResponse == 1) {
                out.println("Пользователь успешно зарегистрирован!");
            } else if (addUserResponse == 0) {
                out.println("Пользователь с таким email уже существует!");
            } else {
                out.println("Ошибка на сервере!");
            }
        %>
    </body>
</html>
