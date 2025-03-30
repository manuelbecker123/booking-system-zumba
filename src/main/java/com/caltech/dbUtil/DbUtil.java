package com.caltech.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbUtil {

	public static Connection getConn() throws ClassNotFoundException, SQLException {
		//step-1 register the vendor driver 
		Class.forName(DbUtilHelperConstant.DRIVER_CLASS);
		//step-2 connection with db  --> DBURL, username,password
		Connection con=DriverManager.getConnection(DbUtilHelperConstant.DB_URL,DbUtilHelperConstant.USERNAME,DbUtilHelperConstant.PASSWORD);
		return con;
	
	}
	
}
