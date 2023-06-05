<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let profilemodify_form = {
        maxSize: 52428800, //50M
        init: function () {
            $("#profilemodify_btn").click(function () {
                var inputFile = $("input[name='img']");
                var files = inputFile[0].files;
                for (var i = 0; i < files.length; i++) {
                    // 함수 호출(checkExtension)
                    if (!profilemodify_form.checkExtension(files[i].name, files[i].size)) {
                        return;
                    }
                }
                profilemodify_form.send();
            });

        },
        checkExtension: function (fileName, fileSize) {
            var reg = new RegExp("(.*?)\.(exe|zip|alz)$");

            // 파일크기 제한
            // 실제파일의 크기 > 최대 크기
            if (fileSize >= this.maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }

            // 확장자 제한
            // 실제파일명의 확장자와 정규식 비교
            // 정규식이면
            if (reg.test(fileName)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;

        },
        send: function () {
            var password = $('#password').val();
            var email = $('#email').val();
            var emailCheck = document.getElementById("email");

            if (password == '') {
                $('#password').focus();
                alert("비밀번호는 필수 입력입니다.");
                return;
            }
            if (email == '') {
                $('#email').focus();
                alert("이메일 주소는 필수 입력입니다.");
                return;
            }
            if (!(emailCheck.checkValidity())) {
                alert("유효하지 않은 이메일 주소입니다.");
                return;
            }
            $("#profilemodify_form").attr({
                method: 'post',
                action: '/apply/profilemodifyimpl',
                enctype: 'multipart/form-data'
            });
            $("#profilemodify_form").submit();
        }
    }

    $(function () {
        profilemodify_form.init();
    });
</script>

<!-- Normal Breadcrumb Begin -->


<c:choose>
    <c:when test="${logincust.profileimgname == null || logincust.profileimgname ==''}">
        <section class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                 style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
        </section>
    </c:when>
    <c:otherwise>
        <section class="normal-breadcrumb set-bg" data-setbg="/uimg/${logincust.profileimgname}"
                 style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
        </section>
    </c:otherwise>
</c:choose>

<!-- Normal Breadcrumb End -->
<!-- Signup Section Begin -->
<section class="signup spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login__form">
                    <h3 style="color: #b7b7b7">My Profile</h3>
                    <form id="profilemodify_form">
                        <input type="hidden" name="profileimgname" value="${logincust.profileimgname}">
                        <div class="input__item">
                            <input type="file" placeholder="Your ProfileImage" name="img"
                                   id="img" style="display: none">
                            <input type="button" value="Profile Image"
                                   onclick="document.getElementById('img').click();"/>
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Your ID" name="custid" id="custid"
                                   value="${logincust.custid}" readonly>
                            <span class="icon_profile"></span>
                        </div>
                        <div class="input__item">
                            <input type="password" placeholder="Password" name="password" id="password">
                            <span class="icon_lock"></span>
                        </div>
                        <div class="input__item">
                            <input type="email" placeholder="Email address" name="email" id="email"
                                   value="${logincust.email}">
                            <span class="icon_mail"></span>
                        </div>
                        <button type="button" class="site-btn" id="profilemodify_btn">Signup Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

