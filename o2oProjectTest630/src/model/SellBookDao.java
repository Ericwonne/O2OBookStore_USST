package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SellBookDao extends BaseDao {
	private static final int recommendNum = 3;
	private static final int schoolBooksNum = 3;

	public ArrayList<SellBook> findBooks(String searchType, String searchContent, int pageNow, int pageSize) {
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && " + "sr." + searchType + " like ? && status=1 limit ?,?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, "%" + searchContent + "%");
			pstmt.setInt(2, (pageNow - 1) * pageSize);
			pstmt.setInt(3, pageSize);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SellBook> sellBooks = new ArrayList<SellBook>();
			while (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
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
		String sql = "select count(*) from sale_record where " + searchType + " like ?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, "%" + searchContent + "%");
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
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
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && " + "sr.id = " + id;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
				return sellBook;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	private SellBook getSellBookFromDB(ResultSet rs) {
		// TODO Auto-generated method stub
		SellBook sellBook = new SellBook();
		try {
			sellBook.setId(rs.getInt("id"));
			sellBook.setIsbn(rs.getString("isbn"));
			sellBook.setName(rs.getString("name"));
			sellBook.setVersion(rs.getInt("version"));
			sellBook.setPublish(rs.getString("publish"));
			sellBook.setAge(rs.getFloat("age"));
			sellBook.setAuthor(rs.getString("author"));
			sellBook.setIf_course(rs.getInt("if_course"));
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<SellBook> recommendRelatedSellBooks(int grade, String school, String major) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && " + "sr.grade=? && sr.school = ? && sr.major = ? " + " union "
				+ " select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && " + "sr.grade=? && sr.school = ?  " + " union "
				+ " select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id && " + "sr.grade=?" + " limit " + recommendNum;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, grade);
			pstmt.setString(2, school);
			pstmt.setString(3, major);
			pstmt.setInt(4, grade);
			pstmt.setString(5, school);
			pstmt.setInt(6, grade);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SellBook> sellBooks = new ArrayList<>();
			while (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
				sellBooks.add(sellBook);
			}
			return sellBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<SellBook> recommendHotSellsBook(int grade, String school, String major) {
		// TODO Auto-generated method stub
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr"
				+ " where `ur`.`id` = `sr`.user_id order by glances" + " limit " + recommendNum;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SellBook> sellBooks = new ArrayList<>();
			while (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
				sellBooks.add(sellBook);
			}
			return sellBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<SellBook> getSellBookBySchoolAndGrade(String school, int grade, int pageNum,int pageSize) {
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr" + " where `ur`.`id` = `sr`.user_id "
				+ " && sr.school= ? " + " && sr.grade= ? " + " limit ?,?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, school);
			pstmt.setInt(2, grade);
			pstmt.setInt(3, (pageNum-1)*pageSize);
			pstmt.setInt(4, pageSize);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SellBook> sellBooks = new ArrayList<>();
			while (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
				sellBooks.add(sellBook);
			}
			return sellBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<SellBook> getNotCourseSellBook(int pageNow,int pageSize) {
		String sql = "select sr.user_id,sr.id,sr.isbn, sr.name, sr.version, sr.publish, sr.age, sr.author, sr.if_course, sr.course_name, sr.grade, sr.school, sr.major, sr.price, sr.discount, sr.tag, sr.release_time, sr.glances,sr.describe, sr.imageurl"
				+ " ,ur.st_num,ur.name userName" + " from user ur,sale_record sr" + " where `ur`.`id` = `sr`.user_id "
				+ " && if_course=0 " + " limit ?,?" ;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ArrayList<SellBook> sellBooks = new ArrayList<>();
			pstmt.setInt(1, pageNow);
			pstmt.setInt(2, pageSize);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				SellBook sellBook = new SellBook();
				sellBook = getSellBookFromDB(rs);
				sellBooks.add(sellBook);
			}
			return sellBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int calNotCourseBuyBooks() {
		// TODO Auto-generated method stub
		String sql = "select count(*) from sale_record where if_course=0";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public int calSellBooksNumBySchoolAndGrade(String school,int grade) {
		// TODO Auto-generated method stub
				String sql = "select count(*) from sale_record where school=? && grade=?";
				try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
					pstmt.setString(1,school);
					pstmt.setInt(2, grade);
					ResultSet rs = pstmt.executeQuery();
					if (rs.next()) {
						return rs.getInt(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return 0;
	}
	
	public boolean addGlances(int id) {
		String sql = "update sale_record set glances = glances+1 where id = "+id;
		try(Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
			int count = pstmt.executeUpdate();
			if(count>0) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}

	public SellBook getSellBookById2(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from sale_record where id="+id;
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
				sellBook.setIf_course(rs.getInt("if_course"));
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
				sellBook.setUserId(rs.getInt("user_id"));
				System.out.println(sellBook.getName());
				return sellBook;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<SellBook> getBookList(String sql){
		ArrayList<SellBook> list = new ArrayList<SellBook>();
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				SellBook book = new SellBook();
				book.setId(rs.getInt("id"));
				book.setIsbn(rs.getString("isbn"));
				book.setName(rs.getString("name"));
				book.setVersion(rs.getInt("version"));
				book.setPublish(rs.getString("publish"));
				book.setAge(rs.getFloat("age"));
				book.setAuthor(rs.getString("author"));
				book.setIf_course(rs.getInt("if_course"));
				book.setCourse_name(rs.getString("course_name"));
				book.setGrade(rs.getString("grade"));
				book.setSchool(rs.getString("school"));
				book.setMajor(rs.getString("major"));
				book.setPrice(rs.getInt("price"));
				book.setDiscount(rs.getFloat("discount"));
				book.setRelease_time(rs.getString("release_time"));
				book.setTag(rs.getString("tag"));
				book.setUserId(rs.getInt("user_id"));
				book.setStatus(rs.getInt("status"));
				book.setDescribe(rs.getString("describe"));
				book.setGlances(rs.getInt("glances"));
				book.setImageurl(rs.getString("imageurl"));
				list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
