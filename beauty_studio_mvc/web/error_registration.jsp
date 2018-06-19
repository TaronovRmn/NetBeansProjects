<%-- 
    Document   : error_registration
    Created on : 28.05.2018, 17:43:33
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Refresh" content="5;url=index">
        <title>Ошибка</title>
    </head>
    <body>
        <h1>Ошибка регистрации</h1>
        <jsp:useBean id="user" class="ru.bs.beans.User" scope="application"/>
        Пользователь с e-mail: ${user.getEmail()} уже зарегистрирован.<br>
        Переход на предыдущую страницу через 5 секунд...
    </body>
</html>
