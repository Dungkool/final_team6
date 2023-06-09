<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Anime Template"/>
    <meta name="keywords" content="Anime, unica, creative, html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=186d9ac6e73cf3e121e11e749901f230&libraries=services"></script>
    <title>Kolly on the Table</title>

    <!-- Google Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap"
            rel="stylesheet"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
            rel="stylesheet"
    />

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.css" type="text/css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="/css/plyr.css" type="text/css"/>
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
    <style>
        .magicIcon {
            position: fixed;
            right: 20px;
            bottom: 30px;
            z-index: 11;
            animation: action 1s infinite alternate
        }

        @keyframes action {
            0% {
                transform: translateY(0)
            }
            100% {
                transform: translateY(-15px)
            }
        }

        #magicIcon {
            width: 180px;
            height: 190px
        }
    </style>
</head>

<body>

<div class="magicIcon">
    <a href="/magic"><img id="magicIcon" src="/img/conch.png" alt="Conch Shell"></a>
</div>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header">
    <div class="container">
        <div class="row">
            <div class="col-lg-2">
                <div class="header__logo">
                    <a href="/">
                        <img style="width: 125px" src="/img/logo.png" alt="logo"/>
                    </a>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="header__nav">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="/recipe/all">Recipe</a></li>
                            <li><a href="/cookingclass/class?location=&type=&classtitle=&sort=1">Class</a></li>
                            <li><a href="/contacts">Contacts</a></li>
                            <c:choose>
                                <c:when test="${logincust != null}">
                                    <li><a>Register</a>
                                        <ul class="dropdown">
                                            <li><a href="/recipe/add">Recipe</a></li>
                                            <li><a href="/cookingclass/add">Class</a></li>
                                        </ul>
                                    </li>
                                </c:when>
                            </c:choose>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-lg-2">
                <div class="header__right">
                    <ul>
                        <c:choose>
                            <c:when test="${logincust == null}">
                                <li><a href="/login" class="search-switch">Login</a></li>
                                <li><a href="/apply">Apply</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/login/logout" class="search-switch">Logout
                                </a></li>
                                <li><a href="/apply/mypage?custid=${logincust.custid}" class="search-switch">
                                    My Page
                                </a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>
<!-- Header End -->


<!--  Main Center Start -->
<c:choose>
    <c:when test="${center == null}">
        <jsp:include page="center.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>

<!--  Main Center End -->

<!-- Footer Section Begin -->
<footer class="footer">
    <div class="page-up">
        <a href="#" id="scrollToTopButton"
        ><span class="arrow_carrot-up"></span
        ></a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="footer__logo">
                    <a href="/"><img style="width: 125px" src="/img/logo.png" alt=""/></a>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="footer__nav">
                    <ul>
                        <li class="active"><a href="/">Homepage</a></li>
                        <li><a href="/recipe/all">Recipe</a></li>
                        <li><a href="/class?location=&type=&sort=">Class</a></li>
                        <li><a href="/contacts">Contacts</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3">
                <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>
                        document.write(new Date().getFullYear());
                    </script>
                    All rights reserved | This template is made with
                    <i class="fa fa-heart" aria-hidden="true"></i> by
                    <a href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->

<!-- Search model Begin -->
<div class="search-model">
    <div class="h-100 d-flex align-items-center justify-content-center">
        <div class="search-close-switch"><i class="icon_close"></i></div>
        <form class="search-model-form">
            <input type="text" id="search-input" placeholder="Search here....."/>
        </form>
    </div>
</div>
<!-- Search model end -->

<!-- Js Plugins -->
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/player.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>
</body>


</html>
