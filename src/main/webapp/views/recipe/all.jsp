<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <meta charset="UTF-8" />
    <meta name="description" content="Anime Template" />
    <meta name="keywords" content="Anime, unica, creative, html" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Colly on the Table | Template</title>

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
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css" />
    <link rel="stylesheet" href="/css/plyr.css" type="text/css" />
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css" />
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css" />
    <link rel="stylesheet" href="/css/style.css" type="text/css" />
</head>

<body>
    <div>
        <h1>Recipe</h1>
    </div>

    <div>
        <div>
            <h3>종류별</h3> <button>한식</button><button>한식</button><button>한식</button><button>한식</button>
        </div>
        <h3>상황별</h3>
        <h3>재료별</h3>
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

                        <c:forEach var="obj" items="${recipelist}">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg">
                                        <a href="#" data-toggle="modal" data-target="#target${obj.id}">
                                            <img src="/uimg/${obj.imgname}" alt="">
                                        </a>
                                    </div>
                                    <div class="product__item__text">
                                        <ul>
                                            <li>Active</li>
                                            <li>Movie</li>
                                        </ul>
                                        <h5>
                                            <a href="#">${obj.recipetitle}<br>한그릇 덮밥 추천</a>
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

<%--                        <c:forEach var="obj" items="${clist}">--%>
<%--                            <div class="col-lg-4 col-md-6 col-sm-12 pb-1">--%>

<%--                                <div class="card product-item border-0 mb-4">--%>

<%--                                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">--%>
<%--                                        <a href="#" data-toggle="modal" data-target="#target${obj.id}">--%>
<%--                                            <img class="img-fluid w-100" src="/uimg/${obj.imgname}" alt="">--%>
<%--                                        </a>--%>
<%--                                    </div>--%>
<%--                                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">--%>
<%--                                        <h6 class="text-truncate mb-3">${obj.name}</h6>--%>
<%--                                        <div class="d-flex justify-content-center">--%>
<%--                                            <h6><fmt:formatNumber type="number" pattern="###,###원" value="${obj.price}"/></h6>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="card-footer d-flex justify-content-between bg-light border">--%>
<%--                                        <a href="/item/detail?id=${obj.id}" class="btn btn-sm text-dark p-0"><i--%>
<%--                                                class="fas fa-eye text-primary mr-1"></i>View--%>
<%--                                            Detail</a>--%>
<%--                                        <form id="cart_form_${obj.id}" class="cart_form">--%>
<%--                                            <input type="hidden" name="cust_id" value="${logincust.id}">--%>
<%--                                            <input type="hidden" name="item_id" value="${obj.id}">--%>
<%--                                            <input type="hidden" name="detail_cnt" value=0>--%>
<%--                                            <input type="hidden" name="cnt" value=1>--%>
<%--                                            <button type="button" class="btn btn-sm text-dark p-0 cartplus_btn"--%>
<%--                                                    id="cartplus_btn_${obj.id}">--%>
<%--                                                <i class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart--%>
<%--                                            </button>--%>
<%--                                        </form>--%>
<%--                                    </div>--%>

<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </c:forEach>--%>


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
