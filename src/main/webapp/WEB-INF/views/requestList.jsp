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
    </style>
</head>
<script>
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
    function modalOn(req_num, requester_id, reward, title, start_date, locate, contents) {
        var nn = document.createElement("p"); //아이디
        nn.setAttribute("id","id");
        nn.innerText = "아이디 : " + requester_id;
        modal.appendChild(nn);
        var ti= document.createElement("p"); //제목
        ti.setAttribute("id","title");
        ti.innerText = "제목 : " + title;
        modal.appendChild(ti);
        var ct = document.createElement("p"); //내욕
        ct.setAttribute("id","contents");
        ct.innerText = "내용 : " + contents;
        modal.appendChild(ct);
        $('.modal').show();
    }
    function modalOff() {
        var pf = document.getElementById("mpopfile");
        modal2.removeChild(pf);
        $('.modal').hide();
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
    <div id="<c:out value="${item.req_num}"/>",onclick="modalOn(<c:out value="${item.req_num}"/>, <c:out value="${item.requester_id}"/>
             ,<c:out value="${item.reward}"/> ,<c:out value="${item.title}"/>, <c:out value="${item.start_date}"/>
            ,<c:out value="${item.locate}"/> ,<c:out value="${item.contents}"/>)"><div><c:out value="${item.title}"></c:out></div>
    </div>

</c:forEach>

<div class="modal" class="modal">
    <button type="button" onclick="modalOff()">종료</button>
</div>
<div>--- 모달 ---</div>

</body>

</html>