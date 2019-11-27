<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title> HELPER :: 현재 진행중 </title>
</head>
<body>
<h1> HELPER :: 현재 진행중 </h1>
<div>
    -- 메인 --
    <div>
        <div>내가 요청한 의뢰</div>
        <div><c:out value="${Myrequest}"/>리스트1</div>
    </div>
    <div>
        <div>내가 해결중인 의뢰</div>
        <div><c:out value="${Mysolve}"/>리스트2</div>
    </div>
</div>
<div>
    -- 내가 요청한 의뢰 모달 --
    <div> 닫기버튼 </div>
    <div>
        <p> 제목: <c:out value="${title}"/> </p>
        <p> 기간: <c:out value="${date}"/> </p>
        <p> 포인트: <c:out value="${point}"/> </p>
        <p> 해결자 번호: <c:out value="${pn}"/> </p>
        <p> 내용 : <c:out value="${text}"/> </p>
    </div>
    <div> <input type="button" value="해결" onclick="">
        <input type="button" value="요청취소" onclick="">
    </div>
</div>
<div>
    -- 내가 해결중인 의뢰 모달 --
</div>
<div> 닫기버튼 </div>
<div>
    <p> 제목: <c:out value="${title}"/> </p>
    <p> 기간: <c:out value="${date}"/> </p>
    <p> 포인트: <c:out value="${point}"/> </p>
    <p> 해결자 번호: <c:out value="${pn}"/> </p>
    <p> 내용 : <c:out value="${text}"/> </p>
</div>
</body>

</html>