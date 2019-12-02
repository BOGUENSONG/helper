package com.ninejo.helper.Service;
import java.sql.*;

public class  DBConnect  {

    private Connection con;
    private Statement stmt;
    private Statement pstmt;

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
    public void setPStatement(String sql, String s1) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, ID, PW);
            pstmt = con.prepareStatement(sql);
            ((PreparedStatement) pstmt).setString(1, s1);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
    }
    public void setPStatement(String sql, String s1, String s2) {
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, ID, PW);
            pstmt = con.prepareStatement(sql);
            ((PreparedStatement) pstmt).setString(1, s1);
            ((PreparedStatement) pstmt).setString(2, s2);
        }
        catch(Exception ex)
        {
            System.err.println(ex);
        }
    }

    public Statement getStatement()
    {
        return stmt;
    }
    public Statement getPStatement() { return pstmt; }
}