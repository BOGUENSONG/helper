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
            data: { "id": $('#registID').val(), "pw": $('#loginPW').val(),"pn" : $('registPN').val()},
            success: function(data) {
                location.href="/main";
            },
            error:function(error) {
                alert("중복된 ID가 존재합니다.");
            }
        });
        //서버에 아이디 전송 해서 DB검색후 중복여부 확인후 true return 리턴
        //받은 값이 true면 registToserver()
        // false면 alert("재입력 하세요") 출력
        // 아이디: registID 비번: registPW 전화번호 registPN
    }
    
    function loginValidation(){
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