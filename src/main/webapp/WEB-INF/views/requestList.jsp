<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 의뢰목록 </title>
    <style type="text/css">
        <%--        스타일 추가--%>
    </style>
</head>
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


    //현재 세션에 저장된 id값
</script>
<body>
<h1> HELPER :: 의뢰목록 </h1>
<div>--- 리스트 ---</div>
<div>    씨발</div>

<c:forEach items = "${list}" var="item" varStatus = "status">
<div><c:out value="${item}"></c:out> </div>

<div></div>
<div></div>
<div></div>
<div></div>
<div></div>

</c:forEach>

<div>--- 모달 ---</div>

</body>

</html>