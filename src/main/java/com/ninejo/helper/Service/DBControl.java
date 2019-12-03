package com.ninejo.helper.Service;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBControl {
    DBConnect db = new DBConnect();

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

    public void resister (String id, String password, String phoneNumber) throws  SQLException{

        String sql = String.format(" insert into helper.member (id, password, phone_number) " +
                "values ('%s', '%s', '%s')", id, password, phoneNumber);

        ResultSet rs = db.getResult(sql);
    } // id, pw, pn 매개변수로 받아서 db에 저장

    public void changeInfo (String id, String password, String phoneNumber) throws  SQLException{

        String sql = String.format("update helper.member set password = '%s' where id = '%s'",  password, id);

        ResultSet rs = db.getResult(sql);

        String sql2 = String.format("update helper.member set phone_number = '%s' where id = '%s'",   phoneNumber, id);

        ResultSet rs2 = db.getResult(sql2);
    } // id, pw, pn 매개변수로 받아서 해당 id의 pw, pn 데이터 변경

    public void addPoint (String id, int point) throws  SQLException {

        String sql = String.format("update helper.member set point = point + %d where id = '%s'", point, id);

        ResultSet rs = db.getResult(sql);
    } // id, point 매개변수로 받아서 해당 id의 포인트 값 증가

    public void subPoint (String id, int point) throws  SQLException {

        String sql = String.format("update helper.member set point = point - %d where id = '%s'", point, id);

        ResultSet rs = db.getResult(sql);
    } // id, point 매개변수로 받아서 해당 id의 포인트 값 감소

    public ArrayList<request> getRequestList () throws SQLException {

        ArrayList<request> rlist = new ArrayList<>();

        String sql = String.format("select * from helper.request where is_completed = false");

        ResultSet rs = db.getResult(sql);

        while(rs.next()){
            request r = new request();
            r.req_num = rs.getInt("req_num");
            r.requester_id = rs.getString("requester_id");
            r.accepted_id = rs.getString("accepted_id");
            r.reward = rs.getInt("reward");
            r.title = rs.getString("title");
            r.start_date = rs.getDate("start_date");
            r.end_date = rs.getDate("end_date");
            r.locate = rs.getString("locate");
            r.contents = rs.getString("contents");
            r.is_completed = rs.getBoolean("is_completed");

            rlist.add(r);
        }
        return rlist;
    } // request 클래스의 arraylist 반환.

    public request getRequest (int req_num) throws SQLException {

        String sql = String.format("select * from helper.request where req_num = %d", req_num);

        ResultSet rs = db.getResult(sql);

        request r = new request();

        while(rs.next()){
            r.req_num = rs.getInt("req_num");
            r.requester_id = rs.getString("requester_id");
            r.accepted_id = rs.getString("accepted_id");
            r.reward = rs.getInt("reward");
            r.title = rs.getString("title");
            r.start_date = rs.getDate("start_date");
            r.end_date = rs.getDate("end_date");
            r.locate = rs.getString("locate");
            r.contents = rs.getString("contents");
            r.is_completed = rs.getBoolean("is_completed");

        }
        return r;
    } // reqnum 에 해당하는 request 반환

    public member getMemberInfo (String id) throws SQLException{

        String sql = String.format("select * from helper.member where id = '%s'", id);
        ResultSet rs = db.getResult(sql);

        member m = new member();
        while(rs.next()) {
            m.id = rs.getString("id");
            m.password = rs.getString("password");
            m.phone_number = rs.getString("phone_number");
            m.locate = rs.getString("locate");
            m.point = rs.getInt("point");
            m.req_request = rs.getInt("req_request");
            m.acpt_request = rs.getInt("acpt_request");
        }
        return m;
    }

    public boolean hasPostRequest (String id) throws  SQLException {

        String sql = String.format("select req_request from helper.member where id = '%s'", id);

        ResultSet rs = db.getResult(sql);

        String result = "";

        while(rs.next()){
            result = rs.getString("req_request");
        }
        if(result==null)
            return false;
        else
            return true;
    } // id를 매개변수로 받아서 등록한 의뢰가 있는지 검사. 있을경우 true, 없을경우 false

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
        idle = hasPostRequest(requester_id);
        int req_num = getReqCount() + 1;

        if(idle) {
            String sql = String.format(" insert into helper.request (req_num, requester_id, reward, title, start_date, locate, contents, is_completed) values " +
                            "(%d, '%s', %d, '%s', curdate(), '%s', '%s', false)"
                    , req_num, requester_id, reward, title, locate, contents);

            ResultSet rs = db.getResult(sql);

            String sql2 = String.format("update helper.member set req_request = %d where id = '%s'", req_num, requester_id);

            ResultSet rs2 = db.getResult(sql2);
        }
        return idle;

    } // 매개변수 받아서 의뢰 등록.
    // 등록자 id, 보상 point, 제목, 장소,
    // 이미 등록한 의뢰가 없을경우 등록 후 true 리턴, 있을경우 false 리턴하고 등록수행안함
    public boolean acceptRequest (String id, int req_num) throws  SQLException {

        boolean idle = false;
        idle = hasAcptRequest(id);
        if (idle) {
            String sql = String.format("update helper.request set accepted_id = '%s' where req_num = %d", id, req_num);
            ResultSet rs = db.getResult(sql);
            sql = String.format("update helper.member set acpt_request = %d where id = '%s'", req_num, id);
            rs = db.getResult(sql);
        }
        return idle;
    } // 의뢰수락/ 유저 id, 의뢰 번호 매개변수로 받음/ 현재수행중의뢰 없을경우 의뢰 수락완료하고 true 리턴 , 아닐경우 false 리턴.

    public int getReqCount() throws SQLException {

        String sql = String.format("select count(*) from helper.request");
        String count = "";

        ResultSet rs = db.getResult(sql);
        while(rs.next()){
            count = rs.getString("count(*)");
        }
        return Integer.parseInt(count);
    } // 모든 의뢰 수 반환
 }

 class request {
    int req_num;
    String requester_id;
    String accepted_id;
    int reward;
    String title;
    Date start_date;
    Date end_date;
    //Date 사용법 - String to Date : Date.valueOf("1111-11-11"); / Date to String : date.toString();
    String locate;
    String contents;
    boolean is_completed;
} //request 객체

class member {
    String id;
    String password;
    String phone_number;
    String locate;
    int point;
    int req_request;
    int acpt_request;
} //member 객체