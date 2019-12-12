<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 의뢰목록 </title>
    <style type="text/css">
        .modal{
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
    /* 닫기버튼*/
        #xbutton{
            background-color: black;
            color: white;
        }
        #xbuttonWrap{
            text-align: right;
        }
    /*    리스트 스타일*/
        .requestList{
            border : 5px double black;
        }
        .listpoint , .liststart{
            float: right;
        }
        .listTitle{
            font-size: 30px;
        }
        .secretInfo{
            display:none;
        }

    </style>
</head>
<script>
    function acceptbtn(){
        //수락하는 함수
        var requestID = $('#requesterid').html();
    }
    function gotoprev(){
        history.back();
    }
    function closemodal(){
        $('.modal').children('.secretInfo').remove();
        $('.modal').hide();
    }
    $(document).ready(function(){

        $('.requestList').click(function(){
            $('.modal').show();
            var node = $(this).children('.secretInfo').clone();
            $('.modal').append(node);
            $('.modal').children('.secretInfo').show();

        });

    })
    var modal = document.getElementsByClassName('modal');
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


            /*r.put("req_num", rs.getInt("req_num"));
            r.put("requester_id", rs.getString("requester_id"));
            r.put("accepted_id", rs.getString("accepted_id"));
            r.put("reward", rs.getInt("reward"));
            r.put("title", rs.getString("title"));
            r.put("start_date", rs.getDate("start_date"));
            r.put("end_date", rs.getDate("end_date"));
            r.put("locate", rs.getString("locate"));
            r.put("contents", rs.getString("contents"));
            r.put("is_completed", rs.getBoolean("is_completed"));
            */


    //현재 세션에 저장된 id값
</script>
<body>
<h1> HELPER :: 의뢰목록 </h1>
<input type="button" value="《" id="prevButton" onclick="gotoprev()">

<c:forEach items = "${list}" var="item" varStatus = "status">
 <div class="requestList" id="<c:out value="${status.index}"/>" >
     <div><a class="listTitle"><c:out value="${item.title}"/></a> <a class="listPoint"><c:out value="${item.reward}pt"/></a> </div>
     <div><a class="listRegion"><c:out value="${item.locate}"/> </a> <a class="listStart"><c:out value="${item.start_date}"/></a> </div>
     <div class="secretInfo">
         <p> 등록번호: <c:out value="${item.req_num}"/></p>
         <p> 등록자 : <a id="requesterid"><c:out value="${item.requester_id}"/></a></p>
         <p><c:out value="${item.reward}"/>pt</p>
         <p><c:out value="${item.title}"/></p>
         <p><c:out value="${item.start_date}"/></p>
         <p><c:out value="${item.locate}"/></p>
         내용 : <p><c:out value="${item.contents}"/></p>
     </div>
 </div>
</c:forEach>


<div class="modal">

    <div id="xbuttonWrap"><input type="button" value="x" id="xbutton" onclick="closemodal()">

    </div>

    <div> <input type="button" value="수락" onclick="acceptbtn()"> <input type="button" value="취소" onclick="closemodal()"> </div>

</div>



</body>

</html>