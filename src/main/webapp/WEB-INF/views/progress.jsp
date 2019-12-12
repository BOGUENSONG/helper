<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 현재 진행중 </title>
    <style type="text/css">
        <%--        스타일 추가--%>
    </style>
</head>
<body>
<h1> HELPER :: 현재 진행중 </h1>
<div>
    -- 메인 --
    <div>
        <div>내가 요청한 의뢰</div>
        <div onclick="openModal1()"><c:out value="${rlist.title}"/></div>
    </div>
    <div>
        <div>내가 해결중인 의뢰</div>
        <div onclick="openModal2()"><c:out value="${alist.title}"/></div>
    </div>
</div>
<div class="modal1">
    -- 내가 요청한 의뢰 모달 --
    <div>
        <p> 제목: <c:out value="${rlist.title}"/> </p>
        <p> 기간: <c:out value="${rlist.start_date}"/> </p>
        <p> 포인트: <c:out value="${rlist.reward}"/> </p>
        <p> 해결자 번호: <c:out value="${pn}"/> </p>
        <p> 내용 : <c:out value="${rlist.contents}"/> </p>
    </div>
    <div>
        <input type="button" value="닫기" onclick="closeModal1()">
    </div>
</div>
<div class="modal2">
    -- 내가 해결중인 의뢰 모달 --
    <div>
        <p> 제목: <c:out value="${alist.title}"/> </p>
        <p> 기간: <c:out value="${alist.start_date}"/> </p>
        <p> 포인트: <c:out value="${alist.reward}"/> </p>
        <p> 해결자 번호: <c:out value="${pn}"/> </p>
        <p> 내용 : <c:out value="${alist.contents}"/> </p>
    </div>
    <div> <input type="button" value="해결완료" onclick="requestComplete()">
        <input type="button" value="닫기" onclick="closeModal1()">
    </div>
</div>
</body>
<script>
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


</script>

</html>