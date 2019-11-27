<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title> HELPER :: 내정보 </title>
</head>
<body>
<script>
    function modifyInfo(){
        //서버에 변경된 비밀번호와 전화번호를 전송
        // newPW , newPN
        // DB 수정 후 완료되면 alert("변경완료");
        // 수정 실패 시 alert("실패");
    }
    function pointAdd(){
        //DB 포인트 정보 수정 후 완료메세지 후
        // 새로고침해서 내 포인트 수정된거 확인
    }
    function pointSub(){
        // DB 포인트 정보 수정 후 완료 메세지 후
        // 새로고침해서 내 포이트 수정된거 확인
    }
    function goToSolveRequestList(){
        // 완료 의뢰 목록 페이지로 이동
    }
</script>
<h1> HELPER :: 내 정보 </h1>
<div>
    id : <c:out value="${id}"/>
    전화번호 : <c:out value="${pn}"/>
    내 포인트 : <c:out value="${point}"/>
</div>
<div>
    새 비밀번호: <input type="text" id="newPW">
    새 전화번호: <input type="text" placeholder="ex) 01012341234" id="newPN">
    <input type="button" value="변경" onclick="modifyInfo()">
</div>
<div>
    <input type="button" value="포인트 충전" onclick="pointAdd()">
    <input type="button" value="포인트 전환" onclick="pointSub()">
    <input type="button" value="완료 의뢰 목록" onclick="goToSolveRequestList()">
</div>
<div>
    ------모달 관련-----
</div>
</body>

</html>