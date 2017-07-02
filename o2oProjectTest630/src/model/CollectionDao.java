package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CollectionDao extends BaseDao {

	public boolean checkCollectStateServlet(int userId, int bookId, int type) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from collect where user_id=? && record_id=? && if_sale=? && status=0";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, userId);
			pstmt.setInt(2, bookId);
			pstmt.setInt(3, type);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0)
					return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean checkCollectRecord(int userId, int bookId, int type) {
		// TODO Auto-generated method stub
		String sql = "select count(*) from collect where user_id=? && record_id=? && if_sale=? ";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, userId);
			pstmt.setInt(2, bookId);
			pstmt.setInt(3, type);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				if (count > 0)
					return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean addCollection(int userId, int bookId, int type) {
		// TODO Auto-generated method stub
		boolean flag = checkCollectRecord(userId, bookId, type);
		if (flag) {
			String sql = "update collect set status = 0 where user_id=? && record_id=? && if_sale=?";
			try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				pstmt.setInt(2, bookId);
				pstmt.setInt(3, type);
				int count = pstmt.executeUpdate();
				if (count > 0)
					return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			String sql = "insert into collect(user_id,record_id,if_sale,status)" + "	values(?,?,?,0)";
			try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, userId);
				pstmt.setInt(2, bookId);
				pstmt.setInt(3, type);
				int count = pstmt.executeUpdate();
				if (count > 0)
					return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean deleteCollection(int userId, int bookId, int type) {
		// TODO Auto-generated method stub
		String sql = "update collect set status = 1 where user_id=? && record_id=? && if_sale=?";
		try (Connection conn = dataSource.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, userId);
			pstmt.setInt(2, bookId);
			pstmt.setInt(3, type);
			int count = pstmt.executeUpdate();
			if (count > 0)
				return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

}
