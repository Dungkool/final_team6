<%--
  Created by IntelliJ IDEA.
  User: naeunlee
  Date: 2023/05/30
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>

    function playAnswer() {
        let data = {
            "voice":{
                languageCode: 'ko-KR',
                name: 'ko-KR-Neural2-A',
                ssmlGender: 'FEMALE'
            },
            "input":{
                "text": "안녕하세요"
                // "text": $('#testInput').val()
            },
            "audioConfig":{
                "audioEncoding":"mp3"
            }
        }
        $.ajax({
            type:'POST',
            url: "https://texttospeech.googleapis.com/v1/text:synthesize?key="+"${key}",
            data: JSON.stringify(data),
            dataType: 'JSON',
            contentType: "application/json; charset=UTF-8",
            success: function(res) {
                var audioFile = new Audio();
                let audioBlob = base64ToBlob(res.audioContent, "mp3");
                audioFile.src = window.URL.createObjectURL(audioBlob);
                audioFile.playbackRate = 1; //재생속도
                audioFile.play();
            },
            error : function(request, status, error ) {
                alert("오류","오류가 발생하였습니다. 관리자에게 문의해주세요.");
            }
        });
    };

    function base64ToBlob(base64, fileType) {
        let typeHeader = "data:application/" + fileType + ";base64,"; // base64 헤더 파일 유형 정의
        let audioSrc = typeHeader + base64;
        let arr = audioSrc.split(",");
        let array = arr[0].match(/:(.*?);/);
        let mime = (array && array.length > 1 ? array[1] : type) || type;
        // url헤더 제거하고 btye로 변환
        let bytes = window.atob(arr[1]);
        // 예외를 처리하고 0보다 작은 ASCII 코드를 0보다 큰 값으로 변환
        let ab = new ArrayBuffer(bytes.length);
        // 뷰 생성(메모리에 직접): 8비트 부호 없는 정수, 길이 1바이트
        let ia = new Uint8Array(ab);
        for (let i = 0; i < bytes.length; i++) {
            ia[i] = bytes.charCodeAt(i);
        }
        return new Blob([ab], {
            type: mime
        });
    }
</script>

<style>
    @media only screen and (max-width: 479px) {
/*나중에 반응형으로 만들기*/
    }

    #conchShell {
        display: table;
        margin: auto;
    }

    #bg {
        height: 80vh;
    }

    #conchShellImg {
        width: 70vh;
        height: 50vh;
        background-size: cover;
        background-image: url("/uimg/conch.png");
        /*에러뜨지만 잘 작동됩니다!*/
        background-repeat: no-repeat;
        background-position: center;
    }

    #conchShellImg:hover,#conchShellImg:active {
        background-image: url(/uimg/conch_glow.png);
        /*에러뜨지만 잘 작동됩니다!*/
    }

    h1,h4 {
        text-align: center;
        font-family: Arial;
        font-weight: bold;
        color: white;
        text-shadow: 0px 0px 12px #565656;
    }
</style>

<div class="container">
    <div class="set-bg" data-setbg="/uimg/bg.jpg" id="bg">
        <h1><br>Ask the Magic Conch Shell</h1>
        <h4><br>마법의 소라고둥님, 무엇을 먹을까요?</h4>
        <div id="conchShell">
            <a href="#" onclick="playAnswer();">
                <div id="conchShellImg"></div>
            </a>
        </div>
        <h1 id="answerText"></h1>
    </div>
</div>

