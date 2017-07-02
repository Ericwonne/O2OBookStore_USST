package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends BaseDao {
	public boolean validate(String username, String password) {
		String sql = "select count(*) num from user where st_name=? && passwd=?";
		try (Connection conn = dataSource.getConnection(); 
			PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, username);
			pstmt.setString(2, password);
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
	public boolean checkUsername(String userName){
		String sql = "select count(*) num from user where st_num=?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				int count = rs.getInt("num");
				if(count == 0) return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean addUser(String userName, String password, String name, String gender, String grade, String department,
			String major, String email, String valid_ques, String valid_ans, String qq, String wechat, String phone) {
		String sql = "insert into user(st_num,name,sex,passwd,grade,school,email,major,wechat,qq,phone,valid_ques,valid_ans)"
				+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";	
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userName);
			pstmt.setString(2, name);
			pstmt.setString(3, gender);
			pstmt.setString(4, password);
			pstmt.setString(5, grade);
			pstmt.setString(6, department);
			pstmt.setString(7, email);
			pstmt.setString(8, major);
			pstmt.setString(9, wechat);
			pstmt.setString(10, qq);
			pstmt.setString(11, phone);
			pstmt.setString(12, valid_ques);
			pstmt.setString(13, valid_ans);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
