<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script>
    let recipe_add = {
        init:function(){
            $('#register_btn').click(function(){
                recipe_add.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/recipe/addImpl',
                // enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        recipe_add.init();
    });
</script>

<body>
<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="anime__details__content">
            <div class="row">
                <div class="col-lg-3">

                </div>
                <div class="col-lg-9">
                    <div class="anime__details__text">

                        <div>
                            <form id="register_form" class="register_form">

                                <input type="hidden" name="custpin" id="custpin" value="${logincust.custpin}">
                                <input type="hidden" name="custid" id="custid" value="${logincust.custid}">
                                <input type="hidden" name="nickname" id="nickname" value="${logincust.nickname}">

                                <input type="text" name="recipetitle" id="recipetitle" placeholder="Enter Recipe Title"><br>
                                <input type="text" name="type" id="type" placeholder="Enter Recipe Type"><br>
                                <input type="text" name="situation" id="situation" placeholder="Enter Recipe Situation"><br>
                                <input type="text" name="ingredients1" id="ingredients1" placeholder="Enter Ingredient 1"><br>
                                <input type="text" name="ingredients2" id="ingredients2" placeholder="Enter Ingredient 2"><br>
                                <input type="text" name="ingredients3" id="ingredients3" placeholder="Enter Ingredient 3"><br>
                                <input type="text" name="cooking" id="cooking" placeholder="Enter Cooking Name"><br>
                                <input type="number" name="time" id="time" placeholder="Enter Cooking Time"><br>
                                <input type="text" name="recipelevel" id="recipelevel" placeholder="Enter Cooking Level"><br>
                                <input type="text" name="recipedesc" id="recipedesc" placeholder="Enter Recipe Description"><br>

                                <div class="form-group">
                                    <label class="control-label col-sm-2">Thumbnail Image:</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" id="thumbnailimg" name="thumbnailimg"
                                               placeholder="Input Thumbnail Image">
                                    </div>
                                </div>

<%--                                <div>--%>
<%--                                    <label class="control-label col-sm-2">Finished Image:</label>--%>
<%--                                    <div class="col-sm-10">--%>
<%--                                        <input type="file" class="form-control" id="finishedimg" name="finishedimg"--%>
<%--                                               placeholder="Input Finished Image">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

                                <button type="button" id="register_btn">Register</button>
                            </form>
                        </div>
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