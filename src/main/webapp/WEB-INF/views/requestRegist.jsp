<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title> HELPER :: 의뢰등록 </title>
</head>
<body>
<script>
    var id = "<%=session.getAttribute("id") %>"//현재 세션에 저장된 id값
    function requestRegistOK(){
        $.ajax({
            url: "/requestRegist",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": $(id).val(), "Title": $('#regTitle').val(), "Point": $('#regPoint').val(), "Date": $('#regDate').val(), "Place": $('#regPlace').val(), "Text": $('#regTextarea').val(),},
            success: function(data) {
                if (data) {
                    alert("의뢰 등록 완료");
                }
                else {
                    alert("SQL오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //확인 버튼
        // 세션의 id와 form들을 보낸다
        // regTitle, regDate, regPoint, regPlace, regTextarea
        // 등록 후 success하면  성공메세지 출력 후 바로 이전페이지로 이동
    }
    function requestRegistCancel(){
        location.href="/main";
        //뒤로 가기
    }
</script>
<h1> HELPER :: 의뢰등록 </h1>
<div> 폼 div
<input type="text" placeholder="제목" id="regTitle">
    <input type="date" id="regDate">
    <input type="number" placeholder="포인트" id="regPoint">
    <input type="text" placeholder="장소" id="regPlace">
    <textarea placeholder="여기에 상세내용을 입력하세요" id="regTextarea"></textarea>
</div>
<div>
    <input type="button" value="확인" onclick="requestRegistOK()">
    <input type="button" value="취소" onclick="requestRegistCancel()">
</div>
</body>

</html>