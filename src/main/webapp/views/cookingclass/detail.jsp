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

    $(function () {
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
                        <div class="single-artcile-bg">
                            <img src="/uimg/${classdetail.thumbnailimg}" alt="">
                        </div>
                        <p class="blog-meta">
                            <span class="author"><i class="fas fa-user"></i> 작성자</span>
                            <span class="date"><i class="fas fa-calendar"></i> 작성일자</span>
                        </p>
                        <h2>${classdetail.classtitle}</h2>
                        <p>${classdetail.classdesc}</p>
                    </div>
                    <div class="single-article-text" id="classmap">
                        <h2>클래스 위치</h2>
                        <div id="map" style="width:500px;height:400px;"></div>
                    </div>

                    <div class="comments-list-wrap">
                        <div class="comment-list">
                            <div class="single-comment-body">
                                <div class="anime__details__review">
                                    <div class="section-title">
                                        <h5>Reviews</h5>
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
                                                            <c:when test="${obj.nickname != null}">
                                                                <h6>${obj.nickname}</h6>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <h6>${obj.custid}</h6>
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
                    <div class="recent-posts">
                        <h4>${classdetail.classtitle}</h4>
                    </div>
                    <div class="archive-posts">
                        <h4>클래스 요약 설명</h4>
                        <ul>
                            <li>블라블라</li>
                            <li>블라블라</li>
                        </ul>
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