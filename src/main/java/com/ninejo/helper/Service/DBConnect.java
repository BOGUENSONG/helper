package com.ninejo.helper.Service;
import java.sql.*;

public class  DBConnect  {

    private Connection con;
    private Statement stmt;

    private String url = "jdbc:mysql://localhost:3306/helper?characterEncoding=UTF-8&serverTimezone=UTC";
    private String ID = "root";
    private String PW = "root";

    public DBConnect()
    {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, ID, PW);
            stmt = con.createStatement();
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
    }
    public ResultSet getResult(String sql) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, ID, PW);
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            return rs;
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
        return null;
    }

    public int getResultmodify(String sql) {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, ID, PW);
            stmt = con.createStatement();
            return stmt.executeUpdate(sql);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
        return 0;
    }
    public Statement getStatement()
    {
        return stmt;
    }
}