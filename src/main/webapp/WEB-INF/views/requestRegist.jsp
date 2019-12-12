<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 의뢰등록 </title>
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
        .formWrap{
            text-align: center;
            margin-top : 40px;

        }
        .formWrap>input , .formWrap>textarea{
            width: 80%;
        }

        textarea{
            height: 200px;
        }

        .buttonWrap{
            text-align:center;
            margin-top: 40px;
        }
        .buttonWrap>input{
            padding : 20px;
            width: 40%;
            background-color: black;
            color: white;
        }

        .buttonWrap>input:hover{
            cursor:pointer;
            background-color: white;
            color: black;
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

    function requestRegistOK(){
        $.ajax({
            url: "/requestRegistdb",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"ID": getId(), "Title": $('#regTitle').val(), "Point": $('#regPoint').val(), "Place": $('#regPlace').val(), "Text": $('#regTextarea').val(),},
            success: function(data) {
                if (data) {
                    alert("의뢰 등록 완료");
                    location.href="/progress?id=" + getId();
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
        location.href="/main?id="+ getId();
        //뒤로 가기
    }
</script>
<h1> HELPER :: 의뢰등록 </h1>
<input type="button" value="《" id="prevButton" onclick="gotoprev()">
<div >
    <div class="formWrap"><input type="text" placeholder="제목" id="regTitle"></div>
    <div class="formWrap"><input type="number" placeholder="포인트" id="regPoint"></div>
    <div class="formWrap"><input type="text" placeholder="장소" id="regPlace"></div>
    <div class="formWrap"><textarea placeholder="여기에 상세내용을 입력하세요" id="regTextarea"></textarea></div>
</div>
<div class="buttonWrap">
    <input type="button" value="확인" onclick="requestRegistOK()">
    <input type="button" value="취소" onclick="requestRegistCancel()">
</div>
</body>

</html>