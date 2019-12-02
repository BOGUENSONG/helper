<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title> HELPER :: 메인화면 </title>
</head>
<body>
<script>
    var id = "<%=session.getAttribute("id") %>"//현재 세션에 저장된 id값
    function goProgressingRequest(){
        function registValidation(){
            $.ajax({
                url: "/myInfo",
                type: "get",
                dataType: "json",
                contentType:'application/json; charset=utf-8',
                data: {},
                success: function(data) {
                    if (data) {
                        location.href="/myinfo";
                    }
                },
                error:function(error) {
                    alert("서버 오류");
                }
            });
            //서버에 아이디 전송 해서 DB검색후 중복여부 확인후 true return 리턴
            //받은 값이 true면 registToserver()
            // false면 alert("재입력 하세요") 출력
            // 아이디: registID 비번: registPW 전화번호 registPN
        }
        //현재 진행중인 의뢰 페이지로 이동
    }
    function goMyInfo(){
        // 내 정보 관리 페이지로 이동
    }
    function goRegistRequest(){
        // 의뢰 등록 페이지로 이동
        // 여기서 페이지 이동전, 이미 내가 의뢰한 의뢰가 있는지 확인
        // id를 서버로 보내서 의뢰 있는지 false/ true를 받아서
        // true면 의뢰 등록 페이지로 이동 false면 오류메세지 출력

    }
    function goRequestList(){
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