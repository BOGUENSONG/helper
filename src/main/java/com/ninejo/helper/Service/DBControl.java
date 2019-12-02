package com.ninejo.helper.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DBControl {
    DBConnect db = new DBConnect();

    public boolean isIdExist (String id) throws SQLException {

        String sql = "select count(*) from helper.member where id = ";
        String count = "";
        sql += "'" + id + "'";
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

        String sql = "insert into helper.member (id, password, phone_number) values ('?', '?', '?');";

        db.setPStatement(sql, id,  password, phoneNumber);
        ResultSet rs = db.getPStatement().getResultSet();

        String count = rs.getString("count(*)");
    }


}
