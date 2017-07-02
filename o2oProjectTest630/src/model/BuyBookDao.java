package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BuyBookDao extends BaseDao {

	public ArrayList<BuyBook> findBooks(String searchType, String searchContent, int pageNow, int pageSize) {
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName" 
				+" from `user`,buy_record br"
				+" where `user`.`id` = `br`.`user_id` && `br`."+searchType+" like ? "
				+ " limit ?,?";
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, "%"+searchContent+"%");
			pstmt.setInt(2, (pageNow-1)*pageSize);
			pstmt.setInt(3, pageSize);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BuyBook> buyBooks = new ArrayList<BuyBook>();
			while(rs.next()){
				BuyBook buyBook = new BuyBook();
				buyBook.setId(rs.getInt("id"));
				buyBook.setIsbn(rs.getString("isbn"));
				buyBook.setName(rs.getString("name"));
				buyBook.setVersion(rs.getInt("version"));
				buyBook.setAuthor(rs.getString("author"));
				buyBook.setCourse_name(rs.getString("course_name"));
				buyBook.setDescribe(rs.getString("describe"));
				buyBook.setExpect_age(rs.getFloat("expect_age")*100);
				buyBook.setExpect_discount(rs.getFloat("expect_discount"));
				buyBook.setGlances(rs.getInt("glances"));
				buyBook.setGrade(rs.getString("grade"));
				String ifCourse;
				if(rs.getInt("if_course")==1)
					ifCourse="是";
				else ifCourse="否";
				buyBook.setIf_course(ifCourse);
				buyBook.setMajor(rs.getString("major"));
				buyBook.setPublish(rs.getString("publish"));
				buyBook.setRelease_time(rs.getString("release_time"));
				buyBook.setSchool(rs.getString("school"));
				buyBook.setSt_num(rs.getString("st_num"));
				buyBook.setUserName(rs.getString("userName"));
				buyBook.setTag(rs.getString("tag"));
				buyBook.setUserId(rs.getInt("user_id"));
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int calRowCount(String searchType, String searchContent) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from buy_record where " + searchType +" like ?";
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

	public BuyBook getBuyBookById(int id) {
		// TODO Auto-generated method stub
		
		 String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName" 
			+" from `user`,buy_record br"
			+" where `user`.`id` = `br`.`user_id` && br.id="+id;
		try(Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql)){
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				BuyBook buyBook = new BuyBook();
				buyBook.setId(rs.getInt("id"));
				buyBook.setIsbn(rs.getString("isbn"));
				buyBook.setName(rs.getString("name"));
				buyBook.setVersion(rs.getInt("version"));
				buyBook.setAuthor(rs.getString("author"));
				buyBook.setCourse_name(rs.getString("course_name"));
				buyBook.setDescribe(rs.getString("describe"));
				buyBook.setExpect_age(rs.getFloat("expect_age")*100);
				buyBook.setExpect_discount(rs.getFloat("expect_discount"));
				buyBook.setGlances(rs.getInt("glances"));
				buyBook.setGrade(rs.getString("grade"));
				String ifCourse;
				if(rs.getInt("if_course")==1)
					ifCourse="是";
				else ifCourse="否";
				buyBook.setIf_course(ifCourse);
				buyBook.setMajor(rs.getString("major"));
				buyBook.setPublish(rs.getString("publish"));
				buyBook.setRelease_time(rs.getString("release_time"));
				buyBook.setSchool(rs.getString("school"));
				buyBook.setSt_num(rs.getString("st_num"));
				buyBook.setUserName(rs.getString("userName"));
				buyBook.setTag(rs.getString("tag"));
				buyBook.setUserId(rs.getInt("user_id"));
				buyBook.setType("0");
				return buyBook;
			}
 		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
