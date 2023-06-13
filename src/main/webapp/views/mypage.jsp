<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script>

</script>
<c:choose>
    <c:when test="${logincust != null && logincust.custid == mypagecust.custid}">
        <!-- Normal Breadcrumb Begin -->
        <a href="/apply/profilemodify">

            <c:choose>
                <c:when test="${logincust.profileimgname == null || logincust.profileimgname ==''}">
                    <section class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                             style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                    </section>
                </c:when>
                <c:otherwise>
                    <section class="normal-breadcrumb set-bg" data-setbg="/uimg/${logincust.profileimgname}"
                             style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                    </section>
                </c:otherwise>
            </c:choose>
        </a>
    </c:when>
    <c:otherwise>
        <c:choose>
            <c:when test="${mypagecust.profileimgname == null || mypagecust.profileimgname ==''}">
                <section class="normal-breadcrumb set-bg" data-setbg="/img/basic_profile.png"
                         style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                </section>
            </c:when>
            <c:otherwise>
                <section class="normal-breadcrumb set-bg" data-setbg="/uimg/${mypagecust.profileimgname}"
                         style="width: 300px; margin: auto; border-radius: 50%; border: 5px solid #f28123; background-size: cover">
                </section>
            </c:otherwise>
        </c:choose>
    </c:otherwise>
</c:choose>
<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-8">
                <div class="anime__details__review">
                    <div class="section-title">
                        <h5>My Recipe List</h5>
                    </div>
                    <div class="anime__review__item">
                        <div class="anime__review__item__pic">
                            <img src="img/anime/review-1.jpg" alt="">
                        </div>
                        <div class="anime__review__item__text">
                            <h6>Chris Curry - <span>1 Hour ago</span></h6>
                            <p>whachikan Just noticed that someone categorized this as belonging to the genre
                                "demons" LOL</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="anime__details__sidebar">
                    <div class="section-title">
                        <h5>My Subcribe List</h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-1.jpg">
                        <h5><a href="#">Boruto: Naruto next generations</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-2.jpg">
                        <h5><a href="#">The Seven Deadly Sins: Wrath of the Gods</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-3.jpg">
                        <h5><a href="#">Sword art online alicization war of underworld</a></h5>
                    </div>
                    <div class="product__sidebar__view__item set-bg" data-setbg="img/sidebar/tv-4.jpg">
                        <h5><a href="#">Fate/stay night: Heaven's Feel I. presage flower</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Anime Section End -->

