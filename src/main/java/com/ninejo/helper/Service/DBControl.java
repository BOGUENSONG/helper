package com.ninejo.helper.Service;

import java.sql.ResultSet;
import java.sql.SQLException;

public class DBControl {
    DBConnect db = new DBConnect();

    public boolean isIdExist (String id) throws SQLException {

        String sql = "select count(*) from member where id ?";

        db.setPStatement(sql, id);
        ResultSet rs = db.getPStatement().getResultSet();

        String count = rs.getString("count");
        if(count.equals("0"))
            return false;
        else
            return true;
    }
}
