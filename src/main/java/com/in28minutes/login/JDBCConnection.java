package com.in28minutes.login;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

public class JDBCConnection {
	String userName;
	String password;
	String dbUrl;
	Connection connection;

    public JDBCConnection(String userName, String password, String dbUrl) {
    	this.userName = userName;
    	this.password = password;
    	this.dbUrl = dbUrl;
        try {
            Class.forName("com.mysql.jdbc.Driver");

        } catch (ClassNotFoundException e) {

            System.out.println("Oracle JDBC Driver Not Found.");
            e.printStackTrace();
            return;
        }
        connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/users?autoReconnect=true&useSSL=false","root", "copper10");

        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
            return;
        }
        if (connection == null) {
            System.out.println("Connection Failed");
        }
    }
    
    public ResultSet selectQuery(String sql) throws SQLException {
    	PreparedStatement preparedStatement = connection.prepareStatement(sql);
    	ResultSet rs = preparedStatement.executeQuery(sql);
    	return rs;
    }
}

