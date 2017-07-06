package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class UserChangeDao extends BaseDao {

	public User UserLook(String st_num)
	{
		String  sql="select * from user";
		User user =new User();
		Connection conn;
		try {
			conn = dataSource.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
		
			ResultSet rst=pstmt.executeQuery();
			while(rst.next())	
		  if(rst.getString("st_num").equals(st_num))
		  {
			  
			
			 user.setSt_num(st_num);
			 user.setName(rst.getString("name"));
			 user.setSex(rst.getString("sex"));
			 user.setPasswd(rst.getString("passwd"));
			 user.setGrade(rst.getString("grade"));
			 user.setSchool(rst.getString("school"));
			 user.setEmail(rst.getString("email")); 
			 user.setMajor(rst.getString("major"));
			 user.setWechat(rst.getString("wechat"));
			 user.setQq(rst.getString("qq"));
			 user.setPhone(rst.getString("phone"));
			 user.setValid_ques(rst.getString("valid_ques"));
             user.setValid_ans(rst.getString("valid_ans"));
		  }
	   
	    
		}
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			
			}
		return user;
		
	
		
	}
	
	
	
	public boolean UserChangeDao(String st_num,User user)
	{
		String sql="UPDATE user set name='"+user.getName()+"' where st_num="+st_num+"";
		String sql1="UPDATE user set passwd='"+user.getPasswd()+"' where st_num="+st_num+"";
		String sql2="UPDATE user set grade='"+user.getGrade()+"' where st_num="+st_num+"";
		String sql3="UPDATE user set school='"+user.getSchool()+"' where st_num="+st_num+"";
		String sql4="UPDATE user set major='"+user.getMajor()+"' where st_num="+st_num+"";
		String sql5="UPDATE user set email='"+user.getEmail()+"' where st_num="+st_num+"";
		String sql6="UPDATE user set qq='"+user.getQq()+"' where st_num="+st_num+"";
		String sql7="UPDATE user set wechat='"+user.getWechat()+"' where st_num="+st_num+"";
		String sql8="UPDATE user set phone='"+user.getPhone()+"' where st_num="+st_num+"";
		String sql9="UPDATE user set valid_ques='"+user.getValid_ques()+"' where st_num="+st_num+"";
		String sql10="UPDATE user set valid_ans='"+user.getValid_ans()+"' where st_num="+st_num+"";

		
		Connection conn;
			try {
				conn = dataSource.getConnection();
				java.sql.Statement sm=conn.createStatement();
				sm.executeUpdate(sql);
				sm.executeUpdate(sql1);
				sm.executeUpdate(sql2);
				sm.executeUpdate(sql3);
				sm.executeUpdate(sql4);
				sm.executeUpdate(sql5);
				sm.executeUpdate(sql6);
				sm.executeUpdate(sql7);
				sm.executeUpdate(sql8);
				sm.executeUpdate(sql9);
				sm.executeUpdate(sql10);
				
			    
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
				
			}
		return true;
		
		
		
		
		
		
		
	
		
		
	}



	
	
	
	
	
	
	
	
	
	
}
