<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script>
    let recipe_add = {
        maxSize: 52428800, //50M
        init:function(){
            $('#register_btn').click(function(){
                var inputFile = $("input[name='img']");
                var files = inputFile[0].files;
                for (var i = 0; i < files.length; i++) {
                    // 함수 호출(checkExtension)
                    if (!recipe_add.checkExtension(files[i].name, files[i].size)) {
                        return;
                    }
                }
                recipe_add.send();
            });
        },
        checkExtension: function (fileName, fileSize) {
            var reg = new RegExp("(.*?)\.(exe|zip|alz)$");
            // 파일크기 제한
            // 실제파일의 크기 > 최대 크기
            if (fileSize >= this.maxSize) {
                alert("파일 사이즈 초과");
                return false;
            }
            // 확장자 제한
            // 실제파일명의 확장자와 정규식 비교
            // 정규식이면
            if (reg.test(fileName)) {
                alert("해당 종류의 파일은 업로드 할 수 없습니다.");
                return false;
            }
            return true;
        },
        send:function(){

            $('#register_form').attr({
                method:'post',
                action:'/recipe/addImpl',
                enctype: 'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };
    $(function(){
        recipe_add.init();
    });
</script>

<!-- Anime Section Begin -->
<section class="anime-details spad">
    <div class="container">
        <div class="anime__details__content">
            <div class="row">
                <div class="col-lg-3">
                    recipe register
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



                                <div>
                                    <label class="control-label col-sm-2">Finished Image:</label>
                                    <div class="col-sm-10">
                                        <input type="file" class="form-control" id="img" name="img"
                                               placeholder="Input Finished Image">
                                        <input type="hidden" name="thumbnailimg" value="${thumbnailimg}">
                                        <input type="hidden" name="finishedimg" value="1.png">
                                    </div>
                                </div>

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
