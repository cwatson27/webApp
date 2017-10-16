package com.faaApp.login;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;

public class OracleConnection {
	String userName;
	String password;
	String dbUrl;
	Connection connection;

    public OracleConnection(String userName, String password, String dbUrl) {
    	this.userName = userName;
    	this.password = password;
    	this.dbUrl = dbUrl;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

        } catch (ClassNotFoundException e) {

            System.out.println("Oracle JDBC Driver Not Found.");
            e.printStackTrace();
            return;
        }
        connection = null;
        try {
            connection = DriverManager.getConnection(dbUrl,userName,password);

        } catch (SQLException e) {
            System.out.println("Connection Failed");
            e.printStackTrace();
            return;
        }
        if (connection == null) {
            System.out.println("Connection Failed");
        }
    }
    
    public ResultSet queryTable(String sql) throws SQLException {
    	PreparedStatement preparedStatement = connection.prepareStatement(sql);
    	ResultSet rs = preparedStatement.executeQuery();
    	return rs;
    }
    public void updateTable(String sql) throws SQLException {
    	PreparedStatement preparedStatement = connection.prepareStatement(sql);
    	preparedStatement.executeUpdate();
    }
}

