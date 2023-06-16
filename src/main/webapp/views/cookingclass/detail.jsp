<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let class_map = {
        map: null,
        geocoder: null,
        init: function () {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                mapOption = {
                    center: new kakao.maps.LatLng(37.47, 126.98), // 지도의 중심좌표
                    level: 3 // 지도의 확대 레벨
                };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 주소-좌표 변환 객체를 생성합니다
            var geocoder = new kakao.maps.services.Geocoder();

            // 주소로 좌표를 검색합니다
            geocoder.addressSearch('서울 성동구 가람길 110', function (result, status) {
                console.log("${classdetail.address}");
                // 정상적으로 검색이 완료됐으면
                if (status === kakao.maps.services.Status.OK) {

                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 결과값으로 받은 위치를 마커로 표시합니다
                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: coords
                    });

                    // 인포윈도우로 장소에 대한 설명을 표시합니다
                    var infowindow = new kakao.maps.InfoWindow({
                        content: '<div style="width:150px;text-align:center;padding:6px 0;">${classdetail.classtitle}</div>'
                    });
                    infowindow.open(map, marker);

                    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                    map.setCenter(coords);
                }
            });

        }
    };
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
    $(function () {
        class_map.init();
        comment_form.init();
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
                    <div class="single-article-text" style="margin-bottom: 50px">
                        <div class="class-bg" style="margin-bottom: 30px;">
                            <img src="/uimg/${classdetail.thumbnailimg}" alt="">
                        </div>
                        <h2 style="color:#F28123; font-weight: bolder">
                            [${classdetail.location}] ${classdetail.classtitle}</h2>
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> 수업소요시간 : ${classdetail.classtime} 분</span>
                            <span class="date"><i class="fas fa-calendar"></i> 지역 : ${classdetail.location}</span>
                            <span class="date"><i class="fas fa-calendar"></i> 정원 : ${classdetail.personal} 명</span>
                        </p>
                    </div>
                    <div class="class-step">
                        <div class="section-title">
                            <h5>클래스 소개</h5>
                        </div>
                        <p>${classdetail.classdesc}</p>
                    </div>
                    <div class="class-step" id="classmap">
                        <div class="section-title">
                            <h5>위치</h5>
                        </div>
                        <p>${classdetail.address}</p>
                        <div id="map" style="width:100%; height:500px; margin-top: 20px;"></div>
                    </div>

                    <div class="comments-list-wrap">
                        <div class="comment-list">
                            <div class="single-comment-body">
                                <div class="anime__details__review">
                                    <div class="section-title">
                                        <h5>Comment</h5>
                                    </div>

                                    <c:forEach var="obj" items="${classComment}">
                                        <div class="anime__review__item">
                                            <div class="anime__review__item__pic">
                                                <img src="/uimg/${logincust.profileimgname}" alt="">
                                            </div>
                                            <div class="anime__review__item__text">
                                                <div class="form-horizontal"
                                                     style="display: flex; justify-content: space-between">
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${obj.profileimgname != null}">
                                                                <img src="/uimg/${obj.custid}_profileimg.jpg">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="/img/basic_profile.png">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </div>
                                                    <div>
                                                        <c:choose>
                                                            <c:when test="${logincust.custid == obj.custid}">
                                                                <form action="/cookingclass/commentDel" method="post">
                                                                    <input type="hidden" name="classcommentpin"
                                                                           value="${obj.classcommentpin}">
                                                                    <input type="hidden" name="classpin"
                                                                           value="${obj.classpin}">
                                                                    <div class="anime__details__btn">
                                                                        <button type="submit"
                                                                                formaction="/cookingclass/commentDel"
                                                                                style="color: #ffffff; background-color: #f28123; font-weight: 700; letter-spacing: 2px;
                                                                    text-transform: uppercase; border-radius: 4px;
                                                                    border: unset">X
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div>
                                                <div>
                                                    <p>${obj.content}</p>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <div class="anime__details__form">
                                        <div class="section-title">
                                            <h5>Your Comment</h5>
                                        </div>
                                        <form id="comment_form">
                                            <input type="hidden" name="classpin" id="classpin"
                                                   value="${classdetail.classpin}">
                                            <input type="hidden" name="custpin" id="custpin"
                                                   value="${logincust.custpin}">
                                            <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                                            <input type="hidden" name="nickname" id="nickname"
                                                   value="${logincust.nickname}">
                                            <textarea name="content" id="content" placeholder="Your Comment"></textarea>
                                            <button type="button" id="comment_btn">Register</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="sidebar-section">
                    <div class="archive-posts">
                        <h4>호스트 소개</h4>
                        <div class="anime__review__item__pic">
                            <img src="/uimg/${cbobj.profileimgname}" alt="">
                        </div>
                        <div>
                            <c:choose>
                                <c:when test="${classdetail.nickname != null}">
                                    <h6>${classdetail.nickname}</h6>
                                </c:when>
                                <c:otherwise>
                                    <h6>${classdetail.custid}</h6>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div class="recent-posts">
                        <h4>${classdetail.cooking}</h4>
                    </div>
                    <div class="single-product-form">
                        <form action="index.html">
                            <input type="number" placeholder="0">
                        </form>
                        <a href="cart.html" class="cart-btn"> 클래스 신청</a>
                    </div>
                    <h4>Share:</h4>
                    <ul class="product-share">
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                        <li><a href=""><i class="fab fa-google-plus-g"></i></a></li>
                        <li><a href=""><i class="fab fa-linkedin"></i></a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end single article section -->
</body>