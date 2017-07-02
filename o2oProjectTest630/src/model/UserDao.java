package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDao extends BaseDao {
	public boolean validate(String username, String password) {
		String sql = "select count(*) num from user where st_num=? && passwd=?";
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
	public String getQuestionByUserName(String userName) {
		// TODO Auto-generated method stub
		String sql = "select valid_ques from user where st_num=?";
		try(Connection conn =dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userName);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getString("valid_ques");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public boolean validateAnswer(String userName, String ans) {
		// TODO Auto-generated method stub
		String sql = "select count(*) num from user where st_num=? && valid_ans=?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, userName);
			pstmt.setString(2, ans);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				int count = rs.getInt("num");
				if(count == 1){
					return true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean modifyPassword(String userName, String newPassword) {
		// TODO Auto-generated method stub
		String sql = "update user set passwd=? where st_num=?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, newPassword);
			pstmt.setString(2, userName);
			int count = pstmt.executeUpdate();
			if(count>0){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public User getUserByStNum(String st_num) {
		// TODO Auto-generated method stub
		String sql = "select * from user  where st_num=?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, st_num);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setGrade(rs.getString("grade"));
				user.setMajor(rs.getString("major"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setQq(rs.getString("qq"));
				user.setSchool(rs.getString("school"));
				user.setSex(rs.getString("sex"));
				user.setSt_num(rs.getString("st_num"));
				user.setWechat(rs.getString("wechat"));
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public  ArrayList<User> getUserList(String sql){
		ArrayList<User> list=new ArrayList<User>();
		try(Connection conn=dataSource.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				User user = new User();
				user.setId(Integer.parseInt(rs.getString("id")));
				user.setSt_num(rs.getString("st_num"));
				user.setName(rs.getString("name"));
				user.setSex(rs.getString("sex"));
				user.setPasswd(rs.getString("passwd"));
				user.setGrade(rs.getString("grade"));
				user.setSchool(rs.getString("school"));
				user.setMajor(rs.getString("major"));
				user.setWechat(rs.getString("wechat"));
				user.setEmail(rs.getString("email"));
				user.setQq(rs.getString("qq"));
				user.setPhone(rs.getString("phone"));	
				user.setValid_ques(rs.getString("valid_ques"));
				user.setValid_ans(rs.getString("valid_ans"));
				list.add(user);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
}
