<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    function displayImage(event) {
        var reader = new FileReader();
        reader.onload = function () {
            var section = document.getElementById('profileimgview');
            section.style.backgroundImage = 'url(' + reader.result + ')';
        };
        reader.readAsDataURL(event.target.files[0]);
    }

    let profilemodify_form = {
        maxSize: 52428800, //50M
        init: function () {
            $('.nice-select:eq(0)').css({
                'width': '30%',
                'height': '50px',
            });
            $('.nice-select:eq(1)').css({
                'width': '100%',
                'height': '50px',
            });
            $('.current').css({
                'top': 4.4
            });
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
            $("#Malebtn").click(function () {
                $("#gender").val('M');
                $("#Malebtn").css('background', '#f28123');
                $("#Femalebtn").css('background', '#b7b7b7');
            });
            $("#Femalebtn").click(function () {
                $("#gender").val('F');
                $("#Malebtn").css('background', '#b7b7b7');
                $("#Femalebtn").css('background', '#f28123');
            });
            $('.phonezone select, .phonezone input[type="text"]').on('change', function () {
                var prefix = $('.selected:first').text();
                var middle = $('#phone_middle').val();
                var end = $('#phone_end').val();
                var phoneNumber = prefix + middle + end;
                $('#phone').val(phoneNumber);
            });
            $('.locationzone select').on('change', function () {
                var loca = $('.selected:eq(1)').text();
                var location = loca;
                $('#location').val(location);
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
        },
    }

    $(function () {
        profilemodify_form.init();
    });
</script>

<!-- Normal Breadcrumb Begin -->


<c:choose>
    <c:when test="${logincust.profileimgname == null || logincust.profileimgname ==''}">
        <section id="profileimgview" class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                 style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
        </section>
    </c:when>
    <c:otherwise>
        <section id="profileimgview" class="normal-breadcrumb set-bg" data-setbg="/uimg/${logincust.profileimgname}"
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
                                   id="img" style="display: none" onchange="displayImage(event)">
                            <input type="button" value="Profile Image"
                                   onclick="document.getElementById('img').click();" style="text-align: left"/>
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
                        <div class="input__item">
                            <input type="text" placeholder="Your Name" name="custname" id="custname"
                                   value="${logincust.custname}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item">
                            <input type="text" placeholder="Your Nickname" name="nickname" id="nickname"
                                   value="${logincust.nickname}">
                            <span class="icon_mail"></span>
                        </div>
                        <div class="input__item" id="genderzone">
                            <button type="button" class="site-btn" id="Malebtn"
                            ${logincust.gender == 'M' ? 'style="width: 49%;background-color: #f28123"' : 'style="width: 49%;background-color: #b7b7b7"'}>
                                Male
                            </button>
                            <button type="button" class="site-btn" id="Femalebtn"
                            ${logincust.gender == 'F' ? 'style="width: 49%;background-color: #f28123"' : 'style="width: 49%;background-color: #b7b7b7"'}>
                                Female
                            </button>
                            <input type="hidden" name="gender" id="gender" value="${logincust.gender}">
                        </div>
                        <div class="input__item phonezone" style="display: flex">
                            <select name="phone_prefix" id="phone_prefix">
                                <option value="010" ${location.phone eq '010' ? 'selected' : ''}>010</option>
                                <option value="011" ${location.phone eq '011' ? 'selected' : ''}>011</option>
                                <option value="016" ${location.phone eq '016' ? 'selected' : ''}>016</option>
                                <option value="017" ${location.phone eq '017' ? 'selected' : ''}>017</option>
                                <option value="019" ${location.phone eq '019' ? 'selected' : ''}>019</option>
                            </select>
                            <div class="input__item phonezone" style="display: flex; margin-bottom: 0">
                                <input type="text" pattern="[0-9]{4}" minlength="4" maxlength="4" placeholder="0000"
                                       name="phone_middle"
                                       id="phone_middle" style="width: 48%;  margin: 0 1% 0 1%">
                                <input type="text" pattern="[0-9]{4}" minlength="4" maxlength="4" placeholder="0000"
                                       name="phone_end"
                                       id="phone_end" style="width: 48%">
                            </div>
                            <input type="hidden" name="phone" id="phone" value="${logincust.phone}">
                        </div>
                        <div class="input__item locationzone" style="display: flex">
                            <select name="location_prefix" id="location_prefix">
                                <option value="서울" ${logincust.location eq '서울' ? 'selected' : ''}>서울</option>
                                <option value="인천" ${logincust.location eq '인천' ? 'selected' : ''}>인천</option>
                                <option value="경기" ${logincust.location eq '경기' ? 'selected' : ''}>경기</option>
                                <option value="대전" ${logincust.location eq '대전' ? 'selected' : ''}>대전</option>
                                <option value="충청" ${logincust.location eq '충청' ? 'selected' : ''}>충청</option>
                                <option value="부산" ${logincust.location eq '부산' ? 'selected' : ''}>부산</option>
                                <option value="대구" ${logincust.location eq '대구' ? 'selected' : ''}>대구</option>
                                <option value="울산" ${logincust.location eq '울산' ? 'selected' : ''}>울산</option>
                                <option value="경상" ${logincust.location eq '경상' ? 'selected' : ''}>경상</option>
                                <option value="광주" ${logincust.location eq '광주' ? 'selected' : ''}>광주</option>
                                <option value="전라" ${logincust.location eq '전라' ? 'selected' : ''}>전라</option>
                                <option value="강원" ${logincust.location eq '강원' ? 'selected' : ''}>강원</option>
                                <option value="제주" ${logincust.location eq '제주' ? 'selected' : ''}>제주</option>
                            </select>
                            <input type="hidden" name="location" id="location" value="${logincust.location}">
                        </div>

                        <button type="button" class="site-btn" id="profilemodify_btn">My Profile Update Now</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Signup Section End -->

<style>
    #genderzone::before, .phonezone::before {
        display: none;
    }

</style>

