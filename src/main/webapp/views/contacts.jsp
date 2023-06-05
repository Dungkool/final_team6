<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let contact_form = {
        init: function () {
            $('#contact_btn').prop("disabled", true);
            $('#contact_btn').css('background', '#b7b7b7');
            $("#contact_btn").click(function () {
                contact_form.send();
            });

            $('input, textarea').keyup(function () {
                var email = $('#email').val();
                var contacttitle = $('#contacttitle').val();
                var contactcontent = $('#contactcontent').val();
                if (contacttitle != '' && contactcontent != '' && email != '') {
                    $('#contact_btn').prop("disabled", false);
                    $('#contact_btn').css('background', '#e53637');
                } else {
                    $('#contact_btn').prop("disabled", true);
                    $('#contact_btn').css('background', '#b7b7b7');
                }
            });
        },
        send: function () {
            var email = $('#email').val();
            var contacttitle = $('#contacttitle').val();
            var contactcontent = $('#contactcontent').val();
            var emailCheck = document.getElementById("email");
            if (contacttitle == '') {
                $('#email').focus();
                return;
            }
            if (contactcontent == '') {
                $('#email').focus();
                return;
            }
            if (email == '') {
                $('#email').focus();
                return;
            }
            if (!(emailCheck.checkValidity())) {
                alert("유효하지 않은 이메일 주소입니다.");
                return;
            }
            $("#contact_form").attr({
                "action": "/contacts/contactimpl",
                "method": "post"
            });
            $("#contact_form").submit();
        }
    }

    $(function () {
        contact_form.init();
    });
</script>


<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3 style="color: #b7b7b7">Contact</h3>
                    <form id="contact_form">
                        <div class="input__item">
                            <input type="text" placeholder="Your ID" name="custid" id="custid"
                                   value="${logincust.custid}" readonly>
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="email" placeholder="Email address" name="email" id="email"
                                   value="${logincust.email}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Title" name="contacttitle" id="contacttitle">
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item" id="textareazone">
                            <textarea placeholder="Input content" name="contactcontent" id="contactcontent"
                                      style="width: 100%; border: none; color: #b7b7b7; padding: 10px;"
                                      rows="5"></textarea>
                        </div>
                        <input type="hidden" name="custname" value="${logincust.custname}">
                        <input type="hidden" name="custpin" value="${logincust.custpin}">
                        <button type="button" class="site-btn" id="contact_btn">Contact Now
                        </button>
                    </form>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="login__social__links">
                    <h3 style="color: #b7b7b7">Login With:</h3>
                    <ul>
                        <li><a href="#" class="facebook"><i class="fa fa-facebook"></i> Sign in With Facebook</a>
                        </li>
                        <li><a href="#" class="google"><i class="fa fa-google"></i> Sign in With Google</a></li>
                        <li><a href="#" class="twitter"><i class="fa fa-twitter"></i> Sign in With Twitter</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

<style>
    #textareazone::before {
        display: none;
    }

</style>