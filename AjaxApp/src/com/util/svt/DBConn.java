//DBConn.java
//- 데이터베이스 연결 전용 객체 
//- 예외 처리 : throws


package com.util.svt;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.lang.ClassNotFoundException;


public class DBConn
{
	// 변수 선언
	private static Connection dbConn;
	
	// 메소드 정의
	public static Connection getConnection() throws ClassNotFoundException, SQLException
	{
		if (dbConn == null)
		{	
			String url = "jdbc:oracle:thin:@211.238.142.163:1521:xe";
			String user = "scott";
			String pwd = "tiger";
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	
	public static Connection getConnection(String url, String user, String pwd) throws ClassNotFoundException, SQLException
	{
		if (dbConn == null)
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn = DriverManager.getConnection(url, user, pwd);
		}
		
		return dbConn;
	}
	
	public static void close() throws Exception
	{
		if (dbConn != null)
		{
			if (!dbConn.isClosed())
			{		
				dbConn.close();
			}
		}
		
		dbConn = null;
	}
}