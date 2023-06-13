<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230"></script>
<script>
    let comment_form = {
        init: function () {
            $("#comment_btn").click(function () {
                <c:choose>
                <c:when test="${logincust != null}">
                $('#login_btn').prop("disabled", false);
                comment_form.send();
                </c:when>
                <c:otherwise>
                $('#login_btn').prop("disabled", true);
                alert("로그인 후 이용해주세요.")
                </c:otherwise>
                </c:choose>
                // register_form.send();
            });
        },
        send: function () {
            var classpin = $('#classpin').val();
            var custpin = $('#custpin').val();
            var custid = $('#custid').val();
            var nickname = $('#nickname').val();
            var content = $('#content').val();

            $("#comment_form").attr({
                "action": "/cookingclass/commentImpl",
                "method": "post"
            });
            $("#comment_form").submit();
        }
    }
    let class_map = {
        map: null,
        init: function () {
            var mapContainer = document.querySelector('#map');// 지도를 표시할 div
            var mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
            map = new kakao.maps.Map(mapContainer, mapOption);

            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커가 표시될 위치입니다
            var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
            var iwContent = '<img src="/img/nature.jpg" style="width:80px"><div style="padding:5px;">Hello Kakao!</div>';

            // 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent
            });

            // 마커에 마우스오버 이벤트를 등록합니다
            kakao.maps.event.addListener(marker, 'mouseover', function () {
                // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
                infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function () {
                // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
                infowindow.close();
            });

            kakao.maps.event.addListener(marker, 'click', function () {
                location.href = 'http://www.nate.com';
            });
        }
    };

    $(function () {
        comment_form.init();
        class_map.init();
    });
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
<!-- single article section -->
<div class="mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="single-article-section">
                    <div class="single-article-text">
                        <div class="section-title">
                            <h5>STEP 01. 호스트 인증</h5>
                        </div>
                        <h2>${result.biznum}</h2>
                        <h2>${result.bizname}</h2>
                        <h2>${result.bizowner}</h2>
                        <h2>${result.bizdate}</h2>
                        <h2>${result.bizadd}</h2>
                        <form action="/ocrimpl" method="post" enctype="multipart/form-data" id="ocr1_form" class="well"
                              style="margin-top: 30px">
                            <div class="form-group">
                                <label for="img"><p>사업자 등록증으로 호스트님을 인증해주세요</p></label>
                                <input type="file" class="form-control" id="img" placeholder="Input Image" name="img">
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="ocr_btn" class="btn" type="button"
                                            style="background-color: #F28123; color: #fff;">인증
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="single-article-text">
                        <div class="section-title">
                            <h5>STEP 02. 클래스 유형</h5>
                            <div class="form-group" style="margin-top: 30px;">
                                <div class="form-check-category">
                                    <fieldset>
                                        <label>
                                            <input type="radio" id="type1" name="type" value="korean" checked/>&nbsp
                                            <span>  한식</span>
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
                    <div class="single-article-text">
                        <div class="section-title">
                            <h5>STEP 03. 클래스 소개</h5>
                        </div>
                        <p>클래스에 대해 소개해주세요</p>
                        <div class="login__form" style="padding-left: 0">
                            <div class="input__item">
                                <input type="text" name="type" id="type" placeholder="Enter Recipe Type"><br>
                            </div>
                        </div>
                    </div>
                    <div class="single-article-text">
                        <div class="section-title">
                            <h5>STEP 04. 금액 및 일정</h5>
                        </div>

                    </div>
                </div>
            </div>
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
        </div>
    </div>
</div>
<!-- end single article section -->
</body>