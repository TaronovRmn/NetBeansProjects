<%-- 
    Document   : auth
    Created on : 26.05.2018, 17:01:25
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="1;url=index.jsp">
        <title>Авторизация</title>
    </head>
    <body>
        <jsp:useBean id="rhBean" scope="session" class="ru.bs.beans.ResponseHandler" />
        <jsp:setProperty name="rhBean" property="email" />
        <jsp:setProperty name="rhBean" property="password" />
        <% int findUserResponse = rhBean.findUser();
            if (findUserResponse == 1) {
                out.println("Вы успешно авторизованы!");
            } else if (findUserResponse == 0) {
                out.println("Неправильный логин или пароль!");
            } else {
                out.println("Ошибка на сервере!");
            }
        %>
        <br>
        <a href="index.jsp">Продолжить</a>
    </body>
</html>
