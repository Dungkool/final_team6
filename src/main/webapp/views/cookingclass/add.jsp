<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230"></script>

<script>
    $(document).ready(function () {
        $("#biz_image").on('change', function () {
            var fileName = $(this).val();
            $(".upload-name").val(fileName);
        });
    });

    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function (event) {
            var img = document.createElement("img");
            img.setAttribute("src", event.target.result);
            img.setAttribute("class", "image_container");
            document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0]);
    }
</script>

<head>
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">
    <!-- fontawesome -->
    <link rel="stylesheet" href="/css/all.min.css">
    <!-- bootstrap -->
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <!-- owl carousel -->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <!-- magnific popup -->
    <link rel="stylesheet" href="/css/magnific-popup.css">
    <!-- animate css -->
    <link rel="stylesheet" href="/css/animate.css">
    <!-- mean menu css -->
    <link rel="stylesheet" href="/css/meanmenu.min.css">
    <!-- main style -->
    <link rel="stylesheet" href="/css/main.css">
    <!-- responsive -->
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
</head>

<body>
<!-- class register section -->
<div class="mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="login__form">
                        <form id="classregister_form">
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 01. 호스트 인증</h5>
                                </div>
                                <h2>${result.biznum}</h2>
                                <h2>${result.bizname}</h2>
                                <h2>${result.bizowner}</h2>
                                <h2>${result.bizdate}</h2>
                                <h2>${result.bizadd}</h2>
                                <p>사업자 등록증으로 호스트님을 인증해주세요</p>
                                <div class="filebox">
                                    <input class="upload-name" aria-label="Search"
                                           value="사업자등록증을 등록해주세요"
                                           placeholder="사업자등록증을 등록해주세요">
                                    <label for="biz_image">파일 찾기</label>
                                    <input type="file" name="biz_image"
                                           id="biz_image" onchange="setThumbnail(event);">
                                    <div id="image_container" class="image_container"></div>
                                </div>

                                <button id="ocr_btn" class="btn" type="button"
                                        style="background-color: #F28123; color: #fff; ">인증
                                </button>


                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 02. 클래스 유형</h5>
                                    <div class="form-group" style="margin-top: 30px;">
                                        <div class="form-check-category">
                                            <fieldset>
                                                <label>
                                                    <input type="radio" id="type1" name="type" value="korean" checked/>&nbsp
                                                    <span>한식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type2" name="type" value="western"/>&nbsp
                                                    <span>양식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type3" name="type" value="chinese"/>&nbsp
                                                    <span>중식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type4" name="type" value="japanese"/>&nbsp
                                                    <span>일식</span>
                                                </label>
                                                <label>
                                                    <input type="radio" id="type5" name="type" value="etc"/>&nbsp
                                                    <span>기타</span>
                                                </label>
                                            </fieldset>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 03. 클래스 소개</h5>
                                </div>
                                <div class="login__form" style="padding-left: 0">
                                    <div class="input__item">
                                        <input type="text" name="type" id="type"
                                               placeholder="Enter Recipe Type"><br>
                                    </div>
                                </div>
                            </div>
                            <div class="class-step">
                                <div class="section-title">
                                    <h5>STEP 04. 금액 및 일정</h5>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- side section start -->
            <div class="col-lg-4">
                <div class="sidebar-section">
                    <div class="archive-posts">
                        <h4>STEP 01. 호스트 인증</h4>
                        <h4>STEP 02. 클래스 유형</h4>
                        <h4>STEP 03. 클래스 소개</h4>
                        <ul>
                            <li>클래스 소개</li>
                            <li>호스트 소개</li>
                        </ul>
                        <h4>STEP 04. 금액 및 일정</h4>
                        <ul>
                            <li>금액</li>
                            <li>일정</li>
                        </ul>
                    </div>

                    <div class="single-product-form">
                        <a href="cart.html" class="cart-btn"> 클래스 등록</a>
                    </div>
                </div>
            </div>
            <!-- side section end -->
        </div>
    </div>
</div>
<!-- end class register section -->
</body>