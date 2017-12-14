<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <link href="<c:url value="/resources/bootstrap/bootstrap.min.css" />"
            rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/spectrum/spectrum.css" />"
            rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/nouislider/nouislider.min.css" />"
          rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/fa/font-awesome.min.css" />"
          rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/chatting.css" />"
          rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/teststyle.css" />"
          rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/css/landing-page.css" />"
          rel="stylesheet" type="text/css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <script type="text/javascript"
            src="<c:url value="/resources/jquery/jquery-3.2.1.min.js"/>"></script>
    <script type="text/javascript"
            src="<c:url value="/resources/interact/interact.js"/>"></script>
</head>
<body>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top"><a class="navbar-brand" href="/">Big-Picture</a>
    <ul class="navbar-nav ml-auto">
        <li class="nav-item"><a class="nav-link" href="/logout">로그아웃</a></li>
    </ul>
</nav>
<script>
    var loadFile = function(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('preview');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    };
    $('.profile-modal').on('show.bs.modal', function() {
        var password = document.getElementById('password');
        var confirm_password = document.getElementById('confirm-password');
        function validatePassword(){
            if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
            } else {
                confirm_password.setCustomValidity('');
            }
        }
        password.onchange = validatePassword;
        confirm_password.onkeyup = validatePassword;
    })
    $('.friend-modal').on('show.bs.modal', function() {
        $("#friend-keyword").keyup(function() {
            var k = $(this).val();
            $(".active > table > tbody > tr").hide();
            var temp = $(".active > table > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
            $(temp).parent().show();
        })
    })
    $('.group-modal').on('show.bs.modal', function() {
        $("#group-keyword").keyup(function() {
            var k = $(this).val();
            $(".active > table > tbody > tr").hide();
            var temp = $(".active > table > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
            $(temp).parent().show();
        })
    })
</script>
<div class="draggable" id="drag-1"
     style="position:fixed; z-index:1000; border-style:solid; border-color:black; background-color:#f8f9fa !important">
    <!--button.btn(onclick='hideFunction()') x-->
    <div class="row tool-margin">
        <div class="row tool-margin" style="width:100%; padding-top:2px">
            <div class="col-4" style="padding-right:1.5px;padding-left:0px">
                <button class="btn btn-primary btn-block" id="changeMode"><span
                        class="fa fa-arrows"></span></button>
            </div>
            <div class="col-4" style="padding-right:1.5px;padding-left:0px">
                <button class="btn btn-primary btn-block" id="pencilStyle"><span
                        class="fa fa-pencil"></span></button>
            </div>
            <div class="col-4" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-primary btn-block" id="brushStyle"><span
                        class="fa fa-paint-brush"></span></button>
            </div>
        </div>
        <div class="row tool-margin" style="width:100%">
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn" style="background-color:#000000"></button>
            </div>
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn"
                        style="background-color:#FFFFFF;border-color:#000000"></button>
            </div>
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn" style="background-color:#FF0000"></button>
            </div>
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn" style="background-color:#00FF00"></button>
            </div>
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn" style="background-color:#0000FF"></button>
            </div>
            <div class="col-2" style="padding-right:0px;padding-left:0px">
                <button class="btn btn-block clr-btn" style="background-color:#FFFF00"></button>
            </div>
        </div>
        <div class="row tool-margin" style="width:100%">
            <input type="color" value="#000000" id="drawing-color"/>
            <!--input(type="text")#drawing-color-->
        </div>
        <div class="row tool-margin" style="width:100%">
            <div class="col-3" style="padding-right:0px;padding-left:0px">
                <input class="form-control form-control-sm" type="text" value="1"
                       id="drawing-line-width-input"/>
            </div>
            <div class="col-9 tool-padding">
                <div class="btn-block" id="drawing-line-width"></div>
            </div>
            <!--input(type="range" value="30" min="0" max="150")#drawing-line-width-->
        </div>
        <div class="row tool-margin" style="width:100%">
            <input type="color" value="#000000" id="drawing-shadow-color"/>
            <!--input(type="text")#drawing-shadow-color-->
        </div>
        <div class="row tool-margin" style="width:100%">
            <div class="col-3" style="padding-right:0px;padding-left:0px">
                <input class="form-control form-control-sm" type="text" value="0"
                       id="drawing-shadow-width-input"/>
            </div>
            <div class="col-9 tool-padding">
                <div class="btn-block" id="drawing-shadow-width"></div>
            </div>
            <!--input(type="range" value="0" min="0" max="50")#drawing-shadow-width-->
        </div>
        <div class="row tool-margin" style="width:100%">
            <div class="col-3" style="padding-right:0px;padding-left:0px">
                <input class="form-control form-control-sm" type="text" value="0"
                       id="drawing-shadow-offset-input"/>
            </div>
            <div class="col-9 tool-padding">
                <div class="btn-block" id="drawing-shadow-offset"></div>
            </div>
        </div>
    </div>
</div>
<section class="content-section-b">
    <div class="container-fluid">
        <div class="row">
            <!--	.alert.alert-danger.block#infotext infotext-->
            <div class="col-md-12">
                <!--desktop tooltips-->
                <div class="row">
                    <button class="col-2 col-md-1 btn btn-block btn-dark" id="chatting-btn"
                            value="off" style="margin-top:0rem">채팅창
                    </button>
                    <button class="col-2 col-md-1 btn btn-block btn-dark" id="remote-control-btn"
                            onclick="hideFunction()" style="margin-top:0rem">리모콘
                    </button>
                    <button class="col-2 col-md-1 btn btn-block btn-dark" id="map-toggle"
                            style="margin-top:0rem">지도
                    </button>
                    <div class="col-6 col-md-9 alert alert-secondary btn-block" id="infotext"
                         style="margin-bottom:0rem; margin-top:0rem">환영합니다!
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="row" id="canvas-container-div">
                            <div id="map-container">
                                <canvas id="map"></canvas>
                            </div>
                            <canvas id="c"></canvas>
                            <!--.spinner-->
                        </div>
                    </div>
                </div>
            </div>
            <div id="sidebar">
                <div class="sidebar1">
                    <input type="hidden" value="비회원" id="namebox"/>
                    <input type="hidden" value="" id="roombox"/>
                    <input type="hidden" id="uid"/>
                    <div class="row margin-zero side-header">

                        <div class="logo">
                            <h4>비회원</h4>
                        </div>
                    </div>
                    <div class="row margin-zero">
                        <div style="margin:1px;" class="side-option-btn">
                            <button style="width:100%;" class="btn btn-info all-chatting">채팅방</button>
                        </div>
                    </div>
                    <div id="msgcontainer" class="left-navigation">
                        <ul id="msgs" class="list"></ul>
                    </div>
                    <div class="footer">
                        <input id="msgbox" type="text"/>
                        <button id="msgenter" class="btn btn-info">입력</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    $('#chatting-btn').click(function () {
        if ($(this).val() == "off") {
            $(this).val("on");
            var fullWidth = window.innerWidth;
            var w;
            if (fullWidth / 3 > 300) {
                w = fullWidth / 3;
            }
            else {
                w = 300;
            }
            $('#sidebar').animate({'width': w}, 700);
        } else {
            $(this).val("off");
            $('#sidebar').animate({'width': 0}, 700);
        }
    });
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
        integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
        crossorigin="anonymous"></script>
<script type="text/javascript"
        src="<c:url value="/resources/bootstrap/bootstrap.bundle.min.js"/>"></script>

<script type="text/javascript"
        src="<c:url value="/resources/bootstrap/bootstrap.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/socket-io-client/socket.io.slim.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/spectrum/spectrum.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/nouislider/nouislider.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/rx/rx.all.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/fabric/fabric.min.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/app/paintView.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/app/map-view.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/app/shortcut.js"/>"></script>
<script type="text/javascript"
        src="<c:url value="/resources/app/chatting.js"/>"></script>
</body>
</html>
