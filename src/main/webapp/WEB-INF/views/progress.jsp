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
        .modal1, .modal2{
            display: none;
            position: fixed;
            z-index: 1;
            top: 0;
            margin: 15%;
            width: 70%;
            height: 80%;
            border: 3px double black;
            background-color: white;
            text-align: center;

        }
        .thumbnail{
            border : 2px solid black;
            min-height: 20px;
            margin : 50px;
        }
        .subtitle{
            text-align: center;
            font-size: 20px;
            margin-top : 40px;
        }

        .xbutton{
            background-color: black;
            color: white;
        }
        .xbuttonWrap{
            text-align: right;
        }

        #requestComplete{
            background-color: blue;
            color: white;
        }
        #requestCancel{
            background-color: red;
            color: white;
        }
        #reqnumber {
            display: none;
        }

    </style>
</head>
<body>
<h1> HELPER :: 현재 진행중 </h1>
<input type="button" value="《" id="prevButton" onclick="gotoprev()">
<div>
    <div>
        <div class="subtitle">내가 요청한 의뢰</div>
        <div class="thumbnail" onclick="openModal1()"><c:out value="${rlist.title}"/></div>
    </div>
    <div>
        <div class="subtitle">내가 해결중인 의뢰</div>
        <div class="thumbnail" onclick="openModal2()"><c:out value="${alist.title}"/></div>
    </div>
</div>
<div>
    <a id="reqnumber"> <c:out value="${rlist.req_num}"/></a>
</div>

<div class="modal1">
    <div class="xbuttonWrap"><input type="button" value="x" class="xbutton" onclick="closeModal1()"></div>
    -- 내가 요청한 의뢰 --
    <div>
        <p> 제목: <c:out value="${rlist.title}"/> </p>
        <p> 기간: <c:out value="${rlist.start_date}"/> </p>
        <p> 포인트: <c:out value="${rlist.reward}"/> </p>
        <p> 해결자 번호: <c:out value="${rlist.pn}"/> </p>
        <p> 내용 : <c:out value="${rlist.contents}"/> </p>
    </div>
    <div>
        <input type="button" value="해결완료" onclick="requestComplete()" id="requestComplete">
        <input type="button" value="요청취소" onclick="requestCancel()" id="requestCancel">
    </div>
</div>
<div class="modal2">
    <div class="xbuttonWrap"><input type="button" value="x" class="xbutton" onclick="closeModal2()">

    </div>
    -- 내가 해결중인 의뢰 --
    <div>
        <p> 제목: <c:out value="${alist.title}"/> </p>
        <p> 기간: <c:out value="${alist.start_date}"/> </p>
        <p> 포인트: <c:out value="${alist.reward}"/> </p>
        <p> 해결자 번호: <c:out value="${alist.pn}"/> </p>
        <p> 내용 : <c:out value="${alist.contents}"/> </p>
    </div>
</div>
</body>
<script>

    function openModal1(){

        $('.modal1').show();
    }
    function openModal2(){
        $('.modal2').show();
    }

    function closeModal1(){
        $('.modal1').hide();
    }
    function closeModal2(){
        $('.modal2').hide();
    }
    function gotoprev(){
        history.back();
    }
    // 이상 버튼관련 함수들 ////////////////////////////////
    function requestComplete(){
        var requestN = $('#reqnumber').html();
        $.ajax({
            url: "/complete",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"req_n" : requestN},
            success: function(data) {
                if (data) {
                    alert("해결 완료");
                    location.reload();
                }
                else {
                    alert("SQL 오류");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //요청 완료를 누르면 진행되는 함수
    }
    function requestCancel(){
        var requestN = $('#reqnumber').html();
        $.ajax({
            url: "/cancel",
            type: "get",
            dataType: "json",
            contentType:'application/json; charset=utf-8',
            data: {"req_n" : requestN},
            success: function(data) {
                if (data) {
                    alert("취소 완료");
                    location.reload();
                }
                else {
                    alert("이미 수락한 사람이있기때문에 취소할수없습니다.");
                }
            },
            error:function(error) {
                alert("서버 오류");
            }
        });
        //요청 취소를 누르면 진행되는 함수
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


</script>

</html>