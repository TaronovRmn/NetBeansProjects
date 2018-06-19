<%-- 
    Document   : admin
    Created on : 26.05.2018, 21:32:30
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Салон красоты</title>
        <link rel="stylesheet" href="css/main.css ">
        <link rel="stylesheet" href="css/table.css">
        <link rel="icon" href="images/favicon.ico" type="image/x-icon" />

        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/slick-theme.css">

    </head>

    <body>
        <a id="anch_head"></a>
        <header>
            <div class="wrapper">
                <div class="container">
                    <div class="left">
                        <a href="index#anch_head"><img src="images/logo.png"></a>
                        <a href="index#anch_port">Портфолио</a>
                        <a href="index#anch_addr">Адреса</a>
                        <a href="Shedule">Запись</a>
                    </div>
                    <div class="right">
                        <div class="container2">
                            <div class="phone">
                                <a href="tel:8(913)794-52-96">8(913)794-52-96</a>
                                <br>
                                <span>карла маркса 21</span>
                            </div>
                            <div class="phone">
                                <a href="tel:8(923)137-77-30">8(923)137-77-30</a>
                                <br>
                                <span>карла маркса 3214</span>
                            </div>
                            <div class="reg">

                                <c:if test="${pageContext.session.getAttribute('user') == null}">
                                    <a href="" onclick="return false" id="loginform">Вход</a> |
                                    <a href="" onclick="return false" id="regform">Регистрация</a>
                                </c:if> 
                                <c:if test="${pageContext.session.getAttribute('user') != null}">
                                    <a href="" onclick="return false" id="username">${pageContext.session.getAttribute('user').getName()} </a> |
                                    <a href="Logout">Выход</a>
                                </c:if>



                                <div class="login">
                                    <div class="arrow-up"></div>
                                    <div class="formholder">
                                        <div class="randompad">
                                            <form action="Auth" method="post" class="logform">
                                                <fieldset>
                                                    <label>E-mail</label>
                                                    <input name="email" type="email" class="em rfield" placeholder="example@example.ru" />
                                                    <label>Пароль</label>
                                                    <input name="password" type="password" class="rfield" />
                                                    <span class="errorc" style="color:red"></span>
                                                    <input type="submit" class="btn_submit disabled" value="Войти" />
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="regist">
                                    <div class="arrow-up"></div>
                                    <div class="formholder">
                                        <div class="randompad">
                                            <form action="Registration" method="post" class="logform">
                                                <fieldset>
                                                    <label>Ваше имя</label>
                                                    <input name="name" class="rfield" />
                                                    <label>Номер телефона</label>
                                                    <input name="phone" class="rfield nonly" />
                                                    <label>E-mail</label>
                                                    <input name="email" type="email" class="em rfield" placeholder="example@example.ru" />
                                                    <label>Пароль</label>
                                                    <input name="password" type="password" class="rfield password" />
                                                    <label>Пароль еще раз</label>
                                                    <input type="password" class="rfield password2" />
                                                    <div class="cpch">
                                                        <span id="mainCaptcha"></span>
                                                        <input type="button" id="refresh" value="Обновить" />
                                                    </div>
                                                    <label>Введите изображенные символы:</label>
                                                    <input type="text" id="txtInput" class="rfield" />
                                                    <span id="error" style="color:red"></span>
                                                    <span class="errorc" style="color:red"></span>
                                                    <span id="success" style="color:green"></span>
                                                    <input type="submit" id="check" class="btn_submit disabled wc" value="Зарегистрироваться" />
                                                </fieldset>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="social_links">
                                <a href="#"><img src="images/instagram.svg" alt="instagramm"></a>
                                <a href="#"><img src="images/vk.svg" alt="vk.com"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <div class="head_content">
            <div class="wrapper">
                <div class="container">
                    <div class="main_content">

                        <div class="htext" style="font-size: 20px;">Удаление пользователя:</div>
                        <div class="admin_menu">
                            <form method="post" action="RemoveUser">
                                <input name="id" placeholder="Введите ID" type="text">
                                <input type="submit" value="Удалить" />
                            </form>
                        </div>
                        <c:if test="${reqtype == 'remove'}">
                            <p style="margin-left: 50px; margin-bottom: 20px;">${result}</p>
                        </c:if> 
                        <div class="htext" style="font-size: 20px;">Поиск пользователя:</div>
                        <div class="admin_menu">
                            <form method="post" action="SearchUsers">
                                <input name="email" placeholder="Введите E-mail" type="text">
                                <input type="submit" value="Найти" />
                            </form>                            
                        </div>
                        <c:if test="${reqtype == 'search'}">
                            <p style="margin-left: 50px; margin-bottom: 20px;">По вашему запросу найдено ${size} пользователей.</p>
                        </c:if> 


                        <div class="htext" style="font-size: 20px;">Список пользователей:</div>

                        <table cellspacing="0">
                            <tr>
                                <th>id</th>
                                <th>username</th>
                                <th>phone</th>
                                <th>email</th>
                                <th>password</th>
                                <th>role</th>                                
                            </tr>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.name}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.email}</td>
                                    <td>${user.password}</td>
                                    <td>${user.role}</td>
                                </tr>
                            </c:forEach>
                        </table>

                        <form method="get" action="admin">
                            <input style="width:200px;" type="submit" value="Показать всех" />
                        </form>

                    </div>
                </div>
            </div>
        </div>


        <footer>
            <div class="wrapper">
                <div class="container">
                    <div class="copy">
                        2018 &copy;
                        <a href="tel:8(913)794-52-96">8(913)794-52-96</a> - Рома
                        <br>
                        <a href="tel:8(923)137-77-30">8(923)137-77-30</a> - Степа
                    </div>
                    <div class="links">
                        <a href="#">О компании</a>
                        <a href="#">Карта сайта</a>
                        <a href="admin">Управление БД</a>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/jquery.min.js"></script>
        <script src="js/slick.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
