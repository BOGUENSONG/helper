<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 메인화면 </title>
    <style type="text/css">
        <%--        스타일 추가--%>
        h1{

            font-size: 20px;
            width: 100%;
            text-align: center;
            border: 2px solid black;
        }
        .buttonWrap{
            text-align: center;
            margin-top: 100px;
        }
        .button{
            width: 50%;
            height: 50px;
            margin-bottom: 50px;
            color: white;
            background-color: black;
        }
        .button:hover{
            cursor: pointer;
            background-color: white;
            color: black;
        }

        #prevButton{
            background-color: white;
            color:black;
            position:absolute;
            float:right;
            top:0;
            right: 0;
            margin-top: 10px;
            margin-right: 10px;
        }



    </style>
</head>
<body>
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
    var id = 'id';//현재 세션에 저장된 id값
    function goProgressingRequest(){
        location.href="/progress?id=" + getId();

        //현재 진행중인 의뢰 페이지로 이동
    }
    function goMyInfo(){
        location.href="/myInfo?id=" +  getId();
        // 내 정보 관리 페이지로 이동
    }
    function goRegistRequest(){
        location.href="/requestRegist?id=" +  getId();
        // 의뢰 등록 페이지로 이동
        // 여기서 페이지 이동전, 이미 내가 의뢰한 의뢰가 있는지 확인
        // id를 서버로 보내서 의뢰 있는지 false/ true를 받아서
        // true면 의뢰 등록 페이지로 이동 false면 오류메세지 출력

    }
    function goRequestList(){
        location.href="/requestList?id="+ getId();
        //의뢰 목록 페이지로 이동
    }
    function logout(){
        location.href="/";
        //의뢰 목록 페이지로 이동
    }


</script>

<h1> HELPER :: 메인화면 </h1>
<input type="button" value="로그아웃" id="prevButton" onclick="logout()">
<%--<div> <a>id: <c:out value="${id}"/></a>--%>
<%--    <a>보유포인트: <c:out value="${point}"/> </a>--%>
<%--    <a>위치:<c:out value="${location}"/> </a>--%>
</div>



<div class="buttonWrap">
    <div > <input type="button" value="현재 진행중인 의뢰" onclick="goProgressingRequest()" class="button"> </div>
    <div > <input type="button" value="내 정보 관리" onclick="goMyInfo()" class="button"> </div>
    <div > <input type="button" value="의뢰 등록" onclick="goRegistRequest()" class="button"> </div>
    <div > <input type="button" value="의뢰 목록" onclick="goRequestList()" class="button"> </div>
</div>
</body>

</html>