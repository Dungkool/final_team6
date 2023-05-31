<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script>
    let login_form = {
        init: function () {
            $('#login_btn').prop("disabled", true);
            $('#login_btn').css('background', '#b7b7b7');
            $("#login_btn").click(function () {
                login_form.send();
            });
            $('input').keyup(function () {
                var custid = $('#custid').val();
                var password = $('#password').val();
                if (custid != '' && password != '') {
                    $('#login_btn').prop("disabled", false);
                    $('#login_btn').css('background', '#f28123');
                } else {
                    $('#login_btn').prop("disabled", true);
                    $('#login_btn').css('background', '#b7b7b7');
                }
            });
        },
        send: function () {
            $("#login_form").attr({
                "action": "/login/loginimpl",
                "method": "post"
            });
            $("#login_form").submit();
        }
    }

    $(function () {
        login_form.init();
    });

</script>

<!-- Login Section Begin -->
<section class="login spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3 style="color: #b7b7b7">Login</h3>
                    <form id="login_form">
                        <div class="input__item" style="margin-bottom: 0">
                            <input type="text" placeholder="Your ID" name="custid" id="custid">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password" id="password">
                            <span class="icon_lock"></span>
                        </div>
                        <button type="button" class="site-btn" id="login_btn">Login Now</button>
                    </form>
                    <a href="#" class="forget_pass" style="color: #b7b7b7">Forgot Your Password?</a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__register">
                    <h3 style="color: #b7b7b7">Dont’t Have An Account?</h3>
                    <a href="/apply" class="primary-btn" style="color: #FFFFFF">Register Now</a>
                </div>
            </div>
        </div>
        <div class="login__social">
            <div class="row d-flex justify-content-center">
                <div class="col-lg-6">
                    <div class="login__social__links">
                        <span style="color: #b7b7b7">or</span>
                        <ul>
                            <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With
                                Facebook</a></li>
                            <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                            <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Login Section End -->

