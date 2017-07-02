package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookDao extends BaseDao {

	public boolean BuyBook(BuyBook buybook)
	{
		String sql="INSERT INTO buy_record"+"(isbn,name,version,publish,author,expect_age,if_course,course_name,grade,school,major,expect_discount,tag,user_id,status,`describe`)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn=dataSource.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			{
				pstmt.setString(1,buybook.getIsbn());
				pstmt.setString(2,buybook.getName());
				pstmt.setInt(3,buybook.getVersion());
				pstmt.setString(4,buybook.getPublish());
				pstmt.setString(5,buybook.getAuthor());
				pstmt.setFloat(6,buybook.getExpect_age());
				pstmt.setInt(7,Integer.parseInt(buybook.getIf_course()));
				pstmt.setString(8,buybook.getCourse_name());
				pstmt.setString(9,buybook.getGrade());
				pstmt.setString(10,buybook.getSchool());
				pstmt.setString(11,buybook.getMajor());
				pstmt.setFloat(12,buybook.getExpect_discount());
				pstmt.setString(13,buybook.getTag());
			
				pstmt.setInt(14,buybook.getUser_id());
				pstmt.setInt(15,1);
			
				pstmt.setString(16,buybook.getDescribe());
			
				pstmt.executeUpdate();
				conn.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
				
	}
	
	public boolean SellBook(SellBook sellbook)
	{
		String sql="INSERT INTO sale_record"+"(isbn,name,version,publish,age,author,if_course,course_name,grade,school,major,price,discount,tag,user_id,status,`describe`,imageurl)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			Connection conn=dataSource.getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);
			{
				pstmt.setString(1,sellbook.getIsbn());
				pstmt.setString(2,sellbook.getName());
				pstmt.setInt(3,sellbook.getVersion());
				pstmt.setString(4,sellbook.getPublish());
				pstmt.setFloat(5,sellbook.getAge());
				pstmt.setString(6,sellbook.getAuthor());
				pstmt.setInt(7,Integer.parseInt(sellbook.getIf_course()));
				pstmt.setString(8,sellbook.getCourse_name());
				pstmt.setString(9,sellbook.getGrade());
				pstmt.setString(10,sellbook.getSchool());
				pstmt.setString(11,sellbook.getMajor());
				pstmt.setFloat(12,sellbook.getPrice());
				pstmt.setFloat(13,sellbook.getDiscount());
				pstmt.setString(14,sellbook.getTag());			
				pstmt.setInt(15,sellbook.getUser_id());
				pstmt.setInt(16,1);		
				pstmt.setString(17,sellbook.getDescribe());
				pstmt.setString(18,sellbook.getImageurl());
			
				pstmt.executeUpdate();
				conn.close();
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
