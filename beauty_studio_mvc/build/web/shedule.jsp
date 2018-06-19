<%-- 
    Document   : shedule
    Created on : 16.06.2018, 14:32:35
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import ="ru.bs.beans.*" %>
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
                        <c:choose>
                            <c:when test="${shtype == 'notlogged'}">
                                <div class="htext" style="font-size: 20px;">Зарегистрируйтесь/авторизуйтесь, чтобы записаться на услугу</div> <br>

                                <div class="htext" style="font-size: 20px;">Расписание:</div>
                                <table cellspacing="0">
                                    <tr>
                                        <th>Имя</th>
                                        <th>Услуга</th>
                                        <th>Дата</th>
                                        <th>Время</th>                                
                                    </tr>
                                    <c:forEach var="note" items="${notes}">
                                        <tr>
                                            <td>${UserList.findUserID(note.userid).getName()}</td>
                                            <td>${note.service}</td>
                                            <td>${note.date}</td>
                                            <td>${note.time}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:when test="${shtype == 'user'}">
                                <div class="htext" style="font-size: 20px;">Запись на услугу:</div>
                                <div class="formholder" style="background: transparent;">
                                    <div class="randompad">
                                        <form action="AddNote" method="get" class="logform">
                                            <fieldset>
                                                <label>Выберите услугу:</label>
                                                <select name="service" class="rfield"/>
                                                <option value="Косметика">Косметика</option>
                                                <option value="Эпиляция">Эпиляция</option>
                                                <option value="Ресницы и брови">Ресницы и брови</option>
                                                <option value="Парикмахер">Парикмахер</option>
                                                <option value="Маникюр">Маникюр</option>
                                                <option value="Визаж">Визаж</option>
                                                </select>
                                                <label>Выберите дату:</label>
                                                <input type="date" name="date" class="rfield"/>
                                                <label>Выберите время:</label>
                                                <input type="time" name="time" class="rfield"/>
                                                <input type="submit" class="btn_submit disabled" style="width:83%;" value="Записаться" />
                                            </fieldset>
                                        </form>
                                    </div>
                                </div>


                                <div class="htext" style="font-size: 20px;">Расписание:</div>

                                <table cellspacing="0">
                                    <tr>
                                        <th>Имя</th>
                                        <th>Услуга</th>
                                        <th>Дата</th>
                                        <th>Время</th>                                
                                    </tr>
                                    <c:forEach var="note" items="${notes}">
                                        <tr>
                                            <td>${UserList.findUserID(note.userid).getName()}</td>
                                            <td>${note.service}</td>
                                            <td>${note.date}</td>
                                            <td>${note.time}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:when test="${shtype == 'admin'}">
                                
                                <div class="htext" style="font-size: 20px;">Расписание:</div>
                                <form action="RemoveNote" method="get">

                                    <table cellspacing="0" style="margin-left: -400px;">
                                    <tr>
                                        <th>id</th>
                                        <th>username</th>
                                        <th>email</th>
                                        <th>phone</th>
                                        <th>service</th>
                                        <th>date</th>
                                        <th>time</th>
                                        <th>delete</th>
                                    </tr>
                                    <c:forEach var="note" items="${notes}">
                                        <tr>
                                            <td>${note.id}</td>
                                            <td>${UserList.findUserID(note.userid).getName()}</td>
                                            <td>${UserList.findUserID(note.userid).getEmail()}</td>
                                            <td>${UserList.findUserID(note.userid).getPhone()}</td>
                                            <td>${note.service}</td>
                                            <td>${note.date}</td>
                                            <td>${note.time}</td>
                                            <td><button type="submit" name="delid" value="${note.id}">Удалить</button></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                </form>
                            </c:when>
                        </c:choose>



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
