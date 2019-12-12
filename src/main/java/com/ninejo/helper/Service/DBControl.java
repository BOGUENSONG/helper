package com.ninejo.helper.Service;

import org.springframework.data.relational.core.sql.SQL;

import java.awt.*;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class DBControl {
    DBConnect db = new DBConnect();

    public boolean isValidLogin (String id, String pw) throws SQLException{

        String sql = String.format("select count(*) from helper.member where id = '%s' and password = '%s'", id, pw);
        String count = "";

        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            count = rs.getString("count(*)");
        }
        if(count.equals("0"))
            return false;
        else
            return true;
    }

    public boolean isIdExist (String id) throws SQLException {

        String sql = String.format("select count(*) from helper.member where id = '%s'", id);
        String count = "";

        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            count = rs.getString("count(*)");
        }
        if(count.equals("0"))
            return false;
        else
            return true;
    } // id를 매개변수로 받아서 해당 id가 존재할 경우 true 반환

    public void resister (String id, String password, String phoneNumber, String locate) throws  SQLException{

        String sql = String.format(" insert into helper.member (id, password, phone_number, locate) " +
                "values ('%s', '%s', '%s', '%s')", id, password, phoneNumber, locate);

        db.getResultmodify(sql);
    } // id, pw, pn 매개변수로 받아서 db에 저장

    public void changeInfo (String id, String password, String phoneNumber) throws  SQLException{
        if (password == null) {
            String sql = String.format("update helper.member set phone_number = '%s' where id = '%s'",   phoneNumber, id);
            db.getResultmodify(sql);
        }
        else if (phoneNumber == null) {
            String sql = String.format("update helper.member set password = '%s' where id = '%s'",  password, id);
            db.getResultmodify(sql);
        }
        else {
            String sql = String.format("update helper.member set phone_number = '%s', password = '%s' where id = '%s'",   phoneNumber, password, id);
            db.getResultmodify(sql);
        }
    } // id, pw, pn 매개변수로 받아서 해당 id의 pw, pn 데이터 변경

    public void addPoint (String id, int point) throws  SQLException {

        String sql = String.format("update helper.member set point = point + %d where id = '%s'", point, id);

        db.getResultmodify(sql);
    } // id, point 매개변수로 받아서 해당 id의 포인트 값 증가

    public void subPoint (String id, int point) throws  SQLException {

        String sql = String.format("update helper.member set point = point - %d where id = '%s'", point, id);

        db.getResultmodify(sql);
    } // id, point 매개변수로 받아서 해당 id의 포인트 값 감소

    public ArrayList<HashMap<String, Object>> getRequestList (String id) throws SQLException {

        ArrayList<HashMap<String, Object>> rlist = new ArrayList<>();
        String locate = "";

        String sql = String.format("select locate from helper.member where id = '%s'", id);
        ResultSet rs = db.getResult(sql);
        while(rs.next()) {
            locate = rs.getString("locate");
            if(rs.wasNull())
                locate = "";
        }
        sql = String.format(" select * from helper.request as r join helper.member" +
                " as m on r.requester_id = m.id and  r.is_completed = false and m.locate = '%s'" +
                "and r.accepted_id is null and r.requester_id != '%s'", locate, id);

        rs = db.getResult(sql);

        while(rs.next()){
            HashMap<String, Object> r = new HashMap<>();
            r.put("req_num", rs.getInt("req_num"));
            r.put("requester_id", rs.getString("requester_id"));
            r.put("accepted_id", rs.getString("accepted_id"));
            r.put("reward", rs.getInt("reward"));
            r.put("title", rs.getString("title"));
            r.put("start_date", rs.getDate("start_date"));
            r.put("end_date", rs.getDate("end_date"));
            r.put("locate", rs.getString("locate"));
            r.put("contents", rs.getString("contents"));
            r.put("is_completed", rs.getBoolean("is_completed"));

            rlist.add(r);
        }
        return rlist;
    } // request 클래스의 arraylist 반환.

    public ArrayList<HashMap<String, Object>> getSolvedRequestList (String id) throws SQLException {

        ArrayList<HashMap<String, Object>> rlist = new ArrayList<>();

        String sql = String.format("select * from helper.request where is_completed = true & accepted_id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        while(rs.next()){
            HashMap<String, Object> r = new HashMap<>();
            r.put("req_num", rs.getInt("req_num"));
            r.put("requester_id", rs.getString("requester_id"));
            r.put("accepted_id", rs.getString("accepted_id"));
            r.put("reward", rs.getInt("reward"));
            r.put("title", rs.getString("title"));
            r.put("start_date", rs.getDate("start_date"));
            r.put("end_date", rs.getDate("end_date"));
            r.put("locate", rs.getString("locate"));
            r.put("contents", rs.getString("contents"));
            r.put("is_completed", rs.getBoolean("is_completed"));

            rlist.add(r);
        }
        return rlist;
    } // request 클래스의 arraylist 반환. 파라미터로 받은 id의 해결했던 의뢰들 리턴

    public HashMap<String, Object> getPostRequest (String id) throws SQLException {

        int num = 0;
        HashMap<String, Object> r = new HashMap<>();

        String sql = String.format("select req_request from helper.member where id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        while(rs.next()) {
            num = rs.getInt("req_request");
            if(rs.wasNull())
                return r;
        }

        sql = String.format("select * from helper.request where req_num = %d", num);

        rs = db.getResult(sql);

        while(rs.next()){
            r.put("req_num", rs.getInt("req_num"));
            r.put("requester_id", rs.getString("requester_id"));
            r.put("accepted_id", rs.getString("accepted_id"));
            r.put("reward", rs.getInt("reward"));
            r.put("title", rs.getString("title"));
            r.put("start_date", rs.getDate("start_date"));
            r.put("end_date", rs.getDate("end_date"));
            r.put("locate", rs.getString("locate"));
            r.put("contents", rs.getString("contents"));
            r.put("is_completed", rs.getBoolean("is_completed"));

        }
        return r;
    } // id를 받아서 현재 요청중인 request 반환

    public HashMap<String, Object> getAcptRequest (String id) throws SQLException {

        int num = 0;
        HashMap<String, Object> r = new HashMap<>();

        String sql = String.format("select acpt_request from helper.member where id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        while(rs.next()) {
            num = rs.getInt("acpt_request");
            if(rs.wasNull())
                return r;
        }

        sql = String.format("select * from helper.request where req_num = %d", num);

        rs = db.getResult(sql);

        while(rs.next()){
            r.put("req_num", rs.getInt("req_num"));
            r.put("requester_id", rs.getString("requester_id"));
            r.put("accepted_id", rs.getString("accepted_id"));
            r.put("reward", rs.getInt("reward"));
            r.put("title", rs.getString("title"));
            r.put("start_date", rs.getDate("start_date"));
            r.put("end_date", rs.getDate("end_date"));
            r.put("locate", rs.getString("locate"));
            r.put("contents", rs.getString("contents"));
            r.put("is_completed", rs.getBoolean("is_completed"));

        }
        return r;
    } // id를 받아서 현재 해결중인 request 반환

    public HashMap<String, Object> getMemberInfo (String id) throws SQLException{

        String sql = String.format("select * from helper.member where id = '%s'", id);
        ResultSet rs = db.getResult(sql);

        HashMap<String, Object> m = new HashMap<>();
        while(rs.next()) {
            m.put("id", rs.getString("id"));
            m.put("password", rs.getString("password"));
            m.put("phone_number", rs.getString("phone_number"));
            m.put("locate", rs.getString("locate"));
            m.put("point", rs.getInt("point"));
            m.put("req_request", rs.getInt("req_request"));
            m.put("acpt_request", rs.getInt("acpt_request"));
        }
        return m;
    }



    public boolean hasAcptRequest (String id) throws  SQLException {

        String sql = String.format("select acpt_request from helper.member where id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        String result = "";

        while(rs.next()){
            result = rs.getString("acpt_request");
        }
        if(result==null)
            return false;
        else
            return true;
    } // id를 매개변수로 받아서 수락한 의뢰가 있는지 검사. 있을경우 true, 없을경우 false

    public boolean postRequest (String requester_id, int reward, String title, String locate, String contents) throws SQLException{

        boolean idle = false;
        idle = !hasPostRequest(requester_id);
        int req_num = getReqCount() + 1;

        if(idle) {
            String sql = String.format(" insert into helper.request (req_num, requester_id, reward, title, start_date, locate, contents, is_completed) values " +
                            "(%d, '%s', %d, '%s', curdate(), '%s', '%s', false)"
                    , req_num, requester_id, reward, title, locate, contents);

            db.getResultmodify(sql);

        }
        String sql2 = String.format("update helper.member set req_request = %d where id = '%s'", req_num, requester_id);
        db.getResultmodify(sql2);

        return idle;

    } // 매개변수 받아서 의뢰 등록.
    // 등록자 id, 보상 point, 제목, 장소,
    // 이미 등록한 의뢰가 없을경우 등록 후 true 리턴, 있을경우 false 리턴하고 등록수행안함
    public boolean acceptRequest (String id, int req_num) throws  SQLException {

        boolean idle = false;
        idle = !hasAcptRequest(id);
        if (idle) {
            String sql = String.format("update helper.request set accepted_id = '%s' where req_num = %d", id, req_num);
            db.getResultmodify(sql);
            sql = String.format("update helper.member set acpt_request = %d where id = '%s'", req_num, id);
            db.getResultmodify(sql);
        }
        return idle;
    } // 의뢰수락/ 유저 id, 의뢰 번호 매개변수로 받음/ 현재수행중의뢰 없을경우 의뢰 수락완료하고 true 리턴 , 아닐경우 false 리턴.

    public boolean completeRequest (int req_num) throws SQLException {

        String rid = "";
        String aid = "";
        int reward = 0;

        String sql = String.format("select accepted_id from helper.request where req_num = %d",req_num);
        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            aid = rs.getString("accepted_id");
            if(rs.wasNull())
                return false;
        }

       sql = String.format("update helper.request set is_completed = true where req_num = %d",req_num);
        db.getResultmodify(sql);

        sql = String.format("select reward from helper.request where req_num = %d", req_num);
         rs = db.getResult(sql);
        while(rs.next()){
            reward = rs.getInt("reward");
        }
        sql = String.format("select requester_id from helper.request where req_num = %d", req_num);
        rs = db.getResult(sql);
        while(rs.next()){
            rid = rs.getString("requester_id");
        }
        sql = String.format("update helper.member set point = point + %d where id = '%s'", reward, aid);
        db.getResultmodify(sql);

        sql = String.format("update helper.member set point = point - %d where id = '%s'", reward, rid);
        db.getResultmodify(sql);

        sql = String.format("update helper.member set req_request = null where id = '%s'", rid);
        db.getResultmodify(sql);

        sql = String.format("update helper.member set acpt_request = null where id = '%s'", aid);
        db.getResultmodify(sql);

        sql = String.format("update helper.request set end_date = curdate() where req_num = %d'", req_num);
        db.getResultmodify(sql);

        return true;
    } // 의뢰번호 매개변수로 받아서 의뢰테이블에서 해결여부 변경, 수락자 등록자에서 각각 수락중 등록중 의뢰 제거

    public boolean cancelRequest (int req_num) throws SQLException {

        String rid = "";
        String aid = "";
        String sql = String.format("select accepted_id from helper.request where req_num = %d",req_num);
        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            aid = rs.getString("accepted_id");
            if(rs.wasNull())
                return false;
        }
        sql = String.format("select requester_id from helper.request where req_num = %d",req_num);
        rs = db.getResult(sql);
        rid = rs.getString("requester_id");

        sql = String.format("update helper.member set req_request = null where id = '%s'", rid);
        db.getResultmodify(sql);

        sql = String.format("delete from helper.request where req_num = %d;",req_num);
        db.getResultmodify(sql);

        return true;
    } // 의뢰번호 매개변수로 받아서 수락여부 확인 후 수락했으면 false 리턴, 안했으면 제거하고 true 리턴

    public String getPhoneNumber (String id) throws SQLException{

        String sql = String.format("select phone_number from helper.member where id = '%s';", id);
        ResultSet rs = db.getResult(sql);

       String s = "";
        while(rs.next()) {
            s = rs.getString("phone_number");
            if(rs.wasNull())
                return "no pn";
        }
        return s;
    }

     // 이 밑으론 신경 x
    public int getReqCount() throws SQLException {

        String sql = String.format("select coalesce(max(req_num), 0) as max from helper.request");
        String num = "";

        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            num = rs.getString("max");
        }
        return Integer.parseInt(num);
    } // 가장 최근 생성된 의뢰 번호 반환

    public boolean hasPostRequest (String id) throws  SQLException {

        String sql = String.format("select req_request from helper.member where id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        while(rs.next()){
            rs.getString("req_request");
            if(rs.wasNull())
                return false;
            else
                return true;
        }
        return false;

    } // id를 매개변수로 받아서 등록한 의뢰가 있는지 검사. 있을경우 true, 없을경우 false
 }
//
// class request {
//    int req_num;
//    String requester_id;
//    String accepted_id;
//    int reward;
//    String title;
//    Date start_date;
//    Date end_date;
//    //Date 사용법 - String to Date : Date.valueOf("1111-11-11"); / Date to String : date.toString();
//    String locate;
//    String contents;
//    boolean is_completed;
//} //request 객체
//
//class member {
//    String id;
//    String password;
//    String phone_number;
//    String locate;
//    int point;
//    int req_request;
//    int acpt_request;
//} //member 객체