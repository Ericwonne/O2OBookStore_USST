package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao extends BaseDao{
	public Admin getAdminById(String acount){
		String sql = "select * from admin";
		try(Connection conn=dataSource.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				Admin admin = new Admin();
				admin.setAccount(rs.getString("account"));
				admin.setPasswd(rs.getString("passwd"));
				return admin;
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
