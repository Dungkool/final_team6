<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>
    <meta charset="UTF-8"/>
    <meta name="description" content="Anime Template"/>
    <meta name="keywords" content="Anime, unica, creative, html"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
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
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css"/>
    <link rel="stylesheet" href="/css/plyr.css" type="text/css"/>
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css"/>
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css"/>
    <link rel="stylesheet" href="/css/style.css" type="text/css"/>
</head>

<body>
<!-- Normal Breadcrumb Begin -->
<section class="normal-breadcrumb set-bg" data-setbg="/uimg/classmain.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="normal__breadcrumb__text">
                    <h2>Our Blog</h2>
                    <p>Welcome to the official Anime blog.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Normal Breadcrumb End -->

<div class="container">
    <div class="row">
        <div class="col-lg-6">
            <div class="row">
                <div class="col-lg-12">
                    <div id="id_search_category" style="display: block;" class="rcp_m_cate">
                        <table style="width: 100%; cellspacing: 0; cellpadding: 0">
                            <colgroup>
                                <col style="width: 100px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th style="padding-top: 10px;">
                                    <span>지역별</span>
                                    <span>종류별</span>
                                </th>
                                <td>
                                    <div class="rcp_cate st3">
                                        <div class="cate_list">
                                            <a href="javascript:goSearchRecipe('cat4','')" class="active">전체</a><a
                                                href="javascript:goSearchRecipe('cat4','63')">서울</a><a
                                                href="javascript:goSearchRecipe('cat4','56')">경기</a><a
                                                href="javascript:goSearchRecipe('cat4','54')">강원</a><a
                                                href="javascript:goSearchRecipe('cat4','55')">충북</a><a
                                                href="javascript:goSearchRecipe('cat4','60')">충남</a><a
                                                href="javascript:goSearchRecipe('cat4','53')">경북</a><a
                                                href="javascript:goSearchRecipe('cat4','52')">경남</a><a
                                                href="javascript:goSearchRecipe('cat4','53')">전북</a><a
                                                href="javascript:goSearchRecipe('cat4','52')">전남</a><a
                                                href="javascript:goSearchRecipe('cat4','62')">기타</a></div>
                                        <div class="cate_list">
                                            <a href="javascript:goSearchRecipe('cat2','')" class="active">전체</a><a
                                                href="javascript:goSearchRecipe('cat2','12')">한식</a><a
                                                href="javascript:goSearchRecipe('cat2','18')">양식</a><a
                                                href="javascript:goSearchRecipe('cat2','13')">중식</a><a
                                                href="javascript:goSearchRecipe('cat2','19')">일식</a><a
                                                href="javascript:goSearchRecipe('cat2','22')">기타</a></div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="blog__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Yuri Kuma Arashi Viverra Tortor Pharetra</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card1.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Bok no Hero Academia Season 4 – 18</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card2.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Fate/Stay Night: Untimated Blade World</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="blog__item set-bg" data-setbg="/uimg/card3.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Housekishou Richard shi no Nazo Kantei Season 08 - 20</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Fate/Stay Night: Untimated Blade World</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Building a Better LiA Drilling Down</a></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Fate/Stay Night: Untimated Blade World</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card3.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Building a Better LiA Drilling Down</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="blog__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Yuri Kuma Arashi Viverra Tortor Pharetra</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Bok no Hero Academia Season 4 – 18</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item small__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Fate/Stay Night: Untimated Blade World</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="blog__item set-bg" data-setbg="/uimg/card.jpg">
                            <div class="blog__item__text">
                                <p><span class="icon_calendar"></span> 01 March 2020</p>
                                <h4><a href="#">Yuri Kuma Arashi Viverra Tortor Pharetra</a></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

</body>
