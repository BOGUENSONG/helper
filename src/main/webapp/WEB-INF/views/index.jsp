<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: HELPER</title>
    <style type="text/css">
<%--        스타일 추가--%>
        h1{
            margin-top: 100px;
            width: 100%;
            text-align: center;}
        .modal{
            display: none;
            position: fixed;
            z-index: 1;
            top: 0;
            margin: 15%;
            width: 70%;
            height: 80%;
            border: 3px double black;
            background-color: white;
            text-align: center;

        }
        #loginID,#loginPW,#loginBut{
            width: 80%;
            height: 30px;
            border : double 3px;
        }
        .idpw{
            text-align: center;
            padding: 5px;
        }

        #loginBut{
            border: none;
            height: 50px;
            cursor: pointer;
        }
        #loginBut:hover{
            background-color: black;
            color: white;
        }
        #registBut{
            border: none;
            background: none;

        }
        #registBut:hover{
            background-color: black;
            color:white;
            cursor: pointer;
        }
        #xbutton{
            background-color: black;
            color: white;
        }
        #xbuttonWrap{
            text-align: right;
        }
        .reg{
            margin-bottom: 20px;
        }
body{
    background-image: url("/resources/img/test1.png");
    background-size: cover;
}


    </style>
</head>
<body>
<script>

    function closemodal(){
        $('.modal').hide();
    }
    function getId() {
        var params = location.search.substr(location.search.indexOf("?") + 1);
        var sval = "";
        params = params.split("&");
        for (var i = 0; i < params.length; i++) {
            temp = params[i].split("=");
            if ([temp[0]] == "id") { sval = temp[1]; }
        }
        return sval;
    }
    function registOpen(){

        $('.modal').show();
    }
    function registValidation(){
        $.ajax({
            url: "/registValid",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: { "ID": $('#registID').val(), "PW": $('#registPW').val(),"PN" : $('#registPN').val()},
            success: function(data) {
                if (data) {
                    location.href="/main?id=" + $('#registID').val();
                }
                else {
                    alert("이미 중복된 아이디가 있습니다.");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
    }

    function loginValidation(){
        $.ajax({
            url: "/loginValid",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: { "ID": $('#loginID').val(), "PW": $('#loginPW').val()},
            success: function(data) {
                if (data) {

                    location.href="/main?id=" + $('#loginID').val();
                }
                else {
                    alert("잘못된 정보입니다.");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //로그인 검사
        //id와 password를 DB에 보내서 true/false 받아옴
        //true경우 location.href 다음페이지
        //false경우 alert("오류");
        // 아이디 : loginID 비밀번호: loginPW
    }

</script>
    <h1> HELPER :: HELPER</h1>
<div class="main">
    <div class="idpw"><input type="text" id="loginID" placeholder=" 아이디"></div>
    <div class="idpw"><input type="text" id="loginPW" placeholder=" 비밀번호"></div>

    <div class="idpw"><input type="button" value="로그인" onclick="loginValidation()" id="loginBut"></div>
</div>
<div class="idpw"> <input type="button" value="회원가입" onclick="registOpen()" id="registBut"> </div>
<div class="modal">
    <div id="xbuttonWrap"><input type="button" value="x" id="xbutton" onclick="closemodal()"></div>
    <div class="reg"> 회원가입 </div>
    <div class="reg"> 아이디   :  <input type="text" id="registID"></div>
    <div class="reg"> 비밀번호 :  <input type="text" id="registPW"></div>
    <div class="reg"> 전화번호 :  <input type="text" id="registPN"></div>
    <div class="reg"> 지역 : <select name="region">
        <option value="">지역선택</option>
        <option value="서울특별시">서울특별시</option>
        <option value="대전광역시">대전광역시</option>
        <option value="부산광역시">부산광역시</option>
        <option value="인천광역시">인천광역시</option>
        <option value="광주광역시">광주광역시</option>
        <option value="대구광역시">대구광역시</option>
        <option value="울산광역시">울산광역시</option>
        <option value="강원도">강원도</option>
        <option value="경기도">경기도</option>
        <option value="충청도">충청도</option>
        <option value="전라도">전라도</option>
        <option value="경상도">강원도</option>
        <option value="제주도">제주도</option>

    </select></div>

    <div> <input type="button" value="확인" onclick="registValidation()"> </div>
</div>
</body>

</html>