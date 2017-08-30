package com.in28minutes.login;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Main {
	public static void main(String[] args) throws SQLException {
		JDBCConnection conn = new JDBCConnection("", "","");
		String query = "SELECT DISTINCT name FROM record;";
		ResultSet userNameSet = conn.selectQuery(query);
		while (userNameSet.next()) {
			System.out.println(userNameSet.getString("name"));
		}
	}

}
