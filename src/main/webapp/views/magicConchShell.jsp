<%--
  Created by IntelliJ IDEA.
  User: naeunlee
  Date: 2023/05/30
  Time: 1:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script>
    var yes = new Audio("res/yes.ogg");
    var no = new Audio("res/no.ogg");
    var lastMod = 0;
    var waitTime = 3000;
    function sleep (time) {
        return new Promise((resolve) => setTimeout(resolve, time));
    }
    function playAnswer() {
        var answer = (Math.random() >= 0.5) ? "Yes" : "No";
        var audio = (answer === "Yes") ? yes : no;
        audio.play();
        answerText.innerHTML = answer
        lastMod = new Date().getTime();
        sleep(waitTime).then(() => {
            var time = new Date().getTime();
            if (time - lastMod >= waitTime) {
                answerText.innerHTML = ""
                lastMod = time;
            }
        });
    }
</script>

<style>
    @media only screen and (max-width: 479px) {

    }

    #conchShell {
        display: table;
        margin: auto;
    }

    #bg {
        height: 80vh;
    }

    #conchShellImg {
        width: 350px;
        height: 420px;
        /*margin-top: 12vh;*/
        /*margin-bottom: 10vh;*/
        background-size: contain;
    }

    #conchShellImg:hover {
     /*background-image: url("res/conch_shell_glow.png");*/
    }

    #conchShellImg:active {
    /*background-image: url("res/conch_shell_glow.png");*/
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
                <div class="set-bg" data-setbg="/uimg/conch.png" id="conchShellImg"></div>
            </a>
        </div>
        <h1 id="answerText"></h1>
    </div>
</div>


