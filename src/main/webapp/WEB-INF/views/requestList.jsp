<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title> HELPER :: 의뢰목록 </title>
    <style type="text/css">
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.8);
        }
        .modal-content {
            color: black;
            text-align: center;
            background-color: #fefefe;
            margin :15%;
            width: 70%;
            height: auto;
            border: 3px solid #888;
            border-radius: 10px;
            font-size: 12px;
        }
        <%--        스타일 추가--%>
    </style>
</head>
<script>
    var modal1 = document.getElementById('Modal1');
    var modal2 = document.getElementById('Modal2');
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
    function modalOn(req_num, requester_id, accepted_id, reward, title, start_date, end_date, locate, contents, is_completed) {
        var nn = document.createElement("p"); //공고번호
        nn.setAttribute("id","mnoticeNo");
        nn.innerText = "아이디 : " + requester_id;
        modal2.appendChild(nn);
        modal1.style.display = "block";
    }
    function modalOff() {
        var pf = document.getElementById("mpopfile");
        modal2.removeChild(pf);
        modal1.style.display = "none";
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
<div>--- 리스트 ---</div>
<div>    씨발</div>

<c:forEach items = "${list}" var="item" varStatus = "status">
    <div class="<c:out value="${status.index}"/>"><div><c:out value="${item.title}"></c:out></div>
        <div><c:out value="${item.contents}"></c:out></div></div>




</c:forEach>

<div id="Modal1" class="modal">
    <div id = "Modal2" class="modal-content">
        <button type="button" onclick="modalOff()">종료</button>
    </div>
</div>
<div>--- 모달 ---</div>

</body>

</html>