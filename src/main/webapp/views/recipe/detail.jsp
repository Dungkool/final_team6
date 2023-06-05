<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let register_form = {
        init: function () {
            $("#register_btn").click(function () {
                <c:choose>
                <c:when test="${logincust != null}">
                $('#login_btn').prop("disabled", false);
                register_form.send();
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
            var recipepin = $('#recipepin').val();
            var custpin = $('#custpin').val();
            var custid = $('#custid').val();
            var nickname = $('#nickname').val();
            var content = $('#content').val();

            $("#register_form").attr({
                "action": "/recipe/commentImpl",
                "method": "post"
            });
            $("#register_form").submit();
        }
    }

    $(function () {
        register_form.init();
    });
</script>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Anime | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div style="right: 0%">
            <c:choose>
                <c:when test="${logincust.custid == recipedetail.custid}">
                    <a href="/recipe/amend">수정</a>
                </c:when>
            </c:choose>
        </div>
        <div class="anime__details__content">
            <div class="row">

                <div class="col-lg-3">
                    <div class="anime__details__pic set-bg">
                        <img src="/uimg/${recipedetail.thumbnailimg}" style="height: 80%"/>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">
                        <div class="anime__details__title">
                            <h3>${recipedetail.recipetitle}</h3>
                        </div>
                        <div class="anime__details__rating">
                            <div class="rating">
                                <span>개수 Votes</span>
                            </div>
                        </div>
                        <p>조리시간 : ${recipedetail.time}분</p>
                        <p>난이도 : ${recipedetail.recipelevel}</p>
                        <div class="anime__details__widget">
                            <div class="row">
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <c:forEach var="String" items="${ingredientList}" begin="0" end="4">
                                            <li><span>${String.name} : ${String.quantity}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <ul>
                                        <c:forEach var="String" items="${ingredientList}" begin="5">
                                            <li><span>${String.name} : ${String.quantity}</span></li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="anime__details__btn">
                            <button class="follow-btn" style="border: unset">Subscribe</button>
                            <button class="follow-btn" style="border: unset">Like</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                    <div class="section-title">
                        <h5>Reviews</h5>
                    </div>

                    <c:forEach var="obj" items="${recipeComment}">
                        <div class="anime__review__item">
                            <div class="anime__review__item__pic">
                                <img src="/uimg/${logincust.profileimgname}" alt="">
                            </div>
                            <div class="anime__review__item__text">
                                <div class="form-horizontal" style="display: flex; justify-content: space-between">
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
                                                <form action="/recipe/commentDel" method="post">
                                                    <input type="hidden" name="recipecommentpin" value="${obj.recipecommentpin}">
                                                    <input type="hidden" name="recipepin" value="${obj.recipepin}">
                                                    <div class="anime__details__btn">
                                                        <button type="submit" formaction="/recipe/commentDel"
                                                                style="color: #ffffff; background-color: #f28123; font-weight: 700; letter-spacing: 2px;
                                                                    text-transform: uppercase; border-radius: 4px;
                                                                    border: unset">X</button>
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
                        <form id="register_form">

                            <input type="hidden" name="recipepin" id="recipepin" value="${recipedetail.recipepin}">
                            <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                            <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                            <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">
                            <textarea name="content" id="content" placeholder="Your Comment"></textarea>
                            <button type="button" id="register_btn">Register</button>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here.....">
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/player.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<script src="js/mixitup.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/main.js"></script>

</body>