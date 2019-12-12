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

    function myrequsting(){ //내가 요청한 의뢰
        $.ajax({
            url: "/myrequesting",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID":getId()},
            success: function(data) {
                if (data) {

                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
    }

    function mysolving(){ //내가 해결중인 의뢰
        $.ajax({
            url: "/mysolving",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": getId()},
            success: function(data) {
                if (data) {

                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
    }

</script>

</html>