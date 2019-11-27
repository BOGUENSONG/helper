<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
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
        //서버에 아이디 전송 해서 DB검색후 중복여부 확인후 true return 리턴
        //받은 값이 true면 registToserver()
        // false면 alert("재입력 하세요") 출력
    }
    function registToServer(){
        //서버에 폼에 적힌 id, password, phonenumber를 보냄
        //db에 저장후 정상처리되면 ok후 location.href를 이용해 다음페이지로 넘어감
    }

</script>
    <h1> HELPER :: HELPER</h1>
<div> Title </div>
<div> 아이디 : <input type="text">
비번:    <input type="text">
    <input type="button" value="login">
</div>
<div> <input type="button" value="회원가입" onclick="registOpen()"> </div>

<div> ----회원가입 모달----
<div>회원가입 머리</div>
    <div> 아이디 : <input type="text">
        비번 :<input type="text">
        전화번호 <input type="text"></div>
    <div> <input type="button" value="확인" onclick="registValidation()"> </div>
</div>
</body>

</html>