package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BaseDao {
	DataSource dataSource;
	public BaseDao(){
		try{
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/rjxt_book");
		}catch (NamingException ne){ 
			System.out.println("Exception:"+ne);
		}
	}
	public Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
}


