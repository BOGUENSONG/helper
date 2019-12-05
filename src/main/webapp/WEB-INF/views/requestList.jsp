<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 의뢰목록 </title>
</head>
<script>
    var id = 'id';
    function reqlist(){ //내가 요청한 의뢰
        $.ajax({
            url: "/requestlist",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": id},
            success: function(data) {
                //data 의뢰목록
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
    }
    //현재 세션에 저장된 id값
</script>
<body>
<h1> HELPER :: 의뢰목록 </h1>
<div>--- 리스트 ---</div>
<input type="button" value="리스트 불러오기" onclick="reqlist()">
<div>--- 모달 ---</div>

</body>

</html>