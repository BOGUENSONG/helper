<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: HELPER</title>
</head>
<body>
<script>

    function registOpen(){
    alert("하이");
    //이전 창이 숨겨지고 회원가입 모달창을 띄운다
    //이전창 이름 :
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
                    session.setAttribute(id,"registID"); //세션에 id정보 저장
                    location.href="/main";
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
                    session.setAttribute(id,"loginID"); //세선에 id정보 저장
                    location.href="/main";
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
<div> Title </div>
<div> 아이디 : <input type="text" id="loginID">
비번:    <input type="text" id="loginPW">
    <input type="button" value="login" onclick="loginValidation()">
</div>
<div> <input type="button" value="회원가입" onclick="registOpen()"> </div>

<div> ----회원가입 모달----
<div>회원가입 머리</div>
    <div> 아이디 : <input type="text" id="registID">
        비번 :<input type="text" id="registPW">
        전화번호 <input type="text" id="registPN"></div>
    <div> <input type="button" value="확인" onclick="registValidation()"> </div>
</div>
</body>

</html>