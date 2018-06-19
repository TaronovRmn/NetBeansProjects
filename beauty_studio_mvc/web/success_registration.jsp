<%-- 
    Document   : success_registration
    Created on : 28.05.2018, 17:43:15
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="5;url=index">
        <title>Успешно</title>
    </head>
    <body>
        <h1>Регистрация пользователя успешно завершена</h1>
        <jsp:useBean id="user" class="ru.bs.beans.User" scope="application"/>
        Пользователь: ${user.getEmail()} был успешно зарегистрирован.<br>
        Переход на предыдущую страницу через 5 секунд...
    </body>
</html>
