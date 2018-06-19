<%-- 
    Document   : remove
    Created on : 26.05.2018, 23:08:08
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="1;url=admin.jsp">
        <title>Удаление</title>
    </head>
    <body>
        <jsp:useBean id="rhBean" scope="session" class="ru.bs.beans.ResponseHandler" />
        <jsp:setProperty name="rhBean" property="email" />

        <% int removeUserResponse = rhBean.removeUser();
            if (removeUserResponse == 0) {
                out.println("Пользователя с таким email не существует!");
            } else if (removeUserResponse == 1) {
                out.println("Пользователь успешно удален!");
            } else {
                out.println("Ошибка на сервере!");
            }
        %>
        <br>
        <a href="admin.jsp">Продолжить</a>
    </body>
</html>
