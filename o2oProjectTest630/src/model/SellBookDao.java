package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellBookDao extends BaseDao{

	public ArrayList<SellBook> findBooks(String searchType, String searchContent, int pageNow, int pageSize) {
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName"
				+ " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && "+"sr."+searchType+" like ? && status=1 limit ?,?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "%"+searchContent+"%");
			pstmt.setInt(2, (pageNow-1)*pageSize);
			pstmt.setInt(3, pageSize);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SellBook> sellBooks = new ArrayList<SellBook>();
			while(rs.next()){
				SellBook sellBook = new SellBook();
				sellBook.setId(rs.getInt("id"));
				sellBook.setIsbn(rs.getString("isbn"));
				sellBook.setName(rs.getString("name"));
				sellBook.setVersion(rs.getInt("version"));
				sellBook.setPublish(rs.getString("publish"));
				sellBook.setAge(rs.getFloat("age"));
				sellBook.setAuthor(rs.getString("author"));
				String ifCourse;
				if(rs.getInt("if_course")==1)
					ifCourse="是";
				else ifCourse="否";
				sellBook.setIf_course(ifCourse);
				sellBook.setCourse_name(rs.getString("course_name"));
				sellBook.setGrade(rs.getString("grade"));
				sellBook.setMajor(rs.getString("major"));
				sellBook.setSchool(rs.getString("school"));
				sellBook.setPrice(rs.getFloat("price"));
				sellBook.setDiscount(rs.getFloat("discount"));
				sellBook.setTag(rs.getString("tag"));
				sellBook.setRelease_time(rs.getString("release_time"));
				sellBook.setGlances(rs.getInt("glances"));
				sellBook.setDescribe(rs.getString("describe"));
				sellBook.setImageurl(rs.getString("imageurl"));			
				sellBook.setSt_num(rs.getString("st_num"));
				sellBook.setUserName(rs.getString("userName"));
				sellBook.setUserId(rs.getInt("user_id"));
				sellBooks.add(sellBook);
			}
			return sellBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int calRowCount(String searchType, String searchContent) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from sale_record where "+searchType+" like ?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "%"+searchContent+"%");
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public SellBook getSellBookById(int id) {
		// TODO Auto-generated method stub
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName"
				+ " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && "+ "sr.id = "+id;
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				SellBook sellBook = new SellBook();
				sellBook.setId(rs.getInt("id"));
				sellBook.setIsbn(rs.getString("isbn"));
				sellBook.setName(rs.getString("name"));
				sellBook.setVersion(rs.getInt("version"));
				sellBook.setPublish(rs.getString("publish"));
				sellBook.setAge(rs.getFloat("age"));
				sellBook.setAuthor(rs.getString("author"));
				String ifCourse;
				if(rs.getInt("if_course")==1)
					ifCourse="是";
				else ifCourse="否";
				sellBook.setIf_course(ifCourse);
				sellBook.setCourse_name(rs.getString("course_name"));
				sellBook.setGrade(rs.getString("grade"));
				sellBook.setMajor(rs.getString("major"));
				sellBook.setSchool(rs.getString("school"));
				sellBook.setPrice(rs.getFloat("price"));
				sellBook.setDiscount(rs.getFloat("discount"));
				sellBook.setTag(rs.getString("tag"));
				sellBook.setRelease_time(rs.getString("release_time"));
				sellBook.setGlances(rs.getInt("glances"));
				sellBook.setDescribe(rs.getString("describe"));
				sellBook.setImageurl(rs.getString("imageurl"));			
				sellBook.setSt_num(rs.getString("st_num"));
				sellBook.setUserName(rs.getString("userName"));
				sellBook.setUserId(rs.getInt("user_id"));
				sellBook.setType("1");
				return sellBook;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
