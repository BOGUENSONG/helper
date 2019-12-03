package com.ninejo.helper.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

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

}
