<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>
    let recipe_search = {
        init: function () {
            $('#search_btn').click(function () {
                $('#search_form').attr({
                    method: 'post',
                    action: '/recipe/search'
                });
                $('#search_form').submit();
            });
            // 클릭 이벤트 핸들러 수정
            $('#type li').click(function () {
                // 선택된 지역 값을 가져옴
                let type = $(this).text();

                // 선택된 지역 값이 "*"(빈 문자열)인 경우 전체 데이터 조회
                if (type === "") {
                    type = "*";
                }

                // 선택된 지역 값을 폼에 설정
                $('#type_input').val(type);

                // 폼을 서버로 제출
                $('#category_form').attr({
                    method: 'post',
                    action: '/recipe/searchType'
                });
                $('#category_form').submit();
            });

            $('#situation li').click(function () {
                let situation = $(this).text();
                if (situation === "") {
                    situation = "*";
                }
                $('#situation_input').val(situation);

                // 폼을 서버로 제출
                $('#category_form').attr({
                    method: 'post',
                    action: '/recipe/searchSituation'
                });
                $('#category_form').submit();
            });
        }
    };
    $(document).ready(function () {
        recipe_search.init();
    });

    // $(function () {
    //     recipe_search.init();
    // })
</script>

<head>
    <!-- google font -->
    <%--    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css?family=Poppins:400,700&display=swap" rel="stylesheet">--%>
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
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/recipemain.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>RECIPES ALL OVER THE WORLD</h2>
                    <p>Welcome to KOLLY'S RECIPES</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<div class="product-section mt-50 mb-150">
    <div class="container">
        <div class="row">
            <div class="col" style="margin-bottom: 30px">
                <form id="search_form" class="d-flex" style="float: right;">
                    <input class="form-control me-2" type="text" placeholder="Search by Recipe Title"
                           aria-label="Search"
                           name="recipetitle" id="recipetitle" value="${recipetitle}">
                    <button id="search_btn" class="btn btn-outline" type="button"
                            style="border: 2px solid #F28123; background-color: #F28123; color: #fff;">Search
                    </button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <form id="category_form">
                <div class="product-filters">
                    <ul>
                        <li class="active" data-filter="*">지역별</li>
                        <li data-filter="서울">서울</li>
                        <li data-filter="인천">인천</li>
                        <li data-filter="경기">경기</li>
                        <li data-filter="대전">대전</li>
                        <li data-filter="충청">충청</li>
                        <li data-filter="부산">부산</li>
                        <li data-filter="대구">대구</li>
                        <li data-filter="울산">울산</li>
                        <li data-filter="경상">경상</li>
                        <li data-filter="광주">광주</li>
                        <li data-filter="전라">전라</li>
                        <li data-filter="강원">강원</li>
                        <li data-filter="기타">기타</li>
                    </ul>

                    <ul id="type" name="type">
                        <li class="active" data-filter="*">종류별</li>
                        <li data-filter="한식">한식</li>
                        <li data-filter="양식">양식</li>
                        <li data-filter="중식">중식</li>
                        <li data-filter="일식">일식</li>
                        <li data-filter="기타">기타</li>
                    </ul>

                    <ul id="situation" name="situation">
                        <li class="active" data-filter="*">상황별</li>
                        <li data-filter="간식">간식</li>
                        <li data-filter="집들이">집들이</li>
                        <li data-filter="생일">생일</li>
                        <li data-filter="기타">기타</li>
                    </ul>
                </div>
                    <input type="hidden" id="type_input" name="type">
                    <input type="hidden" id="situation_input" name="situation">
                </form>
            </div>
        </div>

        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="trending__product">
                            <div class="row">
                                <div class="col-lg-8 col-md-8 col-sm-8">
                                    <div class="section-title">
                                        <h4>ALL Recipes</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="row" >
                                <c:forEach var="obj" items="${recipeList}">
                                    <div class="col-lg-4 col-md-6 col-sm-6">
                                        <div class="product__item">
                                            <a href="/recipe/detail?recipepin=${obj.recipepin}" data-target="#target${obj.recipepin}">
                                                <div class="product__item__pic set-bg" data-setbg="/uimg/${obj.thumbnailimg}"></div>
                                                    <%--                                            <img src="/uimg/${obj.thumbnailimg}" alt="">--%>
                                            </a>
                                            <div class="product__item__text">
                                                <ul>
                                                    <li>Active</li>
                                                    <li>Movies</li>
                                                </ul>
                                                <h5 style="text-align: center;">
                                                    <a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}</a>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>

                            <!-- pagination start -->
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <div class="pagination-wrap">
                                        <ul>
                                            <c:choose>
                                                <c:when test="${cpage.getPrePage() != 0}">
                                                    <li class="pagination-wrap">
                                                        <a href="/recipe/all?pageNo=${cpage.getPrePage()}" aria-label="Previous">
                                                            <span>Prev</span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="pagination-wrap disabled">
                                                        <a href="#" aria-label="Previous">
                                                            <span>Prev</span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
                                                <c:choose>
                                                    <c:when test="${cpage.getPageNum() == page}">
                                                        <li class="pagination-wrap active">
                                                            <a class="pagination-wrap active" href="/recipe/all?pageNo=${page}">${page}</a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li>
                                                            <a href="/recipe/all?pageNo=${page}">${page}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:choose>
                                                <c:when test="${cpage.getNextPage() != 0}">
                                                    <li class="pagination-wrap">
                                                        <a href="/recipe/all?pageNo=${cpage.getNextPage()}"
                                                           aria-label="Next">
                                                            <span>Next</span>
                                                        </a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise>
                                                    <li class="pagination-wrap disabled">
                                                        <a href="#" aria-label="Next">
                                                            <span>Next</span>
                                                        </a>
                                                    </li>
                                                </c:otherwise>
                                            </c:choose>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- pagination end -->


                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-8">
                        <div class="product__sidebar">
                            <div class="product__sidebar__view">
                                <div class="section-title">
                                    <h5>Top Views</h5>
                                </div>
                                <ul class="filter__controls">
                                    <li class="active" data-filter="*">Day</li>
                                    <li data-filter=".week">Week</li>
                                    <li data-filter=".month">Month</li>
                                    <li data-filter=".years">Years</li>
                                </ul>
                                <div class="filter__gallery">
                                    <div
                                            class="product__sidebar__view__item set-bg mix day years"
                                            data-setbg="/img/sidebar/tv-1.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5><a href="#">Boruto: Naruto next generations</a></h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix month week"
                                            data-setbg="/img/sidebar/tv-2.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix week years"
                                            data-setbg="/img/sidebar/tv-3.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#"
                                            >Sword art online alicization war of underworld</a
                                            >
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix years month"
                                            data-setbg="/img/sidebar/tv-4.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#"
                                            >Fate/stay night: Heaven's Feel I. presage flower</a
                                            >
                                        </h5>
                                    </div>
                                    <div
                                            class="product__sidebar__view__item set-bg mix day"
                                            data-setbg="/img/sidebar/tv-5.jpg"
                                    >
                                        <div class="ep">18 / ?</div>
                                        <div class="view"><i class="fa fa-eye"></i> 9141</div>
                                        <h5>
                                            <a href="#">Fate stay night unlimited blade works</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="product__sidebar__comment">
                                <div class="section-title">
                                    <h5>New Comment</h5>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-1.jpg" alt="" />
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5>
                                            <a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
                                        </h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-2.jpg" alt="" />
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Shirogane Tamashii hen Kouhan sen</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-3.jpg" alt="" />
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Kizumonogatari III: Reiket su-hen</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                                <div class="product__sidebar__comment__item">
                                    <div class="product__sidebar__comment__item__pic">
                                        <img src="/img/sidebar/comment-4.jpg" alt="" />
                                    </div>
                                    <div class="product__sidebar__comment__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5><a href="#">Monogatari Series: Second Season</a></h5>
                                        <span><i class="fa fa-eye"></i> 19.141 Viewes</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

</body>