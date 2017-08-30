package com.in28minutes.login;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MainController {
	JDBCConnection conn;
	HashMap<String ,String> employeeMap;

	@RequestMapping(value = "/table2", method = RequestMethod.GET)
	public String showTable(@RequestParam String name, ModelMap model) throws SQLException {	
		
		String query = "SELECT filename from record WHERE name = '" + name + "';";
		ResultSet fileNames = conn.selectQuery(query);
		ArrayList<String> fileNamesList = new ArrayList<String>();
		while (fileNames.next()) {
			fileNamesList.add(fileNames.getString("filename"));
		}
		// map the list to the "path" for .jsp
		 
		 // send the map to the jsp, where it is called "employee"
		model.put("fileName", fileNamesList);
		model.put("employee", employeeMap);
		model.put("name", name);
		return "table2";
	}
	
	@RequestMapping(value = "/table1", method = RequestMethod.GET)
	public String showTable1(ModelMap model) throws SQLException {
		
		conn = new JDBCConnection("", "","");
		String query = "SELECT DISTINCT name FROM record;";
		ResultSet userNameSet = conn.selectQuery(query);
		ArrayList<String> namesList = new ArrayList<String>();
		while (userNameSet.next()) {
			namesList.add(userNameSet.getString("name"));
		}
		// map the list to the "path" for .jsp
		employeeMap = new HashMap<String,String>();
		for(String employee: namesList) {
			 employeeMap.put(employee,employee);
		}
		// send the map to the jsp, where it is called "employee"
		model.put("employee", employeeMap);
		return "table1";
	}
}
