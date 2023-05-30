<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
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
                            <p>Welcome to RECIPES</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Normal Breadcrumb End -->

        <div class="product-section mt-150 mb-150">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="product-filters">
                            <ul>
                                <li class="active" data-filter="*">지역별</li>
                                <li data-filter="#">서울</li>
                                <li data-filter="#">인천</li>
                                <li data-filter="#">경기</li>
                                <li data-filter="#">대전</li>
                                <li data-filter="#">충청</li>
                                <li data-filter="#">부산</li>
                                <li data-filter="#">대구</li>
                                <li data-filter="#">울산</li>
                                <li data-filter="#">경상</li>
                                <li data-filter="#">광주</li>
                                <li data-filter="#">전라</li>
                                <li data-filter="#">강원</li>
                                <li data-filter="#">기타</li>
                            </ul>
                            <ul>
                                <li class="active" data-filter="*">종류별</li>
                                <li data-filter="#">한식</li>
                                <li data-filter="#">양식</li>
                                <li data-filter="#">중식</li>
                                <li data-filter="#">일식</li>
                                <li data-filter="#">기타</li>
                            </ul>
                        </div>
                    </div>
                </div>
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
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <div class="btn__all">
                                    <a href="#" class="primary-btn"
                                    >View All <span class="arrow_right"></span
                                    ></a>
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
                                            <li>Movie</li>
                                        </ul>
                                        <h5>
                                            <a href="/recipe/detail?recipepin=${obj.recipepin}">${obj.recipetitle}<br>${obj.recipedesc}</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        </div>
                        <!-- pagination start -->
                        <div class="col-12 pb-1">
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center mb-3">
                                    <c:choose>
                                        <c:when test="${cpage.getPrePage() != 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/recipe/all?pageNo=${cpage.getPrePage()}"
                                                   aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }"
                                               var="page">
                                        <c:choose>
                                            <c:when test="${cpage.getPageNum() == page}">
                                                <li class="page-item active">
                                                    <a class="page-link" href="/recipe/all?pageNo=${page}">${page}</a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <li>
                                                    <a class="page-link" href="/recipe/all?pageNo=${page}">${page}</a>
                                                </li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${cpage.getNextPage() != 0}">
                                            <li class="page-item">
                                                <a class="page-link" href="/recipe/all?pageNo=${cpage.getNextPage()}"
                                                   aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>

                                </ul>
                            </nav>
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


</body>
