/*
 * @(#)lab2 --- dataBase.java 
 */
package com.hetao.mysql;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Statement;

/**
 * @author 何涛
 * @version 1st   on 2017年9月19日
 */
public class dataBase {
	private static final String url="jdbc:mysql://localhost:3306/bookdb";
	
	public ResultSet Query(String query) throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jdbc.Driver");
		Connection connect=DriverManager.getConnection(url,"root","www.12358.com");
		Statement stat=(Statement) connect.createStatement();
		/*ResultSet rs=stat.executeQuery(query);
		while(rs.next()){
			String s=rs.getString(1);
			s+=" ";
		}*/
		return stat.executeQuery(query);
	}
}

