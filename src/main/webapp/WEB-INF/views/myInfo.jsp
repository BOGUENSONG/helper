<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 내정보 </title>
    <style type="text/css">
        <%--        스타일 추가--%>
        h1{

            font-size: 20px;
            width: 100%;
            text-align: center;
            border: 2px solid black;
        }
        #prevButton{
            background-color: black;
            color:white;
            position:absolute;
            top:0;
            margin-top: 10px;
            margin-left: 5px;
        }
    </style>
</head>
<body>
<script>
    function gotoprev(){
        history.back();
    }
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
    function modifyInfo(){
        $.ajax({
            url: "/changepw",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": getId(), "PW": $('#newPW').val(), "PN": $('#newPN').val()},
            success: function(data) {
                if (data) {
                    alert("내정보 변경완료");
                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //서버에 변경된 비밀번호와 전화번호를 전송
        // newPW , newPN
        // DB 수정 후 완료되면 alert("변경완료");
        // 수정 실패 시 alert("실패");
    }
    function pointAdd(){
        $.ajax({
            url: "/pointadd",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": getId()},
            success: function(data) {
                if (data) {
                    alert("포인트 충전완료");
                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //DB 포인트 정보 수정 후 완료메세지 후
        // 새로고침해서 내 포인트 수정된거 확인
    }
    function pointSub(){
        $.ajax({
            url: "/pointsub",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": getId()},
            success: function(data) {
                if (data) {
                    alert("포인트 반납완료");
                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        // DB 포인트 정보 수정 후 완료 메세지 후
        // 새로고침해서 내 포이트 수정된거 확인
    }
    function goToSolveRequestList(){
        $.ajax({
            url: "/solvedrequest",
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
        // 완료 의뢰 모달창 띄우기
    }
</script>
<h1> HELPER :: 내 정보 </h1>
<input type="button" value="《" id="prevButton" onclick="gotoprev()">
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