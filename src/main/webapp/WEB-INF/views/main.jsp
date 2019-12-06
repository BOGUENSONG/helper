<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 메인화면 </title>
    <style type="text/css">
        <%--        스타일 추가--%>
    </style>
</head>
<body>
<script>
    var id = 'id';//현재 세션에 저장된 id값
    function goProgressingRequest(){
        location.href="/progress";

        //현재 진행중인 의뢰 페이지로 이동
    }
    function goMyInfo(){
        location.href="/myInfo";
        // 내 정보 관리 페이지로 이동
    }
    function goRegistRequest(){
        location.href="/requestRegist";
        // 의뢰 등록 페이지로 이동
        // 여기서 페이지 이동전, 이미 내가 의뢰한 의뢰가 있는지 확인
        // id를 서버로 보내서 의뢰 있는지 false/ true를 받아서
        // true면 의뢰 등록 페이지로 이동 false면 오류메세지 출력

    }
    function goRequestList(){
        location.href="/requestList";
        //의뢰 목록 페이지로 이동

    }
</script>

<h1> HELPER :: 메인화면 </h1>
<div> <a>id: <c:out value="${id}"/></a>
    <a>보유포인트: <c:out value="${point}"/> </a>
    <a>위치:<c:out value="${location}"/> </a></div>
<div>
    <input type="button" value="현재 진행중인 의뢰" onclick="goProgressingRequest()">
    <input type="button" value="내 정보 관리" onclick="goMyInfo()">
    <input type="button" value="의뢰 등록" onclick="goRegistRequest()">
    <input type="button" value="의뢰 목록" onclick="goRequestList()">
</div>
</body>

</html>