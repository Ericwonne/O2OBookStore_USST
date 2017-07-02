package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDao extends BaseDao{
	public boolean isAccountExisted(String account) {
		String sql = "select count(*) num from admin  where account=?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, account);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("num");
				if (count == 1) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean validatePasswd(String account, String passwd) {
		String sql = "select count(*) num from admin where account=? && passwd=?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, account);
			pstmt.setString(2, passwd);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt("num");
				if (count == 1) {
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	
	public Admin getAdminByAccount(String account){
		String sql = "select * from admin where account='"+account+"'";
		try(Connection conn=dataSource.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				Admin admin = new Admin();
				admin.setId(Integer.parseInt(rs.getString("account")));
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
