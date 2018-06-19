<%-- 
    Document   : admin
    Created on : 26.05.2018, 21:32:30
    Author     : TaronovR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
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
                        <a href="index.jsp#anch_head"><img src="images/logo.png"></a>
                        <a href="index.jsp#anch_port">Портфолио</a>
                        <a href="index.jsp#anch_addr">Адреса</a>
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
                                <jsp:useBean id="rhBean" scope="session" class="ru.bs.beans.ResponseHandler" />
                                <% if (rhBean.getName() == null) { %>

                                <a href="" onclick="return false" id="loginform">Вход</a> |
                                <a href="" onclick="return false" id="regform">Регистрация</a>
                                <% } else {%>
                                <a href="" onclick="return false" id="username"><%= rhBean.getName()%> </a> |
                                <a href="logout.jsp">Выход</a>
                                <% }%>



                                <div class="login">
                                    <div class="arrow-up"></div>
                                    <div class="formholder">
                                        <div class="randompad">
                                            <form action="auth.jsp" method="post" class="logform">
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
                                            <form action="registration.jsp" method="post" class="logform">
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
                        <%
                            Connection dbConnection
                                    = DriverManager.getConnection("jdbc:ucanaccess://C:\\Users\\taron\\Documents\\NetBeansProjects\\beauty_studio\\src\\db\\database.accdb");
                            Statement statement = dbConnection.createStatement();
                            String usermail = request.getParameter("email");
                            ResultSet resultset;
                            if (usermail == null) {
                                resultset
                                        = statement.executeQuery("select * from users");
                            } else {
                                resultset
                                        = statement.executeQuery("select * from users where email like '" + usermail + "%'");
                            }
                        %>

                        <div class="htext" style="font-size: 20px;">Удаление пользователя:</div>
                        <div class="admin_menu">
                            <form method="post" action="remove.jsp">
                                <input name="email" placeholder="Введите E-mail" type="text">
                                <input type="submit" value="Удалить" />
                            </form>
                            
                        </div>
                        <div class="htext" style="font-size: 20px;">Поиск пользователя:</div>
                        <div class="admin_menu">
                            <form method="post" action="admin.jsp">
                                <input name="email" placeholder="Введите E-mail" type="text">
                                <input type="submit" value="Найти" />
                            </form>
                        </div>

                        
                        
                        <div class="htext" style="font-size: 20px;">Список пользователей:</div>

                        <table cellspacing="0">
                            <tr>
                                <th>id</th>
                                <th>username</th>
                                <th>phone</th>
                                <th>email</th>
                                <th>password</th>                                
                            </tr>
                            <% while (resultset.next()) {%>
                            <tr>
                                <td> <%= resultset.getString(1)%></td>
                                <td> <%= resultset.getString(2)%></td>
                                <td> <%= resultset.getString(3)%></td>
                                <td> <%= resultset.getString(4)%></td>
                                <td> <%= resultset.getString(5)%></td>
                            </tr>
                            <% }%>
                        </table>
                        
                        <form method="post" action="admin.jsp">
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
                        <a href="admin.jsp">Управление БД</a>
                    </div>
                </div>
            </div>
        </footer>
        <script src="js/jquery.min.js"></script>
        <script src="js/slick.js"></script>
        <script src="js/main.js"></script>
    </body>

</html>
