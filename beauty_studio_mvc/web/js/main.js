jQuery(document).ready(function($) {
    $(' .slickslider').slick({
        prevArrow: '<img src="images/arrows/left.png" class="leftA">',
        nextArrow: '<img src="images/arrows/right.png" class="rightA">'
    })


    $('#loginform').click(function() {
        $('.regist').hide();
        $('.login').fadeToggle('slow');
        $(this).toggleClass('active');
    });

    $('#regform').click(function() {
        $('.login').hide();
        $('.regist').fadeToggle('slow');
        $(this).toggleClass('active');
        generateCaptcha();
    });

    $('#refresh').click(function() {
        generateCaptcha();
    });
    $('#check').click(function() {

    });

    function onlyNumbers(el) {
        el.on("change keyup input click", function() {
            if (this.value.match(/[^0-9]/g)) {
                this.value = this.value.replace(/[^0-9]/g, "");
            };
        });

        return false;
    };
    onlyNumbers($('.nonly'));





    $(document).mouseup(function(e) {
        var container = $(".login");

        if (!container.is(e.target) // if the target of the click isn't the container...
            &&
            container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.hide();
            $('#loginform').removeClass('active');
        }
        container = $(".regist");

        if (!container.is(e.target) // if the target of the click isn't the container...
            &&
            container.has(e.target).length === 0) // ... nor a descendant of the container
        {
            container.hide();
            $('#regform').removeClass('active');
        }

    });

    function generateCaptcha() {
        var alpha = new Array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0');
        var i;
        for (i = 0; i < 4; i++) {
            var a = alpha[Math.floor(Math.random() * alpha.length)];
            var b = alpha[Math.floor(Math.random() * alpha.length)];
            var c = alpha[Math.floor(Math.random() * alpha.length)];
            var d = alpha[Math.floor(Math.random() * alpha.length)];
        }
        var code = a + '' + b + '' + '' + c + '' + d;
        $('#mainCaptcha').html(code);
    }

    function checkValidCaptcha() {

        var string1 = removeSpaces($('#mainCaptcha').text());
        var string2 = removeSpaces($('#txtInput').val());
        if (string1 == string2) {
            $('#success').html('Регистрация успешна!');
            $('.errorc').html('');
            //alert("Form is validated Successfully");
            return true;
        } else {
            $('.errorc').html('Повторите попытку!');
            $('#success').html('');
            generateCaptcha();
            $('#txtInput').val('');
            $('.password2').val('');
            //alert("Please enter a valid captcha.");
            return false;

        }
    }
    //пароли
    function checkPass() {
        var pas1 = $('.regist .password').val();
        var pas2 = $('.regist .password2').val();
        if (pas1 != "" && pas1 != pas2) {
            $('#error').html('Пароли не совпадают!');
            $('.regist .password2').css({ 'box-shadow': '0 0 1px 1px #d8512d' });
            $('.regist .password2').addClass('error_field');
            return false
        } else {
            $('#error').html('');
            $('.regist .password2').removeAttr('style');
            $('.regist .password2').removeClass('error_field');
            return true
        }

    }
    $(function() {
        var passchk = 0;
        $('.regist .password2').focus(function() {
                passchk = setInterval(function() {
                    checkPass();
                }, 500);
            })
            .blur(function() {
                clearInterval(passchk);

            });
    }); //сравнение паролей в реальном времени

    function removeSpaces(string) {
        return string.split(' ').join('');
    }

    $(function() {

        $('.logform').each(function() {
            // Объявляем переменные (форма и кнопка отправки)
            var form = $(this),
                btn = form.find('.btn_submit');

            // Добавляем каждому проверяемому полю, указание что поле пустое
            form.find('.rfield').addClass('empty_field');

            // Функция проверки полей формы
            function checkInput() {
                form.find('.rfield').each(function() {
                    if ($(this).val() != '') {
                        // Если поле не пустое удаляем класс-указание
                        $(this).removeClass('empty_field');
                    } else {
                        // Если поле пустое добавляем класс-указание
                        $(this).addClass('empty_field');
                    }

                });
            }

            // Функция подсветки незаполненных полей
            function lightEmpty() {
                form.find('.rfield').each(function() {
                    if ($(this).hasClass('empty_field') || $(this).hasClass('error_field')) {
                        $(this).css({ 'box-shadow': '0 0 1px 1px #d8512d' });
                    } else {
                        $(this).removeAttr('style');
                    }
                });
            }

            $('.em').blur(function() {
                if ($(this).val() != '') {
                    var pattern = /^([a-z0-9_\.-])+@[a-z0-9-]+\.([a-z]{2,4}\.)?[a-z]{2,4}$/i;
                    if (pattern.test($(this).val())) {
                        $(this).removeAttr('style');
                        $(this).removeClass('error_field');
                        $('.errorc').text('');
                    } else {
                        $(this).css({ 'box-shadow': '0 0 1px 1px #d8512d' });
                        $('.errorc').text('Не верно введён email!');
                        $(this).addClass('error_field');
                    }
                } else {
                    $(this).css({ 'box-shadow': '0 0 1px 1px #d8512d' });
                    $('.errorc').text('Поле email не должно быть пустым!');
                }
            });

            var tried = false;


            // Проверка в режиме реального времени
            setInterval(function() {
                // Запускаем функцию проверки полей на заполненность
                checkInput();
                if (tried) lightEmpty();
                // Считаем к-во незаполненных полей
                var sizeEmpty = form.find('.empty_field').size();
                var sizeErr = form.find('.error_field').size();
                // Вешаем условие-тригер на кнопку отправки формы
                if (sizeEmpty > 0 || sizeErr > 0) {
                    if (btn.hasClass('disabled')) {
                        return false
                    } else {
                        btn.addClass('disabled')
                    }
                } else {
                    btn.removeClass('disabled')
                }
            }, 500);

            // Событие клика по кнопке отправить
            btn.click(function() {
                if ($(this).hasClass('disabled')) {
                    // подсвечиваем незаполненные поля и форму не отправляем, если есть незаполненные поля
                    lightEmpty();
                    tried = true;
                    return false
                } else {
                    // Все хорошо, все заполнено, отправляем форму
                    var cpt = true;
                    if ($(this).hasClass('wc')) {
                        cpt = checkValidCaptcha();

                    }
                    if (cpt && checkPass()) {
                        form.submit();
                    } else {
                        return false
                    }
                }
            });

        });




    }); //проверка на заполненность полей
//
//    $(function() {
//        $('a[href*=#]').click(function() {
//            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
//                location.hostname == this.hostname) {
//                var $target = $(this.hash);
//                $target = $target.length && $target || $('[name=' + this.hash.slice(1) + ']');
//                if ($target.length) {
//                    var targetOffset = $target.offset().top;
//                    $('html,body').animate({ scrollTop: targetOffset }, 500); //скорость прокрутки
//                    return false;
//                }
//            }
//        });
//    }); //скроллинг



});