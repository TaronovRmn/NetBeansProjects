<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <title>Салон красоты</title>
        <link rel="stylesheet" href="css/main.css ">
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
                        <a href="#anch_head"><img src="images/logo.png"></a>
                        <a href="#anch_port">Портфолио</a>
                        <a href="#anch_addr">Адреса</a>
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
                                <% } else { %>
                                <a href="" onclick="return false" id="username"><%= rhBean.getName() %> </a> |
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
                    <div class="contmenu">
                        <div class="htext">Наши услуги</div>
                        <div class="menu">
                            <div class="menu_elem">
                                <a href="#">
                                    <img src="images/menu/cosmet.svg" alt="instagramm">
                                    <span>Косметика</span>
                                </a>
                            </div>
                            <div class="menu_elem">
                                <a href="#">
                                    <img src="images/menu/depilation_new.svg" alt="instagramm">
                                    <span>Эпиляция</span>
                                </a>
                            </div>
                            <div class="menu_elem">
                                <a href="#">
                                    <img src="images/menu/eye.svg" alt="instagramm">
                                    <span>Ресницы и брови</span>
                                </a>
                            </div>
                            <div class="menu_elem">
                                <a href="index2.html">
                                    <img src="images/menu/hair_new.svg" alt="instagramm">
                                    <span>Парикмахер</span>
                                </a>
                            </div>
                            <div class="menu_elem">
                                <a href="#">
                                    <img src="images/menu/manikur.svg">
                                    <span>Маникюр</span>
                                </a>
                            </div>
                            <div class="menu_elem">
                                <a href="#">
                                    <img src="images/menu/visage.svg" alt="instagramm">
                                    <span>Визаж</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a id="anch_port"></a>
        <div class="portfolio">
            <div class="wrapper">
                <div class="container">
                    <div class="gallery">
                        <div class="htext">Наши работы</div>
                        <div class="slickslider">
                            <div class="portfolio_elem sl1">
                                <div class="slide_flex">
                                    <div class="desc">Маникюр 350 руб. + гель лак KODI 500 руб. + дизайн 300 руб. Мастер: Ольга Бушмина.</div>
                                </div>
                            </div>
                            <div class="portfolio_elem sl2">
                                <div class="slide_flex">
                                    <div class="desc">Маникюр 350 руб. + гель лак KODI 500 руб. + френч 200 руб. Мастер: Кристина.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a id="anch_addr"></a>
        <div class="adress">
            <div class="wrapper">
                <div class="container">
                    <div class="htext"> Наши адреса</div>
                    <div class="adress_elem">
                        <div class="adress_elem_a1">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1142.9994481974497!2d82.9231899820643!3d55.04323524194419!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x42dfe5b888a07097%3A0x5b2d5ee772472c64!2z0YPQuy4g0JPQvtCz0L7Qu9GPLCAxNSwg0J3QvtCy0L7RgdC40LHQuNGA0YHQuiwg0J3QvtCy0L7RgdC40LHQuNGA0YHQutCw0Y8g0L7QsdC7LiwgNjMwMDA1!5e0!3m2!1sru!2sru!4v1521899077479" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                        <div class="adress_elem_a2">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2289.3191484679182!2d82.89783601582528!3d54.98503818035498!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x42dfe6e5918b3cdd%3A0x6859cf80bbc05588!2z0L_RgC4g0JrQsNGA0LvQsCDQnNCw0YDQutGB0LAsIDEwLCDQndC-0LLQvtGB0LjQsdC40YDRgdC6LCDQndC-0LLQvtGB0LjQsdC40YDRgdC60LDRjyDQvtCx0LsuLCA2MzAwNjQ!5e0!3m2!1sru!2sru!4v1521899290323" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
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