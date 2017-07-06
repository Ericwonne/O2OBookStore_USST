package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BuyBookDao extends BaseDao {
	private static final int recommendNum = 3;

	public ArrayList<BuyBook> findBooks(String searchType, String searchContent, int pageNow, int pageSize) {
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` && `br`." + searchType
				+ " like ? " + " limit ?,?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, "%" + searchContent + "%");
			pstmt.setInt(2, (pageNow - 1) * pageSize);
			pstmt.setInt(3, pageSize);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BuyBook> buyBooks = new ArrayList<BuyBook>();
			while (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public BuyBook getBuyBookFromDB(ResultSet rs) {
		// TODO Auto-generated method stub
		BuyBook buyBook = new BuyBook();
		try {
			buyBook.setId(rs.getInt("id"));
			buyBook.setIsbn(rs.getString("isbn"));
			buyBook.setName(rs.getString("name"));
			buyBook.setVersion(rs.getInt("version"));
			buyBook.setAuthor(rs.getString("author"));
			buyBook.setCourse_name(rs.getString("course_name"));
			buyBook.setDescribe(rs.getString("describe"));
			buyBook.setExpect_age(rs.getFloat("expect_age") * 100);
			buyBook.setExpect_discount(rs.getFloat("expect_discount"));
			buyBook.setGlances(rs.getInt("glances"));
			buyBook.setGrade(rs.getString("grade"));
			buyBook.setIf_course(rs.getInt("if_course"));
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public int calRowCount(String searchType, String searchContent) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from buy_record where " + searchType + " like ?";
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

	public BuyBook getBuyBookById(int id) {
		// TODO Auto-generated method stub

		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` && br.id=" + id;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				return buyBook;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BuyBook> recommendRelatedBuyBooks(int grade, String school, String major) {
		// TODO Auto-generated method stub
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br"
				+ " where `user`.`id` = `br`.`user_id` && br.grade=? && br.school=? && br.major=?" + " union"
				+ " select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` && br.grade=? && br.school=?"
				+ " union"
				+ " select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` && br.grade=?" + " limit "
				+ recommendNum;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, grade);
			pstmt.setString(2, school);
			pstmt.setString(3, major);
			pstmt.setInt(4, grade);
			pstmt.setString(5, school);
			pstmt.setInt(6, grade);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<BuyBook> buyBooks = new ArrayList<>();
			while (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BuyBook> recommendHotBuyBook(int parseInt, String school, String major) {
		// TODO Auto-generated method stub
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` " + "order by br.glances"
				+ " limit " + recommendNum;

		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ArrayList<BuyBook> buyBooks = new ArrayList<>();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BuyBook> getBuyBookBySchoolAndGrade(String school, int grade,int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` " + " && br.school = ?"
				+ " && br.grade= ?" + " limit ?,?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, school);
			pstmt.setInt(2, grade);
			pstmt.setInt(3, pageNow);
			pstmt.setInt(4, pageSize);
			ArrayList<BuyBook> buyBooks = new ArrayList<>();
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BuyBook> getNotCourseBuyBook(int pageNow,int pageSize) {
		// TODO Auto-generated method stub
		String sql = "select br.user_id,br.id,br.isbn, br.name, version, publish, author, expect_age, glances,if_course, course_name, br.grade, br.school, br.major, br.expect_discount, br.tag, br.release_time, br.`describe`,st_num,user.name userName"
				+ " from `user`,buy_record br" + " where `user`.`id` = `br`.`user_id` " + "  && if_course = 0"
				+ " limit ?,?" ;
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ArrayList<BuyBook> buyBooks = new ArrayList<>();
			pstmt.setInt(1, (pageNow-1)*pageSize);
			pstmt.setInt(2, pageSize);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BuyBook buyBook = new BuyBook();
				buyBook = getBuyBookFromDB(rs);
				buyBooks.add(buyBook);
			}
			return buyBooks;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public int calNotCourseBuyBooks() {
		String sql = "select count(*) from buy_record where if_course = 0";
		try(Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
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

	public int calBuyBooksNumBySchoolAndGrade(String school,int grade) {
		String sql = "select count(*) from buy_record where school=? && grade=?";
		try(Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, school);
			pstmt.setInt(2, grade);
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

	public boolean addGlances(int id) {
		// TODO Auto-generated method stub
		String sql = "update buy_record  set glances = glances+1 where id = "+id;
		try(Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)){
			int count = pstmt.executeUpdate();
			if(count>0) return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public ArrayList<BuyBook> getBookList(String sql) {
		ArrayList<BuyBook> list = new ArrayList<BuyBook>();
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BuyBook book = new BuyBook();
				book.setId(rs.getInt("id"));
				book.setIsbn(rs.getString("isbn"));
				book.setName(rs.getString("name"));
				book.setVersion(rs.getInt("version"));
				book.setPublish(rs.getString("publish"));
				book.setAuthor(rs.getString("author"));
				book.setCourse_name(rs.getString("course_name"));
				book.setDescribe(rs.getString("describe"));
				book.setExpect_age(rs.getFloat("expect_age"));
				book.setExpect_discount(rs.getFloat("expect_discount"));
				book.setGlances(rs.getInt("glances"));
				book.setIf_course(rs.getInt("if_course"));
				book.setGrade(rs.getString("grade"));
				book.setSchool(rs.getString("school"));
				book.setMajor(rs.getString("major"));
				book.setRelease_time(rs.getString("release_time"));
				book.setTag(rs.getString("tag"));
				book.setUserId(rs.getInt("user_id"));
				book.setStatus(rs.getInt("status"));
				list.add(book);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}


}
